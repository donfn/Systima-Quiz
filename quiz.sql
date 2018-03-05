-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Φιλοξενητής: 127.0.0.1
-- Χρόνος δημιουργίας: 04 Μαρ 2018 στις 14:15:07
-- Έκδοση διακομιστή: 10.1.26-MariaDB
-- Έκδοση PHP: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `quiz`
--

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `levels`
--

CREATE TABLE `levels` (
  `id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `levels`
--

INSERT INTO `levels` (`id`, `number`, `text`) VALUES
(1, 2, 'Ηρωικός Ηγούμενος της Μονής Γ _ _ _ _ _ _ κατά κόσμο Γεώργιος _ _ _ _ _ _ _ _ _ , με καταγωγή\r\nαπό χωριό της επαρχίας Μυλόποτάμου γνωστό στις μέρες μας για την τέχνη της αγγειοπλαστικής και την\r\nπολιτιστική του δραστηριότητα. Μιλάμε για το χωριό….. Μ _ _ _ _ _ _ _ _ ς\r\n(το ηγουμενείο είναι το κελί του Ηγουμένου της κάθε μονής…….. κάτι σαν ένα γραφείο ας πούμε….. )'),
(2, 3, 'Η εκκλησία της Μονής έχει δυο κλίτη. Το ένα κλίτος είναι αφιερωμένο στη Μ _ _ _ _ _ _ _ _ _ _ Τ_ _\r\nΣ _ _ _ _ _ _ ενώ το άλλο στον Α _ _ _ Κ _ _ _ _ _ _ _ _ _ _ και την Α _ _ _ Ε _ _ _ _ .\r\nΤα κλίτη είναι οι πτέρυγες ας πούμε ……….. αριστερά και δεξιά μοιρασμένες…..'),
(11, 11, 'Ο πολυπληθής στρατός των Τούρκων που αριθμούσε περίπου…. Ιε΄οοο πολεμιστές , ΧΧΧ\r\nκανόνια, με τον Μ _ _ _ _ _ _ _ ΝαΪλη Πασά, απέναντι σε CCCXXV Κρητικούς αγωνιστές.'),
(14, 4, 'VIII Βροχάρης, Μεθυστής ΧΙ ( XVIII LX ΣΤ΄ )\r\n….όταν κάνεις βόλτα κοιτάς τις βιτρίνες….'),
(15, 5, 'Ο Νεόφυτος Πατελάρης ήταν Τουρκομαθής……… κατάφερε να εξαιρέσει το Αρκάδι από τα άλλα\r\nμοναστήρια και να ακούγεται η καμπάνα του……. . ήταν για τους Τούρκους ΤΣΑΝΛΙ ΜΟΝΑΣΤΙΡ…. Που\r\nσημαίνει…… Ζ _ _ _ _ _ _ Μ _ _ _ _ _ _ _ _ .\r\nκράτα ζωντανό το μυαλό σου με τη γνώση που παίρνεις από τα σχολικά βιβλία……'),
(16, 6, 'Μαντατοφόρος της Μονής που μετέφερε επιστολή στον Πάνο Κορωναίο. Α _ _ _ Π _ _ _ _ _ _ _ _\r\nΦρούραρχος της Μονής Αρκαδίου από την Πελοπόννησο Ι _ _ _ _ _ _ _ _ μ _ _ _ _ _ _λ _ _ _ .\r\n..Aν ακολουθήσεις ….τα στοιχεία….. η χημεία είναι αυτή που ενώνει τους ανθρώπους……'),
(17, 7, 'Το σύνθημα της Κρητικής επανάστασης ‘ήταν &lt;&lt; Ε _ _ _ _ _ ή Θ _ _ _ _ _ _ &gt;&gt; Η\r\nΚρήτη γέννησε αξιόλογους ανθρώπους όπως ο Ελευθέριος Βενιζέλος , ο Νίκος Καζαντζάκης κ.α.'),
(18, 8, 'Ο Συνταγματάρχης του Ε. Σ. Π _ _ _ _ Κ _ _ _ _ _ _ _ ς , ο Λοχαγός που τιμήθηκε με τον\r\nΧάλκινο Σταυρό του Φοίνικα Μ _ _ _ _ _ Κ _ _ _ _ _ ς αλλά και ο Διοικητής του Στρατού των\r\nΧανίων Ι _ _ _ _ _ _ _ _ μ _ _ _ _ _ κ _ _ ς έπαιξαν σημαντικό ρόλο στην επανάσταση της\r\nΚρήτης εναντίον του Τούρκου κατακτητή.\r\nΟ καθένας παίρνει το βραβείο του……'),
(19, 9, 'Η Μονή Αρκαδίου έχει ανακηρυχτεί ως Μ _ _ _ _ _ _ Ε _ _ _ _ _ _ _ _ ς από την UNESCO.\r\nΠοτέ δεν κτυπάμε πόρτα που είναι…. ανοιχτή……. Απλά κοιτάζουμε προσεχτικά…. πίσω … το απέραντο\r\nγαλάζιο…'),
(20, 10, '…….Εκεί που φυλούσαν το κρασί τους στον κρασομαγατζέ όπως τον έλεγαν, ήταν γραφτό να\r\nγίνει ο τόπος θυσίας εκατοντάδων ψυχών Κρητικών αλλά και χιλιάδων Τούρκων που είχαν μπεί στο\r\nπροαύλιο της Μονής. Μιλάμε για την Π _ _ _ _ _ _ _ _ _ _ _ _ _.\r\nΤο χοροστάσι έλαβε χώρα στις 20 του Φλεβάρη του 2004…. Δίπλα …πολύ κοντά…');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `main`
--

CREATE TABLE `main` (
  `id` int(11) NOT NULL,
  `datatype` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `main`
--

INSERT INTO `main` (`id`, `datatype`, `value`) VALUES
(1, 'status', 'on'),
(2, 'maxlevel', '10');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `teams`
--

CREATE TABLE `teams` (
  `id` int(11) NOT NULL,
  `name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `class` text NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `teams`
--

INSERT INTO `teams` (`id`, `name`, `class`, `level`) VALUES
(1, 'ΗΓ.ΓΑΒΡΙΗΛ', 'A1G', 1),
(2, 'ΠΑΝ.ΚΟΡΩΝΑΙΟΣ', 'A2G', 4),
(3, 'Ι.ΔΗΜΑΚΟΠΟΥΛΟΣ', 'BG', 1),
(4, 'ΜΙΧ.ΚΟΡΑΚΑΣ', 'GG', 1),
(5, 'ΕΜΜ.ΣΚΟΥΛΑΣ', 'AL', 1),
(6, 'ΧΑΡ.ΔΑΣΚΑΛΑΚΗ', 'BL', 1),
(7, 'Κ.ΓΙΑΜΠΟΥΔΑΚΗΣ', 'GL', 1);

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `main`
--
ALTER TABLE `main`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT για άχρηστους πίνακες
--

--
-- AUTO_INCREMENT για πίνακα `levels`
--
ALTER TABLE `levels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT για πίνακα `main`
--
ALTER TABLE `main`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT για πίνακα `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
