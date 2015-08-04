-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 29, 2015 at 08:56 PM
-- Server version: 5.5.43-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `catalog`
--

-- --------------------------------------------------------

--
-- Table structure for table `barcodes`
--

CREATE TABLE IF NOT EXISTS `barcodes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `barcode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `serial` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `modiefied` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `location_id` (`location_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `barcodes`
--

INSERT INTO `barcodes` (`id`, `item_id`, `location_id`, `barcode`, `serial`, `description`, `modiefied`, `created`) VALUES
(9, 19, 12, 'asdfasdf', '', '', '2015-06-29 23:52:19', '2015-06-29 23:52:19');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE IF NOT EXISTS `blogs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `perma` varchar(255) NOT NULL,
  `teaser` text NOT NULL,
  `body` text NOT NULL,
  `entry_date` datetime DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `checkouts`
--

CREATE TABLE IF NOT EXISTS `checkouts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `barcode_id` int(10) unsigned NOT NULL,
  `membership_id` int(10) unsigned NOT NULL,
  `status` int(11) NOT NULL,
  `date_expected_in` int(11) NOT NULL,
  `date_out` int(11) NOT NULL,
  `date_in` int(11) NOT NULL,
  `modiefied` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `barcode_id` (`barcode_id`),
  KEY `membership_id` (`membership_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `confs`
--

CREATE TABLE IF NOT EXISTS `confs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `conf` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci NOT NULL,
  `select_options` text COLLATE utf8_unicode_ci NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group` (`group`),
  KEY `conf` (`conf`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=40 ;

--
-- Dumping data for table `confs`
--

INSERT INTO `confs` (`id`, `group`, `conf`, `type`, `value`, `notes`, `select_options`, `modified`, `created`) VALUES
(2, 'Conf', 'ConfType', 'Array', 'Array\r\nHash\r\nText\r\nHTML\r\nEncrypted\r\nFile\r\nWysiwyg\r\nImages\r\nDropdown', '', '', '2015-04-19 21:32:15', '2014-07-14 07:46:22'),
(10, 'Site', 'Site Name', 'Text', 'MKC Law Group', '', '', '2015-04-19 13:39:16', '2014-08-11 09:47:01'),
(13, 'Conf', 'ConfGroup', 'Array', '-\r\nConf\r\nMail\r\nSite\r\nHome\r\nContact', '', '', '2015-04-21 19:54:25', '2014-08-11 18:59:04'),
(14, 'Conf', 'status_registration', 'Dropdown', 'invite only', '', '-\r\nInvite Only', '2015-04-21 20:31:29', '2014-09-03 19:43:19'),
(15, 'Conf', 'status_site', 'Dropdown', 'Active', '', '-\r\nActive\r\nClosed', '2015-04-21 20:30:16', '2014-09-03 19:44:17'),
(16, 'Site', 'Google Analytics', 'Text', '', '', '', '2015-04-21 20:29:13', '2014-11-17 21:23:47'),
(17, 'Conf', 'MenuType', 'Array', '-\r\nPage\r\nContact Us\r\nHome\r\nURL', '', '', '2015-04-19 21:23:25', '0000-00-00 00:00:00'),
(18, 'Site', 'Address Block', 'Wysiwyg', '<h3>Fort Lee Office</h3>\r\n<p>2 Executive Drive, Suite 720<br />Fort Lee, New Jersey 07024<br />Ph: (201) 947-5200 <br />Fx: (201) 708-6676</p>\r\n<h3>Hoboken Office</h3>\r\n<p>300 Hudson Street, Suite 10<br />Hoboken, New Jersey 07030<br />Ph: (201) 203-7476 <br />Fx: (201) 708-6676</p>\r\n<h3>New York Office</h3>\r\n<p>1250 Broadway, 36th Fl., Suite 300<br />New York, New York 10001<br />Ph: (212) 726-1104 <br />Fx: (212) 726-3104</p>\r\n<p>Consultations are by appointment only</p>\r\n<p>National Languages</p>\r\n<div class="flags"><img src="https://mkclawgroup.com/files/Flags/Flag_of_the_United_States.jpg" alt="" /><img src="https://mkclawgroup.com/files/Flags/Flag_of_South_Korea.jpg" alt="" /><img src="https://mkclawgroup.com/files/Flags/Flag_of_the_Peoples_Republic_of_China.jpg" alt="" /><img src="https://mkclawgroup.com/files/Flags/Flag_of_Mexico_200.jpg" alt="" /><img src="https://mkclawgroup.com/files/Flags/Flag_of_Spain.jpg" alt="" /></div>\r\n<p>English | Korean | Chinese | Spanish</p>', 'Sidebar', '', '2015-04-25 23:22:24', '2015-04-17 04:21:24'),
(19, 'Site', 'Tag Lines', 'Text', 'Here are the taglines\r\nHere is another tagline\r\n', 'One per line. Used in home page and pages with specified tag lines.', '', '2015-04-28 18:54:52', '2015-04-18 20:38:34'),
(20, 'Home', 'Home Images', 'Images', '', 'Select the color version of the image (BW version is automatically generated)', '', '2015-04-24 09:43:50', '2015-04-19 00:44:21'),
(21, 'Home', 'Company Full Name', 'Text', 'Law Offices of Michael K. Chong, LLC', '', '', '2015-04-21 20:34:17', '2015-04-19 14:00:03'),
(22, 'Home', 'Home About', 'Wysiwyg', '<h1>About MKC</h1>\r\n<p>MKC Law Group provides knowledgeable and reliable legal services to individual and corporate clients. The firm&rsquo;s main office is located in Fort Lee, New Jersey, within minutes of Manhattan and Queens. It has satellite offices in Manhattan and Hoboken.</p>\r\n<p>As a full-service law firm, MKC Law group practices in diverse areas of the law and serve a wide range of regional, national and international clients in their business, immigration, intellectual property, personal injury, family law, criminal law, real estate, bankruptcy, tax/estate planning, and labor &amp; employment law matters.&nbsp;</p>', '', '', '2015-04-21 19:51:42', '2015-04-20 03:03:12'),
(23, 'Site', 'Footer', 'Text', '© 2015 Law Offices of Michael K. Chong, LLC', '', '', '2015-04-20 03:07:16', '2015-04-20 03:07:16'),
(25, 'Conf', 'ReCaptcha Key', 'Text', '6LdEjAUTAAAAAF_bO6XpHzTdOg7XqqLmo5uqHtM6', '', '', '2015-04-21 00:45:13', '2015-04-21 00:45:13'),
(26, 'Contact', 'Contact Us Email', 'Text', 'email@danielsu.com', 'Where the contact us form go', '', '2015-04-21 20:25:16', '2015-04-21 00:46:33'),
(27, 'Contact', 'Contact Us Thank You', 'Text', 'Thank you for contacting us.', 'Confirmation to after contact us has sent', '', '2015-04-21 20:24:57', '2015-04-21 00:48:18'),
(28, 'Contact', 'Contact Us Map', 'Text', '<iframe src="https://www.google.com/maps/d/u/0/embed?mid=zYJvde9F9jCg.kjx1PtB1VaX0" width="100%" height="480"></iframe>', 'Google map embed', '', '2015-04-21 20:25:07', '2015-04-21 01:14:21'),
(29, 'Conf', 'ReCaptcha Key (public)', 'Text', '6LdEjAUTAAAAANWWHTSPO-hKfO7MLoBH3ZDUyAAB', '', '', '2015-04-21 01:16:08', '2015-04-21 01:15:52'),
(30, 'Conf', 'UserRoles', 'Array', '-\r\nUser\r\nStaff\r\nAdmin', '', '', '2015-04-21 02:10:48', '2015-04-21 02:10:48'),
(31, 'Conf', 'UserStatus', 'Array', '-\r\nPasive\r\nActive', '', '', '2015-04-21 02:46:22', '2015-04-21 02:46:22'),
(36, 'Site', 'Site Description', 'Text', 'MKC Law Group is a full-service law firm, MKC Law group practices in diverse areas of the law and serve a wide range of regional, national and international clients in their business, immigration, intellectual property, personal injury, family law, criminal law, real estate, bankruptcy, tax/estate planning, and labor & employment law matters. ', 'Used by search engine to display results, should be around 115 characters or less.', '', '2015-04-28 18:52:30', '2015-04-28 18:48:27'),
(37, 'Site', 'Site Keywords', 'Text', 'Litigation, Employment Law, Business Law, Auto Dealership, Wholesaler Law, Professional Malpractice, Family Law, Real Estate Law, Municipal Law, Court, Criminal Law, Personal Injury, Bankruptcy, Tax, Estate Planning', 'Comma separated list. Place the most important keywords in the first 10 phrases.', '', '2015-04-28 18:53:53', '2015-04-28 18:50:47'),
(38, 'Home', 'Home Feature Image Sort', 'Dropdown', 'By Date Added', '', 'By Order Added\r\nRandom', '2015-05-02 12:27:53', '2015-05-02 12:15:45'),
(39, 'Site', 'Feature Image Transition', 'Dropdown', 'BW > Color', '', 'BW > Color\r\nColor > BW', '2015-05-09 12:09:58', '2015-05-07 15:02:46');

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE IF NOT EXISTS `emails` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body_html` text COLLATE utf8_unicode_ci NOT NULL,
  `body_text` text COLLATE utf8_unicode_ci NOT NULL,
  `variables` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subject` (`subject`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `emails`
--

INSERT INTO `emails` (`id`, `subject`, `body_html`, `body_text`, `variables`) VALUES
(5, 'Password Retrieval', '<h1>Activate an Account or Retrieve Your Password</h1>\r\n<p>Your retrieval code is: <b>{code}</b></p>\r\n<p>Enter the code here: http://worshipdashboard.org{reset_url}</p>\r\n<p>The code is valid for 48 hours. If you did not initiate this, please ignore this message</p>', 'Activate an Account or Retrieve Your Password\r\n\r\nYour retrieval code is: {code}\r\n\r\nEnter the code here: http://worshipdashboard.org{reset_url}\r\n\r\nYou have 48 hours to reset your password.', 'code\r\nreset_url'),
(8, 'Invite', '<p>{sender_name} has invited you to active your login at bThere.Today - a scheduling and reminder system for recurring events.</p>\r\n\r\n<p>Enter use this email <b>{user_email}</b> to <a href="https://bthere.today/users/retrieve_password/activate">activate your login</a>.</p>\r\n\r\n<p>If this is not your primary email, you can update your email address on the account settings page once you have activated your account.</p>', 'Please see HTML portion of this email.', 'sender_name\r\nuser_email');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE IF NOT EXISTS `images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned NOT NULL,
  `conf_id` int(10) unsigned NOT NULL,
  `image` varchar(255) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `org_id` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title_original` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `publisher` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `modiefied` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=20 ;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `org_id`, `title`, `title_original`, `publisher`, `author`, `description`, `modiefied`, `created`) VALUES
(1, 1, 'Adventures of Huckleberry Finn', 'Adventures of Huckleberry Finn', '', 'Mark Twain', 'A seminal work of American Literature that still commands deep praise and still elicits controversy, Adventures of Huckleberry Finn is essential to the understanding of the American soul. The recent discovery of the first half of Twain''s manuscript, long thought lost, made front-page news. And this unprecedented edition, which contains for the first time omitted episodes and other variations present in the first half of the handwritten manuscript, as well as facsimile reproductions of thirty manuscript pages, is indispensable to a full understanding of the novel. The changes, deletions, and additions made in the first half of the manuscript indicate that Mark Twain frequently checked his impulse to write an even darker, more confrontational book than the one he finally published. --This text refers to an out of print or unavailable edition of this title.', '2015-06-19 21:19:46', '0000-00-00 00:00:00'),
(6, 1, 'The Adventures of Tom Sawyer', 'The Adventures of Tom Sawyer', '', 'Mark Twain', 'Whether forming a pirate gang to search for buried treasure or spending a quiet time at home, sharing his medicine with Aunt Polly''s cat, the irrepressible Tom Sawyer evokes the world of boyhood in nineteenth century rural America. In this classic story, Mark Twain re-created a long-ago world of freshly whitewashed fences and Sunday school picnics into which sordid characters and violent incidents sometimes intruded. The tale powerfully appeals to both adult and young imaginations. Readers explore this memorable setting with a slyly humorous born storyteller as their guide.\r\n\r\nTom and Huck Finn conceal themselves in the town cemetery, where they witness a grave robbery and a murder. Later, the boys, feeling unappreciated, hide out on a forested island while the townspeople conduct a frantic search and finally mourn them as dead. The friends triumphantly return to town to attend their own funeral, in time for a dramatic trial for the graveyard murder. A three-day ordeal ensues when Tom and his sweetheart, Becky Thatcher, lose their way in the very cave that conceals the murderer.\r\n\r\nWith its hilarious accounts of boyish pranks and its shrewd assessments of human nature, The Adventures of Tom Sawyer has captivated generations of readers of all ages. This inexpensive edition of the classic novel offers a not-to-be-missed opportunity to savor a witty and action-packed account of small-town boyhood in a bygone era.', '2015-06-19 21:22:00', '0000-00-00 00:00:00'),
(7, 1, '疾風烈火', 'Fresh Wind, Fresh Fire: What Happens When God''s Spirit Invades the Hearts of His People', '', '辛傑米', '「疾風烈火」是作者辛傑美(JimCymbala)事奉體驗的現身說法，打從二十歲開始於布魯克林會幕教會 (BrooklynTabernacle)事奉，從僅有會眾不足二十人而靈性建築及財政巳十分破落之情況中經過不少掙扎奮鬥, 廿五年後於美國紐約及超過十個海外地區，先後建立七間教會，辛牧師並非一位受專業訓練之傳道人，他的妻子嘉露亦不懂樂章，但他倆帶領的敬拜及祈禱聚會,卻大大影響著每一位與會者的心靈。嘉露的詩選亦流行於美國，她所帶領的詩班更榮膺格林美獎，且屢屢應邀於RadioCity、CarnegieHall演出，而嘉露卻謙稱這一切成就全賴祈禱、惟獨祈禱。\r\n\r\n他們的教會位處品流複雜、黑邦盤據、流鶯處處、毒販充斥、鼠輩酒徒彼彼皆是之地區，比起現在頌恩堂所在的社區有過之而無不及，但對社區的外展服務卻是忠心熱忱、全然關愛，且部份義工正是各該事工中經悔改信主重生的,而辛牧師之曾叛逆後悔改回轉之女兒Chrissy正是外展隊工的一員。縱使附近的教會經常門堪羅雀，但會幕教會卻仍然每主日維持四堂崇拜，每堂最少有1,600人參加，且經常座無虛席，參加者要在門外排隊等候入座。\r\n\r\n讀「疾風烈火」能使人由衷地向神屈膝以至生命從此改寫。辛牧師指出「禱告越多、知所要禱告越多、禱告也越逼切。在禱告中，不但可聆聽，更可感覺、看見和經歷神，承受從祂而來的恩典」，此書所敘述無數之神跡見証,對於很多尚未從聖靈體會神之全能的基督徒，提供了一個肯定的指引。\r\n\r\n2006年頌恩堂亦將慶祝獨立廿五週年，過去已建立了七間教會，與會幕教會比較，你滿足我堂的現狀嗎？在禱告與事奉的祭壇前，你擺上了多少呢？作為頌恩堂的會友，你是否引以為榮？是否願意繼續堅持在祈禱敬拜、廣傳福音、擴展差傳、勤讀聖經、實踐關懷的行動中，忠於PGMBC的價值取向？\r\n\r\n尚未讀「疾風烈火」一書的肢體，我鼓勵你務必讀一次(該書有中文本及英文本.)，領受神所應許賜豐盛生命的大恩，為擴展天國盡一點力量。', '2015-06-19 21:36:13', '0000-00-00 00:00:00'),
(8, 1, 'The Horse and Boy (Chronicles of Narnia, Book 5)', '', '', 'C. S. Lewis', '', '2015-06-29 13:05:19', '0000-00-00 00:00:00'),
(9, 1, 'The Last Battle (Chronicles of Narnia, Book 7)', '', '', 'C. S. Lewis', '', '2015-06-29 13:03:04', '0000-00-00 00:00:00'),
(10, 1, 'The Lion, Witch and Wardrobe (Chronicle of Narnia, Book 2)', '', '', 'C. S. Lewis', '', '2015-06-29 13:04:56', '0000-00-00 00:00:00'),
(19, 12, 'Book 2', '', '', '', '', '2015-06-29 23:52:19', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE IF NOT EXISTS `locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `org_id` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `perma` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `modiefied` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `org_id` (`org_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `org_id`, `title`, `perma`, `modiefied`, `created`) VALUES
(1, 1, 'Reformed Church of Newtown', 'newtown', '2015-06-05 21:46:32', '0000-00-00 00:00:00'),
(12, 12, 'Test 4', 'Test-4', '2015-06-26 02:02:23', '2015-06-26 02:02:23');

-- --------------------------------------------------------

--
-- Table structure for table `memberships`
--

CREATE TABLE IF NOT EXISTS `memberships` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `org_id` int(10) unsigned NOT NULL,
  `membership_code` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `modiefied` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `org_id` (`org_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `memberships`
--

INSERT INTO `memberships` (`id`, `user_id`, `org_id`, `membership_code`, `role`, `modiefied`, `created`) VALUES
(1, 1, 1, '99999999999999999999', 'Admin', '2015-06-26 01:52:48', '2015-06-19 08:47:33'),
(10, 1, 10, '', 'Admin', '2015-06-26 01:52:51', '2015-06-26 01:50:22'),
(11, 1, 11, '', '', '2015-06-26 02:01:40', '2015-06-26 02:01:40'),
(12, 1, 12, '', '', '2015-06-26 02:02:23', '2015-06-26 02:02:23');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lft` int(10) unsigned NOT NULL,
  `rght` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `page_id` int(10) unsigned NOT NULL,
  `menu` varchar(255) NOT NULL,
  `perma` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `lft`, `rght`, `parent_id`, `type`, `page_id`, `menu`, `perma`, `url`) VALUES
(4, 1, 18, NULL, '-', 0, 'Root', 'root', ''),
(5, 2, 13, 4, '-', 0, 'nav_admin', 'nav_admin', ''),
(6, 14, 17, 4, '-', 0, 'nav_staff', 'nav_staff', ''),
(7, 4, 5, 8, 'URL', 0, 'Menu', 'menu', '/cms/admin/menus/'),
(8, 3, 12, 5, '-', 0, 'Admin', 'admin', ''),
(9, 6, 7, 8, 'URL', 0, 'Users', 'users', '/cms/admin/users'),
(10, 8, 11, 8, 'URL', 0, 'Rights', 'rights', '/cms/admin/rights'),
(11, 9, 10, 10, 'URL', 0, 'reLoad', 'reload', '/cms/admin/rights/load'),
(12, 15, 16, 6, 'URL', 0, 'NT Item', 'nt_item', '/admin/newtown/items');

-- --------------------------------------------------------

--
-- Table structure for table `orgs`
--

CREATE TABLE IF NOT EXISTS `orgs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `perma` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `default_period` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `penalty` decimal(10,0) NOT NULL,
  `timezone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `modiefied` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `orgs`
--

INSERT INTO `orgs` (`id`, `perma`, `title`, `default_period`, `penalty`, `timezone`, `modiefied`, `created`) VALUES
(1, 'newtown', 'The Reformed Church of Newtown', '21', 0, '', '2015-06-26 01:59:31', '2015-06-05 17:43:46'),
(10, 'test-2', 'test 2', '21', 0, '', '2015-06-26 01:59:38', '2015-06-26 01:50:22'),
(11, 'Test-3', 'Test 3', '', 0, '', '2015-06-26 02:01:40', '2015-06-26 02:01:40'),
(12, 'Test-4', 'Test 4', '', 0, '', '2015-06-26 02:02:23', '2015-06-26 02:02:23');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `perma` varchar(255) NOT NULL,
  `teaser` text NOT NULL,
  `body` text NOT NULL,
  `sort_by` varchar(255) NOT NULL,
  `hidetitle` tinyint(1) NOT NULL DEFAULT '0',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rights`
--

CREATE TABLE IF NOT EXISTS `rights` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `public` tinyint(1) NOT NULL,
  `user` tinyint(1) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `owner` tinyint(1) NOT NULL,
  `skip_group` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `path` (`path`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=24 ;

--
-- Dumping data for table `rights`
--

INSERT INTO `rights` (`id`, `path`, `public`, `user`, `admin`, `owner`, `skip_group`) VALUES
(1, 'Checkouts/index', 0, 0, 0, 0, 0),
(2, 'Checkouts/view', 0, 0, 0, 0, 0),
(3, 'Checkouts/add', 0, 0, 0, 0, 0),
(4, 'Checkouts/edit', 0, 0, 0, 0, 0),
(5, 'Checkouts/delete', 0, 0, 0, 0, 0),
(6, 'Groups/index', 0, 0, 0, 0, 1),
(7, 'Groups/view', 0, 0, 0, 0, 0),
(8, 'Groups/add', 0, 0, 0, 0, 0),
(9, 'Groups/edit', 0, 0, 0, 0, 0),
(10, 'Groups/delete', 0, 0, 0, 0, 0),
(11, 'Items/detail', 0, 0, 0, 0, 0),
(12, 'Items/index', 0, 0, 0, 0, 0),
(13, 'Items/view', 0, 0, 0, 0, 0),
(14, 'Items/add', 0, 0, 0, 0, 0),
(15, 'Items/edit', 0, 0, 0, 0, 0),
(16, 'Items/delete', 0, 0, 0, 0, 0),
(17, 'Locations/index', 0, 0, 0, 0, 0),
(18, 'Locations/view', 0, 0, 0, 0, 0),
(19, 'Locations/add', 0, 0, 0, 0, 0),
(20, 'Locations/edit', 0, 0, 0, 0, 0),
(21, 'Locations/delete', 0, 0, 0, 0, 0),
(22, 'Pages/display', 0, 0, 0, 0, 0),
(23, 'Pages/home', 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'User',
  `reset_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reset_time` int(10) unsigned NOT NULL,
  `reset_tries` tinyint(3) unsigned NOT NULL,
  `reset_timelimit` int(10) unsigned NOT NULL,
  `invite_time` int(10) unsigned NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`),
  KEY `password` (`password`),
  KEY `reset_code` (`reset_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `fname`, `mname`, `lname`, `role`, `reset_code`, `reset_time`, `reset_tries`, `reset_timelimit`, `invite_time`, `status`, `modified`, `created`) VALUES
(1, 'email@danielsu.com', '818efb2d81ab701d4aee50e7060ba59f57662ac67202b7cc6b18a279e1b347cd', 'Daniel', '', 'Su', 'Admin', 'ZMSTKdimzy', 1414631884, 0, 0, 0, 'Active', '2014-10-30 05:18:04', '2014-07-06 23:29:35');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD CONSTRAINT `barcodes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `barcodes_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`);

--
-- Constraints for table `checkouts`
--
ALTER TABLE `checkouts`
  ADD CONSTRAINT `checkouts_ibfk_1` FOREIGN KEY (`membership_id`) REFERENCES `memberships` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `checkouts_ibfk_2` FOREIGN KEY (`barcode_id`) REFERENCES `barcodes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`org_id`) REFERENCES `orgs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `memberships`
--
ALTER TABLE `memberships`
  ADD CONSTRAINT `memberships_ibfk_1` FOREIGN KEY (`org_id`) REFERENCES `orgs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `memberships_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
