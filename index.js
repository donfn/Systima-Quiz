
//
//Χρησιμοποιώ Node.JS(Το παρόν έγγραφο) , Javascript(+jQuery), MaterializeCSS (είμαστε στυλάτοι), Socket.IO(Αυτό εδώ μου έβγαλε την πίστη, αλλά το αγαπώ.)
//
//

//ΕΝΑΡΞΗ-------------------------------------------------------------------------

//Φόρτωση plugins
var app = require('express')();
var http = require('http').Server(app);
var mysql = require('mysql');
var io = require('socket.io')(http);
var port = process.env.PORT || 3000;
var GLOBAL = require('GLOBAL');
GLOBAL.window = GLOBAL;

//Εδώ λέμε τι να "σερβίρει" ο σέρβερ σε κάθε request
app.get('/', function(req, res){
  res.sendFile(__dirname + '/index.html');
});
app.get('/fonts/roboto/Roboto-Regular.woff2', function(req, res){
  res.sendFile(__dirname + '/fonts/roboto/Roboto-Regular.woff2');
});
app.get('/fonts/roboto/Roboto-Regular.woff', function(req, res){
  res.sendFile(__dirname + '/fonts/roboto/Roboto-Regular.woff');
});app.get('/css/materialize.min.css', function(req, res){
  res.sendFile(__dirname + '/css/materialize.min.css');
});
app.get('/inc/buzz.mp3', function(req, res){
  res.sendFile(__dirname + '/inc/buzz.mp3');
});
app.get('/inc/tick.png', function(req, res){
  res.sendFile(__dirname + '/inc/tick.png');
});
app.get('/js/materialize.js', function(req, res){
  res.sendFile(__dirname + '/js/materialize.min.js');
});
app.get('/inc/loading.gif', function(req, res){
  res.sendFile(__dirname + '/inc/loading.gif');
});
app.get('/admin/', function(req, res){
  res.sendFile(__dirname + '/admin/index.html');
});


//Σύνδεση στην βάση δεδομένων
var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "quiz"
});
console.log('  › Σύνδεση στην βάση δεδομένων επιτυχής');

//Εύρεση του μέγιστου επιτρεπόμενου level στο παιχνίδι (δεν υπάρχει λόγος γι'αυτό, θα καταλάβεις παρακάτω)
con.query("SELECT `value` FROM main WHERE datatype='maxlevel'", function (err, result, fields) {
			GLOBAL.maxlevel = result[0].value;     
});
GLOBAL.server_status = null;
//Αυτό το function βρίσκει το στάτους του συστήματος και το μεταδίδει στους πελάτες.
function emit_status(){
     con.connect(function() { //ΣΥΝΔΕΣΗ MYSQL
       con.query("SELECT value FROM main WHERE datatype = 'status'", function (err, result, fields) {
	       if(GLOBAL.server_status !== result){
		       GLOBAL.server_status = result;
                       clients.emit('init_data', result); //ΑΠΟΣΤΟΛΗ ΜΕΣΩ SOCKET.IO
                       admin.emit('init_data', result);
	       };
       });
     });
}

setInterval(emit_status , 500); //Αποστολή κατάστασης του συστήματος ανα 500ms στα συνδεμένα τερματικά

//Εδώ handlαρουμε την σύνδεση των "μαθητικών" τερματικών
var clients = io.of('/clients/');
clients.on('connection', function(socket){
  console.log('  › Νέο μαθητικό τερματικό με ID:' + socket.id);
  emit_status(); //Του στέλνουμε το στάτους 
  GLOBAL.clientsocket = socket; //Αυτό δεν θυμάμαι γιατί το έχω βάλει. Φοβάμαι μην το διαγράψω και κρασάρει κάπου ;-;
    socket.on('ask', function(ask){ //Όταν τα μαθητικά τερματικά ποστάρουν ένα "ask" στον server δηλαδή μια απάντηση που πρέπει να προωθηθεί για έλεγχο....:
      console.log('  › Νέο request: ' + socket.id + ' ----> ME ASK'+ask['team'] + GLOBAL.admin_socket['id']);
      con.query("SELECT `level` FROM teams WHERE name='"+ ask['team'] +"'", function (err, result, fields) { //Έπαέ βρίσκουμε το τρέχον λέβελ της ομάδας που έστειλε το request
      admin.emit('ask', ask , socket.id,result[0].level); //Προώθηση στους admin για εξέταση
     });
  });
}); 
//ΤΕΛΟΣ

var admin = io.of('/admin/'); // Εδώ παρομοίως handlάρουμe των καθηγητών που θα επικυρώνουν τις απαντήσεις (admins)
admin.on('connection', function(socket){
	console.log('  › O διαχειριστής έχει ID:' + socket.id);
	GLOBAL.admin_socket = socket; // Και αύτο νομίζω κάπου το χρησιμοποιώ :0
        emit_status();
	socket.on('response', function(socketid,team,response){ //Όταν απαντήσει ο admin στο request του μαθητή...
	console.log('  › response:' + socketid + 'data:' + response);
		console.log('team' + team);
		if(response == 1){ //Εαν η απάντηση είναι σωστή (ΝΑΙ ΧΡΗΣΙΜΟΠΟΙΩ BOOLEAN MH ΜΕ ΚΟΙΤΑΣ!!!1111lne)
	          con.query("SELECT `level` FROM teams WHERE name='"+team+"'", function (err, result, fields) {
                    if(result[0].level == GLOBAL.maxlevel){ // Εαν ο χρήστης έχει φθάσει στο τελευταίο λέβελ. Έδω επανέρχομαι στον ορισμό του maxlevel που δεν έχει και πολύ νόημα: Δεν λειτουργεί ποτέ αυτό το IF!!!(το σύστημα κρασάρει ούτως ή άλλως γιατί δεν βρίσκει την επόμενη απάντηση αλλά τεσπα xD)
			 con.query("UPDATE main SET `value` = 'off' WHERE `datatype` = 'status'");
			 console.log('  › ΝΙΚΗΤΡΙΑ ΕΙΝΑΙ Η ΟΜΑΔΑ:' + team);
		     }
		    if(result[0].level !== GLOBAL.maxlevel){//Εάν ο χρήστης δεν είναι στο τελευταίο level στέλνει τον επόμενο γρίφο
			 var currentlevel = result[0].level + 1; //Ανεβάζει το level του χρήστη κατά 1
			 con.query("UPDATE teams SET `level` = "+currentlevel+" WHERE `name` = '"+team+"'"); //και το βάζει στην db
			 con.query("SELECT `text` FROM levels WHERE number='"+currentlevel+"'", function (err, result, fields) { //Με βάση τις 2 προηγούμενες εντολές βρίσκουμε την επόμενη ερώτηση που πρέπει να στέιλουμε στον παίκτη απο την db
				GLOBAL.nextone = result[0].text; //Εδώ το ορίζουμε ως global μεταβλητή, ίσως θα έπρεπε να το κάνω με socket.id.nextone, να το δηλώσει μονο στο συγκεκριμένο socket.id και να μην το κάνει global γιατί ίσως δημιουργηθεί θέμα...  
			        clients.to(socketid).emit('ask_response',response); //Στέλνουμε στο μαθητικό τερματικό το αποτέλεσμα (Σωστό/Λάθος)
                                clients.to(socketid).emit('nextone',GLOBAL.nextone); //Στέλνουμε
				GLOBAL.nextone = "";// Για να είμαστε σίγουροι πως δεν θα γίνει καμία μ@λακία :)
		          });
		       }
                     });
		 }
        else if(response == 0){ // Εαν η απάντηση είναι λάθος....
		               clients.to(socketid).emit('ask_response',response); 
			      }
}); 
}); 


http.listen(port, function(){ // Εκκίνηση σέρβερ
  console.log('  › Εκκίνηση server επιτυχής');
});
