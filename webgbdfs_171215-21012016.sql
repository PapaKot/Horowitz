-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Хост: localhost:3306
-- Время создания: Янв 21 2016 г., 10:01
-- Версия сервера: 5.5.45-cll-lve
-- Версия PHP: 5.4.31

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Дамп данных таблицы `horowitz_articles`
--

INSERT INTO `horowitz_articles` (`id`, `section`, `module`, `date`, `title`, `announce`, `article`, `active`, `sort`) VALUES
(27, 'services', 'm3', '2016-01-17 00:00:00', 'Labor2', 'hello', '<p>Hello world</p>', 0, 1),
(28, 'services', 'm3', '2016-01-18 02:14:23', 'Service4', 'Announce Service4', '<p>Content Service4</p>', 0, 2),
(5, 'news', 'm1', '2016-01-12 00:00:00', 'Compassionate, one-on-one service', 'In order to develop a strong lawyer-client relationship, we place great value on quality and mutual respect. Every case is handled with unsurpassed attention to detail and dedication to protecting your legal rights', '', 1, 1),
(6, 'news', 'm1', '2016-01-13 00:00:00', 'Success born of experience', 'Horowitz Law Group attorneys have achieved excellent results by combining practical realities with legal requirements. We offer our clients unmatched expertise, developed over many successful years of practice in Labor, Construction and Litigation.', '', 1, 2),
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
(22, 'staff', 'm1', NULL, 'John D. Horowitz', 'Director', '<p>John counsels employers on a wide range of construction and labor issues. As part of his practice, John represents companies in drafting and negotiating construction agreements, independent contractor agreements, non-compete agreements, and other commercial and employment contracts. John also counsels employers on construction claims pertaining to extra work, defective work, lien claims, surety claims, suspension of work and delay claims, and other issues that arise during the performance of construction work.</p>\r\n<p>&nbsp;</p>\r\n<p>John handles the negotiation and administration of collective bargaining and project labor agreements, which includes representing companies in labor arbitrations, jurisdictional disputes, strike contingency planning, structuring double-breasted operations, and proceedings before the National Labor Relations Board.</p>\r\n<p>&nbsp;</p>\r\n<p>John has been successful in representing companies at trials and hearings, and has appeared before federal and state courts, government agencies and arbitrators throughout the country to represent companies in construction, and labor and employment disputes, including representing employers in discrimination, workplace harassment, whistleblower, wage and hour and prevailing wage claims, as well as breach of contract actions and the enforcement of non-compete agreements.</p>\r\n<p>&nbsp;</p>\r\n<p>A significant part of John&rsquo;s practice also involves counseling employers on day-to-day management issues, such as equal employment opportunity compliance; discipline and discharge; employee disabilities and leaves of absence under the Family and Medical Leave Act, the Americans with Disabilities Act and state laws; drafting employment, non-compete, consultant, independent contractor and separation agreements; and complying with the Fair Labor Standards Act and state wage and hour laws.</p>', 1, 1),
(23, 'staff', 'm1', NULL, 'Lawrence A. Beckenstein', 'Counsel', '<p><strong>Primary Areas of Practice</strong></p>\r\n<p>Larry is a seasoned litigator with more than 32 years of experience, focusing on commercial, employment and real estate litigation.&nbsp; Known as a &ldquo;lawyer&rsquo;s lawyer&rdquo;, Larry finds creative solutions to client needs, and is readily accessible to clients throughout a case.&nbsp; Further, he has successfully represented clients through trial, and routinely achieves client objectives.&nbsp; Larry&rsquo;s retention of new clients is based almost exclusively on prior client satisfaction and word of mouth.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Education &amp; Background</strong></p>\r\n<p>Larry received his B.A. in 1978 from SUNY Binghamton, and his J.D. in 1981 from the New England School of Law.&nbsp; Larry initially honed his litigation skills by handling insurance defense cases, and supervising the defense of mass tort litigation.&nbsp; In 1992, Larry co-founded a boutique litigation law firm in Garden City, New York.&nbsp; Thereafter, in 2000, Larry returned to his roots in New York City and formed his current law firm, The Law Offices of Lawrence A. Beckenstein, P.C.</p>', 1, 2),
(24, 'staff', 'm1', NULL, 'Richard J. Delello', 'Counsel', '<p><strong>Primary Areas of Practice</strong></p>\r\n<p>Richard Delello is a career labor and employment lawyer. He represents management clients exclusively in all aspects of their labor-management relations, including union organizing drives, collective bargaining, strike preparation and labor arbitration. Rick has particular expertise in long-range labor planning, including the implications of mergers, acquisitions, relocations, subcontracting and other major management decisions. Rick has practiced before the National Labor Relations Board throughout the United States. His practice also includes counseling employers with respect to employment discrimination and wrongful termination issues. Prior to becoming Of Counsel to Horowitz Law Group, PLLC, Rick was a partner at Grotta, Glassman &amp; Hoffman and Fox Rothschild, where he represented regional and national clients in a wide range of industries for 30+ years.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Education &amp; Background</strong></p>\r\n<p>Rick received his B.S. in 1976 and M.S. in 1977, both from Cornell University&rsquo;s School of Industrial and Labor Relations. Then, while employed full-time by ACF Industries as a Labor Relations Representative, Rick attended Seton Hall University&rsquo;s Law School at night, where he obtained his J.D. in 1983. Shortly before graduating from law school, Rick began his legal career at Grotta, Glassman &amp; Hoffman, where he became a partner and member of the firm&rsquo;s Executive Committee and ultimately helped steer the firm&rsquo;s merger with Fox Rothschild.</p>', 1, 3),
(25, 'news', 'm1', '2016-01-14 00:00:00', 'Just the right size', 'Our attorneys are far more accessible to our clients  as compared to larger law firms, which allows us to provide personalized, empathetic and effective legal counsel while keeping the operating expenses at a minimum.', '', 1, 3);

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
(33, 24, 'image', '', 1, 1);

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
