-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Дек 25 2015 г., 05:06
-- Версия сервера: 5.5.45-cll-lve
-- Версия PHP: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `webgbdfs_171215`
--

-- --------------------------------------------------------

--
-- Структура таблицы `horowitz_articles`
--

CREATE TABLE IF NOT EXISTS `horowitz_articles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `section` varchar(63) DEFAULT NULL,
  `module` varchar(15) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `announce` text,
  `article` text,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `sort` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `SectionIndex` (`section`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Дамп данных таблицы `horowitz_articles`
--

INSERT INTO `horowitz_articles` (`id`, `section`, `module`, `date`, `title`, `announce`, `article`, `active`, `sort`) VALUES
(1, 'news', 'm1', '2013-02-22 00:00:00', 'Lorem ipsum dolor sit amet', 'Praesent sodales, tellus at vulputate laoreet, magna tortor mattis neque, nec sagittis augue neque eu nunc.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sodales, tellus at vulputate laoreet, magna tortor mattis neque, nec sagittis augue neque eu nunc. Suspendisse potenti. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Ut at orci vel libero commodo aliquet eget nec libero. Sed ornare imperdiet ligula, ut blandit est facilisis ut. Fusce commodo faucibus augue ac eleifend. Sed dolor nisi, dictum sed sollicitudin sit amet, sollicitudin non augue. Sed vitae urna libero.</p>', 1, 1),
(2, 'news', 'm1', '2013-02-22 00:00:00', 'Proin dolor augue', 'Mauris id purus mi. Nulla quis sapien vitae nibh tempor consequat. Morbi malesuada justo at ante accumsan vel posuere lectus placerat.', '<p>Proin dolor augue, pellentesque eu congue a, tincidunt a nisl. In eget mi sed ante venenatis semper. Donec in semper quam. Sed vel turpis purus. Mauris id purus mi. Nulla quis sapien vitae nibh tempor consequat. Morbi malesuada justo at ante accumsan vel posuere lectus placerat. Etiam sodales nisi quis mauris auctor at aliquet arcu volutpat. Cras aliquam, elit vel ultrices eleifend, ante turpis vestibulum purus, nec sagittis lacus tellus quis orci. Ut nec augue non tortor pulvinar condimentum nec a justo.</p>', 1, 2),
(3, 'news', 'm1', '2013-02-22 00:00:00', 'Nullam tellus felis, tristique et tristique in', 'Phasellus ornare pretium risus at cursus. Fusce faucibus, justo nec iaculis condimentum, dui ipsum dignissim nisi.', '<p>Nullam tellus felis, tristique et tristique in, mollis ut est. Mauris imperdiet justo nec erat adipiscing ac bibendum ipsum vehicula. Integer ullamcorper hendrerit sodales. Phasellus ornare pretium risus at cursus. Fusce faucibus, justo nec iaculis condimentum, dui ipsum dignissim nisi, a faucibus nulla arcu sed sapien. Proin ac arcu nec metus consectetur convallis. Etiam convallis elit sit amet libero facilisis eu pretium felis bibendum. Nulla facilisi. Suspendisse mollis quam at metus imperdiet sagittis. Quisque mauris purus, facilisis vitae bibendum sit amet, consectetur quis felis. Donec sed gravida nunc. Etiam sollicitudin ante metus.</p>', 1, 3),
(4, 'news', 'm1', '2013-02-22 00:00:00', 'Praesent condimentum lobortis', 'Sed orci orci, varius id vehicula at, accumsan a risus. Phasellus dapibus, turpis ut commodo ultrices, orci urna faucibus justo', '<p>Praesent condimentum lobortis erat sit amet suscipit. <a href="#">Phasellus accumsan</a> eros eget magna tristique gravida. Maecenas condimentum, sapien sit amet tempor egestas, turpis mauris dignissim purus, nec consectetur ipsum justo eu dui. Donec sed ante metus, eu posuere lacus.</p>\r\n<p>Sed pretium <strong>aliquet turpis</strong>, a volutpat massa tincidunt eget. Sed semper, velit et consectetur viverra, leo odio rutrum arcu, ut tincidunt massa elit ac dolor. Sed orci orci, varius id vehicula at, accumsan a risus. Phasellus dapibus, turpis ut commodo ultrices, orci urna faucibus justo, at vestibulum erat purus nec nisi.</p>', 1, 4),
(5, 'news', 'm1', '2013-02-22 00:00:00', 'Nam laoreet diam in nunc euismod', 'Suspendisse fermentum urna quis sem blandit faucibus. Aliquam sit amet metus ligula, in posuere diam.', '<p>Nam laoreet diam in nunc euismod et sollicitudin orci consequat. <strong>Mauris suscipit</strong>, tellus sit amet fringilla semper, nulla dolor vulputate sapien, sit amet scelerisque magna mauris elementum dolor. Suspendisse fermentum urna quis sem blandit faucibus. Aliquam sit amet metus ligula, in posuere diam.</p>\r\n<p><a href="#">Duis ipsum nulla</a>, facilisis vel malesuada id, cursus at neque. Pellentesque vel nisi lectus. Aenean lobortis vulputate lectus, non ullamcorper lacus bibendum id. Cras vitae lectus neque, at varius urna. Phasellus posuere felis sit amet augue lobortis vestibulum fermentum turpis pharetra.</p>\r\n<h2>Quisque fermentum</h2>\r\n<ul>\r\n<li>elit et tempus tincidunt,</li>\r\n<li>justo eros tristique diam,</li>\r\n<li>eget pulvinar felis velit ac quam.</li>\r\n</ul>\r\n<p>Integer faucibus tortor a libero sollicitudin pellentesque. Donec ac leo in est feugiat sodales.</p>', 1, 5),
(6, 'news', 'm1', '2013-02-22 00:00:00', 'Nulla facilisi', 'Suspendisse mollis quam at metus imperdiet sagittis. Quisque mauris purus, facilisis vitae bibendum sit amet, consectetur quis felis.', '<p>Nulla facilisi. Suspendisse mollis quam at metus imperdiet sagittis. Quisque mauris purus, facilisis vitae bibendum sit amet, consectetur quis felis. Donec sed gravida nunc. Etiam sollicitudin ante metus. Praesent condimentum lobortis erat sit amet suscipit. Phasellus accumsan eros eget magna tristique gravida.</p>\r\n<p>Maecenas condimentum, sapien sit amet tempor egestas, turpis mauris dignissim purus, nec consectetur ipsum justo eu dui. Donec sed ante metus, eu posuere lacus.</p>\r\n<table border="0"><caption>Maecenas condimentum</caption>\r\n<tbody>\r\n<tr><th scope="col">Sapien</th><th scope="col">Tempor</th><th scope="col">Egestas</th><th scope="col">Turpis mauris</th></tr>\r\n<tr>\r\n<td>volutpat massa</td>\r\n<td>mollis quam at metus</td>\r\n<td>+</td>\r\n<td>25</td>\r\n</tr>\r\n<tr>\r\n<td>turpis mauris</td>\r\n<td>accumsan eros eget magna</td>\r\n<td>+</td>\r\n<td>30</td>\r\n</tr>\r\n<tr>\r\n<td>donec sed</td>\r\n<td>leo odio rutrum arcu</td>\r\n<td>-</td>\r\n<td>50</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>Sed pretium aliquet turpis, a volutpat massa tincidunt eget. Sed semper, velit et consectetur viverra, leo odio rutrum arcu, ut tincidunt massa elit ac dolor.</p>', 1, 6),
(7, 'home', 'm2', NULL, 'Professional practice lawyers', '', NULL, 1, 1),
(8, 'home', 'm2', NULL, 'To protect your rights', '', NULL, 1, 2),
(9, 'home', 'm2', NULL, 'We do our work qualitatively', '', NULL, 1, 3),
(13, 'home', 'm4', NULL, 'Partners1', 'http://www.edem-mebel.ru/', NULL, 1, 1),
(14, 'home', 'm4', NULL, 'Partners2', 'http://www.lamma-tula.ru/', NULL, 1, 2),
(15, 'home', 'm4', NULL, 'Partners3', 'http://pekarev-tula.ru/', NULL, 1, 3),
(16, 'home', 'm4', NULL, 'Partners4', 'http://www.gakkard.ru/', NULL, 1, 4),
(18, 'home', 'm4', NULL, 'Partners5', 'http://www.lamma-tula.ru/', NULL, 1, 5),
(19, 'home', 'm4', NULL, 'Partners6', 'http://www.edem-mebel.ru/', NULL, 1, 6),
(20, 'home', 'm4', NULL, 'Partners7', 'http://www.gakkard.ru/', NULL, 1, 7),
(22, 'staff', 'm1', NULL, 'John D. Horowitz', 'Director', '<p class="font_7" style="font-size: 15px;"><span style="font-family: arial,ｍｓ ｐゴシック,ms pgothic,돋움,dotum,helvetica,sans-serif;"><span style="font-size: 15px;">John counsels employers on a wide range of construction and labor issues. As part of his practice, John represents companies in drafting and negotiating construction agreements, independent contractor agreements, non-compete agreements, and other commercial and employment contracts. John also counsels employers on construction claims pertaining to extra work, defective work, lien claims, surety claims, suspension of work and delay claims, and other issues that arise during the performance of construction work.</span></span></p>\r\n<p class="font_7" style="font-size: 15px;">&nbsp;</p>\r\n<p class="font_7" style="font-size: 15px;"><span style="font-family: arial,ｍｓ ｐゴシック,ms pgothic,돋움,dotum,helvetica,sans-serif;"><span style="font-size: 15px;">John handles the negotiation and administration of collective bargaining and project labor agreements, which includes representing companies in labor arbitrations, jurisdictional disputes, strike contingency planning, structuring double-breasted operations, and proceedings before the National Labor Relations Board.</span></span></p>\r\n<p class="font_7" style="font-size: 15px;">&nbsp;</p>\r\n<p class="font_7" style="font-size: 15px;"><span style="font-family: arial,ｍｓ ｐゴシック,ms pgothic,돋움,dotum,helvetica,sans-serif;"><span style="font-size: 15px;">John has been successful in representing companies at trials and hearings, and has appeared before federal and state courts, government agencies and arbitrators throughout the country to represent companies in construction, and labor and employment disputes, including representing employers in discrimination, workplace harassment, whistleblower, wage and hour and prevailing wage claims, as well as breach of contract actions and the enforcement of non-compete agreements.</span></span></p>\r\n<p class="font_7" style="font-size: 15px;">&nbsp;</p>\r\n<p class="font_7" style="font-size: 15px;"><span style="font-family: arial,ｍｓ ｐゴシック,ms pgothic,돋움,dotum,helvetica,sans-serif;"><span style="font-size: 15px;">A significant part of John&rsquo;s practice also involves counseling employers on day-to-day management issues, such as equal employment opportunity compliance; discipline and discharge; employee disabilities and leaves of absence under the Family and Medical Leave Act, the Americans with Disabilities Act and state laws; drafting employment, non-compete, consultant, independent contractor and separation agreements; and complying with the Fair Labor Standards Act and state wage and hour laws.</span></span></p>', 1, 1),
(23, 'staff', 'm1', NULL, 'Lawrence A. Beckenstein', 'Counsel', '<h2 class="font_2" style="font-size: 14px;"><span style="font-weight: bold;"><span style="font-family: tahoma, tahoma-w01-regular, tahoma-w02-regular, tahoma-w10-regular, tahoma-w15--regular, tahoma-w99-regular, sans-serif; font-size: 16px;">Primary Areas of Practice</span></span></h2>\r\n<p class="font_7">Larry is a seasoned litigator with more than 32 years of experience, focusing on commercial, employment and real estate litigation.&nbsp; Known as a &ldquo;lawyer&rsquo;s lawyer&rdquo;, Larry finds creative solutions to client needs, and is readily accessible to clients throughout a case.&nbsp; Further, he has successfully represented clients through trial, and routinely achieves client objectives.&nbsp; Larry&rsquo;s retention of new clients is based almost exclusively on prior client satisfaction and word of mouth.</p>\r\n<p class="font_7">&nbsp;</p>\r\n<p class="font_7"><span style="font-weight: bold;">Education &amp; Background</span></p>\r\n<p class="font_7">Larry received his B.A. in 1978 from SUNY Binghamton, and his J.D. in 1981 from the New England School of Law.&nbsp; Larry initially honed his litigation skills by handling insurance defense cases, and supervising the defense of mass tort litigation.&nbsp; In 1992, Larry co-founded a boutique litigation law firm in Garden City, New York.&nbsp; Thereafter, in 2000, Larry returned to his roots in New York City and formed his current law firm, The Law Offices of Lawrence A. Beckenstein, P.C.</p>', 1, 2),
(24, 'staff', 'm1', NULL, 'Richard J. Delello', 'Counsel', '<p class="font_7"><span style="font-weight: bold;"><span style="font-family: arial,ｍｓ ｐゴシック,ms pgothic,돋움,dotum,helvetica,sans-serif;">Primary Areas of Practice</span></span></p>\r\n<p class="font_7"><span style="font-family: arial,ｍｓ ｐゴシック,ms pgothic,돋움,dotum,helvetica,sans-serif;">Richard Delello is a career labor and employment lawyer. He represents management clients exclusively in all aspects of their labor-management relations, including union organizing drives, collective bargaining, strike preparation and labor arbitration. Rick has particular expertise in long-range labor planning, including the implications of mergers, acquisitions, relocations, subcontracting and other major management decisions. Rick has practiced before the National Labor Relations Board throughout the United States. His practice also includes counseling employers with respect to employment discrimination and wrongful termination issues. Prior to becoming Of Counsel to Horowitz Law Group, PLLC, Rick was a partner at Grotta, Glassman &amp; Hoffman and Fox Rothschild, where he represented regional and national clients in a wide range of industries for 30+ years.</span></p>\r\n<p class="font_7">&nbsp;</p>\r\n<p class="font_7"><span style="font-weight: bold;"><span style="font-family: arial,ｍｓ ｐゴシック,ms pgothic,돋움,dotum,helvetica,sans-serif;">Education &amp; Background</span></span></p>\r\n<p class="font_7"><span style="font-family: arial,ｍｓ ｐゴシック,ms pgothic,돋움,dotum,helvetica,sans-serif;">Rick received his B.S. in 1976 and M.S. in 1977, both from Cornell University&rsquo;s School of Industrial and Labor Relations. Then, while employed full-time by ACF Industries as a Labor Relations Representative, Rick attended Seton Hall University&rsquo;s Law School at night, where he obtained his J.D. in 1983. Shortly before graduating from law school, Rick began his legal career at Grotta, Glassman &amp; Hoffman, where he became a partner and member of the firm&rsquo;s Executive Committee and ultimately helped steer the firm&rsquo;s merger with Fox Rothschild.</span></p>', 1, 3),
(25, 'news', 'm1', '2015-12-16 00:00:00', 'Проверка ленты', 'Это сообщение для проверки работы ленты новостей - анонс.', '<p>Это сообщение для проверки работы ленты новостей - текст.</p>', 1, 7),
(26, 'staff', 'm1', NULL, 'Ded Moroz', 'Ded Moroz - анонс', '<p>Ded Moroz - текст.</p>', 1, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `horowitz_articles_images`
--

CREATE TABLE IF NOT EXISTS `horowitz_articles_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_article` int(10) unsigned DEFAULT NULL,
  `field_name` varchar(31) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `sort` int(10) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `IndexIdArticle` (`id_article`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=48 ;

--
-- Дамп данных таблицы `horowitz_articles_images`
--

INSERT INTO `horowitz_articles_images` (`id`, `id_article`, `field_name`, `title`, `sort`, `active`) VALUES
(45, 7, 'image', NULL, 1, 1),
(18, 6, 'image', NULL, 1, 1),
(19, 5, 'image', NULL, 1, 1),
(20, 4, 'image', NULL, 1, 1),
(12, 3, 'image', NULL, 1, 1),
(13, 2, 'image', NULL, 1, 1),
(14, 1, 'image', NULL, 1, 1),
(46, 8, 'image', NULL, 1, 1),
(47, 9, 'image', NULL, 1, 1),
(22, 13, 'image', '', 1, 1),
(23, 14, 'image', '', 1, 1),
(24, 15, 'image', '', 1, 1),
(25, 16, 'image', '', 1, 1),
(27, 18, 'image', '', 1, 1),
(28, 19, 'image', '', 1, 1),
(29, 20, 'image', '', 1, 1),
(31, 22, 'image', '', 1, 1),
(32, 23, 'image', '', 1, 1),
(33, 24, 'image', '', 1, 1),
(40, 25, 'image', NULL, 1, 1),
(38, 26, 'Image', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `horowitz_articles_meta`
--

CREATE TABLE IF NOT EXISTS `horowitz_articles_meta` (
  `section` varchar(63) COLLATE utf8_unicode_ci NOT NULL,
  `module` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `id_article` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `h1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`section`,`module`,`id_article`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
