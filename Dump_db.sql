-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: rental
-- ------------------------------------------------------
-- Server version	5.6.25-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `application_states`
--

DROP TABLE IF EXISTS `application_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_en` varchar(100) NOT NULL,
  `name_uk` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_states`
--

LOCK TABLES `application_states` WRITE;
/*!40000 ALTER TABLE `application_states` DISABLE KEYS */;
INSERT INTO `application_states` VALUES (1,'new','Ğ½Ğ¾Ğ²Ğ¸Ğ¹'),(2,'confirmed','Ğ¿Ñ–Ğ´Ñ‚Ğ²ĞµÑ€Ğ´Ğ¶ĞµĞ½Ğ¸Ğ¹'),(3,'rejected','Ğ²Ñ–Ğ´Ñ…Ğ¸Ğ»ĞµĞ½Ğ¸Ğ¹'),(4,'done','Ğ²Ğ¸ĞºĞ¾Ğ½Ğ°Ğ½Ğ¸Ğ¹'),(5,'canceled','Ğ²Ñ–Ğ´Ğ¼Ñ–Ğ½ĞµĞ½Ğ¸Ğ¹');
/*!40000 ALTER TABLE `application_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idClient` int(11) NOT NULL,
  `idCar` int(11) NOT NULL,
  `dateFrom` datetime NOT NULL,
  `dateTo` datetime NOT NULL,
  `idPlaceFrom` int(11) NOT NULL,
  `idPlaceTo` int(11) NOT NULL,
  `dateOperation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idState` int(11) DEFAULT NULL,
  `note` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `idClient_idx` (`idClient`),
  KEY `idCar_idx` (`idCar`),
  KEY `idState_idx` (`idState`),
  KEY `idPlaceFrom_idx` (`idPlaceFrom`),
  KEY `idPlaceTo_idx` (`idPlaceTo`),
  CONSTRAINT `client` FOREIGN KEY (`idClient`) REFERENCES `clients` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idCar` FOREIGN KEY (`idCar`) REFERENCES `cars` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idPlaceFrom` FOREIGN KEY (`idPlaceFrom`) REFERENCES `places` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idPlaceTo` FOREIGN KEY (`idPlaceTo`) REFERENCES `places` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idState` FOREIGN KEY (`idState`) REFERENCES `application_states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (13,1,3,'2016-01-01 00:00:00','2016-01-05 00:00:00',1,1,'2016-01-22 00:00:00',4,'ok'),(14,1,8,'2016-01-06 00:00:00','2016-01-09 00:00:00',5,5,'2016-01-22 00:00:00',4,'ok 2'),(15,1,8,'2016-01-10 00:00:00','2016-01-12 00:00:00',5,7,'2016-01-22 00:00:00',3,'ĞĞµ Ğ¾Ğ¿Ğ»Ğ°Ñ‡ĞµĞ½Ğ¾'),(16,1,6,'2016-01-15 00:00:00','2016-01-16 00:00:00',3,3,'2016-01-22 00:00:00',3,'sorry'),(17,7,4,'2016-01-01 00:00:00','2016-01-10 00:00:00',2,2,'2016-01-22 00:00:00',5,''),(18,7,5,'2016-01-01 00:00:00','2016-01-10 00:00:00',2,2,'2016-01-22 00:00:00',5,''),(19,4,9,'2016-01-05 00:00:00','2016-01-08 00:00:00',4,4,'2016-01-22 00:00:00',1,''),(20,4,6,'2016-01-07 00:00:00','2016-01-07 00:00:00',3,3,'2016-01-22 00:00:00',4,'ok'),(21,1,3,'2016-02-01 00:00:00','2016-02-02 00:00:00',1,1,'2016-01-22 00:00:00',1,''),(22,1,3,'2016-01-27 00:00:00','2016-01-28 00:00:00',1,1,'2016-01-24 00:00:00',4,'ok');
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_park`
--

DROP TABLE IF EXISTS `car_park`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car_park` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idCar` int(11) NOT NULL,
  `idPlace` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `car_idx` (`idCar`),
  KEY `place_idx` (`idPlace`),
  CONSTRAINT `car` FOREIGN KEY (`idCar`) REFERENCES `cars` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `place` FOREIGN KEY (`idPlace`) REFERENCES `places` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_park`
--

LOCK TABLES `car_park` WRITE;
/*!40000 ALTER TABLE `car_park` DISABLE KEYS */;
INSERT INTO `car_park` VALUES (5,3,1),(6,4,2),(7,5,2),(8,6,3),(9,7,3),(10,9,4),(11,8,5);
/*!40000 ALTER TABLE `car_park` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(45) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `photo` blob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (3,'Ford Mustang',200.00,'ÿØÿáÿExif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0·\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0¬(\0\0\0\0\0\0\01\0\0\0\0\"\0\0\0´2\0\0\0\0\0\0\0Ö‡i\0\0\0\0\0\0\0ì\0\0$\0\0\0\0\nü€\0\0\'\0\nü€\0\0\'Adobe Photoshop CC 2014 (Windows)\02016:01:11 01:55:49\0\0\0\0\0\0\0\0\00221 \0\0\0\0ÿÿ\0\0 \0\0\0\0\0\0 \0\0\0\0\0\0\0´\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0r\0\0\0\0\0\0z(\0\0\0\0\0\0\0\0\0\0\0\0\0‚\0\0\0\0\0\0u\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0ÿØÿí\0Adobe_CM\0ÿî\0Adobe\0d€\0\0\0ÿÛ\0„\0			\n\r\r\rÿÀ\0\0i\0 \"\0ÿİ\0\0\nÿÄ?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q2‘¡±B#$RÁb34r‚ÑC%’Sğáñcs5¢²ƒ&D“TdEÂ£t6ÒUâeò³„ÃÓuãóF\'”¤…´•ÄÔäô¥µÅÕåõVfv†–¦¶ÆÖæö7GWgw‡—§·Ç×ç÷\05\0!1AQaq\"2‘¡±B#ÁRÑğ3$bár‚’CScs4ñ%¢²ƒ&5ÂÒD“T£dEU6teâò³„ÃÓuãóF”¤…´•ÄÔäô¥µÅÕåõVfv†–¦¶ÆÖæö\'7GWgw‡—§·ÇÿÚ\0\0\0?\0õT’I%)$’IJI$’R’I$”¤’I%)$’IJI$’R’I$”¤’I%)$’IOÿĞõT’I%)$’IJI$+2i¨ísÚû¤€RHè¥LH\'õ\']MLĞÒmq–\0éìß{İüŸüR¿ëGéï#+-¢ßÏqkŞïü·1şKRQ\Z.Ş½’÷y,:ş»}XyÀ|Ùcêëj|Ÿ®ŸV1i7ßÔjebÃ‰3û¬kKßı”©ËÜöë 4jéğûÛµaİõÛ¡UikìÈ\ræê+u•Ïî¶Æ}?úŞõËu¯¬”uÛM}c§ÓÓ§ÙGÚ[¬óòÍôUÿ\0°û½&„õ|jp½VÖ3pò\ZF¿gÌÆs›ı‡Úİÿ\0ÙD\0«{f}pú¾øœ“Tÿ\0¥ªÚÇùÖÔÖÒWqúÏMË~Ì\\šo1şÚÜÍk÷ÿ\0Ñ\\¥}ØİPµÍìêÀ°VåÃ¦S&xõéú1*Õ~qê0rvüD)5Íp–GˆÕy½DSÕññ0sİE\r³\'ªµ³Ñn%cô®}nsè­û½Œ²½–1i·+9Øã5¹¶tıÃÔ§ª©,¦¢?C^Sm­Ùåìı&_§™G¥gêõÿ\03êØ5µÕ²\rìöÉ.c¡ıq¯#%;ª\ZêÊ´íÆÈ®E7;ı?ß•ÿ\0uìşsşÓßzéÒA¤’I$?ÿÑõT+ì¹­ÛE~¥ãqÚÁü«¯ı Û;ºGÂ9õ t»]vfF úvï«*¸&Š(e›énU™®Ÿ^¯JïKÔõŸüÚIãKu±m½ÏµÙ†<± 0º=ÛeÏú{«k\\ô,ş­ÓğÜÚ¯ÍÆÅºÁ5·\"æVH˜Şcšç·püÕå6ŒŸ­¶P31¬£‹®¹µĞÚCËKvä;síŞ÷ÿ\0>¨_ş1>°eöê°s¶ˆhÈÅ­úr…\Ze2éöÜ¾ÃM]?,î9c¨ù¬¸\n¿³UO÷×}DKo¯\rÂŒzXË­hc\0ıë,úı\"ñ»>¶\\ÜzîËú¯Ò>ÍtŠïO¤>$;ÒÈkÚÇ}ÌPÇúÕõn·nWİŒãôŸ…Ÿ}:øú~æ cØ.PkŒØıß–±zö§cä=­ÿ\05Ÿ÷÷ª¹ßX0:vÖd^E¯şo½Ö\\ïêcÕºÏíıç]?ë‡ÕêrYc²ºÍ-]FEŒÉ¨ÿ\0%Ïë;?¨º|/­İ\nÁe76ŠŞu±­­ÍÈö]Y9/ÿ\0ŠõS\r†Ä=¹è\'÷lGùˆè½õŸ/^ŸĞ/4Ÿğ¹÷7çè—oU²ºwÖ¾¢ØÈÀè;DÜ€ûËIşËš°³şºg_?`«hÿ\0O•%ä~ıxvÆÿ\0×m³ş-ae_Õú†™¹6ÚÓş\rÎÚÏ–5^_ôSxüÙÇ*N•ıèëÿ\0:NöwÕÊ\0,Î?Uév´ßS‡Ë\Zêÿ\0E`_õ?§dZ?PéÌwj±~Ùlÿ\0d×•gı%,•„ûÇÛnû>+}®¯iµà}|JÇÓÊ½ŞÆ¡şzÅ«“õ£ªŠ¾ÁÑÛWAÀf¢—3×?Ë¿&ß«ıOûrÄ=ÃŞ—N ×·ÆNçäˆÿ\0Öäÿ\0Ì>ªÒ‹^îA¬äÕşoÚñ(ÿ\0«F=#ücâŒu:šŞXr}“ü†úÿ\0ô_Z5oë—µ¯·;/!§‹>Ñm=¿6ÇÑW[‹ÖÙnN\\ø2ëgğ³Ûı´}óÚş‹Ñ €x¸<ç÷õ;:ïMúüŒæ»3¬õ+™^E¨;ÓÃÆw­·+Ñg½·YôşĞïÒÓ‘éÿ\0ƒEú­Õiêø¹uìœ,\'9Æº«¾‹ŞH­î®ë¬Çe~ïÑ~‡ôõZŞ²Zk¿¨]é¸A¢ëıFÿ\0Ì§=–šªáaÙ‡Ÿè\nğß˜%„ãâ¼}+é{yÚˆÏcbKá†2¬ºeÃõùX}dé}+\\z§©m­¤5—€H}­Şü[iµ»}/§^;ö~vŸâóëWíŒ;p2r[™•ƒµ­ËhxVá¹…ş½t[öŠ¶úw~ôŸÎûÖfKÇpslé¸NäÕ[gúÁ€µË[ì²âµ…„:±°µ¡³?ÓÇk=gÕşü-iÃ%ôbÉÉ\0MJ ¤D¸½_Ş“×$±R,Yh\"DVö‚?“cn·ş¡hôÜ´á²íA|’Òd‰;ƒwT§‰ÔÉ†Ph‹­ÿÒô®«™ö.ŸvFÇXàY[\0.sì\"ššİÅ­÷Yc9yßVéy]j—t,ÜçcŒ{›}MÍŞÓé[ad±ÎµØö:¿Gİè{ÿ\0Ÿ]WøÈ1õ\'ªy±ƒï¶¦¯9fÖ—‘Mg©YuØ˜O»ì™U¹â›\r´bå`7×~ïKİUŒËÆıŞŸè?GúEÁù®¸Cw”É=£3š\\#n!(ğğüÍÜñSÕŒÜn—Õ°ójkİh©Òö±\0Ts+ÿ\0Ï¤±2Å—×zK€éâæÎªêˆ?>Êìÿ\0ÀÑèúó˜ìc“•ƒE­“SİY’Ódş”^ß¢ßßF_êk}ŸmÄ?ğvKGù¶Õÿ\0P‰”Æñ¿%±ÁËOn`Gûñ#şrN¯õÛ ²Ü<üËëØÏB»šóUf±éT{.Æ³Óö[ML¯úz×/Ÿ—›‘h~kv9ƒkZ*µ­Û]L©c1»}‹ª·ë½Ïpsº…\0dÔ,äÍ•[ÿ\0T§W×;]ˆïë3aÿ\0¢êS}Ù~áfû†4æ OõLeû`ñM± cıêÆ]Ìc×[¿Iî½ïPç©ºGĞ­§ıuvßó¢¼–í¿$åülµ/£Yº‡ÇÚïËC’÷ÀÜRGÂ²Kù¹‰ÿ\0‹ÿ\0~àtVÛÖésûèpmî°±­vùôïßyeMsöì»İôıÿ\0áWCÒ¾©ıZÇ³×êC§ŞgskwPc@?ºúªw¦úÿ\0ë¿öïój–E¬ÏÊ³¦tnZ\Zã}¸˜u—€à==ï|W[k§{¶Wô*·\"ïô¨oú»õ”:VXñcø=2<\\FPø­œ±ÂqG1“¹åq÷b½Æ÷8™QzuíÈÆ«¤ã\\?>»\Z\\?¨ê©r§Õõ¯å¾ëiÆËÈ%¥Æ¡¨ğÏÌõ˜1ê¯wç¹qÕô\\æŞhÍ®ÜKCCı+šXâÂvúŒŸkÙ»Ûì[x8ucA˜R|#ºG4Áª¯5¸¾ËÊ<|fQ?/£./ñbİêİB“‰UX´´_lUE@ˆ®½›ÆmıÏÒşçé²;õšÚ3öİu6íwéªcv9ÿ\0	·o¶ÖWş\Z¿W&Ïûmgu¾»“oQ».›,©ÇÍĞ°í>½µ~íŒşmüÏĞÚ°1§ãĞ6˜,€!¶\\ïûlú_õÅ,1ƒ#Y4ùk$r˜c•Gá¡òÌÇæâıèş‹êÙ=w­ôß…‡’-ı- ¸Ç‹‡şEWÈê¿UœÏQÿ\0Wñ,ufHcZÙÍ+•¾ç¼î™Ú\'àï¨bûUî`GØëŒ\\¼¢	Œ½@Kæ”wşëİÓ_ø¾Êhsú;kÜöçú–V´°:OÔ¦\\×aÖê€m¸4Iö:µçXİCÒ†‡8ªÚÀêaægq&Ãÿ\02Hd×Q±ä®7.XøqËşéì>°u.Ğ(ep¼•€_?½cXÀû7SûkSêíÔdtÊïÇvê,\ruNæ[±ŸãZúåùy–2‡i\"Š-‚Êë;nÙ·şädı7ÿ\0£Æ^¥ş-.õ¾¨ãYØ¾Ğ>Or³í.ı\\Ù4/›€üıfcé/ÿÓôN´j8ŞøŒêöI»µ¯sÚÈ~ê¨·ôy“½şÓÿ\0EúOÑ¿ŒwIª¿Nü/«ùôá\nßNUïx·+Ò,ô¨§ûò2ıK}j¥Ÿè¿™±z´Õ{6ZİÂdv ×sßŞj§gEÆ¶äİ·è›I±Ãú®°»gö1rË‹1ÇF qb^«˜fıMú›‘e´ôî¿û*_ê;¨0ÖZïvĞÏ¶}‚æìkö‡şº¥gø§úÂæ›p2ğ³©:±õXàLü+u_ø*õkºsK‘g¦D\ZìqµŸöŞO¯_ı“oÔŒW»\\Lwõ@©óÿ\0€p\\½ÖÜàùßìô¾?™õS¯aä¿\ZÜvkÑÍ®êŸ÷}–}/ä*®è}hsÓòO›js‡ùÕ‡/i?QÚÖKìª;S™’ÁşnKºôÿ\0›]b–m«2óö;ÿ\0öã§b¿ÿ\0Mõÿ\0UıÚ…{‚]oƒ…ñœn›A¶Ë0oôŞÚši³é¼z{¾‡æoŞ§Óú,W~oQ¦Ê±qv°1à°Û‘`ßˆ7l³nÏÖ²^Ï¡‰Wú[ñ×±7¦}o«Js¡¿ÊÀÄ\'ÿ\0Î£ÿ\0=¬Û>®õœÎ¥öÓõ†§õ*X[_OÉÃõKñe¶÷2çÕSlÍ£Õßé;mu¢L«dˆH+Ÿ÷Ü/“äÖì1X­¶Pm¿ŞÍí=»¶î÷~êè:M-éØıW;¨õ,^”àæ[™ˆ÷X[M¯õz¬v=Uìfçº»=[-ÿ\0…özFOíŒ_±õª5eÔÇ8öcÙQ?GÖ¡—:œŠ÷·ùÚ³±úwLÀsİõ_¬`ºØõ&M•Díİö|ö5Ûw!B§,8äe°ö¼¹½c¦ıh«©çdfÓYôë9°‘V@i®ÏC%Î³Ö·ìù¢ÏÒ³ô~¢İê9ßdÁ¾óÍm$|5¿ÚµXêVº-æËõ_­W}¥Î7İ½Úú®õmÈÜíşÿ\0zçş¹\\Ú0kÇ\rº›¯é)È-sÚ+ú[ı6SµÎµÍömQe£]t.‡#˜áåóqoÇ\nõz¥éÿ\0§ÀáŒLÇáâäéÓ²ûÅöûX÷°ŸR¦=ßÎ\\ÿ\0Iôÿ\0~ÅT¶ßEÁ.k„­\r`6zMıßô[X\'¨åU‚ÛÃÛŠì¦zÃôWêYcïx³Ûcm§ú*ı÷%ÒúwQµù}/úEì¦ê\0&².£»è·Ó³İ[ÿ\0›ViÈvğié®é•İ‘y9D–³µ»dşšì†Õwö(«şÜN>Êß êìF1¼ı»gş¶ªÿ\0]Eà5ı@PÖ’*§ÖtIæÇº¦îş®õzŸñc„`åeçŞ{†¹”´ÿ\0eµ¿ş­UöfI:.×úG—„#^CÆ:iLx^y½NÚ@£—P¨ôqş\0×)æ}aÇÈÁ~CÅwß„×?ípuîæè¾ê™EW{¶7ôŒ}‹¦¿êÔî›‰nnoOy£†Ë®¶ë­-cu{ı,Wïöşwè—Ÿõ§ôî´ætß©ØÙ¡Ï››ph¬üĞ¥ÛŸo¥şõ—úˆœ2Ó[ªÈüK¨Œ|<æ¹ş‹}Ô1±ºúÚúë.÷9®›7¹ßE¬¶Ë,o»Şõíâ²·×õ/>w/™ñZÓÿ\0R¸\ZÅï\\½/.ƒYÌ´7\"ĞwÔÚª¨zvzŸÒ½âÿ\0Oı§ÿ\0v®t>–Î‘Ò1:k¿ìÕ†9ÿ\0¼ÿ\0¥u¿õÛ\\û‚ä?ÿÔõT’I%)$’IJI$’RîÇ¢öì¾¶ZÑ¨kÚ?é\"$’š±úGıÂÇÿ\0¶™ÿ\0‘Kö?Jí‹Pø4È®$’œŒŸ«í²íØÙÄ¨¶\ruµ¿H~{\\æ—{—/õƒüU®ó’î©}Ù Ei%à	İ±®İú&nıÚ×~’V§éßW™•õW¤uj¶ÛC1­	Áîoø;S´:\'CÆèô_M\Z‹ï~C´à»o´%›}‹I$­JLá¹¥²Dˆ‘Èø\'I%4Æö†œ»È\0\rKJjüèI9µ0UMöSS4®ªı6µ‚tc\Z*ú\ro³b¸’JX\04	ÒI%?ÿÕõT’I%)$’IJI$’R’I$”¤’I%)$’IJI$’R’I$”¤’I%)$’IOÿÙÿíÔPhotoshop 3.0\08BIM\0\0\0\0\0Z\0%G\0\0s\0\08BIM%\0\0\0\0\0ñ?3k˜³•\"X×ÂeF>8BIM:\0\0\0\0\0å\0\0\0\0\0\0\0\0\0\0\0printOutput\0\0\0\0\0\0\0PstSbool\0\0\0\0Inteenum\0\0\0\0Inte\0\0\0\0Clrm\0\0\0printSixteenBitbool\0\0\0\0printerNameTEXT\0\0\0\0\0\0\0\0printProofSetupObjc\0\0\0\0P\0r\0o\0o\0f\0 \0S\0e\0t\0u\0p\0\0\0\0\0\nproofSetup\0\0\0\0\0\0\0Bltnenum\0\0\0builtinProof\0\0\0	proofCMYK\08BIM;\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0printOutputOptions\0\0\0\0\0\0\0Cptnbool\0\0\0\0\0Clbrbool\0\0\0\0\0RgsMbool\0\0\0\0\0CrnCbool\0\0\0\0\0CntCbool\0\0\0\0\0Lblsbool\0\0\0\0\0Ngtvbool\0\0\0\0\0EmlDbool\0\0\0\0\0Intrbool\0\0\0\0\0BckgObjc\0\0\0\0\0\0\0\0\0RGBC\0\0\0\0\0\0\0Rd  doub@oà\0\0\0\0\0\0\0\0\0Grn doub@oà\0\0\0\0\0\0\0\0\0Bl  doub@oà\0\0\0\0\0\0\0\0\0BrdTUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Bld UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0RsltUntF#Pxl@R\0\0\0\0\0\0\0\0\0\nvectorDatabool\0\0\0\0PgPsenum\0\0\0\0PgPs\0\0\0\0PgPC\0\0\0\0LeftUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Top UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Scl UntF#Prc@Y\0\0\0\0\0\0\0\0\0cropWhenPrintingbool\0\0\0\0cropRectBottomlong\0\0\0\0\0\0\0cropRectLeftlong\0\0\0\0\0\0\0\rcropRectRightlong\0\0\0\0\0\0\0cropRectToplong\0\0\0\0\08BIMí\0\0\0\0\0\0H\0\0\0\0\0H\0\0\0\08BIM&\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?€\0\08BIM\r\0\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\08BIMó\0\0\0\0\0	\0\0\0\0\0\0\0\0\08BIM\'\0\0\0\0\0\n\0\0\0\0\0\0\0\08BIMõ\0\0\0\0\0H\0/ff\0\0lff\0\0\0\0\0\0\0/ff\0\0¡™š\0\0\0\0\0\0\02\0\0\0\0Z\0\0\0\0\0\0\0\0\05\0\0\0\0-\0\0\0\0\0\0\0\08BIMø\0\0\0\0\0p\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿè\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿè\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿè\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿè\0\08BIM\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\0\0\0\08BIM0\0\0\0\0\0\08BIM-\0\0\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\0\0\0@\0\0@\0\0\0\08BIM\0\0\0\0\0\0\0\0\08BIM\Z\0\0\0\0A\0\0\0\0\0\0\0\0\0\0\0\0\0\0´\0\0\0\0\0\0n\0i\0s\0s\0a\0n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0´\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0null\0\0\0\0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0\0´\0\0\0\0Rghtlong\0\0\0\0\0slicesVlLs\0\0\0Objc\0\0\0\0\0\0\0\0slice\0\0\0\0\0\0sliceIDlong\0\0\0\0\0\0\0groupIDlong\0\0\0\0\0\0\0originenum\0\0\0ESliceOrigin\0\0\0\rautoGenerated\0\0\0\0Typeenum\0\0\0\nESliceType\0\0\0\0Img \0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0\0´\0\0\0\0Rghtlong\0\0\0\0\0urlTEXT\0\0\0\0\0\0\0\0\0nullTEXT\0\0\0\0\0\0\0\0\0MsgeTEXT\0\0\0\0\0\0\0\0altTagTEXT\0\0\0\0\0\0\0\0cellTextIsHTMLbool\0\0\0cellTextTEXT\0\0\0\0\0\0\0\0	horzAlignenum\0\0\0ESliceHorzAlign\0\0\0default\0\0\0	vertAlignenum\0\0\0ESliceVertAlign\0\0\0default\0\0\0bgColorTypeenum\0\0\0ESliceBGColorType\0\0\0\0None\0\0\0	topOutsetlong\0\0\0\0\0\0\0\nleftOutsetlong\0\0\0\0\0\0\0bottomOutsetlong\0\0\0\0\0\0\0rightOutsetlong\0\0\0\0\08BIM(\0\0\0\0\0\0\0\0?ğ\0\0\0\0\0\08BIM\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\08BIM\0\0\0\0‘\0\0\0\0\0\0 \0\0\0i\0\0à\0\0Äà\0\0u\0\0ÿØÿí\0Adobe_CM\0ÿî\0Adobe\0d€\0\0\0ÿÛ\0„\0			\n\r\r\rÿÀ\0\0i\0 \"\0ÿİ\0\0\nÿÄ?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q2‘¡±B#$RÁb34r‚ÑC%’Sğáñcs5¢²ƒ&D“TdEÂ£t6ÒUâeò³„ÃÓuãóF\'”¤…´•ÄÔäô¥µÅÕåõVfv†–¦¶ÆÖæö7GWgw‡—§·Ç×ç÷\05\0!1AQaq\"2‘¡±B#ÁRÑğ3$bár‚’CScs4ñ%¢²ƒ&5ÂÒD“T£dEU6teâò³„ÃÓuãóF”¤…´•ÄÔäô¥µÅÕåõVfv†–¦¶ÆÖæö\'7GWgw‡—§·ÇÿÚ\0\0\0?\0õT’I%)$’IJI$’R’I$”¤’I%)$’IJI$’R’I$”¤’I%)$’IOÿĞõT’I%)$’IJI$+2i¨ísÚû¤€RHè¥LH\'õ\']MLĞÒmq–\0éìß{İüŸüR¿ëGéï#+-¢ßÏqkŞïü·1şKRQ\Z.Ş½’÷y,:ş»}XyÀ|Ùcêëj|Ÿ®ŸV1i7ßÔjebÃ‰3û¬kKßı”©ËÜöë 4jéğûÛµaİõÛ¡UikìÈ\ræê+u•Ïî¶Æ}?úŞõËu¯¬”uÛM}c§ÓÓ§ÙGÚ[¬óòÍôUÿ\0°û½&„õ|jp½VÖ3pò\ZF¿gÌÆs›ı‡Úİÿ\0ÙD\0«{f}pú¾øœ“Tÿ\0¥ªÚÇùÖÔÖÒWqúÏMË~Ì\\šo1şÚÜÍk÷ÿ\0Ñ\\¥}ØİPµÍìêÀ°VåÃ¦S&xõéú1*Õ~qê0rvüD)5Íp–GˆÕy½DSÕññ0sİE\r³\'ªµ³Ñn%cô®}nsè­û½Œ²½–1i·+9Øã5¹¶tıÃÔ§ª©,¦¢?C^Sm­Ùåìı&_§™G¥gêõÿ\03êØ5µÕ²\rìöÉ.c¡ıq¯#%;ª\ZêÊ´íÆÈ®E7;ı?ß•ÿ\0uìşsşÓßzéÒA¤’I$?ÿÑõT+ì¹­ÛE~¥ãqÚÁü«¯ı Û;ºGÂ9õ t»]vfF úvï«*¸&Š(e›énU™®Ÿ^¯JïKÔõŸüÚIãKu±m½ÏµÙ†<± 0º=ÛeÏú{«k\\ô,ş­ÓğÜÚ¯ÍÆÅºÁ5·\"æVH˜Şcšç·püÕå6ŒŸ­¶P31¬£‹®¹µĞÚCËKvä;síŞ÷ÿ\0>¨_ş1>°eöê°s¶ˆhÈÅ­úr…\Ze2éöÜ¾ÃM]?,î9c¨ù¬¸\n¿³UO÷×}DKo¯\rÂŒzXË­hc\0ıë,úı\"ñ»>¶\\ÜzîËú¯Ò>ÍtŠïO¤>$;ÒÈkÚÇ}ÌPÇúÕõn·nWİŒãôŸ…Ÿ}:øú~æ cØ.PkŒØıß–±zö§cä=­ÿ\05Ÿ÷÷ª¹ßX0:vÖd^E¯şo½Ö\\ïêcÕºÏíıç]?ë‡ÕêrYc²ºÍ-]FEŒÉ¨ÿ\0%Ïë;?¨º|/­İ\nÁe76ŠŞu±­­ÍÈö]Y9/ÿ\0ŠõS\r†Ä=¹è\'÷lGùˆè½õŸ/^ŸĞ/4Ÿğ¹÷7çè—oU²ºwÖ¾¢ØÈÀè;DÜ€ûËIşËš°³şºg_?`«hÿ\0O•%ä~ıxvÆÿ\0×m³ş-ae_Õú†™¹6ÚÓş\rÎÚÏ–5^_ôSxüÙÇ*N•ıèëÿ\0:NöwÕÊ\0,Î?Uév´ßS‡Ë\Zêÿ\0E`_õ?§dZ?PéÌwj±~Ùlÿ\0d×•gı%,•„ûÇÛnû>+}®¯iµà}|JÇÓÊ½ŞÆ¡şzÅ«“õ£ªŠ¾ÁÑÛWAÀf¢—3×?Ë¿&ß«ıOûrÄ=ÃŞ—N ×·ÆNçäˆÿ\0Öäÿ\0Ì>ªÒ‹^îA¬äÕşoÚñ(ÿ\0«F=#ücâŒu:šŞXr}“ü†úÿ\0ô_Z5oë—µ¯·;/!§‹>Ñm=¿6ÇÑW[‹ÖÙnN\\ø2ëgğ³Ûı´}óÚş‹Ñ €x¸<ç÷õ;:ïMúüŒæ»3¬õ+™^E¨;ÓÃÆw­·+Ñg½·YôşĞïÒÓ‘éÿ\0ƒEú­Õiêø¹uìœ,\'9Æº«¾‹ŞH­î®ë¬Çe~ïÑ~‡ôõZŞ²Zk¿¨]é¸A¢ëıFÿ\0Ì§=–šªáaÙ‡Ÿè\nğß˜%„ãâ¼}+é{yÚˆÏcbKá†2¬ºeÃõùX}dé}+\\z§©m­¤5—€H}­Şü[iµ»}/§^;ö~vŸâóëWíŒ;p2r[™•ƒµ­ËhxVá¹…ş½t[öŠ¶úw~ôŸÎûÖfKÇpslé¸NäÕ[gúÁ€µË[ì²âµ…„:±°µ¡³?ÓÇk=gÕşü-iÃ%ôbÉÉ\0MJ ¤D¸½_Ş“×$±R,Yh\"DVö‚?“cn·ş¡hôÜ´á²íA|’Òd‰;ƒwT§‰ÔÉ†Ph‹­ÿÒô®«™ö.ŸvFÇXàY[\0.sì\"ššİÅ­÷Yc9yßVéy]j—t,ÜçcŒ{›}MÍŞÓé[ad±ÎµØö:¿Gİè{ÿ\0Ÿ]WøÈ1õ\'ªy±ƒï¶¦¯9fÖ—‘Mg©YuØ˜O»ì™U¹â›\r´bå`7×~ïKİUŒËÆıŞŸè?GúEÁù®¸Cw”É=£3š\\#n!(ğğüÍÜñSÕŒÜn—Õ°ójkİh©Òö±\0Ts+ÿ\0Ï¤±2Å—×zK€éâæÎªêˆ?>Êìÿ\0ÀÑèúó˜ìc“•ƒE­“SİY’Ódş”^ß¢ßßF_êk}ŸmÄ?ğvKGù¶Õÿ\0P‰”Æñ¿%±ÁËOn`Gûñ#şrN¯õÛ ²Ü<üËëØÏB»šóUf±éT{.Æ³Óö[ML¯úz×/Ÿ—›‘h~kv9ƒkZ*µ­Û]L©c1»}‹ª·ë½Ïpsº…\0dÔ,äÍ•[ÿ\0T§W×;]ˆïë3aÿ\0¢êS}Ù~áfû†4æ OõLeû`ñM± cıêÆ]Ìc×[¿Iî½ïPç©ºGĞ­§ıuvßó¢¼–í¿$åülµ/£Yº‡ÇÚïËC’÷ÀÜRGÂ²Kù¹‰ÿ\0‹ÿ\0~àtVÛÖésûèpmî°±­vùôïßyeMsöì»İôıÿ\0áWCÒ¾©ıZÇ³×êC§ŞgskwPc@?ºúªw¦úÿ\0ë¿öïój–E¬ÏÊ³¦tnZ\Zã}¸˜u—€à==ï|W[k§{¶Wô*·\"ïô¨oú»õ”:VXñcø=2<\\FPø­œ±ÂqG1“¹åq÷b½Æ÷8™QzuíÈÆ«¤ã\\?>»\Z\\?¨ê©r§Õõ¯å¾ëiÆËÈ%¥Æ¡¨ğÏÌõ˜1ê¯wç¹qÕô\\æŞhÍ®ÜKCCı+šXâÂvúŒŸkÙ»Ûì[x8ucA˜R|#ºG4Áª¯5¸¾ËÊ<|fQ?/£./ñbİêİB“‰UX´´_lUE@ˆ®½›ÆmıÏÒşçé²;õšÚ3öİu6íwéªcv9ÿ\0	·o¶ÖWş\Z¿W&Ïûmgu¾»“oQ».›,©ÇÍĞ°í>½µ~íŒşmüÏĞÚ°1§ãĞ6˜,€!¶\\ïûlú_õÅ,1ƒ#Y4ùk$r˜c•Gá¡òÌÇæâıèş‹êÙ=w­ôß…‡’-ı- ¸Ç‹‡şEWÈê¿UœÏQÿ\0Wñ,ufHcZÙÍ+•¾ç¼î™Ú\'àï¨bûUî`GØëŒ\\¼¢	Œ½@Kæ”wşëİÓ_ø¾Êhsú;kÜöçú–V´°:OÔ¦\\×aÖê€m¸4Iö:µçXİCÒ†‡8ªÚÀêaægq&Ãÿ\02Hd×Q±ä®7.XøqËşéì>°u.Ğ(ep¼•€_?½cXÀû7SûkSêíÔdtÊïÇvê,\ruNæ[±ŸãZúåùy–2‡i\"Š-‚Êë;nÙ·şädı7ÿ\0£Æ^¥ş-.õ¾¨ãYØ¾Ğ>Or³í.ı\\Ù4/›€üıfcé/ÿÓôN´j8ŞøŒêöI»µ¯sÚÈ~ê¨·ôy“½şÓÿ\0EúOÑ¿ŒwIª¿Nü/«ùôá\nßNUïx·+Ò,ô¨§ûò2ıK}j¥Ÿè¿™±z´Õ{6ZİÂdv ×sßŞj§gEÆ¶äİ·è›I±Ãú®°»gö1rË‹1ÇF qb^«˜fıMú›‘e´ôî¿û*_ê;¨0ÖZïvĞÏ¶}‚æìkö‡şº¥gø§úÂæ›p2ğ³©:±õXàLü+u_ø*õkºsK‘g¦D\ZìqµŸöŞO¯_ı“oÔŒW»\\Lwõ@©óÿ\0€p\\½ÖÜàùßìô¾?™õS¯aä¿\ZÜvkÑÍ®êŸ÷}–}/ä*®è}hsÓòO›js‡ùÕ‡/i?QÚÖKìª;S™’ÁşnKºôÿ\0›]b–m«2óö;ÿ\0öã§b¿ÿ\0Mõÿ\0UıÚ…{‚]oƒ…ñœn›A¶Ë0oôŞÚši³é¼z{¾‡æoŞ§Óú,W~oQ¦Ê±qv°1à°Û‘`ßˆ7l³nÏÖ²^Ï¡‰Wú[ñ×±7¦}o«Js¡¿ÊÀÄ\'ÿ\0Î£ÿ\0=¬Û>®õœÎ¥öÓõ†§õ*X[_OÉÃõKñe¶÷2çÕSlÍ£Õßé;mu¢L«dˆH+Ÿ÷Ü/“äÖì1X­¶Pm¿ŞÍí=»¶î÷~êè:M-éØıW;¨õ,^”àæ[™ˆ÷X[M¯õz¬v=Uìfçº»=[-ÿ\0…özFOíŒ_±õª5eÔÇ8öcÙQ?GÖ¡—:œŠ÷·ùÚ³±úwLÀsİõ_¬`ºØõ&M•Díİö|ö5Ûw!B§,8äe°ö¼¹½c¦ıh«©çdfÓYôë9°‘V@i®ÏC%Î³Ö·ìù¢ÏÒ³ô~¢İê9ßdÁ¾óÍm$|5¿ÚµXêVº-æËõ_­W}¥Î7İ½Úú®õmÈÜíşÿ\0zçş¹\\Ú0kÇ\rº›¯é)È-sÚ+ú[ı6SµÎµÍömQe£]t.‡#˜áåóqoÇ\nõz¥éÿ\0§ÀáŒLÇáâäéÓ²ûÅöûX÷°ŸR¦=ßÎ\\ÿ\0Iôÿ\0~ÅT¶ßEÁ.k„­\r`6zMıßô[X\'¨åU‚ÛÃÛŠì¦zÃôWêYcïx³Ûcm§ú*ı÷%ÒúwQµù}/úEì¦ê\0&².£»è·Ó³İ[ÿ\0›ViÈvğié®é•İ‘y9D–³µ»dşšì†Õwö(«şÜN>Êß êìF1¼ı»gş¶ªÿ\0]Eà5ı@PÖ’*§ÖtIæÇº¦îş®õzŸñc„`åeçŞ{†¹”´ÿ\0eµ¿ş­UöfI:.×úG—„#^CÆ:iLx^y½NÚ@£—P¨ôqş\0×)æ}aÇÈÁ~CÅwß„×?ípuîæè¾ê™EW{¶7ôŒ}‹¦¿êÔî›‰nnoOy£†Ë®¶ë­-cu{ı,Wïöşwè—Ÿõ§ôî´ætß©ØÙ¡Ï››ph¬üĞ¥ÛŸo¥şõ—úˆœ2Ó[ªÈüK¨Œ|<æ¹ş‹}Ô1±ºúÚúë.÷9®›7¹ßE¬¶Ë,o»Şõíâ²·×õ/>w/™ñZÓÿ\0R¸\ZÅï\\½/.ƒYÌ´7\"ĞwÔÚª¨zvzŸÒ½âÿ\0Oı§ÿ\0v®t>–Î‘Ò1:k¿ìÕ†9ÿ\0¼ÿ\0¥u¿õÛ\\û‚ä?ÿÔõT’I%)$’IJI$’RîÇ¢öì¾¶ZÑ¨kÚ?é\"$’š±úGıÂÇÿ\0¶™ÿ\0‘Kö?Jí‹Pø4È®$’œŒŸ«í²íØÙÄ¨¶\ruµ¿H~{\\æ—{—/õƒüU®ó’î©}Ù Ei%à	İ±®İú&nıÚ×~’V§éßW™•õW¤uj¶ÛC1­	Áîoø;S´:\'CÆèô_M\Z‹ï~C´à»o´%›}‹I$­JLá¹¥²Dˆ‘Èø\'I%4Æö†œ»È\0\rKJjüèI9µ0UMöSS4®ªı6µ‚tc\Z*ú\ro³b¸’JX\04	ÒI%?ÿÕõT’I%)$’IJI$’R’I$”¤’I%)$’IJI$’R’I$”¤’I%)$’IOÿÙ\08BIM!\0\0\0\0\0]\0\0\0\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0 \0C\0C\0 \02\00\01\04\0\0\0\08BIM\0\0\0\0\0\0\0\0\0\0ÿá^http://ns.adobe.com/xap/1.0/\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.5-c021 79.155772, 2014/01/13-19:44:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\" xmlns:photoshop=\"http://ns.adobe.com/photoshop/1.0/\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:DocumentID=\"adobe:docid:photoshop:a3d418ae-b7f5-11e5-9c71-f2ea50208459\" xmpMM:InstanceID=\"xmp.iid:f3388036-03b2-aa4f-accc-a208acf4fdbf\" xmpMM:OriginalDocumentID=\"F1C8DF936E23926E555B6CF4CA6770CD\" dc:format=\"image/jpeg\" photoshop:ColorMode=\"3\" xmp:CreateDate=\"2016-01-11T01:50+02:00\" xmp:ModifyDate=\"2016-01-11T01:55:49+02:00\" xmp:MetadataDate=\"2016-01-11T01:55:49+02:00\"> <xmpMM:History> <rdf:Seq> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:9581f4a7-e4c2-9049-883c-a3e79e85335c\" stEvt:when=\"2016-01-11T01:52:07+02:00\" stEvt:softwareAgent=\"Adobe Photoshop CC 2014 (Windows)\" stEvt:changed=\"/\"/> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:f3388036-03b2-aa4f-accc-a208acf4fdbf\" stEvt:when=\"2016-01-11T01:55:49+02:00\" stEvt:softwareAgent=\"Adobe Photoshop CC 2014 (Windows)\" stEvt:changed=\"/\"/> </rdf:Seq> </xmpMM:History> <photoshop:DocumentAncestors> <rdf:Bag> <rdf:li>5EE3EF0C41697BF07E6C2821BB379DC6</rdf:li> <rdf:li>C1DD39FBB457C0FDB98FC240EF869A41</rdf:li> </rdf:Bag> </photoshop:DocumentAncestors> </rdf:Description> </rdf:RDF> </x:xmpmeta>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 <?xpacket end=\"w\"?>ÿî\0Adobe\0d\0\0\0\0ÿÛ\0„\0		\n\n\n\n\r\rÿÀ\0\0´\0ÿİ\0\0#ÿÄ¢\0\0\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\0s\0!1AQa\"q2‘¡±B#ÁRÑá3bğ$r‚ñ%C4S’¢²csÂ5D\'“£³6TdtÃÒâ&ƒ	\n„”EF¤´VÓU(\ZòãóÄÔäôeu…•¥µÅÕåõfv†–¦¶ÆÖæö7GWgw‡—§·Ç×ç÷8HXhxˆ˜¨¸ÈØèø)9IYiy‰™©¹ÉÙéù*:JZjzŠšªºÊÚêú\0m\0!1AQa\"q‘2¡±ğÁÑá#BRbrñ3$4C‚’S%¢c²ÂsÒ5âDƒT“	\n&6E\Z\'dtU7ò£³Ã()Óãó„”¤´ÄÔäôeu…•¥µÅÕåõFVfv†–¦¶ÆÖæöGWgw‡—§·Ç×ç÷8HXhxˆ˜¨¸ÈØèø9IYiy‰™©¹ÉÙéù*:JZjzŠšªºÊÚêúÿÚ\0\0\0?\0õN*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUØ«ÿĞõN*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUØ«ÿÑõN*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUØ«ÿÒõN*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUØ«ÿÓõN*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb­RH¤u«ˆbv4ªÒüØ¦İéŸ×ıq¥·Í;|÷ş¸­¡„)	gäÌz³4@>“Ä`¦Fd÷0o1~tùgH¹ú­ªM«L¦’›6C\ZS·©!Ucş§,‹B[~}yrJzÖ:•¿`I@úbvıXğWÖÛó›È’ÓÔÔ¾¬Ok˜\'‡ñdãøà¢µîËÏ>Y¿PluK+¦?e#¸‘?\"ÕÁ»!\0z¦pßNËÊH”Óƒù0[#ˆt*¢ö/Úa¶TKˆì¸ùV˜Û0±v*ìUØ«±Wb®Å]Š»ÿÔõN*ìUØ«±Wb®Å]Š»v*ìUØª•Íå­´fK‰V$QRXÓlSHïe½jÔÚÚv-´Ò—û­~ú˜ª:)-•BF@°®(TõÇošøâ®æ¾8ªU¯ù“IĞ´é/õ9ÄÉ°YÛ²¢õf8@Wù×ó/]óC½´<¬4bh¶ˆHyŒÌ>×úƒàÿ\0[&#Hc–¶‹P)¿A’TöıGûÌÿ\0pÁjŠM>ñEÀœmVÍ¤YÌ?Òlıäˆ÷‘Š¬ƒK†Ñ¹XÍu§°èm.&‡ş7ø\\	¦QyÏvH~¥¯½Í>Ì\Z„QÎ§ØÈ¡$~Èd!2òæ6±çaqg4c=‰öâŞ¥\n5B„\r^23\nuoçÌlÑ €í´S‰‘ xcøşŠeÿ\0+&å.n-|µ¢jZİ¥”Ö¡lğ%¿­£Ç—RÇë¼gá“Òø¾XcN>\\Øø·E;Ğ?7´k«ØôİV9ô­F]£µ¿ˆÛÊçş+5hgÿ\0»“’²9´øPŸĞhÿ\06Lş)¢š5’&Œ*¬7&(hó_ŠŠ»v*ìUØ«ÿÕõN*ìUØ«±Wb­rQÔŒUÜ×Ä}ø¦š2Ä\r¨\' $ckÂP—\ZŞ‘li=ä(”º×î­r&`um†›$¹FGàƒ“Ì6“?C$Ê?j8ÜƒôÒ™0y7ÇG!õz¬BQšyì®(%7\r«ğDmNL\0>Àwl„DH;±²»÷qË=Â€@•ƒñ Rµòòÿ\0à8e‘ âåâ‘åÂ?›=O]Öí\06^^ºÔÏ‚\\Z[ù/\"7ü& Àb’CqùƒùRË«†NÇô•“~ÇáK¹I31ı÷î¡Ès/üš\r‡nö<X~lk±ÿ\0½^\\šÜ÷õ#¹Z}ñá¡ŞŠ,[Î¿ó”^X¶]\\ŞIıÅ¨™ã-N¬Ä¡âƒå€„<«]ÿ\0œ™òŸ™.Òë]ò…äã\ZCª°~(`¥N «­?<ÿ\0(E=o.ëøªö))ÿ\0Tİ9#náôÇéëóAoqO‘IÇ‰S­\'ógò”(†?7>½°º‰—Ûœk*‘²{/7yóÕ<×¤KËì‡¹“ÿ\0#„xmY£ßocwgv¾6÷vòıÜãj©>—ªAııœª?˜¡#ï¥1µ`~ópÑ,fX F¸ÜÆz»\réÓì®¨ˆ­n¼«äK-&×™üÛ0$B†Ù\Z>SLüºÛ}Ÿùx‘3ê“²œ¼,`ïÿ\0‹ş\'üÖCe{¤éúe®•§D ±³ˆCm\Z±ÙPwñfûLß´Ù{­b^iÕ¬îkØÒæÕè})@e>~Œ;0ø±T?“?8®ü™}®©q%ÿ\0–e`´¤Éqi]‡65i¡ïÃûØÿ\0İ¢|IY…n˜å3ÿ\06Íş·ó¢úSOÔ,õ(olåYí§PñJ„e\" ‚1Ú\'E…‹±Wb®Å]Š¿ÿÖõN*ìU§tä`ˆ –f4\0¤“Š@½ƒÔ¼Ïxm%¹Ó`U²ş–5Xßz~é\0äãş,n1ÿ\0­”Ë!«†x„f}güœ>¯óåü?Õú‘ZSjÛ%ÍôÊQÎ8ÃÅNã˜´GìşÇúÙ(ßV¼âUËø¿‰#\\Ù\"ÔWupÑµ¥™º*õüvQşSÃd${œ¬P9\Z!åKÛ³êj×¾ŒGsmÿ\0‰9ø›!áÌ·ş~Ûxó§ÿ\0³Ñ|½aO«Úqşìˆş91AÇÉ©Ï“ê’\"ëUKXL’2[Â½ÿ\0€ÂeMxôæF‡¨¤Òk—F°¯£é,Â®GˆNßì²¾2y9ÑÓF<÷?Ñÿ\0Šh5GïdyùLiÿ\0(¸-5Ü)¾VãıÖ¿pÅh÷©ÏwafIŒQ¢Š³?\0ÆÃ(ÂG•°İgó›òãJs—ñÏ*ìRÙ}J²_‡ñÈœ¾:Iõ<?Öc³ÿ\0ÎHùYO:öäöáU¯Ür/“pĞ_ñqV<Iu×ç¥åú‘“on•¶¬…˜}Åcâ³\Z\nïÿ\0K?wæI52MÇålW`îL¶ñ×ş	mÃ~8Œ§½Ğ@ÿ\0û?â’=KBÓ/A/ùF`\'öíî/b?r|?ğ¹/¸ç²aø”X¦£ùq-Ç#cåSO\'j	šeû\0á°ş`°=óşš	?ü«}RĞ1¾Ò/ı/÷à†J¯ÍU[.Çš2çÍÀÕö^LBÇ®(S£ivµO¬ËnOXæø	eî´Ä†ãÒì¥<£Ô!Ÿ¶Ü	¯ÉX,mÖŞhó¦‹+-§¨CÀüÙÜÎ#4èh¬0%ëŸ’zæ_uèl|Ë­Üê\Z²ËÛk ²–\nÀÄ…äS\"óp>Ëıœ„öFš+şj‡æ¿ç%Í¯æ–¤l-­ïm´¨†—­êP8a%ÑC§RñŒŸø¥pãÈÏ;•w\'_–v_<ê¯§ÅåËÈ¤D×WV·È`zUÄğò^Gì¨vl2•0ÅˆÌ²ß6şWÉw\'¯§j	O«İÅËqÿ\0Â[şMdqÕÊşO™äb^k®~]yÊ(ˆŠo‹ÁmfG‘¸Š‘1I;Ñ2ÈÌHlãfÓÏ©÷òcó+Zü¿Öbòç™`¹¶òåü«+sˆlç‘¸©^@~áØÑ—ıÖßü9\nİbx‡	ÿ\03ş\'ú¯¬‘ÕÔ:ÊÂªÃpAÅ¬ŠÙ¼PìUØ«±Wÿ×õMG*×%¥j)Š±Ëï6y=¼Ä<·¨ŞÇ¥Ág‚ÒäúqÎ­ĞÄZ‘ÎTõ@Y—ùpp2Çš\'ÌÎ\'°‚ÑRîêµ\0§/QÇÉ•\nä2r§+D*f_Ì„¥şö?î‘%nÏ€ù)?Çíc…	©etû—Ó’95‰Í¤s†XšP§‚»P…¾ÑÀmœL/~O7o2ÎFY³å\råNå¢½hİ¿àØà÷38´½?Ò¸ÿ\0¼’\ZOÌ¯ÎÈ\ro¿,ZjukMF7û‡ÆÙc¼¦ÿ\0ŠŒÓş|ëÖıË~\\kÖ§Æ0’Ô˜ñC!é?âØü¿ó>V—PúÎ©m©Ù¯§\rå“ğåé4Ÿ¤‚MØv8òFááœ?.êÇóÓòêğ€ºÍ´l{LÏÿ\0’éëÃRîb2bşu\\p²K9hš€Qºë–ÃĞ’9zÿ\0Æ6l‰>MÃ<¥ñ[ª^ù®á:Š´‡cytŞœ)òâ“ıüD“Ğ6G8ï9şÊLjoÊ­aı9ykºš›+jEûÆØøg©eù¸¡	Kúÿ\0ñÔÛMüºü¥Ò\0ôô”»•nzÈkôí‡†ö¿Q.\\8ÿ\0ªØõ?,éP Ólì­×¬¬‘Æ£ı‘GF\'Yóœ‹Õÿ\0?ü§òy0ÛÒ²Ôÿ\0_áşˆìğy–#¨ÎKêD‘§èê‰ÚK¹wÿ\0€ŒÆù”·Ç³aÕ ºÿ\0œ„óìõôä¶¶Oøªß‹–Èœ’o‹\0é6uå+?Îï2ÙG¨ÜêÃGÓe£šá#Gu=Ö5^Tùãä—ZseÑá<&<sşdß#µDĞ´vãæ/Ìù£¸j(Y¾„Ÿş%á÷É§ó£ø0Güâ’OçOË%n#Íú¶ :QíZd?ğq‘1Î-ÑÍ–CûœhIuŸÉ;¿÷¨Ë9=Z]\"3_¹AÃqşqAÇš_äaóPúüãÜ£x-Åz—Ón#?|C$2üMĞÊ\\ğÿ\0¥1e^Tó\'åN€³&•«ZY‹’¦Nkt§á]æF¥?–¼rG-ó-GG(Š9Gñïx—*ô5suå½DëŒìòİÉõû.E‹Aï^Mû_ä~Ö]@ê]vnÌÉÎ1ŸùÉÏå\rÇæ·— »Ò¼µ¢Â©3ıfæk¹m«%\0UÇ.|eWù°NBGŸØÙ§Ç(F¥2ßêñ8%şÅè2ù³ó¶!ş—å{9¼x\\ÂµûÙr’û?‰ÿ\0\'/órÇıôX7æO—¿0|í¥ÙÆ4,.­§švcy=e@œT„/Âíä°ÌFìµö†y„x\"}?Ï1b:GåçUÜGMŸS{m7š‰íî/L±O ­\'JrO‡-9¢ëcÙy¯qÃñ}…äMJá,ÆtÜ™*Ğ1?³]Ôÿ\0mMı«€qqÇüÿ\0ø¦^	ğû^éÔ¥»†ZRQTÌFÀ\rÉ8ª° î:‡v*ÿ\0ÿĞõÔÈûöB¿ª˜ªñüIñ#yÇæg”<¹ù‰¡Üè),vºÔl‚+£\03ÂÇ.QÊÄn+Å×ıtlÈEàß_7šD–@ò5ü¶ºo—ÔAsª$…î%%(Á&%œ,³!øäçşëUÈnI\'¿âŸû‡™ëšœ­®¢YõíFC,QÊe73qıâİ™ê½rÏ5şb}é?ø·Î0º¬ZıülNÊ.æ\'ı‰V¡Èøa3>ôm¿æoæu°­·šuP¥\ZêQJ{3œ|0¿˜——úPšÛş}~qZîi¸•VŸŞ›ïæ­Œçº)¤?ó’ß›Q0{«‹[Í‡Ç=´B£ç\"q¶ÃXcÑ5ƒşr›ÌmDÔü¿av§¯*Wş	å_ø\\ÄäG´k½Xş|ş]j?·ä”R~ÓD —ğhâoø|‰Â\\ˆöœz¦ŞXüÄü‚³ÔWP±³]\"ø‚³Ú3q®Ç‰§ã_eÈ˜Iº:¬İ\0Õz~Ÿç¿,kASKÖ¬§cöb†àC\'Ñ¤ÿ\0…È\'\"ê†ó™ô_/¯-_R{YrKv´Î?ÉœÏÌ²¯ùYr8HÏ;Õÿ\06µûø™4d´Œ\rÅÊVr#«\'ÏwÈ’İJ¹œÁuõ-JQ6«y5üÍº‰\\°ÿ\0bŸe~Œƒ\\ıKcÓä V‘å^¿~DÉº8¹šdcr+N¤ïƒ¶:`Ï¼ƒ¥ySC±o9y­Å¼LWEÒ\0÷3/û°¡ı…ÿ\0+áË1×2àë<Iz1l‹\'úœ?âæ—yÏó_ÎşlĞÌÚf˜vÆÕŠü=ƒÈ(Íôq\\”óÕ¦ìØÀlt:g2¤‡«Rµùå\'#°†‹¹3ƒL‘?¼ˆşp*¿o§ en\\pW4æ×@™Ô0ZƒĞ™\rÛê!.Š`Ô-ö\n³|€ÜãE\"qi4ÉïÑŒşÀûgæz/Ñ„&`û‘cË\"8~ÀE ‘M©ĞşxK– lÆu-Ëåíf”B-dnHFÛ~ÜÓ,&Æî$ #’ãÉè–6ºŠÅ¶wsC¡Iã¡Àïlœ±Ÿ¨GäÉ4ËP\0·™€ëêc÷‘\\²$¸9±ãè+Ü™$.Î²Fµ•FÃù‡^\'çÛü¬˜,È¤ÄêšÔr[Gcu†ŸrúRÄ\ZC!ı‡-^5è¹g‡-ƒŠ0â&@äœ‡‹ÓÂ™Æ5äßôíÙou„¸¦JåŞ\\s\'üœ?ÙÅ7u­ùŠİ‹˜¯­î¹[üQåVxÛ‰‡‰Ü.Hd\"ù4äÑaœeÂ\'ÅõqCı“=³9í!/îåEtù0fK¡UÅ_ÿÑõN*Çüëæ;LîÚ%S(S@	jß*Í“„[°ìİÔd1‘áó?>şt»ş^ê÷ÚE¤¶ú¬Kª¹*D-tşŸª¤nxüEvû|2˜êƒ²ÉØ²Á1dJ2|[}Ğê2¬¼½^ª?h©0c™8ˆ#gQ­„£”‰~\"Ê<å¨Aq{ep…Oúº–\'“U`U<uÜeÎ#/²Ò¼(NÃŒfµîw\\\n§U<GÃÊµ\njíşÅ¾Î{oåß™,uI‡–§òe¼Ö±Z\Z•ÁQ,£¨ìà?’œy/‡ìaT›ÿ\0.ÿ\0*4M=µ¼ÕôÙAèé–æ¹¡!Ö6à¨œHş÷ãOõ±W”êÿ\0¡–ñ†’×&Ä âo½0ÜÚa%h?g¡„Sn´ã·ÎqVÖ‰ÔrcN25è+Š¦Úf…gy<üƒ¤6ñ´²°›* ,Nõ\rÓˆÿ\0+H$rWòÿ\0œæ³™-5f{í0ì‹!ç5¿ƒDÍÒãşíÿ\0ÉûY‹›—.nß³»RX¥SõAšMÉÂ5¼Ä#$7!Ğı–Õ¿WÂÙTwzó/ ÄĞ?Å¿P·ó*¬i÷&vŞÂa¶õº7§Jÿ\0’rüy!ÊAÔë´Z 8±NSşÜæì›ùkò÷ó³]ºŠ;KibŠo;ÉÖÖ(8¡ÉZ«|ƒf_ƒçşRÔã“Õaÿ\0œnüÄ1«Íæ8cr8é÷Ğä|w2­©Æ~Ækå/È;{b’ù‹U›U(œB$”J×µx¯²ãàC¹?Êú¯çŸö?©‹şdÎ>ùŠëQVò†²ºuµ+!»¸*ªk²(Ìpøîb{[Uş©\'è?“ÿ\0™Í©—Ö5ÅƒHµ-Ü–·rK$œNëÀ«ñÓg–FxáÈ9\ZM^«,Àñ\'_ÅêzbùzÆ5yå\"MÜõ ì‰ì3€=Wæ¥Èscº¾»åí\"@³\\A¦,›Ç¥zšr!C6ÿ\0äª®ã2úBrêqâ½–ÿ\0Òÿ\0‰M<½©é\Zçİ$„\'Ö(unÊô\0ñöaË\Z4C”N<XåÅèŸÇ©‘Cå.ôPêÑXËĞ£³!æWLc«=láü˜nãòWºú?ÍÌ¨Õ¨F‚)Óe91€ô!ÁŸkãş,sùÜ)&¿ùçç±bŞpW‰X5\'„¸«OM¼pœ2éŒ{OÍ@eŒ¿­Ö¡¤~P~k%[/8Z<qªˆ\0´£AˆÄO.Ë]&§âßù¿ñhñùmùåoö5>âŸÍ?Æ5ÁáO¸2\Zı)ç,ŸéãËÓ@üøµ?ZeÈä ÿ\0ˆºcÃtf3é%şR_éJs X~aK¦¯¦Ù$333\"—¥®ÜÜn~,@™æÏ&š;ÆrâdXjjã÷–Ãì¸«<~Íİ“ü¯µüÙ1if„ù}_î”uOMšÆáÏÖ£?ÿ\0d==†	6a\'ÕÌ,ÏËO]*8ûDÌ«ş¯*¸\ZfTM‡ŸÔÃ‡!	¦I¡ÿÒõN*ó>OæSÍí¢é°[Ü[XØ¥Ì±K7£+I<Œ D*ß{òÌ\\ÀÈĞzË0Å‹[qÊ¸«‹éyÂXé°êZ‡—üËgugm¬D#0XæE\"Ê’BZ±KÁ—öY¾Å€á$¯A¨ÉãcŒ±Ê&xåÑ–ßK7Ò<ùú7êZL7\\À\\jQgcãêĞúóÌ¢æ^9Â<k]ƒW”Ü€—õ+ş’KµùÆ¯É]uôlói¬¢‘°ÁG€Y½S™ <‹©	ÇêŒ¾L?Uÿ\0œ\'¶b_IóT¿eo-VO½£‘?âm¯f\'¨ÿ\0Î~eA_©jzeâ‰êMGÈÆÃşZìÌ??›>\\’7»ÑÕ“•aš	¡™K.ûUƒ±eÁ,‚<Ûği2e¾ÇL_Ğÿ\01ï®Öµc¨Ş\\€Ï*¼Äl%åĞd|h­’ìíDyÂ_$M;T€·«g<$õıË©úy˜˜ïqå§È9Æ_éJÉÄü	¦á‰#éL•µ‘K¢œ+%\rn@‡Ş~%Å	Ó_%·—.#Rº„‹äÆJD‡™\0³É‚ÿ\0Àá*¾õ­iJ\0Ôè8èŸ”É>¨.ti(¥»³™·U0¯9•ˆè[ü™ü¶Ì\rTNoUØ:™Ã/£‰ë:W•¼ _Pó]…¸êcf•‡ÜÄÁç ô5¹#´1N_écúYf—¨~\\è¨ëgæò‚M¥Q²DŞş“BÊü¥lÊÇ’0Äè5Ú<º™q\\şŒ£êş·«ıêmæ¯’mcT5]ÎìúV[áWŒm–şf.ì<ßÍ¯ëN+âüñò¿\"º®©!=T[Fú(£æbä,ßÑÿ\0Mÿ\0B?ç?’/.j°j÷zr1Ä?á_l®Z°œ~Îd—X²D¾¼š•>¯llíåÜØ±ı§mêÙ\\²™»Ÿ8«â?Îb˜¾l:E‚Ş’]3úVÑ97ù¯ùüXÂrá³j#¦Ärª[cãı49«_Ç¥,wš³ÌgÔA–)8«\\\\€H2)„G‘ùrû0ÄÊ¼³h\0ˆ ñ¹rË$Œ¤x¤WùWÍÖ¿\\\Z†™,¥à§×-\'%0’ø£¢MOÚáÃ\'‡‡Ç•ä€˜¦ı®X2	_Çı(½sUó,‹*½c–4•[Ä2õúsO9Q}O„J69$ïæ·2TkZÃ¶CŒ·4I¢‡óYJG{<aÎ)_\rğŒÒïk—ga—8Äÿ\0š<»ù«ç+×·ŸSšxÈ¢ú¥_q¸?=FNä:¸ùû\'O=¸#ıscù¿¬ì%ô¤-ñ2áª“­Éìş.œCüæAgù©ÈVkhˆêHfO×Ë-\ZŸ\'_“°«”Šu¤ù×G½‚/U\ZÕÜ*C¨å½9Ÿ†[±.nÍË^¤O™5½?HÑ§Ô^DâŠLlH¥iZŸòGÚ8g*Õ¥Á,“á;âş«À,8ùš ÑN-î$	õÇu£s4_R´‘9øU¿gùW*8&¶hiòKÂ£ôÂÒ}åbJ7ìTû™~>N^+)MòÇ\rÿÓõN*øÛşrÇRÕlÿ\06­$Ó®¥´š=>#êÂÌ¤UÚŸgâêr°‘·>y%XÌI×şéŠ·Ÿ¿6æÔtM]·¹Ôæ´¸[í>Òê&íø!,Ø¡ŒŸµƒ.8‘ÜÛ£×dÚ\"dÿ\0›&akùñå æ-VÆûK”S˜xÄ¨+î¤7ü&cx$‹»£ÚŒ¸rFx¥ı ŸZ~fyô/£¬[«0ª¬äÂßòT&@âèåb×à—)ÇıÏû¤â1ÉÃ›©’:ƒm=Gü#edæG,!?ô²Y7æì÷‡VŸå\'?âjÙÌLul¥—<qÿ\0sşå&Ö¿6¼Ûz#Rú­òES©+±Ş2øò—4G²pà$ãâ…ÿ\0Kş),ÿ\0•‰m>‹\r{´3Ïû˜È1°z\'‚c”ÿ\0ÓF?ñÔD˜:?¼Ó¯#ñár’¹ã\\;)ñ{ãş”ÿ\0Å#áóÏ“&^70\\€zú–öóøÂ$<Ú¥‚G¤úoø•›Ê@Z;t=ÌšbWïŒ¶KÄó-_”ïÇ	|cşú-AåÉ»Šı\ZWÀÚÜEÿ\0L#7ô¾ö©ö|Oùÿ\0Jÿ\0â‘‘ş\\şHJO+{÷GºOé“ÿ\0¤ãO²ÿ\0Úûø¦5{oåß-Y^é¾_++^1„Üª²úv`‡ôT°šY>)_ö‘ùŸ1ç;½íÛàÒğğ“0˜Oùì^IXW\"‘) ä»cÒ§\'N<²/RV;XY(Û-.òá†ÅWÆ™ ŒX%&Y£èRA¯‰Ê÷%Ì0¶ŸvÚu¤³PMj€“ıáÙÿ\0Øå Ğprãñ$Æ¼Ëæ4Ôµ»»Ë‡&ÃOV‰J\Z‘šÎÊOíË\'î‘¿›ÓÍ–0³ÎOÛzŸ9ˆú1z#şıƒyËYÔuËÛ»ûæeš8¢#ŠX¡f8‘x¦^]C¼µr–—²¯©#H\"E=Z6øf#a„zmÍì¢ÎÖÕ6ÊĞr¯Ú¹âàYsQ©‡ïßö>s-,|½?éRö¼oWít_Ö³*ás]×­óÚÁÂ‘™×[’ÊÄı°p²ñz§vZÁo¢¡!$öÛYT2Q>ƒ×ğÉFMYpìÉ¬u%Ø£q>Ù`“‡“üÎóhŸê^\\šãÑ³ë:œ£p°®çáñ4û?µéñı¬ÍÓ#gøİ<ßkÌb‡~¬¿Wü*?ñrx‡˜õİzkbütæfÀáv÷n\nú•)Ìÿ\0»37™y°kwß—SµÏ’´›¦ë<!úrŒb£NghK‹1=ü?îY&Xá?ÿÔõN*ùWóÖ=\r>l¤ó+MgåË‹-n5hã,–ó2BYˆ)OQŸíª|yQróuüÿ\0÷I6µçK0şlù;½NÏZ¿ÒY Ô5.¦ĞÇ<œ\"«Pr§”œ~æ©ö¹dsı?&ŞÌ—İÿ\0¸/0üËÓ¿GëP^$¤“Bhğ¹òl£C-ˆvŞÓb©Âcøáøÿ\0v—êént-N ‡¶q/ÙXË$ò(¯í)ãÇ3ŞeªF¬¾ŸÀæ¦ˆXµ?ÉqEÈĞH$rFA«ëvàu´û&vRú„µr³Š\'˜rqësÃéœÇùÅXy¯ÌÜyAæQ°%şş@¬éaÜåÚÕã\'úÜ+×ÎzòŸŞÚeëÿ\0p~V-±íí@çÂÍDGç­AM$³‰½Õ™]r?”íÃÚcöHˆüü¼‚É`Àø,€şµÈ\'›l}¢=aşËş:™éşp´»gip¢$i$o„€¨91ê;dˆ÷·ÃÚ<}a/šµ¯æ—¿k×Zu¬`ş¦9YÒOÉÎÅí›¯~µ4‡óÊj¤›§Ve1=Iû©•~S\'s˜=¡Òõô²Hôÿ\03Á¬ù†/5¤é²ÉI§àŠ>¤î¤³S2ñé€Ø‡G«í³+”g_ÍŒéªÚykşqöàq“ó.ë™ê„_®:fOçJ{WRŒı‰Œ–ß÷~d³5jâØ~qğ!ÜåMGóÊ\"óòòõlg›DüÀ·{ØÑšº{W…˜\n…’œX)öl‰Ó@ôm‡lêboŠÿ\0Í	—îlïôèîbŠeƒªËâáXuZî§ù8æ³&>	÷\ZMgˆLuNâ’$è2 ¶Kó÷™EèÆÔ’4&1ã+üıÕå“€â>«/‚yzÃë<GU­ü¹\0wrQŠ@5×’Eÿ\0‘Yº—sæÖ†œ	d»€&f·pçì¨	Vcò\rŠ¹§Œ,·QŠ[Ûof§©cÕ¾tøz“$—Zm»·ÄÆ»B ş+šÍfÓø=§³ş­9ò™^mØ³z}ÙnØÃr¦`aí±ğÊ7OĞõ‹æ¥•ÅÑÿ\0Šby?â áù1‘æDY§åçœÛ‰}8ÛĞİK\r¿üu8œd¨Öãoú¢Rÿ\0ršOù}ç[EäšyÖ0Yæ´’;•^ß¢ÎGİ–tß‡´°Êb<\\\'úwıÚzÁ–¦€uú:å`¹Ù ò/4y†MNşş÷•VòïêğŸø¦\0z|È¯û<İà\0|Ïµ5.¢ROÑêAA\"ÛÈnÔ2µ?–0´ì¥ÿ\0ˆåÁÀ~…şS·/Ë/7š×•Õ6d—¿wÜË1kÿÕõ4æ_FOH/éƒÓ•6¯ÓŠ°\rÍS¸Óõ#Ìÿ\0V†U+İ7P\nÈáˆ\"«ŠMü¹\'ÙÊ%”Aæíğö~I˜8O¬ÙB_Ì“Éüİç/Ê»-è~G³ıô.\'vÓíÈ°‘\"´¼G\"Ñ[›/Ã”Î\\_H%Ùé1xœ²Ç‹ø6ÿ\0zÉîÿ\0-?*¿2´éï`»[¦Ôfúô/i:Çsk$‹ñÆ©¿íä®ÿ\0–c\0cüN·&IÂ0Ê!Ã	ÿ\0ÿ\0§ÇıV¯ÿ\0Î$ê‘D#Ñ¼À¼#E£lÊÀ1©X‹)ßş*ËüBg€\"À5_ùÆ¯Í›LVvÚšùeºJöú\'0:i1=CòÃó#L\0ŞygQR»ÅnÒ¨ùI©’ãŒvîÒòÕ”^[ËnàĞ‹„‘_ş(Ãa¬Äha\"Ÿ²İNô*Ÿxï…Hb(j{Ãî=1VÉ»€À·ÑÇqŠ§ö®–^]¿ŠKt©m!CFpïÅÏù)L*Šl	é»nCSèØàVu}å[/èövº„HşaÔãKÛÈÙ~+;W­¡ ı™çSëÍûI¤Ÿ´ù‹—&ôßgéG	”‡6=ª-¬ÜR$Y$Ø š\rÎ6KghpcÇ@’EÒÛUÕltÕ<>¹2@Â¼Û‰4û[u§íf]:¢yòëÊ~dóñk:íŸ”4E,b¹’.î\nZÉ5\"SFõâ¼¾cû\\©7æÇå‰òn¦«i}±¥\\GëÙjö|})b\"pâ6tIbvEn-Å¹®*ü™ÖÚ9/´—j+q\nÿ\0”¿ıëÇş0u‘ä^¯Ù¬ûËş¼^ª³ç0^°Åäß›\ZÁšêÏOVÙÜÜJ=‡Âƒş%™zndó>Ôj*0Ä?á’ÿ\0{şùˆë\\^_išu²—™ †8£äºc(Oª«›\"ñÈK…¹ñÜŸLÄŞ”şïÁÇoµ@½0ªÍÈ¸H¡…\nÁn»Ô³‰ÏÏµ{Oå–n|Æ°ØÅ$P(‚5Ìì8Ğ!%NıGÂ3]ª–@sØö¦84’œ—¯Óÿ\0)×<µ§éw²ÙØ[~‘±öêæ\"s×’F¬ıß1e¹ÃSˆ$p“ü—ùßñÔ­Z«oq¤iÇù£ôåqşËŒíˆ &Q2é/·ş:²åuk¡Æÿ\0ÍÒHãˆÜ²ıÆ4ÃÇæÆ:cÒ?îƒËşZ-[Jòäÿ\0“\n/ã$‡õdLÃhÓÌ÷¦ÿ\0²o)ëúw–oÅÎ—*­­pª†¦ =¿›rğ›sèhğHÇ‡ú¼_îŠ[ùŸç_NÔuß©ÛØ\\¼^˜K`UZY>sR~=÷#\'ŞLlÑœ~KI*”§Â=ÓôÅáÚî[K!nœ¾¯×’“Ğ n,á3nùÒÌ”6áO6!äoòWeQşH®~‹~S¡OË_.ÔØÄßğC—ñÈ–YŠÿÖõ<Ñ‰bxÉ*ä¤«\n÷t8«Öô½2d<×¢Å­ÛÀioõd¹`§ıù\rŠßÍé+£‘öp‚Ù²ˆ\"$ÆÚMNÚÆĞÚùwBŠÚĞŠ GìÅo7üQä©­æÚÇåï•on\ZêóËÙİ±ä×ÚEÄhõşcÁíúĞ¶	c˜nÅ©Éé”¢„‹DÕ´±MÏºŞ’‹ömõXâíÊHÑ?ä¦CÁ,9Ÿ‘úã	ÿ\0Z?ï£ÂµÖ?8—kMgË^dQû2/¡)ÿ\0‘÷ÀqË¿ìeV.°1ş¤Ïûş$cy×ó:È¹ËõŸîİ7PBÉ&ø²<î\r±Ôa?Å8ÿ\0Z1ŸüKÏüÅæ\rcS½kwI×í\0¨HšÇëF¾é\Z²ı¬Å„Û¿Òö¶—xGùÂ^¯÷IB]~YLü5K«X	û_¤tÉb#æ}6À1Ìu-“Öif>œrÿ\0Işÿ\0…2ƒÉÿ\0‘ú€/ü¹!nË;Û¹„Y0f:¸r†\\±¥á—û‰£áüü£»5ˆéÄöú¨ó;&\'.ğãOMƒıNér&#şqÏò‘á\nòqA¿ª)Zøîç,ã=î´ØúFéfÄ|çä?ÉïËù¬õèd‹Q–Ç”¶º)¼úÙº¼ôdRBZÄ{7ûóá‹ˆn™\r,n¥ëzÒñ}Sÿ\0sõ,ò¯å½¯æìÚÃkMªŞ_Èn/&Gl=i>&B’@Wì„¢|ğü9G¨šêî°cÄ$I1ş€ÿ\0tÉüÑÿ\08ˆ·úR>y«\0<VG–hæ\rO…Ù€daO…Óş2qFQæèµÚœ9ˆáâóE{ÿ\08ïùÙ¡ê\\[èq5¬‹,vrÇ1ÉYIe;ûI—q:ÿ\0¸ŸüSÓõ»-7ÎQ±Òüíùs¬ùXÓ9¯ô==%ÙÀM,œU¸|\\[ìË_\n]Ï.ó­Ô\Z$~Yò§“õ«M-f7Ú¡i\'Ö®ŸáâšK{u*­é«;;ülØñxrî,?ËPjš˜lï.ì®-\"ˆæib‘WŒŸ©eP:å:€±ì‰Ë¢2#ká—ùÏcúìeHFähFÙ§·Ò¸^æíOëşe»¸SXãc_êÆ8ş¼Üi¡Ã\0ù§lj|mLåĞÿ\0˜Ì|Ûæ-ÒóD·òı°‡ZÓííRæıÀ$\\G\n¨>fUºÆ¨Øk¶1EªÎ¡­õeõT¬©ÍI@¯§%U¾ø²<•¡¦Ÿ¨­ÀX–Ã	ì1_‹‰¦J4Ušùyş§`az)A\n7-·H#¯ù\\³S¬Şowìü¸4ßÖ‘W“\\²Š¼î#RMiÈWî@Æ{œµäsy·NO÷k9ÿ\0%Oñ¦Ha“.ÒÆ:ÚÈ¼Å}txØi×7DôàŒßñ\0Ù`Ó—\Z}±È¦)®‡ù¥¨\nÙyjûèÆÚQøÉÀdÆ›ÉÆ—mùÂ-?—üécv©æºÒÃ|I¡ˆ¿ÉÀ\nØ¶W–=­ ê÷ŸæCêc_š:×î­4Xœ¿¿¹Ş»ÒˆÑS–è¡ÎN´ú¯§ş¼ÿ\0Ş æçPÒô} £[iÖ–ì×w0êÈ\'•¤jÔ|¢ÿ\0“›. †ÑlnSR\Z[Ÿ¬Ásû»)”9B×u,GOÙl!_¢SÒ†‘å\'KàÙZA¨ìÉ\rÿ\0\r•ªkŠ¿ÿ×õEqV¤$BŒ*§C\r2Úµ+\\6®“K³u¡ŒSªO*Ø3¤¡>mR­CòöÊëíp—ş2¢¿üH6¨8?-máoİ3Áïo$–ÿ\0òicjš\'‘‚ á¬ê(ıë,s/İqÇñÁj£7’µVF°“\'òİYC\'ßé|mRkÿ\0Êãu_¬iúõßÖ/?O9ñT’çò/C›y<¡¢1=M½ÄÖçşÜ~¼!²9f9óJ®?çü´õ¯”™?æV“ğéä|8÷6naürùµ§~G~FµäV:Æ•}c©“Æ+MNêdş„±ÉèMş¬r3ÿ\02â &959\'õH”^¹ÿ\08É¢Ú]\rWòûSŸÊÚª(‰f¹³–Ÿ³\"HY÷ÿ\0Y×ş+ÈË-¸u’‚…¼ÿ\0ó“:4Ko&•iªˆöõí®c\nÀt!g!×åL¨Æc“°m$Ç¬zş1ÿ\0r¬<ÿ\0ù÷ÓùâB;Ç5±‚¶7‘N=äİ-ÍÎÕÿ\0ÊzÙ¡ÿ\0ˆÇ‡Šl|\r/ó‡û$,¿›]òöóæC7ê‹)÷#ÀÓ8|äÇ5ïÌÍİY\Z\rKÈCşì{‹{€Šóº¢ì2ó^šXàjˆ¿çKÓşÈ±Ÿ3ù’Uòİö©¨ZiñÜÇ	ôšÊ&J9øV®ÎÅÛ‘î3¸äSĞ’tø%Ï£şgù¯-mî/.–TÉ<Ä…Q¹$æØÎÉ·¥IäıJãÍRÚXØÖş@³z²DT’+¶ÕËBiôF³y§éò,ÂŞH’êÚœ¡auyáßfXî/äõ>iS[/Ê]YÅ…æ›ˆnåD(õøVB…}8Ò½¾È->idm^à´,Õ[X\0^»’ò0\'•/úÙ‰ùpddK¸=±(â(DıRõ&ö?¿—00#H·ü]$²~©øe¢|µyOVU¥şZùjÂ†Ë@´ˆŒ¶ÈOŞÊNKf“9d²(4«ØT,6ŞšB ıcb·Q6:…ØákiÍ;R0D˜„Y›aÑqWÏtÿ\0œ¦ò»Á%“ ¾»lûz·ÃĞ€Ÿ„<ŸOîÛ,2„ÌOOƒÄ´ï&y£Ï¾a–öÚÈAìÕ!9zq4\n¼ªx®ÀC“,Ù§’FS<R?Äôçüó_–¬o$¹¶úÍßÔã³Ò™wT–ni$„{!Ë[Ñ?#$ì[G°×5Uå<:Œ—QFãoÜ¹Ûø°åŒl¯¡òµv*ÿ\0ÿĞõM1Wb®Å]Š»v*ìUØ«±Wb®Å]Š¨_XXßÛ=­õ¼wVÒlğÌŠè~jÀŒU&_#h‘/9/l“²[_]Æƒä‚Nş\r«‡“Êÿ\0w®jÉÿ\0G!ÿ\0äâ>6«‡–/—ìùT3hßñ+sŠ·şÖÙó.¡ôÇbì[ µ‹2éÚt·–úÍıûÂú²C`…w50vá\nÄ›Î^vh¹ÛÃ{(Ûê´ÿ\0…¶8i^ùÁcçï3C,7zlÆÒ‰Zâ8Äs?\ZĞHcXÕÎÿ\0h®<›1–B& ü?Âó?!yzûGüÂòü÷ĞVÙ/àYê6àîÿ\0Ä±¦·|Çùg,sŞØD±êİâG\0B D•à×¿’·ñ=¬’âîú9®Ú•\"(“‚‚~dœ²ÕôÖŸåİ2ÚÎÒ%GÕÕxì:•©¶·¢$îOU\0 §Ëv*•êWšäj¶Vuké–wõ?©ñQ\0=¶_‹C¶©æB­]0 Q~±­iPj1Viù9å+ù/SÊ6÷/yYçŠY¬R³1háV`‘ğ²ü/ö¸òN8mYU®”Öæ‡Ë6ÖĞì§Ñ’5d¥[ˆZíş¶VPöĞÉE«Ó–ø«pA$1(HĞQTl\0ÅWâ®Å_ÿÑõN*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUlqÇ\ZñB-I¢Š\nœU·QÔ0ğ\"£ñÅX‡›+ü·æY–ìïã<£¸‰TƒQÍE9oû_k*Ë-’U·‰& Ê¨¢B:„àVÒİÏÄ€÷ÅUqWb®Å]Š»v*ìUØ«±Wb®Å]Š¿ÿÒõN*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUØ«ÿÓõN*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUØ«ÿÔõN*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUØ«ÿÕõN*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUØ«ÿÙ'),(4,'Audi A6',120.00,'ÿØÿáÈExif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0·\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0¬(\0\0\0\0\0\0\01\0\0\0\0\"\0\0\0´2\0\0\0\0\0\0\0Ö‡i\0\0\0\0\0\0\0ì\0\0$\0\0\0\0\nü€\0\0\'\0\nü€\0\0\'Adobe Photoshop CC 2014 (Windows)\02016:01:11 01:53:38\0\0\0\0\0\0\0\0\00221 \0\0\0\0ÿÿ\0\0 \0\0\0\0\0\0 \0\0\0\0\0\0\0´\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0r\0\0\0\0\0\0z(\0\0\0\0\0\0\0\0\0\0\0\0\0‚\0\0\0\0\0\0>\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0ÿØÿí\0Adobe_CM\0ÿî\0Adobe\0d€\0\0\0ÿÛ\0„\0			\n\r\r\rÿÀ\0\0i\0 \"\0ÿİ\0\0\nÿÄ?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q2‘¡±B#$RÁb34r‚ÑC%’Sğáñcs5¢²ƒ&D“TdEÂ£t6ÒUâeò³„ÃÓuãóF\'”¤…´•ÄÔäô¥µÅÕåõVfv†–¦¶ÆÖæö7GWgw‡—§·Ç×ç÷\05\0!1AQaq\"2‘¡±B#ÁRÑğ3$bár‚’CScs4ñ%¢²ƒ&5ÂÒD“T£dEU6teâò³„ÃÓuãóF”¤…´•ÄÔäô¥µÅÕåõVfv†–¦¶ÆÖæö\'7GWgw‡—§·ÇÿÚ\0\0\0?\0ô\0€uNµS=tãjˆYıw­ÓÑ0Ù—m/½¶X*¬†Hs÷8¿ó}‰Zˆu4Núçõ~œ<<¼ÛÎ!Î¯Õª—5Ö=­5¹Öz\r{XÆ¹¿Mn1ÍsCšCØà×4È Ís]û®jDÒ@¶bS€£¹ â\ZĞ%Î:\0¥Î?É\\Æ7øÂé7õ#Šju8€¹¿n±ÃiÛôéV×íªÇ„{ı•ÿ\08³²ª\0Î’R{›[Kì;İ\\ç{Z?¬ç,®¹6Uõ[2ì\\ƒU UevSf×—²KSƒö9^aOWÉÛp¾ë²mVRêìµïlX6z›l{·>¿¤ÕEöÊn¦úÛm66Úİôlcƒš`í;^Éj\"ñŞ—õ»¬ô¬?²adm£Ûé‡5ôƒ\\ë,m-w³ôîé·úŸğ^’×ë]z†gEéÎÇÌû6[ßhÎ¯únöÚË®ª§4ıSŞ•[Õı{ºÚºctm÷×]ŸÕ®ÿ\0¤úÚ¼ó§eÛ‡™^Uëc’ú÷	€?I²ßj­ûO/%Ãí97_î-¶ËÎÛcÜÔØ¯&æüJ\n{«Zº¾YÅÆÍÈiªíãÓemhq\r°ûŞİ¿¼»’àÖ—8€Ö‰$è\0ÊòO«v:¿¬¸n?÷%£üğêÿ\0ïë¥ÿ\0û†\'NvâëX×\0LY¹»¿ÌMºR—±§7àÃMõZ,şl±ívïêm>åçıs­uKú®UNÈ²–QcémtYel-cˆkÜÆÙüã›ô×-‹•è^/ª[s=Ì±¦;‡·ÜÕfÌ‡Ys¬q%Ï;‰$’IóL2µñÓ>¨gdftÇœ‹=GÓi­¤€!•–·Úãôœ·—t®·Ô0:v_Ø­ôËœÂe¡Ñ$Vç³wÑ~Õ»õKëe¹YC©e—ã×A¸ºÈ†–¹ŒC•ô\Z‰c:ÿ\0ÿĞï\nq#B‡„…ç8ÿ\0]îú¿Õ:Ş>eWuS:ÏH:İ¾ÇXÍ¿¤m×·ÒúèÓE›¥æ…_WµúÏõ‹ö7¶´Y‘p©\'k\0Ô±Öûÿ\0›ö×·ü\"à3¾µõ.·ÔŸk]M¸˜à5¢¿uµ9Œwó–şÍõw]UúÍõùİw\nœ7`3Ô[ë:Ái~»_VĞÏM›~›=snËfÒK.ƒ¡ïİ<\n+$lé³·Õ²ñïÇéM­áÖQˆú/\ZËH¿\"Êšë7nö®ÛêçøÀéXWè£¨‡³#\n¦SUT±Ï6ÖÆ¶¶Xı”²Ïoé+}‹ËÎc-;àË`mhš·‰Nnhôp¨vU€\0QkŒyµ®.D€P\r>¤>·ôÏ¬İ¬cc²Ê2©ÃºÇc]´’Àßçj}rË×{lıÅç8·XƒÃ·~\"SÓõWë[Û¿öVScS a>^÷5Îşªµ‡õGëu×7\0ã´.Ê\"¶ÄGiwı€ TMæïk¬w¹îlOŸKú¨Úv9t7ÿ\0‹®¶ââüÌ<fìaµÄÄÎ×¿cÛş/º“$­…æ^óÕÚÇ%ª­Æ¢Éi“y(°ìùÊÚâæËÀİÕé.›]¼OïoZxâ÷§×A§7//(“3E/©£ûY\rvä(öU‡‘®Ø:G%¡ƒxi‚I„@úP´ú×Õ,œZéoÕú3Bwkèäı=­}§ı€>«ıme¡ÌÇº§aÆú˜Aw;aşÍßÉKƒª¸\'ç:‹Y•ŠïNàE•X\"e‡ÚöîÜ×msWWõË\"ìß¨}¨Úíö¹ô>Û	\\úlkßù¿Mÿ\0¸¸ª¾¡}j°5ÀWWƒ’ÒF¿ğEË èâã\Z¸³¯ä7 ·èUëAhıßYÁŸô…¤JdØØÁ<K€çâ¬}·A6\0&|—£àô«X,Ù‹†Ğ;—cöî{œ¯UN%gô8ñ>\rhMö¼i¸ùµ=I•ãÚÃ]†»`z¾›ËßÎ5»U+>¶ãb7Ó¥‡!Î‚÷mhƒô]ívåê]mù\'¢ä¶ªœ}‡Bí£ğ^dú™ûĞö†äÚ}ÓÑÿÑÖwYY|Æíûö\0²îéW2/vEİ*§Üâ\\÷¾Û=Äêç=¬{\Zç+dêÆ|È(Í-ü´ş\n^Ùˆ÷GÜfíÄéØ´4şëK¿ê‚7Únâ¶TÆø6 •,·\"ÆÕU~¥¯Ñ¬h\'òûZßå¹V»ªô¼k7u;F›16¶€Aú/êƒêÿ\0+ìtÜ–Z–Ãòîs6Zöúg–m`işÁk•œl }¸˜î¬3Mm©¤¹§Ô©´1ŞÓûë+ë§Uéş™ÃéøX®µÁ­\'ÔµàÖ:ãè»ü\"Gë×Ö\nÚÛ2½±úŠ™eµZ[?H1Ç-ïåÖ…ö	¯©oCê¥sjÿ\0¹ÄıÕ¹é7 ã·úFe ø6­çüç¸®_¨}fê—tÇgôv3%ÔÇÛiÊ$[v³ ¶«+£#\rß÷-¶l«ü=Uş“fUên«‰‰Ôú¥ÅÊas‡O-¡»ö2–ÛKwYWªÖo±ÿ\0àŞ‡O}\Zì.‰„İùYşƒ?yâšGßsZ¨Û×ş§W\"§‘ñ¤c´Ú\'úÔUéà‹Êi4³©<e·}BÃê’ÖÛalk_şrÓéù4aå·/¦¶Ö=­s\ZËú\"×kms=Ìı\"V{ª¼ûöÎ(f]ÄğËC*$ ÙqnïëúHø™½7.ãL·-£s±.i®ğ?{Ğ³İmğ¸şµğ‹\'©àä`³5÷6ªí\"ç4¼ie÷zµ«W…›ÖZjËÇú÷8‡ólÇ½õ±¬ÿ\0„©è”\\±ƒ†ªöc‹2æÿ\0WE˜:f zßµ°©÷_l~Ğc6ûM!ÕÑÔ˜Ï§úOÖìşkÔWğz¯MêU}«§ÚC‰ Û^¤d±»½+=»½ß˜•ª\nXÖ´U€\Z†¸ S¬C§áå‡¹wŞ\\FÚ@ğù$l\'RPı2{˜ø”¶ÇåA,z¥İ3 ‡Î\'•åı ôZzEÙuTÚ2ÃÉP“©F½ÛW©[P²—5Ú‚<Jãºç@§\"·±ÒAá¦cğIÿÒ¤~·\\Ñ®%_7Oıñ[é]s«uK\\Ü<:[E`»#6Í1¨cFë-ÈÈØ+ö47¿Ôÿ\0«RúµM}W®Q‡A«m–¹$z›¶Ÿê¹Îßgük³ê]/7Ø¾“†ı ãEd0‡Öİ•ú~Æ¹ö\'Z)ãzÿ\0Q·+§¶ª\r•tü²* môíËİ§QÌoµÔôöTw`tïğûê¿7ôv}U\rªªöTß£\rm`í­YÀüÖ®–ßªÀå6«m¡ÙOÖ‘sˆÛ½ÇÕs)õC^í·¢Š~¨å~Î~\"Áÿ\0SbJ!á:ˆ}™8Û˜\0`\0OwÏç~ê–N1{Ú\ZÒç¸\0@ÔÈöÿ\0Ô®Ë+êÖr¾ÍS+s{­¶±¸;uMÿ\0¾:Ö@ñÓ_‡CìÒÓ{\ràÇĞÛ¿Óu[?·½E<Uı[¤½JªKM[¶‡Á­àÒâäÀå0zokÿ\0ãœ©cıfèXxç®ôß°ú™.©“îÇÈ\0ºŞŸk¿5Ì{]èÿ\0Áÿ\0ÅúËºêüc[‰v3séÈ«)¦Êh«††¸mvë-i»èûGïÿ\0„Aé?RúŸOèY]\'Ìª:€h¤>¯M–6yX›êW’İµı?R»6ÖĞ)\Z>dÛKË®µóeš½ÎïÛº›2lu£¦ç@k\Z^L\ZßÎÜ½ê>lôk.{ä/Óş-§ìÿ\0ø\nÔ¦ûús=*iUÌe\"†ÿ\0Ğ®¤Tğ=?êwÖüç6æô×Ğ}×å¹¸ã_Ï5İ¶çÖØº,oñiÔœÀ3ú®5&}ÌÇc¬Óş6àßwıeo7ª—ı ,ñÚò? z‘Í¥ÚØÃäö»şªºÒÕZ0ÁúõG\r£ímSµ¦C²íƒá[›Gùí]>WMÃ¬Õ‰E8õK*cXÓı–ÏZï£c‡“Û‹õlñŸ0‚•İGßN¦8…fNŸBÇÒ|¡Íûœ°\ZÛâ¬Ó…}“\0˜Ôù•)±•ö½N6{j\ZÃŸKn®{oÛéäSı}—1s]g­}héµ™ÕµµÙüÎMM­ôÙÿ\0t7İÿ\0k*µ]ÍúÅõc¦2º•o´Æ›ß#óAº–;ş6êÖ~__éŸZz;ğziÈÇÈÁ¾¼ŸJÖVêÌã9ûûhm?¬ş•Ş÷Ğÿ\0Oô6şbÑMùëÕ`úbºÕ<Ÿ¬Y·‚cÄòCk\n³¨GÚ¬\Zh?ú)ô»¶YùÑOğbZ)ÿÓ¡Ñ\\ün­MÌqkš·O¤ºÎ¡ş1ñğó(À;#¨f6¦Ûš1uôƒµÜùû«Ùv×lØËkı*ä±²íÁÈfU‹+4!Í#m•¹§Úö=Ÿšå:[òú“Ûc±ßÔ.µ¸÷VvŸVº1íéÔ=ú¹”î¾Íè©ô\'õ\\Ü|>»Ó9{+És&ÆµÄz”ïÑõ{›újÑkë×\\ÚÏÂGñrá~¬çetş£^P­õU×˜íõØÒÂÎ£@h¹Ş›¶í~]~›.ÿ\0M“±nW‰—sˆÄuWk£¬ùÖç5É)ÜËÉÃÏkENšÌµÕZêÜ8ŞÏR¯Mş•¿FÚÿ\0=]¯ªc†ŠËZÑ\0€æN/Z«Gb[§vßõ2 r2ëşv«ã¹®)ëÛŸŠïñÜ§êâ¹ÃÜİdk§å\\sz¤rcã¢±ûTóÁãË„”ôyìmT>Ğ[SŸcœÖ«÷˜ÚÖ®vœŠú†G£ÓzõêEùAî«‹k÷5r?^ssºÇTé¿V1îô±]_Ú²I$´^íÖ7ı.5>­uÿ\0¥·úŠì?©×>¼S•V\\‘^fğ}Ãü\'¢ÿ\0N«»ó(û?ü¨©ôê:NEÇnyeÇÆÚØãş~ÖÙÿ\0‚.C?­SEyÿ\0±ò1úsíu7^ocı1îªÖfaì¹ôŞÍ›şÏëûÿ\0š®ß[ôkCêgÖ¾¥GQÿ\0šŸYêg± ôüù–ä×™ºÏÏ±Õ7}w?ùİ–Ó“úå_¦é³º\ryYäãßwO¿!¡™/ÇôËm\rXo£*œšmmö3!µı£Óı«é{µ>sgÖ¢×ÓNëN1İ¯¼Ã=\ZqñëÈ£èÛê}¢ª½;+ôl®§©¿ëGZÆ±£/¦S‡[ÈhvKm£kˆc¿HìÌŠú?Sô›şş*ÅÖÌ¼lJß^7SËÃ{ñ‡Šâİ¾.\rVöıïz]£ô/«õ¸`S»!åÆì»ˆ·!î&Nü‚ß£üŠ}6×Q´8×u¬ÚzYë8Ì£3Ó¯\"ª¬­·½ÅŒËÈô­¶çı“÷³g¦ïÒúW~‘yÎ_\\êİPÕ“Ö²nÉéş³E”5í­„7ÜöÓ‡I®½ígøOgüc²ågÕ–Ëqm¨İUìu7.ö<l³ÛıW/éxø]ë3±:ë+uv–Ü-as\\\Zvîô€~ö½õ™ìµ ,{÷S{&¬Ú¾ÉÒ:[ó[[²+Çc›X-ô\\öİkög>¼¶ş³ş\'ùÏS«Ñş­tn©Ñúæ\0µµ¹ıB¬†TÆ¹®l×Y·mhô,ı#*²û˜¬çıÁn+11Ùnw¤Û\ZÈÄ¡¢Ç2í›qÙëä²‹j§Ñ·gM³ô+;¢Û×~²õ6±•;Ğ®»Àí\"ºßuNÅõ¬½åÎüæz–İ‘ì«ù´Ç¨^[—sw¶Çov÷4‚7¹íÜßoµÎüÕPŞJ\'Péø½3\'ì8Ù•çŠ˜Ãuô™¯Ö#õŠiøZês}–*©!ÿÔÁu¤ù+ı«fcQ•V×çRêóğšñ»yÇ™¸£óÿ\0K…¶Í•ûı\Zr}?æÕAÓs­‹f6`íèÚ¿í»}7*Yx]S‡Û‹‘êÜ]¬k¥iİ]µ]LúvVï ô8ât±ä…®9Õ}¯íı:×šÎg­‹’ç=ÅÎeu=æ¯_ßúµ®e_ğŠÁúáƒ˜Eö9ø×X&Öµ¡Õ‡~wèíÌ¶µÏõŒ¾§ÕrE¹ÙF÷V6Vk6¶w5P­sî³ÙúEI¸nJrçëK«ş‰Õ[_òI²¯Â—^Åµ‹õÛ®6r*Éo€²§çÑE«Ë)”=\'´Ëd¢\n}™Ÿ]2ı/¦6ÁÜú.?ôØrÿ\0Z>¬ŞÒÌœ@‘«;\\?«½´¯\ZfFu&kºÆ‘àâ­Wõƒ®Õôríd}ÎIOuu8ùZ,·\nßZ»º[™K´İ5YXµ®\rİïn\'½G¡_Õpñsr¬oNûUƒ•`}ZÎß³¾·ÿ\0:÷Ú??Øÿ\0ÒÖ¹^—õÇ©aõ\\ü†²æáÛ½àVÀ÷VöºŒš÷Ãœ¢Çÿ\0obî2:–~6}™8¹MÉè=a®ºïfá.a­Ùáãu¿øOô>¾GóTÙiSõ³ªau‹Óú®ÑÖºUàd\ZÚ\ZÆ?w½Ôsú?¶ÒËéüÏÓ]ûëÔzZı¹Ñpú¥\"MAÖ5¼6Á5ß_ınæ=«Åó¨û\'@ÌÈ}vRÌüªëÃe 5Îes‘u€4û¶»f÷ÿ\0Â«¿S¿Æ%_Wz#úuØödØ.}´‘`c^Ö\r„l{¿œ­Ïÿ\0® §½úáõç ^ŞŸUuåõ\'°Ûcn³eT²73ÖÚûn·ü5¥ÿ\0Àı^#üeıiÈÂ~^3z~+xdTÆ¥ÒàïK.Ì‹ıMUÈúùÓîÈ³5ÿ\0Wğò³î{ŸnNY}û‰2ßĞ¿kXÚÙ¶ºÛşŠ‹¾»æVwàtŞ™Ó¬ÿ\0IˆÇ;_åf}«j*v>¬õÏ®_YzİLÈêV»°m±±¸Ô¿oót–Š.Ç·}®gè>Ëw¨ÏûqXúÕõ^‡õµu~§…Ò¶5­µ»ıkĞ}f3=W;o·è.O7ëgÖLá·#¨ŞXy­ô™ÿ\0mQé×ÿ\0EeCœ|IIOHî£õ7¦\r¸7u¬†È@úXáÀèêğ1ê[[›ş›\"¯ê*ÙßZ:ÇU¯ìùzX`û0qÚÚ1€ÑöjfßŞ¿ÕzÈew*Õ8à ¦Å3\0vDLÑ	ÑCÿÕâœ\Zu#_c©õ<Sú®eÕy¸ó_¹ª¹Qì”ª½U_ÖÙBú_ÑÔ?YzÛ™^6{{ŒŠ\ZOùõìB=CêåÇõ¾ŒhqåøW9ŸøÅT¡>ÏèßıKÿ\0Q2s­‡Ãÿ\0véı“ê¥ÿ\0Ìu,¬\'ÍÊ¨XÑÿ\0\\«oıR˜ú¯uúôş£ƒœ;4Yé¿üÇoXª¶GÓs¡ÈõÆ9ŞäQáê\"ºf?ôk#êÇ^ÇÖŞc€üê¶Ú?ğ\'9Ë6ê.Û}o¡Ş5Ìÿ\0«\r]¯Õèátù¿ĞğOğ:ˆHxCÿ\0V->ßN!öKşõñãK‡´‚´ºG\\ë]§\nÆYŒçov&Cu[à·Ôc,ôlÚïséôıOğˆ}_úkş*¨R,gÖzYë9\r»>Æ»Ó*©€2ºÚNí•SSZÆ{¿ÏYãÎë@p’JhŒ7y©7Å]NŞBJj·\r£² Ç`VIH…M\naŸ¹NŠ•ÂI&ì’ÿÙÿí!˜Photoshop 3.0\08BIM\0\0\0\0\0Z\0%G\0\0s\0\08BIM%\0\0\0\0\0ñ?3k˜³•\"X×ÂeF>8BIM:\0\0\0\0\0å\0\0\0\0\0\0\0\0\0\0\0printOutput\0\0\0\0\0\0\0PstSbool\0\0\0\0Inteenum\0\0\0\0Inte\0\0\0\0Clrm\0\0\0printSixteenBitbool\0\0\0\0printerNameTEXT\0\0\0\0\0\0\0\0printProofSetupObjc\0\0\0\0P\0r\0o\0o\0f\0 \0S\0e\0t\0u\0p\0\0\0\0\0\nproofSetup\0\0\0\0\0\0\0Bltnenum\0\0\0builtinProof\0\0\0	proofCMYK\08BIM;\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0printOutputOptions\0\0\0\0\0\0\0Cptnbool\0\0\0\0\0Clbrbool\0\0\0\0\0RgsMbool\0\0\0\0\0CrnCbool\0\0\0\0\0CntCbool\0\0\0\0\0Lblsbool\0\0\0\0\0Ngtvbool\0\0\0\0\0EmlDbool\0\0\0\0\0Intrbool\0\0\0\0\0BckgObjc\0\0\0\0\0\0\0\0\0RGBC\0\0\0\0\0\0\0Rd  doub@oà\0\0\0\0\0\0\0\0\0Grn doub@oà\0\0\0\0\0\0\0\0\0Bl  doub@oà\0\0\0\0\0\0\0\0\0BrdTUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Bld UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0RsltUntF#Pxl@R\0\0\0\0\0\0\0\0\0\nvectorDatabool\0\0\0\0PgPsenum\0\0\0\0PgPs\0\0\0\0PgPC\0\0\0\0LeftUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Top UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Scl UntF#Prc@Y\0\0\0\0\0\0\0\0\0cropWhenPrintingbool\0\0\0\0cropRectBottomlong\0\0\0\0\0\0\0cropRectLeftlong\0\0\0\0\0\0\0\rcropRectRightlong\0\0\0\0\0\0\0cropRectToplong\0\0\0\0\08BIMí\0\0\0\0\0\0H\0\0\0\0\0H\0\0\0\08BIM&\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?€\0\08BIM\r\0\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\08BIMó\0\0\0\0\0	\0\0\0\0\0\0\0\0\08BIM\'\0\0\0\0\0\n\0\0\0\0\0\0\0\08BIMõ\0\0\0\0\0H\0/ff\0\0lff\0\0\0\0\0\0\0/ff\0\0¡™š\0\0\0\0\0\0\02\0\0\0\0Z\0\0\0\0\0\0\0\0\05\0\0\0\0-\0\0\0\0\0\0\0\08BIMø\0\0\0\0\0p\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿè\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿè\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿè\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿè\0\08BIM\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\0\08BIM0\0\0\0\0\08BIM-\0\0\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\0\0\0@\0\0@\0\0\0\08BIM\0\0\0\0\0\0\0\0\08BIM\Z\0\0\0\0A\0\0\0\0\0\0\0\0\0\0\0\0\0\0´\0\0\0\0\0\0n\0i\0s\0s\0a\0n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0´\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0null\0\0\0\0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0\0´\0\0\0\0Rghtlong\0\0\0\0\0slicesVlLs\0\0\0Objc\0\0\0\0\0\0\0\0slice\0\0\0\0\0\0sliceIDlong\0\0\0\0\0\0\0groupIDlong\0\0\0\0\0\0\0originenum\0\0\0ESliceOrigin\0\0\0\rautoGenerated\0\0\0\0Typeenum\0\0\0\nESliceType\0\0\0\0Img \0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0\0´\0\0\0\0Rghtlong\0\0\0\0\0urlTEXT\0\0\0\0\0\0\0\0\0nullTEXT\0\0\0\0\0\0\0\0\0MsgeTEXT\0\0\0\0\0\0\0\0altTagTEXT\0\0\0\0\0\0\0\0cellTextIsHTMLbool\0\0\0cellTextTEXT\0\0\0\0\0\0\0\0	horzAlignenum\0\0\0ESliceHorzAlign\0\0\0default\0\0\0	vertAlignenum\0\0\0ESliceVertAlign\0\0\0default\0\0\0bgColorTypeenum\0\0\0ESliceBGColorType\0\0\0\0None\0\0\0	topOutsetlong\0\0\0\0\0\0\0\nleftOutsetlong\0\0\0\0\0\0\0bottomOutsetlong\0\0\0\0\0\0\0rightOutsetlong\0\0\0\0\08BIM(\0\0\0\0\0\0\0\0?ğ\0\0\0\0\0\08BIM\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\08BIM\0\0\0\0Z\0\0\0\0\0\0 \0\0\0i\0\0à\0\0Äà\0\0>\0\0ÿØÿí\0Adobe_CM\0ÿî\0Adobe\0d€\0\0\0ÿÛ\0„\0			\n\r\r\rÿÀ\0\0i\0 \"\0ÿİ\0\0\nÿÄ?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q2‘¡±B#$RÁb34r‚ÑC%’Sğáñcs5¢²ƒ&D“TdEÂ£t6ÒUâeò³„ÃÓuãóF\'”¤…´•ÄÔäô¥µÅÕåõVfv†–¦¶ÆÖæö7GWgw‡—§·Ç×ç÷\05\0!1AQaq\"2‘¡±B#ÁRÑğ3$bár‚’CScs4ñ%¢²ƒ&5ÂÒD“T£dEU6teâò³„ÃÓuãóF”¤…´•ÄÔäô¥µÅÕåõVfv†–¦¶ÆÖæö\'7GWgw‡—§·ÇÿÚ\0\0\0?\0ô\0€uNµS=tãjˆYıw­ÓÑ0Ù—m/½¶X*¬†Hs÷8¿ó}‰Zˆu4Núçõ~œ<<¼ÛÎ!Î¯Õª—5Ö=­5¹Öz\r{XÆ¹¿Mn1ÍsCšCØà×4È Ís]û®jDÒ@¶bS€£¹ â\ZĞ%Î:\0¥Î?É\\Æ7øÂé7õ#Šju8€¹¿n±ÃiÛôéV×íªÇ„{ı•ÿ\08³²ª\0Î’R{›[Kì;İ\\ç{Z?¬ç,®¹6Uõ[2ì\\ƒU UevSf×—²KSƒö9^aOWÉÛp¾ë²mVRêìµïlX6z›l{·>¿¤ÕEöÊn¦úÛm66Úİôlcƒš`í;^Éj\"ñŞ—õ»¬ô¬?²adm£Ûé‡5ôƒ\\ë,m-w³ôîé·úŸğ^’×ë]z†gEéÎÇÌû6[ßhÎ¯únöÚË®ª§4ıSŞ•[Õı{ºÚºctm÷×]ŸÕ®ÿ\0¤úÚ¼ó§eÛ‡™^Uëc’ú÷	€?I²ßj­ûO/%Ãí97_î-¶ËÎÛcÜÔØ¯&æüJ\n{«Zº¾YÅÆÍÈiªíãÓemhq\r°ûŞİ¿¼»’àÖ—8€Ö‰$è\0ÊòO«v:¿¬¸n?÷%£üğêÿ\0ïë¥ÿ\0û†\'NvâëX×\0LY¹»¿ÌMºR—±§7àÃMõZ,şl±ívïêm>åçıs­uKú®UNÈ²–QcémtYel-cˆkÜÆÙüã›ô×-‹•è^/ª[s=Ì±¦;‡·ÜÕfÌ‡Ys¬q%Ï;‰$’IóL2µñÓ>¨gdftÇœ‹=GÓi­¤€!•–·Úãôœ·—t®·Ô0:v_Ø­ôËœÂe¡Ñ$Vç³wÑ~Õ»õKëe¹YC©e—ã×A¸ºÈ†–¹ŒC•ô\Z‰c:ÿ\0ÿĞï\nq#B‡„…ç8ÿ\0]îú¿Õ:Ş>eWuS:ÏH:İ¾ÇXÍ¿¤m×·ÒúèÓE›¥æ…_WµúÏõ‹ö7¶´Y‘p©\'k\0Ô±Öûÿ\0›ö×·ü\"à3¾µõ.·ÔŸk]M¸˜à5¢¿uµ9Œwó–şÍõw]UúÍõùİw\nœ7`3Ô[ë:Ái~»_VĞÏM›~›=snËfÒK.ƒ¡ïİ<\n+$lé³·Õ²ñïÇéM­áÖQˆú/\ZËH¿\"Êšë7nö®ÛêçøÀéXWè£¨‡³#\n¦SUT±Ï6ÖÆ¶¶Xı”²Ïoé+}‹ËÎc-;àË`mhš·‰Nnhôp¨vU€\0QkŒyµ®.D€P\r>¤>·ôÏ¬İ¬cc²Ê2©ÃºÇc]´’Àßçj}rË×{lıÅç8·XƒÃ·~\"SÓõWë[Û¿öVScS a>^÷5Îşªµ‡õGëu×7\0ã´.Ê\"¶ÄGiwı€ TMæïk¬w¹îlOŸKú¨Úv9t7ÿ\0‹®¶ââüÌ<fìaµÄÄÎ×¿cÛş/º“$­…æ^óÕÚÇ%ª­Æ¢Éi“y(°ìùÊÚâæËÀİÕé.›]¼OïoZxâ÷§×A§7//(“3E/©£ûY\rvä(öU‡‘®Ø:G%¡ƒxi‚I„@úP´ú×Õ,œZéoÕú3Bwkèäı=­}§ı€>«ıme¡ÌÇº§aÆú˜Aw;aşÍßÉKƒª¸\'ç:‹Y•ŠïNàE•X\"e‡ÚöîÜ×msWWõË\"ìß¨}¨Úíö¹ô>Û	\\úlkßù¿Mÿ\0¸¸ª¾¡}j°5ÀWWƒ’ÒF¿ğEË èâã\Z¸³¯ä7 ·èUëAhıßYÁŸô…¤JdØØÁ<K€çâ¬}·A6\0&|—£àô«X,Ù‹†Ğ;—cöî{œ¯UN%gô8ñ>\rhMö¼i¸ùµ=I•ãÚÃ]†»`z¾›ËßÎ5»U+>¶ãb7Ó¥‡!Î‚÷mhƒô]ívåê]mù\'¢ä¶ªœ}‡Bí£ğ^dú™ûĞö†äÚ}ÓÑÿÑÖwYY|Æíûö\0²îéW2/vEİ*§Üâ\\÷¾Û=Äêç=¬{\Zç+dêÆ|È(Í-ü´ş\n^Ùˆ÷GÜfíÄéØ´4şëK¿ê‚7Únâ¶TÆø6 •,·\"ÆÕU~¥¯Ñ¬h\'òûZßå¹V»ªô¼k7u;F›16¶€Aú/êƒêÿ\0+ìtÜ–Z–Ãòîs6Zöúg–m`işÁk•œl }¸˜î¬3Mm©¤¹§Ô©´1ŞÓûë+ë§Uéş™ÃéøX®µÁ­\'ÔµàÖ:ãè»ü\"Gë×Ö\nÚÛ2½±úŠ™eµZ[?H1Ç-ïåÖ…ö	¯©oCê¥sjÿ\0¹ÄıÕ¹é7 ã·úFe ø6­çüç¸®_¨}fê—tÇgôv3%ÔÇÛiÊ$[v³ ¶«+£#\rß÷-¶l«ü=Uş“fUên«‰‰Ôú¥ÅÊas‡O-¡»ö2–ÛKwYWªÖo±ÿ\0àŞ‡O}\Zì.‰„İùYşƒ?yâšGßsZ¨Û×ş§W\"§‘ñ¤c´Ú\'úÔUéà‹Êi4³©<e·}BÃê’ÖÛalk_şrÓéù4aå·/¦¶Ö=­s\ZËú\"×kms=Ìı\"V{ª¼ûöÎ(f]ÄğËC*$ ÙqnïëúHø™½7.ãL·-£s±.i®ğ?{Ğ³İmğ¸şµğ‹\'©àä`³5÷6ªí\"ç4¼ie÷zµ«W…›ÖZjËÇú÷8‡ólÇ½õ±¬ÿ\0„©è”\\±ƒ†ªöc‹2æÿ\0WE˜:f zßµ°©÷_l~Ğc6ûM!ÕÑÔ˜Ï§úOÖìşkÔWğz¯MêU}«§ÚC‰ Û^¤d±»½+=»½ß˜•ª\nXÖ´U€\Z†¸ S¬C§áå‡¹wŞ\\FÚ@ğù$l\'RPı2{˜ø”¶ÇåA,z¥İ3 ‡Î\'•åı ôZzEÙuTÚ2ÃÉP“©F½ÛW©[P²—5Ú‚<Jãºç@§\"·±ÒAá¦cğIÿÒ¤~·\\Ñ®%_7Oıñ[é]s«uK\\Ü<:[E`»#6Í1¨cFë-ÈÈØ+ö47¿Ôÿ\0«RúµM}W®Q‡A«m–¹$z›¶Ÿê¹Îßgük³ê]/7Ø¾“†ı ãEd0‡Öİ•ú~Æ¹ö\'Z)ãzÿ\0Q·+§¶ª\r•tü²* môíËİ§QÌoµÔôöTw`tïğûê¿7ôv}U\rªªöTß£\rm`í­YÀüÖ®–ßªÀå6«m¡ÙOÖ‘sˆÛ½ÇÕs)õC^í·¢Š~¨å~Î~\"Áÿ\0SbJ!á:ˆ}™8Û˜\0`\0OwÏç~ê–N1{Ú\ZÒç¸\0@ÔÈöÿ\0Ô®Ë+êÖr¾ÍS+s{­¶±¸;uMÿ\0¾:Ö@ñÓ_‡CìÒÓ{\ràÇĞÛ¿Óu[?·½E<Uı[¤½JªKM[¶‡Á­àÒâäÀå0zokÿ\0ãœ©cıfèXxç®ôß°ú™.©“îÇÈ\0ºŞŸk¿5Ì{]èÿ\0Áÿ\0ÅúËºêüc[‰v3séÈ«)¦Êh«††¸mvë-i»èûGïÿ\0„Aé?RúŸOèY]\'Ìª:€h¤>¯M–6yX›êW’İµı?R»6ÖĞ)\Z>dÛKË®µóeš½ÎïÛº›2lu£¦ç@k\Z^L\ZßÎÜ½ê>lôk.{ä/Óş-§ìÿ\0ø\nÔ¦ûús=*iUÌe\"†ÿ\0Ğ®¤Tğ=?êwÖüç6æô×Ğ}×å¹¸ã_Ï5İ¶çÖØº,oñiÔœÀ3ú®5&}ÌÇc¬Óş6àßwıeo7ª—ı ,ñÚò? z‘Í¥ÚØÃäö»şªºÒÕZ0ÁúõG\r£ímSµ¦C²íƒá[›Gùí]>WMÃ¬Õ‰E8õK*cXÓı–ÏZï£c‡“Û‹õlñŸ0‚•İGßN¦8…fNŸBÇÒ|¡Íûœ°\ZÛâ¬Ó…}“\0˜Ôù•)±•ö½N6{j\ZÃŸKn®{oÛéäSı}—1s]g­}héµ™ÕµµÙüÎMM­ôÙÿ\0t7İÿ\0k*µ]ÍúÅõc¦2º•o´Æ›ß#óAº–;ş6êÖ~__éŸZz;ğziÈÇÈÁ¾¼ŸJÖVêÌã9ûûhm?¬ş•Ş÷Ğÿ\0Oô6şbÑMùëÕ`úbºÕ<Ÿ¬Y·‚cÄòCk\n³¨GÚ¬\Zh?ú)ô»¶YùÑOğbZ)ÿÓ¡Ñ\\ün­MÌqkš·O¤ºÎ¡ş1ñğó(À;#¨f6¦Ûš1uôƒµÜùû«Ùv×lØËkı*ä±²íÁÈfU‹+4!Í#m•¹§Úö=Ÿšå:[òú“Ûc±ßÔ.µ¸÷VvŸVº1íéÔ=ú¹”î¾Íè©ô\'õ\\Ü|>»Ó9{+És&ÆµÄz”ïÑõ{›újÑkë×\\ÚÏÂGñrá~¬çetş£^P­õU×˜íõØÒÂÎ£@h¹Ş›¶í~]~›.ÿ\0M“±nW‰—sˆÄuWk£¬ùÖç5É)ÜËÉÃÏkENšÌµÕZêÜ8ŞÏR¯Mş•¿FÚÿ\0=]¯ªc†ŠËZÑ\0€æN/Z«Gb[§vßõ2 r2ëşv«ã¹®)ëÛŸŠïñÜ§êâ¹ÃÜİdk§å\\sz¤rcã¢±ûTóÁãË„”ôyìmT>Ğ[SŸcœÖ«÷˜ÚÖ®vœŠú†G£ÓzõêEùAî«‹k÷5r?^ssºÇTé¿V1îô±]_Ú²I$´^íÖ7ı.5>­uÿ\0¥·úŠì?©×>¼S•V\\‘^fğ}Ãü\'¢ÿ\0N«»ó(û?ü¨©ôê:NEÇnyeÇÆÚØãş~ÖÙÿ\0‚.C?­SEyÿ\0±ò1úsíu7^ocı1îªÖfaì¹ôŞÍ›şÏëûÿ\0š®ß[ôkCêgÖ¾¥GQÿ\0šŸYêg± ôüù–ä×™ºÏÏ±Õ7}w?ùİ–Ó“úå_¦é³º\ryYäãßwO¿!¡™/ÇôËm\rXo£*œšmmö3!µı£Óı«é{µ>sgÖ¢×ÓNëN1İ¯¼Ã=\ZqñëÈ£èÛê}¢ª½;+ôl®§©¿ëGZÆ±£/¦S‡[ÈhvKm£kˆc¿HìÌŠú?Sô›şş*ÅÖÌ¼lJß^7SËÃ{ñ‡Šâİ¾.\rVöıïz]£ô/«õ¸`S»!åÆì»ˆ·!î&Nü‚ß£üŠ}6×Q´8×u¬ÚzYë8Ì£3Ó¯\"ª¬­·½ÅŒËÈô­¶çı“÷³g¦ïÒúW~‘yÎ_\\êİPÕ“Ö²nÉéş³E”5í­„7ÜöÓ‡I®½ígøOgüc²ågÕ–Ëqm¨İUìu7.ö<l³ÛıW/éxø]ë3±:ë+uv–Ü-as\\\Zvîô€~ö½õ™ìµ ,{÷S{&¬Ú¾ÉÒ:[ó[[²+Çc›X-ô\\öİkög>¼¶ş³ş\'ùÏS«Ñş­tn©Ñúæ\0µµ¹ıB¬†TÆ¹®l×Y·mhô,ı#*²û˜¬çıÁn+11Ùnw¤Û\ZÈÄ¡¢Ç2í›qÙëä²‹j§Ñ·gM³ô+;¢Û×~²õ6±•;Ğ®»Àí\"ºßuNÅõ¬½åÎüæz–İ‘ì«ù´Ç¨^[—sw¶Çov÷4‚7¹íÜßoµÎüÕPŞJ\'Péø½3\'ì8Ù•çŠ˜Ãuô™¯Ö#õŠiøZês}–*©!ÿÔÁu¤ù+ı«fcQ•V×çRêóğšñ»yÇ™¸£óÿ\0K…¶Í•ûı\Zr}?æÕAÓs­‹f6`íèÚ¿í»}7*Yx]S‡Û‹‘êÜ]¬k¥iİ]µ]LúvVï ô8ât±ä…®9Õ}¯íı:×šÎg­‹’ç=ÅÎeu=æ¯_ßúµ®e_ğŠÁúáƒ˜Eö9ø×X&Öµ¡Õ‡~wèíÌ¶µÏõŒ¾§ÕrE¹ÙF÷V6Vk6¶w5P­sî³ÙúEI¸nJrçëK«ş‰Õ[_òI²¯Â—^Åµ‹õÛ®6r*Éo€²§çÑE«Ë)”=\'´Ëd¢\n}™Ÿ]2ı/¦6ÁÜú.?ôØrÿ\0Z>¬ŞÒÌœ@‘«;\\?«½´¯\ZfFu&kºÆ‘àâ­Wõƒ®Õôríd}ÎIOuu8ùZ,·\nßZ»º[™K´İ5YXµ®\rİïn\'½G¡_Õpñsr¬oNûUƒ•`}ZÎß³¾·ÿ\0:÷Ú??Øÿ\0ÒÖ¹^—õÇ©aõ\\ü†²æáÛ½àVÀ÷VöºŒš÷Ãœ¢Çÿ\0obî2:–~6}™8¹MÉè=a®ºïfá.a­Ùáãu¿øOô>¾GóTÙiSõ³ªau‹Óú®ÑÖºUàd\ZÚ\ZÆ?w½Ôsú?¶ÒËéüÏÓ]ûëÔzZı¹Ñpú¥\"MAÖ5¼6Á5ß_ınæ=«Åó¨û\'@ÌÈ}vRÌüªëÃe 5Îes‘u€4û¶»f÷ÿ\0Â«¿S¿Æ%_Wz#úuØödØ.}´‘`c^Ö\r„l{¿œ­Ïÿ\0® §½úáõç ^ŞŸUuåõ\'°Ûcn³eT²73ÖÚûn·ü5¥ÿ\0Àı^#üeıiÈÂ~^3z~+xdTÆ¥ÒàïK.Ì‹ıMUÈúùÓîÈ³5ÿ\0Wğò³î{ŸnNY}û‰2ßĞ¿kXÚÙ¶ºÛşŠ‹¾»æVwàtŞ™Ó¬ÿ\0IˆÇ;_åf}«j*v>¬õÏ®_YzİLÈêV»°m±±¸Ô¿oót–Š.Ç·}®gè>Ëw¨ÏûqXúÕõ^‡õµu~§…Ò¶5­µ»ıkĞ}f3=W;o·è.O7ëgÖLá·#¨ŞXy­ô™ÿ\0mQé×ÿ\0EeCœ|IIOHî£õ7¦\r¸7u¬†È@úXáÀèêğ1ê[[›ş›\"¯ê*ÙßZ:ÇU¯ìùzX`û0qÚÚ1€ÑöjfßŞ¿ÕzÈew*Õ8à ¦Å3\0vDLÑ	ÑCÿÕâœ\Zu#_c©õ<Sú®eÕy¸ó_¹ª¹Qì”ª½U_ÖÙBú_ÑÔ?YzÛ™^6{{ŒŠ\ZOùõìB=CêåÇõ¾ŒhqåøW9ŸøÅT¡>ÏèßıKÿ\0Q2s­‡Ãÿ\0véı“ê¥ÿ\0Ìu,¬\'ÍÊ¨XÑÿ\0\\«oıR˜ú¯uúôş£ƒœ;4Yé¿üÇoXª¶GÓs¡ÈõÆ9ŞäQáê\"ºf?ôk#êÇ^ÇÖŞc€üê¶Ú?ğ\'9Ë6ê.Û}o¡Ş5Ìÿ\0«\r]¯Õèátù¿ĞğOğ:ˆHxCÿ\0V->ßN!öKşõñãK‡´‚´ºG\\ë]§\nÆYŒçov&Cu[à·Ôc,ôlÚïséôıOğˆ}_úkş*¨R,gÖzYë9\r»>Æ»Ó*©€2ºÚNí•SSZÆ{¿ÏYãÎë@p’JhŒ7y©7Å]NŞBJj·\r£² Ç`VIH…M\naŸ¹NŠ•ÂI&ì’ÿÙ8BIM!\0\0\0\0\0]\0\0\0\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0 \0C\0C\0 \02\00\01\04\0\0\0\08BIM\0\0\0\0\0\0\0\0\0\0ÿá,http://ns.adobe.com/xap/1.0/\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.5-c021 79.155772, 2014/01/13-19:44:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\" xmlns:photoshop=\"http://ns.adobe.com/photoshop/1.0/\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:DocumentID=\"adobe:docid:photoshop:503aded4-b7f5-11e5-9c71-f2ea50208459\" xmpMM:InstanceID=\"xmp.iid:163d7b9a-d892-f04b-8ca1-4bc7484964f7\" xmpMM:OriginalDocumentID=\"F1C8DF936E23926E555B6CF4CA6770CD\" dc:format=\"image/jpeg\" photoshop:ColorMode=\"3\" xmp:CreateDate=\"2016-01-11T01:50+02:00\" xmp:ModifyDate=\"2016-01-11T01:53:38+02:00\" xmp:MetadataDate=\"2016-01-11T01:53:38+02:00\"> <xmpMM:History> <rdf:Seq> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:9581f4a7-e4c2-9049-883c-a3e79e85335c\" stEvt:when=\"2016-01-11T01:52:07+02:00\" stEvt:softwareAgent=\"Adobe Photoshop CC 2014 (Windows)\" stEvt:changed=\"/\"/> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:163d7b9a-d892-f04b-8ca1-4bc7484964f7\" stEvt:when=\"2016-01-11T01:53:38+02:00\" stEvt:softwareAgent=\"Adobe Photoshop CC 2014 (Windows)\" stEvt:changed=\"/\"/> </rdf:Seq> </xmpMM:History> <photoshop:DocumentAncestors> <rdf:Bag> <rdf:li>C1DD39FBB457C0FDB98FC240EF869A41</rdf:li> </rdf:Bag> </photoshop:DocumentAncestors> </rdf:Description> </rdf:RDF> </x:xmpmeta>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 <?xpacket end=\"w\"?>ÿî\0Adobe\0d\0\0\0\0ÿÛ\0„\0		\n\n\n\n\r\rÿÀ\0\0´\0ÿİ\0\0#ÿÄ¢\0\0\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\0s\0!1AQa\"q2‘¡±B#ÁRÑá3bğ$r‚ñ%C4S’¢²csÂ5D\'“£³6TdtÃÒâ&ƒ	\n„”EF¤´VÓU(\ZòãóÄÔäôeu…•¥µÅÕåõfv†–¦¶ÆÖæö7GWgw‡—§·Ç×ç÷8HXhxˆ˜¨¸ÈØèø)9IYiy‰™©¹ÉÙéù*:JZjzŠšªºÊÚêú\0m\0!1AQa\"q‘2¡±ğÁÑá#BRbrñ3$4C‚’S%¢c²ÂsÒ5âDƒT“	\n&6E\Z\'dtU7ò£³Ã()Óãó„”¤´ÄÔäôeu…•¥µÅÕåõFVfv†–¦¶ÆÖæöGWgw‡—§·Ç×ç÷8HXhxˆ˜¨¸ÈØèø9IYiy‰™©¹ÉÙéù*:JZjzŠšªºÊÚêúÿÚ\0\0\0?\0ïÃÛ&…ÀS§\\\n¸)8Up¾$¶Å+–.äï¡P(Å[\0b­ÓÇ\n·P1UÀ÷ÀJ@n¦ƒ¦›®Òá_­69W|mp8PØü0Zi±‰Já‚Õ½±µ¦ÁÁjÇ?15ŸÑ>NÔnCq•ã0Ã½9>MÆPùJôÒaòÁ%ƒÈa‡ËşbƒW’&š+`ÆH€ÄM‰Û\0RõútpæŠS‰yüzV‰€ÊŞƒäO2ŞyƒF{ë¸ãQ3 HªB>Ñ\'£vJ\nÓXR¼SbXægæ~_‹ô|X‹R¸ˆÉmqŒ 5§ÇÎ§î\\®R¦p…¼Š_>ùÎèÖmnè‚wXØD>ä)3—{!ç­~XyÒ÷Zy4ûˆc-¡WYİÍhK3³e¸çm!OBËm¥Ø«xUÿĞïøUp |°ªêâ®{m4¸>6Š]Ë¶6Š\\6­îqUÊ0€1âM7O²+ÇL¡½°ªàFD«L@“@:“Û*’\\ùëÉv¬Rã^°‰ÇU7Ô}\0œ;­¡¥üÈò`·¸’ÏT‚ş[x^àÛ[8i#jvÃE•ùókLó–±s¦ÙXKmèEë	eu<…i@ª6ûğ ³å\'\"Ê›!.õ\"È®_Û[×Öš4ÿ\0‰0Å;<çósÍŞQÔ<›qke¬ÙÜİ‰cd†)‘Øñmè8cÍ‡Ï·­YƒÛĞ´ò[Õ^å\r2!%±(„¼Nhì7ß+‘H¾‚üƒ¿’çË—é)«EuO  ÉDì¡è:Ö¹¥è–¨js‹{D 4„3nzl œ,u©ÿ\0Î@ùjŞù\"±¯,ÿ\0İ×ŒL7ß‚<¾’¸ñÕh£,>|¥w{¬v÷(&uOZN\n«ÈÒ­ñ SÄÿ\0<µ-.÷RÓ¥²ºàÆ’G)ƒq!‡Zey1òyÄ3ÇQñ ŞÔ?$¯ù–hAİí›ğ`rÌ[œÜã™3AèkN¸«xUÿÑï»à%.¡ÛUÀSçˆ*¼bJ…Ã$®`´S\rÖÿ\06¼¡¢j3é÷pn­Û„‹\\–´®ÌXxå‚%e\Z>µ§êÚd\Z¥œœ¬î”r8á°4Ü7L¬Û0Œ†ê	¹z¤¼\rÓez~$Ó`¥`vßSàŒÅ°Gß­02şry;@Ô¤Ó&y®¯a%gŠ\0#)g+¿ú¹dq’€É<«æ[O1èĞê–ªbI¹AÙLŠ§ÄœŒ…3Îå9ÛL‡~Q°ûÔàI|=ªÊ`Õ¯#³+¸œ´îÔ™ù{\\‡I»–êºÍo-»¡<ië\'\ZÖ‡ìäøXÚÖõ v0\\º1&2Èi×¨¦Û0ÿ\0•Çç7¹ÓÌ\Z‹[®Ÿ\ZÃ†8Q±™K+­‘á	²õ{OÌg\\ü Õõ¹hõ›?†k¨‚Åö›n!:|;eu»1Éó³]fw¦¤îIñß$X«Åp8ô_¸dJU.§« †f\0EinLÿ\058†%n [ëjiM…2¹Ó³Ş?çn+k­Cá$OOš‘„,Yç¼^§åÍá¦ñMÿ\0ÃÓøägÉ¶ß/¬€uÊ‹b.Êî8ËTŠìFL&ÔÚâÚ2E8’:“×ç’æ¼”ãšh0S+d>TÔ¦µÕbš1Ê»«©¡`u\"Âaæ9ù›QÕ\'KÍBWHœ¤q©ÕJ¿!,†ù²Œ\0«ò_Z¿ÿ\0%‹ÜÈm¦VhK¥À19,S7LsDpÛİó+w	ÿÒï äK*\\)ĞõÀ­-€~X­/˜Úi.Ö|Ç è‘Ç.¯\r’ÊÜbõZ…›ÁTU É$ÍóæÔ‘ÿ\0µƒG+,ˆË¸!ãR9‘N4ÎêŞt×õ¿(|©kœmn\'¸[€å¡?\0¯†ø?ˆ¤ò	Oä¿šõ=3Ïš]¼2‘m¨È-î¢$ñ`Õ¡ 9/ìã=â°4_^qPwÌ[s)u¢˜çæ¿{åÿ\0(_ê–~µ¨Œ¸ä£“­*:W\'ŒY¢Õ-òş©=Ö¡4×êO#z!İ™˜’IÌÇ’ykÎzŸ—\rBÊv‰C«\\\"“ÆE_Ùeèßì²2Ù™n¡ÿ\091ææ¸qiee\r½k\Zº;¿hóÓÃ+ğÃ>2ñ½fõ§Ô§¹pÜ1‘€ØUH”)Å0ôÏ&9 ó[ÀõÀÿ\0>˜‰ISz|€È’©½©[é×6]ËË)vôéÉFÍ†•)3}¯@¥V)JôÀUê	5Ú‡\"ïHˆzÊ}N!‰TÔíŸÖWU­BqDKÒ?%<á y~÷R\ZÅìvis\"á\'REÛï-‘zç‹Ë=e”ò•O°e9	›áÍò ¸\'¿Lƒ ­ê²Š‡\\	L!¸­®ßÍ¶ «$„á*J_E¾õ#ğÊÏ6c’\'_uMfç–Ü˜ô¨9	\rÙ„ïÈúßèMUup¦F]Du¥K­İ‚&·Y‹›5Î\\¾»-}¬×›ıºqñû<vãeÁçÿÓï€Šx|ò›ozüñµ¥Àı8Úğ·ËÇZyç¯æ¹ =\'Lsl.£õä¼‰Ùf\ZœŠk.ÅwhË\"\r>~óŸ™u]{W7º”¾µÇ¦‘—éUQAZm\\´€95İ”ÿ\0ÎH×\Zlœ…dÓíïSıĞÃ#²HİŞbó—uùi¢é)5u;ùä’-´R¯ÂySçß\ZŞÔ‘TÄt½NæÆşÒòÒV†æŞ@ğÊ¿iXˆÉtbú3Ê¿ó:§–ãƒZ7w\ZÕ¬g›.r©_‡ÃãÊ%w\"96İ#ŸşrŸQ[úÇ¢@4ş@šG3S¹æ(Ÿğ˜| ¾1¶yæÏ5èşoü¢ÕõM*oR/D#4«QÀ­#Ã Ë$¸ ùjiGÖI¯P?^e8hç¸å£{ƒL‰l	d—>)ŠÚR˜—B;Œ„™:r{AQI™~xš#ü àUÂCFÂ¨C%÷ï””ªÅ.*‰·’Ó¿† *}§ßíQûŸÉ‹E¢nu%–7uİWcà0jyîÊº¿ v§±®W(¶À¾ºódRj•—éç$ú_5$F¾c’ßo!F.èÎÙ©_—m\\jÆí­)¹$8é²3DÛŞ[ÃW‘zîy\r²fEY5(îTxU¿³=Ë·z´>bŠÕÃ¢4”5¬`šd&DÆA»ÿ\07XÍÊi%c!#“IPE=ÎÀ”œ¢’\rcóBâØ¼\Z_¦Ê@¬Œ9U»Óze°ÁŞÂYû’ùYŞb¥=déşû5¦OÀ<rÿ\0ÿÔî¡˜\ZW)·+…¯j3iú&¡}šÖŞY¢CĞ²!\"¸hÀ—~Hşey‡Í§V‹Z‘$’×Ó–)BWªğâ»q®Y–<šğÈË›Ó¦Ô¬á™ šæ(§–‚8^EWjôâ¤Ô×*¦ı\rÿ\09\'wg%öñÜÄÌ\"9¨µR¬6;í™9QÌSÃn.’F. (	ú2ÒÔé.KKI+ÄWs‘	!uü‰û°”§h\rwÉICÇ øOƒcÑJg%È~D¸ï\\$¶IÇ*Wß¦“m/Í~b°°ŸK°½š\r7PaõÛhÈ	.Ôª:cµÚŞÔ‚–ä‰…vÚ‡~”9cZ2Ææ;Ûg´ŠT3T”RÀVŸ<€6YôHîu:IéÆyÈ‹C:Óíoí‘2H	{j÷¤e<kDè~Œ…–Tˆ´Ö\0„´GQß%»ôœEL¡—\nU75Ü\nœ(C<·ïYO.sÍÀQ÷œ¨Ä–VO•4ÍXWÚpÄS·ŞëË By7äïæMÅÏ%²Xâ&§”ª?Ur&–V£æ.ëº\r´_[ÓÔ‡í´r³r³|4úG³‚ùL^ûÌ·“L—ºyµ•@äÃ£Üƒ„Àİ€BÛ7ë–—RM¼eä(Ôãÿ\0„B]È°£ş ÖŒw]![ƒWPåV²OB¶¿¨qhÙâÔŞ€š›õÉ­³ÎŸš~l¶m\"ÓÌs‹p‰Ø´å£§ö}²©aFc!äËtoùÇo<JÑK{{c, ±I&yİ\ZÇ· éŸZp*_­IÔµŠÿ\0²Áá¯säÏ•Pú¢•ğáAˆÃñÆÊÏ%)V}&ÚG^Œñ†?{’ğÂ,²;Êº o•UGà1ğÂ‚ùóşr2ÂÖÚPÅOì|şY0\0I6ùÓ —b¯ÿÕíáÛ1-É¤¿ÌCÔcjvÓ/_ÎJ\'uØ¾#\Z½ÕœR%½ÓÛ ?¦ì…€ìx‘\\Ï“ƒ$šíä¦Y\'šæáh=Fw‘Ç‡ÄIlˆfW®‰¯Nac;pÜü¿Ï®4Qa|\ZN¼ÊÑ\r.õÛmÒŞFıKˆRU®ü­ç¡—E¾¦Ô„ƒj|°QM…[/%ş`½ZßË÷„òÛ•ÿ\0”Â-ntwOzjĞIlIû ä’œ•:2?+ùSó˜ì¦!_…ä¶uZüë1¶Yüâÿ\0™^eëvè£öLR1úwÌ™¯üã=ìqşóÌ¤ğAÿ\0Ç$Pğÿ\0Î:L—ïüÇmè7ÚŒDkObÒ.\Z[«Iü—ü­ÓÂµÄÑ\\N62z¼?l5ÑI´_—¿”–»Ãenìz•V”Ÿ¸6%Ñù?òİIèjàøYÈ£µçÈŞA?ùQ%oµşf¶<+Ä‹´òæƒjÃêQ·–Ê:}Üñ&#J±jòöš¤tõ^6ÿ\0ˆÄp­¢‘ï`^°éVh;*Èß‚,c¶Ú}Q…§ixÇjÍÿ\0“ñ0ï5~^I¯†úß˜§n]V8\"fürÈš`Cºÿ\0œv•éé¸\rÀôAş˜’JòCÃÿ\08ó¡O[S¼˜ñqDO×‘àOO´ÿ\0ùÇO#0>³ßHGŒ¨¿«OMìÿ\0 ¿-­Ü3YI=;KqQô€\neùË¾ZĞb	¥i6–¿å\"U¾–á\\i §£Q¼?aPdsı0POªİjmĞWä”ıg\Z	²Ù:£õ,ûü\r—vÖÚñÅ)ì‡ğ-;¢#²•‡˜ûüMıqµ|çÿ\09åÛH!’åhd š“÷“’½‘[¾pÊ™;ÿÖ¶¹§¡Õ	?Î…«ø“‡s—ÍwsåÛ…e¹ºyÑÅ]¤*G…61lZóÈ¿”×’ú“é‹3ÊÎƒî¸LI@ \"lü­ù[cCoåøöb¡ÿ\0†/ˆ‚LÂs¥¢Û6:oÛŒ~˜ÿ\0ˆŒ—	cÄ¾¸ôøm@>ÿ\0R1áG‡éËº×Ñ„}?Úpğ¢Õ?KßH>ÒGî¨õ©Ç…6Üw—jy	˜·¦ƒõÃÂÊ«^ê2\n4óñöpŸñ¶\n²°r­e‘Ïúó³4¶ª–_X4‚ÌNÇÃÕÔ£­¼¡æH1hÈ ôgŠŸñ0¸8‚DOrm|Ğ@&8-ş„¨œ eÀQ‰ä~Ÿ¥cıbã\\ ^¼yìo.²•ùmú†?$ğ4ŞEnÚ¬n}ùÔpñù/ïA]ùN{PZK»R£»NPÿ\0ÉB¸DÂ8R¬è‰v¶okõ§İ\"FÌÔş]Ï/£%¤ÄZ[®ÜTÀ†ı¿Ïlm+Z8ış@œmyãVR\0¥}ñµJßHy$\rÎ€vä¸–“>Ú8”F>ô9”ÎLvèÀYE´Ú”È²^®ëáL	UYØŸv+mµÁ=¶ùâ•¢jiQ1\\-:W+Éÿ\05môFõí/QYz6ù È¼¿Wü¡òªè[µ·™¦\n_’½OòˆÛ\Zı‘¿ŞGí/İ×®G…“ÿ×õi)º“áP?‰9™n*ø­\'®Ğı<”~¥Åi–÷@t\n>gøqÅ*©k1êëò¿­6­ıQëµkòQŠ-´½ù™§êÀ•O«¸ıŸ§‘Åû.k´6ÖÉşüo…?àÛŠş8€d\"K\"Òü‘3¤º®£e\"¾¤NoBëP“¹˜‡zogåŸ#[ŸŞê?\\oåõQGÜ”?DÎIõ¹òu†öö0r¨s÷µND’È\0¶o=Aã\n… ƒ\ZJW}ù,1e‘`ˆu’V£ı“0ğ¢Ø.³ÿ\09åe}i.eî› ×-_œ`§Şøì¬BóşrYîÓGÒg¹eú—sÇn´ä©•¿â8‹k_ÿ\0šQÕíô¤V9fPE;K!d?ğ8UOË~oó\'š¯M–¡æÄ¸ãÈF$eüB¬%ÿ\0‚É\0ÈÓ1¶òuº\0ïpf—»º?{—oÇ,¦¾$Åtx»ZßB—¶mÖ\'Uuùñ#o£\"C(Õ¾•¯iƒÕò¾¨dzèš›4Ğü±LO­°äÉºgI–“ù‹¥Évºf¿_ÕÂ¢=	üUqöÜ¸abbYk\0zƒĞøƒ…Šƒ\'¦m\Z|8Tl,ª:O—ğÀÍ]ªVŸF¬ÒÂ¿2Z$„›q¸ˆ~Ø*â­¤\'á%½öÀª‹1\'j}øª¢ÊÀvù\rñKóÄ)-×­À	!Ä¼ïÌ^c¹·Ò%µ\"+Ä€8;ÿ\0H[x‡=C—ûÏÿ\0~§÷äÿ\0Ø(­‡ÿĞ6õç©ıİ~Y–ãn¬)íó¯öbªŠ^´ä¤ö¥³%ÂĞ|+òşÁÒW \n‚Ç`:ï…SIô¨4»!¨ù“P‹G²o°²ÿ\0}\'²F*Õú2c£!9yù©¤Y7§åÍ\nK¹Ø¾Ô›Óü¥ˆr“ş!‘$–tC¬şjşbµ¬·rOmijJ¤vÁ{\0Óól¼LJ×ó/óëë\r6»:˜¦ô•c	\n	Û‡‰Ä’œÿ\0‹¿2­cYî/­îá pÛµG Gû›\ZGwåÿ\0Ìİ*şT¶Ö \ZDÒ±ßÛ»=™c°+|PWù¾$Ç’A;ó?Ì›º¶šh¸Xlo[—ua¬üzê2Ë¿Eÿ\0Yr$²c^nò.·gåöÖµ­J[ûô)êE+4ÊœúR©_òUpÓwBùVçB¸ò¬°‹8eÖc‘ÒâiT9Ÿ‰ª£ù:~Î&TÈBËİYâäTĞtÉŠg°kX‹K‚Ö;&3zj³9jJ|D’|p*¡¥Ûê\\éñKâ†7 ã~€šığ„ôÏ$y™u›F¶»øuKO†æ?æ`ãş6Ëi!–$q¸â<N6ª}z7ˆë;¤\ZQ¿³Óõ6³Õ­’úÑ‡Ge÷SÔõr&-‚lFm\'Í¾\\H®ü›«>©¢ÛH&}\ni(¯$F?Ù_øá–Å™è¿›¾OóbZéVq\\Cæ\n;ÜÛN‚6·X…YÎÓrb8ø¿i¸dD‚v”¯Qôœ,\0FC\Zö¯ß‚ÙÒ6¶û à*·Ÿ,m•5Á<1ZoĞn¤»«|E1V¸û\nâª¨­Ú˜¥(×¬ÖTøÀ¡÷¦*óÍgË¶Ò,‚‹¿‰ş§$øBß—Ù‹ûÚõ.&%ÿÑ‘}ZÁ«Êåz’çúåüm<\r›}-ãù·0^<kÀ½Fı«èş–_á‰šğ#´Û\r7Q»K;9RææJğ&ƒ©5èsƒŒ§€-óW›t$¼ún‡Z·›àÔ»šMìôÄ\"¡æ#¬§ı×\0ıëÿ\0Åi‘2%ˆ(·“WÕ¦ı7®]½î©zy‰¾ÒE]„köc\rÙSö8d¢È¦±[7û¦§sÓï&˜Ú)*ó\\l4Øá<xĞªÆœ5¦„‡ÊĞ#VvPÜ®§z•õxÿ\0#’nÔàšk‡’w2ISRÆ¿pí… )Q@Ae\" àŒUù;UÓµ}8y\'ÌŒÏ¦İ4[îT–Öàn‘‰:©Sñ[?üòÈÌy‡æD¾~òÖ¥uå0]½İ›ÑíîV“Ã_‚@ÔåËoŒrø[¦˜¿•uÓîç™¢2ZÊ¥$`iB\rA9-²2¥‰ šêI‚”‰áÜäÀk%\ZŒKü\rQ·N•?<—\n8“Xµ(ãiƒ²ˆäªô^CjTm\\h\"Ê­·˜®íuo´Ùı;Ø‰&\0QĞ\n\n«lM>1E+\\yŸTÔ§7÷M!è	 /ÉEıAR›/Ì=RÊô‹…ADF`À“U6Hˆ?2<Ñy7§e=ÅÔŸï¸\"~åSƒ‰,›Ë~Jüå×¤7šn˜-\"w%¯.ä%äz$–®ÿ\0³6B!™Úÿ\0Î,]j·qê~kó!‹SFWéjV`W§ïÜ.ãù½,‰)ìvBòõ½œ6æ{™Ş$n¥”4¯ÄS“!Kÿ\06W„/ÿ\0iê)\rÔƒÙ¸ŸÔ6´µ¼¯qıÜË ğè^JæÖ[aûØ^ Wõ‘ŠÚ[ÛXÔ»\n¿h”}¿w[JßÏPF(úµ²2ı¥2\0A÷\Z+hi|ÿ\0äñÿ\0K‹_ù\Z¸h­„3şbù=6\Zµ©ÿ\0ƒ\ZE‡\'æ_“‡ÚÕíG°‘pQM¡5ÌŸ(:şïT¾L‡õ‘¶+ªy÷Ë¬¬~»	ğÓõØimÿ\0ôZÿ\0{oöéö‡Juë…ÿÒçm©kkÖşä{œ~±—qº*/­k×P¸úd—øãÄ„§Vòçæ\'šîRëRBÌ—²HñÛÆµ¡vv\"¡ÈäØØ^õMCPÿ\0B|…ä»¦¾ó}Äk\'˜¼É5dúŒN6¢’@™ÿ\0ãÚßı×ıôÙ¶@SÎ¼çm•¥¯—ôàÃÔW½Ô\'‘¹Í)I3š—’YİkËùpªeı^^J´\n(QFÔ@É5„=âË<¥ƒ±CÑX±	)F­fÃêÔîå;xñ)ŠÊ–²0Óí	nGÒ\'c€\"\\Ñ÷–3ÜÜ–Š2Y·e4=ğ¡eä]Vî•5?Íı˜ªÌ>PÔô»+„Ÿ÷*P¼WìÕ AíÄõ—Yl‚Ò\r7ó›òò]\"òD‹ÎZ¬•bB{Å58MşWÇü¹oní.ôÿ\0_L»‰­ïm$’˜fWV ƒU ¹cR~â)Ëoº¹h,nMRÊ1Tbd«ÄT|°áP¶]STºdÓ¬§»•ÑÁHßrÈq2¦uåÿ\0ÈßÍİ`«E¤6&é5ü‹\rÿ\0 –“şIãeh=#Cÿ\0œN¸“ŒeóIİ­¬#\'øË)şIb¯AÑ? ?)4p§êFşeë5ô†s_•Xä*Ëôï.y\'L·Óâ>ÎQòŒÿ\0€ÆÖ“Ó¶±  ¨‹²¢*°bªOæ%è*¤ŞcÍøâ•3æò¿UÃÍL:6*¨¾o~„‚;ƒŠ¥Ö4Ë‰“Ó“´±>ìV×76wÂşÖ\rbØì}U	r£ü™V„ıø«óå:j¶Ï{äÍnkiÅÜ]ëBİx	Hçxzœ×ü¼•­<OVºón“¨Ï§jo5­õ³qš	†•¨A«…²H°ƒ:ş·ÿ\0-o÷é-†¿­Óıëo¸L-…\'×5“ÖåĞ¿Ó\"šSı5«ËAñû+ı1µ§ÿÓ {øÇíÓïÉ+Ô?.<›§M¢\'™5xEßÖ¿GZ8&0ˆx™d·V‚ıŸÚÃH,¾ãÍ\Z­²p¶ƒáQDUZ¨Û|°Ò¼²×ÊVšd—-f5a5ä­=ÔâåyË+LÎÆXïß\r1P›Ê–’µÜ’Å©K%âÄ’É+Ç#ıEU>ŠĞrûX)(¦Ó-É%à»5Cÿ\0\ZŒ(§\r7Lı¡v¿óÍñ¦”®4M&`€\\Ü!W\0ÖÊßg¶Ò®¤6•å{\r>9c[æu’i&­ŠñõMJí#t8¢“‹_9hşH°•åòìŞf[—¬“Y¯a\n1½IRyHÖÀm $·?ó‘s³‘¤şZß\Zô3Èëø,ñ¶)¦1ç¿ÎO>ë^W»Ó¦ò¾Ÿ¤Åx¦:Ë#It£»ÆËÄşÈvLl­1¯Ê\rÏZf±g®èvÑ‰mä7Wvğˆ$?\Z(‘Á§Ÿåâşu~Zi^q×-µ­\nå,u_OUõEQÂ\n#)—)ìö]x|XjÖÒ\r;òËô‰µ^òı£P«Aa@£öAoU¸ü±áE³òÛòãK£C Arë¸’íà×äõOø\\4voc«ÛYD!µ´ŠÚÑ!Q\Zÿ\0Àª-£ÓÌ10¡—Óù‡?¨cJ¼jV²øèÆ§ÁÖEÿ\0q¥·wşêöÚOùêÿ\0†\"Ô¤‡U¥U=Aã+øRp­ ¦¸ºŒÒEt?å1J½÷Áj´İI¾ø­5õ‰|6´ÚË!é­* ”úb¨„‚Fé\\UœÔ®ôOlmSM*6†q7>+Ñ¤ßz¼WóÎ×Ìş`µîŸmk§ŞÚBæráHƒF®…G\"¼_‹`!óæ·óXÿ\0¥Fœ~RÊ?ãl<ExB“§™ÇÚĞ¬ú³¸ÿ\0±â+AEß__µ ÃşÆå¿©ÁÄSJ~¶³ÿ\0Vÿ\0¤†ş˜,«ÿÔ‚Ipæ¿\\’UşQjvZ¯t¸„j³ZÀ‘K@áoöCş9ÕšdwV6¨w†3áUÓ$,M2Ò@ĞŒn\0\0ÿ\0F¬OFÔ¯oüÛ.™5“Û‹xÀº²kP*î²ımdu~]‹ùWV`Ú\r¯dv6ªm Aüƒ@ê¶:^™g%íäIèDµv w`£v (©êOU%Ñ/ô­WQ{CclŠõ6rG=µÁp –æ°»²l?ÕÅSóåM4õ³ˆÿ\0°_éŠ¨Éäí!Å\ZÂ3_j~¬6©£ù5äkû“us£«ÏüÂIaì\r0*¼?•^P·Œ6/§ì¹¯ã…Tå‡—Ú%+%ÌUQĞ«vùcº¡ßòÏMŒKTš1àñT~cePWCHêZ·Ûıü…?\Z6Š@ËäİK¥½å…Ï²\\\"Ÿ¸”Ç‰i	?”üÑätù]?š%ÿ\0aÏZJå[ˆ„èğ¸ı™ƒü2[#vÔ»l¼_äh~ãCŠ7\\#n¥é¤\"b½½	Ÿ$¸×\"R¬Ëıâ)\'¸OáL !ßQcöA§†4›^–-Z¾4¶Œ‹Oâ¼ˆ£«1\0}ç®Ô¯ô\rØ]kĞiöäUe»‘`Vÿ\0P=_ùä’`µyŞ¿ÿ\09%ä-=¾‰ou®İV‘ú)õhtÔ™ZVÿ\0cj¹$ÓÖÿ\09¿8õ[#w§Ù[yoMn>„ì‹êÈ\\•DIo³HÜ[ ‰öY°+Ìn<çæÛR;û¿0jWzŒÎ9VyKÆÀşË1ø?Ø®){î‹®j>ò¾™©êÜÎ¯hg±º¶RÑÄ×JQ–åáZ/Ö$ãÿ\0í|BmäòÛ\\K?Å²5<TĞáT#êMüøªƒj-_µV~oøÚ¿ÿÕ‚Kmì>ìš«ùo¯İézuµÅ»RHŒ¤NêFg˜ŸCò™´PÍuuÌ¶Ñ‚òqZ•^ƒ·&+şNJş]~hù3Ï6/&ƒt­qòÚ½VU¦û«Q¿JUüÃ¯êö:‹¬2€S‚ñ €wÀ„<tÔÈôÛı‰Ç\n£bóœûsÈ‘úëQiæ¸U ;lG v?G¶*ƒĞÿ\0ÂZ;Îúfœ¶orÜçtf?2I§ù?gNÓ_Ó›öØ|ÔâªÉªéïÒaôÔb•t¹·³\"Ÿ¤b«É\Zâ«bU1%E~ú±T£T,£¶H0ıGIÔï¹abp1V7{ä}T7)##æUúo—o QäŒ×bŒTş«/[[˜4é®uÆ6VÑ<×\rpÊ±Æ¥™ˆ`İ`W–êŸ™ÿ\0–’iQjĞèÚÄú}Ô•¶¡i§Io¯Z\0†FXŞ¬xı·ğ}¬mR=3óOÕôıBïËZ5şªú\\…/t¢ÖñŞÆŠµ2ıY™™ãfˆ;#}¥\\<KINŸù­«êò¤Z7”Y,­<·w~”	é¡p¾—§Éøñ_íü8wFÈ8ÿ\0:¼Ä°\\¼šk-¯9®Ú@‘>Áİ¡\rÂ¬QG%ø¹ı¬•¥[Ïm.$¶½´Òà¸1ÃÜHş¤â±‚¤Uƒx¦K3Öµ¯Ì=\\òî‡;i\Z¹|–Ì¶°ÎñÇn”²‡y‘P$ã·İâ¬Sşr3ó/Ì>VÕ¬¼¹ ^ıNòH\rÍæ ‘ªÌ±»8›âô·Iä÷û¿áÄ•œn¯&¿¹{›éî5+ÙMdšVgv?å;òs/Dü½¿Ñb\ZV¨Ğ-äwë7\"}fÎâRVŸUş5†mÕ‘×ƒú­ö±UÚ÷›¼»y¤\\Z\\,oq©YÚ±72Gi\'£\rÄrÕcPÖKûÈÚO…ŸóaV8úV¿ç0ê:>Ÿ3­ÜòÎ,¬£åÀ;\nÌ€ ;ïû8Ò½òKQ¸²Ğ5«khä†Hç¶UiM£ºĞ\nU¢Ä ¥ZñšŞíŒ€¨”—J¢´?©+Şo¹ÀªFè“×\n»ëø«ÿÖˆºdôo)ØéwY‚k+Ÿôè[…õ›ìÕg§8ÏFJÿ\0iqWé:=·œ|ïæ1kŸ¼Óm®(¡«`„¬QìCp$_…NGÜÁc kæOËæ“OÖt f¹ÓCHb¸7”r]YTrd¯_±ÆEøÕ} y·Nó×“í<Ábw?}~(å]ıVÀ”˜Ş¼2”cĞäU—U\"Ÿ×%¬)×Àş8ª j‹Ù±B²jƒÇ¢#Õ=ñµEEªæÅQ°êÄF#éÅ*¶¾a¸„Ñ_š©5FÜuÅP?˜›^_ò‡”ç×ubPˆàµÛœ³°<c¾4«7ì\'&Â‡Éšÿ\0üä_ç™/‹ÚêÏ¢ÚHÄZéúj…jvèÓHßì¿ØcIL´ùÈ_ÎŸ+\\Æ5K¹5KV#•–±nQœwá7æéuÿ\0\'\ZCé_ÊÏÎ%şcÚ²Z/èızçw£ÌGª£¡’&E_Û_³ûh˜Ú½-£´l¡‘¤Tv¡Uåú–‹iäx.4Ëë3}ùm|ÎSàõò’]$Œ×Íñ.ß¸û|<[^çOËŸ)Ûjö÷ŞHó~o*zcO•o!…m;¹ıì§•Ú«ñOÁãû´«öd…¹òæ—{%ÕÏœüóióÃ\ZÜÚÚÎ×œÊqr\"W3Ê²;¯9zKÏ’ü)…P7ºŸnîí´#y]¼É©Ü„„]jr\\İM Œ\0ˆ-b‘‚*¯÷ÒúQ*ÿ\0“Š§ şBëÏo\rî§y¥ùné…M‹¥ÚK$Uı–»œ9/ãé¯òÛÓLÇË¿•Ú.…®¦½>¡¨ëZÔQ¼p]êS,‚! âæ(Ñ#D%~õqCÊ?ç,üœn­,<İof´ÒôÓ¬$Ö2Ôvÿ\0’Ÿäà)ŸômFù­ßL´ÜËsÈ4¾„o7´dWi¿$\nÿ\0åá„LeNÌç@ü‰»¹´¶¿Öµ{MÆî4šnWG\"ÊéÅ\r\"ÛÏÁ^EşëàbH<Â¬=E¿&¿-¼›}5¬ñ1ßG¦Ï}kqwp©¹¶“‹ÂÖñÑx$aåwy‡\"•[­^[Yf{Co¢|-ÎñXZÅWy•Q‰†İİ¶’İ£Iù|?y×•|éiå»¯>êºDfòÆYâl§‚¼o5ÀeB#UaËö¾\nÃ†¹¨j÷ww·Ò%”£\n( ƒD{F½¿›í`µq\'\nµS]SŠ¿ÿ×‹µ0¡£kN¾V$ˆœGÀƒüpª[åº5ƒ\\Jœíá×/Şá{0‡Ñ)_b¯\\B¦^b³‘¼ôuë(Ÿôf ‰4O\nUb•¨x·ìû2ÿ\0+rÅWşRk’y3ó3Tò]ÅcÒµª]iÑ‰#§¨€üÈLóÏKÖ¯t¸¯®Cs2WìJáãˆVÛÈ^iâ(„¨z2\Zƒ÷a´!$òÏš \'Ô²’ƒ½0*­µˆ¿¼µ•Hë±À–…ÍÊ}´uñ¨8ªõÔ˜w¡ÅUãÕ˜~Ö*‹‡ZaÔâ«×Wÿ\0H\"¿	¡ûğ…x/üäç˜&¾óF‘¡&ÒÂĞ]:†[–$šxúh€­Š²O%ézGô(®î£\r®\\¢µÔ«ıâ—–?iQÚUûmñ?ìáBqÿ\0+Ï^”iwisk8àÖ·A^&ñª¹\"¾ëñà¥yïŸ¼¨y\"şÏÎ>Q[[XfVÑ‹Icp~Ê;Éo/Ù^ñŠ^_:¯¨?$6cüÆò¯×E·`Â\r^Éj8IO†Eı×5\'òüIûôB\' ‚ƒÔ\Zâ©4FòlÄÉq i’LßjF³‰úJW@Ëå)ÛÌ\rLŠ¢ªÂÎÜoá²d±¦œH‚(-ÑXÃ\ZDhÕ£\n¡\'Ö1\0ƒNø)¼óË\'¦Œ¥MzıPÆ<ßnŞiòî¡¢İ±t¼‰’2z,€UoÃKo­Æ“®ÇĞËgpáHÜqn.ã9ğÈâ’,=µ¿6ü‡–¬4‹õŸV‚Î	m&Ó Œ+H²I›ÆqJ‹<Ê¾œ2Éñrøs\'_8Ë)”Mñ5áF‹Öÿ\0ç |Í;²èvº%ˆ¸‰ÕïÇPÿ\0éŸ&åèÅÚlÄ2%°Fw©jšÆ­yõNîkË·ØKq#O)ö‰§È`KÖÿ\0(?-õ}HÔtÉm¥=TÇë^J¿\r¼0‡£¿Äí\'ÃÚø0€‚U?4<¹äß-®£hW¢÷Q´†TÖ%\ZÉÎ¨Î`’5[à¯Â¼qVMp+TÅ]şÖ*ÿ\0ÿĞ†<ÃÆ¹4!ŞvªEGCŠ³/Ëø´­[Có.{ıa\Z+ËuB@¥ÄFÍßzĞzËmÎŸg–E,–ÿ\0ÌV:·å…´şXú½©·OOV° ‰á¹3.GövZa¤>züÂÕ5[?0hº³ÎVµ‰§V=H%fê7¦¯k_5[y‹F´Ö4ùcÜF­$2!³!bh®­ğïö±J?:êš[Q.¬tt2\"Ÿ‘û\'ïÅ	æùÙ¯CN\Z«J¿Ë:$¿‰ø±K%Óÿ\0=®ä^7vÖw44$rŒŸ¿À©å¯æ¿•.è/4$õ1äñ¦*Ì•÷ÛH¿W\'ıù¯â9U]4Ë›ÿ\0÷šö\Z€J ıÆ‡\\ß–\Z<ÊZÖèĞô ‚?Š±¯0ş_êÚb­Å³}b©~;²íôá\nùÏóÃëÿ\0úD\nÇx4äö*ca÷¡ÅY]íÜ\ræá%øål¯rÂ3Ğ•“Ó_»IG_Ñõ?ÓpkZRñ±g%\"VâÄFß_ù©¸â¯qò­®ç?)Üq3ÛOYë\ZuÍ¡NÌê@d‰¾>?Ì¼×\"Uá>Bó§ù=ùÊaÔ­”w\r¥ëj>ËÛ³3Sü‚uÿ\0ı¬	}Ø×q˜–HÈuqÉ5ã!ä¼r¦›b¨Y`õ-Ş[‰Vu’I\n\0îIÛ\r«ÏõïÌ?Ê.b/¼Õf^*ó†Ü‰Ş¿óÈ>a:¯üäŸäÅeµ]GSuí>’Ÿ¦B¿«V«ÿ\0ÎZé;ÊJ{,—³Ôÿ\0À ÿ\0±µO.¿4¼Ñç\r/QÔ5\râÚÆ)9ô«xÙZ„ÉëÏpü‰PR‹\Zâ\n¼kó—Dãæ/ÒöjdKï÷¥€©õ—bÆƒöÆı1PÄt¯+kú´«•„÷ÆŠJ•_¢½~Œ—¦è¿óšòÙKÍWÖŞ]Ò€äó]H¶ëO›üMòã†‘høüÁù\rä–)£ZÍæıZ=½r\rµaã#ƒ4£ıUã…HüËùÙç_0@Ö)pšFjKÓêÑPövÕ“ı“ñÿ\0\'%¦€ûoÛ¢ÛomñWb¯ÿÑçÄ“×$…\'pWĞ<È4\rr\rNXÚ{2[j¶Éö¥²¸\'ÿ\0\'Ã4_ñdIŠ²‰âÕô]fËK‚=JÃÌê³XêÑw\"?Iã§ó×÷‘ı¨åä˜UãŸ™ZÓG$´ëeKŠv–Bd ûñ+€ªS ù¯UÑã’bM}7å@Ş\"„uÀ–Ieù¬ZtwŒ÷ÊÊ¿ğ\'lmi1‹ób)Oúm¬Sø´Öñ1ÿ\0ƒ@¯øáâZFÁùå	½²H˜÷ŠYáüÊ¿†6I„eò”äon­ÏjIà}Ñ8U5·Õ!¥mµå§a<2§ã˜`Ja­«\nzw¶7>\0Nˆ~é„xªckæ3ÂAÖF§í[0“şL³b‹L£üÎóM™i/aAUd—Õ‡ÙÆ)yïõë[¯6ùkÌÑ€&Óî£òŸÈ%!ûÄ‹şË3¿Ì?\"êPk	uÿ\0¢.£u¯û>•ÇˆŸ\ZLmiØùRÏÊZ47Ò[¾­m¨DÉ/2“HC\n0ı›¼~fÏå>^Å¡•]3Q&’:PsQF¥~EpÒuùÍ3ßëpêÒ{¨YA4Üºr„“şÅ_QÎ8ùÚO4şZéñ\\KÊûJ­…Ác¹ô@ôÉ\'Æ#=\\[…øĞ(ûGÛ|aÿ\09ùÖŞpód_´¹š/&ir4&;fânåCG•ë³\'/†%?íşÖ)y¦Ğ=ø[{y ÓƒJy7äš|RÚ\'ş#Š§\Zæ¥ÜÚØGå»}BæåƒµÜR\'©éƒN\02ÿ\0âãl4ªv?–^y½ E¤L ÷qüøÒ-ô§<“ùsåï(ØÃ®[Ü[êq\'©}w9‚YIOIUvU<y7\"Òo1ùëşqÓE‘Mß˜.ÔÔ[Z;4U÷•½8ÿ\0àYğ¬\\ÿ\0œœ×Ö7µòfcå‹SP\'âî>¬ƒ‚Ÿ”x8“O(×|Éæ\r~ñ¯5½FãQºc_VæFŠÿ\0/#ğeÈ¥<…1TÒØ±¥qTÒØaB-GÃŠ»v*ÿ\0ÿÒæ·/{lisk,uõ—ñ#0y1#šê0÷ÂP‡–te4;àT-·›¼íå»I­¼½«Ikc+6$$‘«·W‰dW1ÿ\0#KºMFæâK‹’ó\\LÅå•Û“31©f\'rIÁj±,æ\'qLU]l\\uÅ[6Ä`¥ShHí‚’¦Ñ{b­+O¬nËş©#õaB\"-cX‡ì]Ê>lOë®EGæÍv3_\\1ñe_à6©ŸæwšíiéÜ²Ù^EıM†Õ¨şkkš=…õfŠeâK0r!”‚ÊXQ€èØÚIùwÍ‹ç¿Ê6Y•.Òµ&…ä#ı\nwğaû™ü¯òq	bşAü×óÖ‰z<­y+dg·u™k%¼‚£¡ğ;a¤0=é¨¾`ˆZO4 IN<–»Sül*•~q\"[_XXƒV¶Óãóy‡á‘VKÿ\08Áç­\'Ë÷úİ¯¨-•¥ÌQOoÍ]ùKpı‡¯û	zÿ\0›¿>¼˜šeÍÔ×/qÃëÃFÉÍJòS\'‰kUÃH`íù—ÿ\08Ã¥Ækä&¼¸DPZâ((Y@<ä‘ji¿ÁŠRMşròÖè¯Ô¿-ôâbb3È( váh)şË\r¡Üÿ\0ÎIy–(Œ\Z&¤èğşÊÛÚò#é•œÂãjÆ5OÎŸÌ½H2Ë®O7T·ãn¿òH&K½ÔµùL··2ÜÊngg?{PØ«`ÓUKvcŠ¢á³Üb©•½½)Š££L(VÅ]·LUÔÅ_ÿÓ„[~fk‘¯˜¢¹Nà‚¤ıÕ†bËE†œ©—T@ó—”/Oû“ÑB±ë$jø\rü¾Hı2eã@ó\r;ò·Qşæıìöfd\0ÿ\0Ï@ÃşxóKÁˆò-IùSkv…ô­n…;…pâ„ÿ\0Är?¯ª$\'ò·È¤Zå›!©Ş+¡ã‹_¹¸œ²:üg™¦K67}å]~ÀŸ­iwÕŒlWï|sã—\"\Z¥Šc˜KHŒ,¼[Àí–°hÃ	é¶*´Ù¡èqU&°¥1U6ÓÏ†*¢ÖÃRkğÅTÚÍ‡lUI­ŠöÅY§åWæEï‘µ·’H>½¢_!·ÕôÇ?Ğ7Z,‰ö£ÙoöX…{ü¾^ÒüÛ^`ò•ßéx…K˜ho¡ZPC}o^lÑ…gO´¿Ï’BLŸ–ú&†n<Ñçú¥µ·ï\rÄ¥–„6\0»±èƒ¾~óÇšÌZıî¦WÓ[©+\'NbCî¨/ò°+Gt`ÈÅXt`h\nÛM+}§fù’qU˜«±Vè|1VÄn{bª‹m!íŠª¥›Øª&;:uª&;`)¶*‰7¦\ZTJ-(VLUqÅ]¶*Ö*ÿ\0ÿÔâåòh[Q€ªÆ§lU¤/Š7Š’§ğÀ@)“[O7y¢ÊŸWÔ§\n?eÛÔ_¹ë”ÏK\\ÃdsÌr)ÕŸçš-È1Av½ÉR„ı*iøf$û3åqo¶]Sù§å{ğZĞU«ö˜,rø`­˜ÿ\0ÉÙ#ôM´jà~ ãä¾«Ğ~‘¼Óõ¦ğ¸I?¸“Gò›ËÃ–®š²¤Ç(ÿ\0…*q£–?TWò<Š[yù1æxjm.mî—°«FÇşSñËaÚ¸Ï0CQÑK¡Ho|‡çK*™´©]GíEIGü!9•\rn)r“T´óKˆnmÛÍ¼°ê$FOÖdFq<‹I‰Â—(›¶I\r 8ªÆ·ŒôÅT^ÈØ«V««é×ëJ¼Æät–	6ÿ\0‚B*§¬^y«W‘dÕµAÓì5ÌÏ).dÓT·ômÏp>üU±¦ËÜŒUPi§¾*¼iÀb«×Oª²iãùqUU°QÛV[4ÅW‹d±Uâì1UÂ!á…Äxªğ˜ªêSk~Ø«qVñWÿÕâÆ¹ …¦¸ªÃ×v*Ö*£\'\n ÜqU†˜Ut>¯1èòçÛ…køde]SèË4?ùY¿èÏÒ;råÃşJm˜Y¿-ü\\.V?¥½Cÿ\0•µğı{ê|;úÿ\0oşIf«7åºq9ñzÓ+?ï9ı/õZ~×òÉLÃëèâo÷±=sşU[ëÿ\0Põ;ú?oşIffÍtâhŸ…Ö˜µÿ\0*›âıúCŸoGìÿ\0ÉlÙbüÏ^~Kb_UõÔı_O·­Æ¿ğ¹.´ãJº)S&Áxç+¿ÖÂczUíŠşçÛ®_GÛ\\}?lPï‚½°%zğï…ÇUß!]ğb®ø{b®ùâ«‡M±UÛÓw|U®Ø«±W\\UÿÙ'),(5,'Toyota RAV4',180.00,'ÿØÿá€Exif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0·\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0¬(\0\0\0\0\0\0\01\0\0\0\0\"\0\0\0´2\0\0\0\0\0\0\0Ö‡i\0\0\0\0\0\0\0ì\0\0$\0\0\0\0\nü€\0\0\'\0\nü€\0\0\'Adobe Photoshop CC 2014 (Windows)\02016:01:11 01:58:42\0\0\0\0\0\0\0\0\00221 \0\0\0\0ÿÿ\0\0 \0\0\0\0\0\0 \0\0\0\0\0\0\0´\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0r\0\0\0\0\0\0z(\0\0\0\0\0\0\0\0\0\0\0\0\0‚\0\0\0\0\0\0ö\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0ÿØÿí\0Adobe_CM\0ÿî\0Adobe\0d€\0\0\0ÿÛ\0„\0			\n\r\r\rÿÀ\0\0i\0 \"\0ÿİ\0\0\nÿÄ?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q2‘¡±B#$RÁb34r‚ÑC%’Sğáñcs5¢²ƒ&D“TdEÂ£t6ÒUâeò³„ÃÓuãóF\'”¤…´•ÄÔäô¥µÅÕåõVfv†–¦¶ÆÖæö7GWgw‡—§·Ç×ç÷\05\0!1AQaq\"2‘¡±B#ÁRÑğ3$bár‚’CScs4ñ%¢²ƒ&5ÂÒD“T£dEU6teâò³„ÃÓuãóF”¤…´•ÄÔäô¥µÅÕåõVfv†–¦¶ÆÖæö\'7GWgw‡—§·ÇÿÚ\0\0\0?\0¹…‚Ü<J±Zâÿ\0LA{¹q>ç;ù(¥…\\v “î×Á/²8v+DHC`Ô µTÃG™V[Š{„FãWŞã\n¦¨cT¶…m¸õx¢zGtŞ4ÑhB‰ÁiŒj|TşÏTpãW	qÌø¨™[?g¤~hKìôşë~ä¸Â¸K‹µÅM´XïÍŸÁk\ZXİ6€–ÖRãWœ0¯ÒâˆÜkN‹@9£‚¤,A¯”¦™”€\ZuĞîän–¹¾iæt h®hòù¦’Jà)³Y$jŠÆ‰çø*­°O!–Çp£!xmµ\'ñSoxU£Åª^£|SH]oÿĞÈoÖ¹]-«Ö—´±Í±íŞæ–[fıá•9öXïûgô_ñ{ßVoë%ÙUŸ±ää6Çº,{¬ÙïÇa>£±·ÿ\0…ÙèşŸş+-…Õ>ËÒó:^F?ÚÙ”ÆÙS´6»Ïè™‘mo½¬­ÏÒzx¿èÿ\0œ]\'ÕGtsÔ­ÎÀûnm÷ïªËïkET×¥ÚÙ_è÷>Æ·\ZŠùŒõ}*«K¹à¶CC£ÑD€æüåGôqîyøh—ÙFµ•Ö¾±ô¾=\'5×eéµ‘¹»¾‹²,w²Šÿ\0­úEfS¯‚6ÛsÈ>Ó¸y§m$HĞğ@<ÅÙõ»®äcdå±ÍÅcKjÇe-K}Kl´î{ÚÍÕĞÏøk—Eõ?¯u.³^GIÍËe¹Vë0-‹ªº°×=ŸMŒ÷{ºÊ¬ô­ÿ\0‹QûŞ½·]§÷Kµî?ÜŸŞ¯wİü(~´õÛ×¿7 <xÜÖÃ¸±»j­ŸEègë/[n£;$ÿ\0×O÷\'{’ì\0õ¦âİıTšû}¶6y‘r\rúå×™ôs->O‡¿j#~ºu‡9`Æº]ÿ\0Ÿ1÷ÒKİ=•Áâö;rD;s<Š›`:Æ¾W7õ³%îmne´˜ØêuıİÔ¿]gÖGµş•ø,m§†µï¤Ÿƒ2[ÏónDdğAƒ­µÓä–Çv*8øyÁÍ¤šï¬M¸Ö€ÛX?yÌüú¿áé}”-\\\r0Ä»-á¦¸­İßùTıñ	äxÁ.\"ªEé¸~t©ü©ø\"‡G‡à¤-wˆÿ\0_’SAƒZÙúDü‘CG‰KÖˆN/ziµÂŸÿÑ»õs¦ı^´U”Û0ó:‹ècßUum588÷1ï³ôÖOé½¿¤ı7øĞ3º«mU1µÔÁ\r­\rhÉc6ªêİ]78´ãç½®nEµ¸Ø\\ÛÜÖ{İ–zU×Ulşoüµ˜‡Œü›±…¢%ÎsÜÚª®¶şsì±íbŸê@,r²v¶—[ÌıŸÒ³2Ø6ÛMXÇ~ë€Ù[ÿ\0íë*kW“Ÿ]Ìcœl{®..:—Ycˆ÷:ëô—°åô¶fS~]M»økë.sNÖ™oº¯øOzÅ³ü\\tY%¬ÈÆgòrÁ»n«÷¿}ê9›+â(4úO@ú²Ìw`õ½ˆÛ¡­uô/cÚl}›_—e/³Ô²İßÑÙüİjË:?Vº÷HêLÍ4äZÚ)xªºà?f+Úûq¿GmO®Æìÿ\0„b\r¿âÃÒOQÈ¤v¯%µØØ›>í«?7ü]uÌCºvE‹Ú×¼06Ö–=ÇÛ5ïı}gò=é©m}hè™Ø=_5õÑc±.°äcØÚË˜E¿¤¾­õîmVW‘êû,ÿ\0¹¿´Öó°nıİÂÍúKØñòr¬uŒß¹ Èİ:Oæ×µÍAÍ£¥åŞ«‰£-•½¦}­m963éÿ\0&Öÿ\0mE>FçNó;Ã ˆÒå«®É\Z£À¯MwCÿ\0Ç~]ÃÓ‚;{ÃkE§ê¿ÔüèøX#ù³ÿ\0YbVª|Ï&¦zu[€°wıáÿ\0’]&VGO«ÖªÇº6Ü	.nñùíº·9¾ÿ\0jëÿ\0æOÕˆ×¤Ğ>O÷õõ#êÈÌW<–Ysê.‰ ‹x¬‡WYkë²ÇWQİSÉ-¾ƒûôŞßs™ş·×bŞéXé±Õâõ0Ám„75Ê®\'è×{›ÄÊşÂä‚ôlıÔwÔ^†~ƒrjğÙ“wışÇªîÿ\0ı+Ò}UİÊí¶5ÏŞ?KÚÿ\0j\\]•]İgWé	}oõ¢n¯÷Z<‚X=\"œVâVëî©\ZoÈ²Ò\0Ñ­ÜÖ5ŸğmE8-:±Å‡ÁÚü’\"]ÕÃÙèÉ˜Jà¤ì;ÙÛpıæê£é:9	Ö;­£ÙôÇ:¤K{PØäá¥?ÿÒè:Õî£W£RëfÀË?EUvµì¿“¿Ô¹Íõ~›¯·+gôŸğıÛÍ`mLôŸ[ìß-;½­†»u¯ş£¹Ó3ºUvg3§#ÓzËi,©§Õ·Ò£ˆË>…>®û}‹7übu{ÿ\0`ãÖÛ\\YÔn0¸<ÕPŞ[f;ØÏK}Î¥ÛÂzhC¢ºíõ{÷5´Ù½–=í±¢XâvüæÕôk±ß¡ym¦«mÆpt¸×±û‡î=™ÚÏûúÀú£Ôrs~­âœÀá•8÷oúG`k©{§÷ñì©j’›Vº·“Cù]êVÚ½€I÷VZ?tëú?ë5\r¯+šúù×lé½ĞÇvÌ çR×[KFì‡7ş3{)şİ‰)ëz_WÄiu&ÆÛ¹û_s^×µú-eŒgójÏVÃÃÎÄ³6±m6hêÏ<şnßs×7}vƒ±x?Cë9]/:¼ŠËŸX†ßX\Z:³£ëvßä¯mÃÏnFok·7h‡~óH©ÿ\0Ú©ÌINe¸İg§á|G>Ê˜àì\\ŠêWüİ¸Ù­Úÿ\0Júú_Sù‹MüßóUáı«ëù&¼¬LVs®Éª¦W[G{ngé?;ı^ºçõ#CM@:×¸»s§k[¦ã\0ı\'9;óİcbÁ] CÛ ùmqr*pğpóòêôšH£‡å‹_…H^Ü\nêõrr*İÿ\0j,nÄ_ÙŸãŸ²õZ­«óöXà#èºÇàÕ¿İùŞÅ°:»kau»k©—8¸5hî\\ı­­Œ\\îWøĞè”Üê¨¦ì¶4Ç«^Ö0Ÿø?Yì±íş_¦‚©´2¿Æeö›§åÇòšÂ´Ûjÿ\0¨Tú§×o®µ»ªt*ZËHevÓqueçŠŒ}›-wî=ÿ\0~F½?+äê¿ô¢…ÿ\0ãGêöM/ÇÉéyWQhÛmOôœÇİ{M‰)¶ÿ\0¯}db;1˜8WW]†«VC‹›`üÏÒ¶–[ùÿ\0Ì¿ü\rÿ\0¸GXÿ\0B†]Ó0±)´Vû\\,q¾Çd×·ûM\\}cê0ª1:¡§yµØåØûIµì}ßÓmkšİß‘¿şİ±t?øêt6ıÀ€P\0¢ßçR$*‹£wüé£_ÕXü×´?×XKFíÔ?ĞÄ~ÿ\0EŒş{u9HvuÌû1ëËÃ¸³6ÚÒÆ¼ÖéÙS¬²Ö¾í¹_NŸWÿ\0F*µÿ\0~IÛ…–`“5éUÒtÜÎÔzI»§×Kú~X{­kZç>ÜŠÙr78ˆ5â‚-ÄoÖ.¦ñ´#Ü)lŸ¿ÛîRgÖ ÂM€rXo—Ò¥õª7\nCöš7²°[]mõ@ö»İêúnc,wö3ìÌ.°tæØò¤!á­#ùÍÓg¹Ÿ³güójN1û«xï?ÿÓ¾oéUëkS\ZCFE@4\0Xë?XÚæı/ç=ïşÚçş±áÓÔú—CÂÄËÆ¼edZÑe.°5¥Ş€­·zÏÈ²§~çş{^êäA:x¹_®8Áê¢+v5Öú2Cši²ç5ÛK,õüvWúìõYmŠ(™X²Ê@­\Z_Sln=ıC§l5·m7×Q÷m ÛsYûíİô?º/LºKï‡+Ì~¶1:ı•½Å–1•¹Îq`ûC};\ZÖ~¬µ¬kıˆx¿Z:®0iûKÍ|4¸‹#ÃÖŸú6©mcéä=¥yçøÈ±öõlp`}`_c÷»üÚÕÜ/¯ùÚŠ²äKş	êµgıcêİªô÷QM•ßµØöRFíÅÎo£éîßü÷§µPÃ\Zì|0Ç†}šÊıA¡x¬Ï]ğßŞs=O¨ºï©Yeıìî;Ÿ‡kñŒ÷h‹±ÏıµvÏì*¬Â·÷¹®È·í/ÉÚêˆ-¯*«šßÌ¢Ú­»ôˆ?Q.qÉêXüû)º‹M˜¶;ÿ\0= \nKw¯u~³‡Ôœp¨ªìZªg¬,0÷XíÖm¨ÿ\0&½¿OÙ¿ş^è–uN¹MãÓ[{wåÍ!³ÖúŠ­=¬õ¬ùn¾ŸK¤¸´²×°ÚÑ[êñßş…û7½îúşúæú›³«é”ºªvRæ3sËá¬©Îİù¬­Œşn¤¾ªòc“‹Òz^-ŒÏôó-5—dÀ4²¾\\l®É­”ÿ\0_ô–®Yÿ\0Y>¦—10K{Ùû¿éz,\\ŸÖ­/ë7;î9¯İ.0ûŞ?íFDşgú\nV/ó‚Z£GÑmúÁõScÿ\0gà½ícœÆşÎ-ÀKCˆoÑÜ¥ÑèÅÎ¨Y‘Ñºiİe­Š±!­ªŒŠı5»ıOÓ6¼è±»fu‰ö¼êÚ^Uá§óE¯hĞi¦äAAMQì£¸}”ã: O@Âõ}&<´a~sîû6İ=F7k,¦ÿ\0ç¬¥êX­d`b0än…¾‹m¬pZ2¿Z«ƒŞÖVö?ÓµÛÿ\0›şf¿çœ¬çó“|½gÎC}ù@IºØÍ¯şôú%ısê¿N½ø·ôº«È¯is[Óª˜±¾½ÿ\0Gô›,ı\"°ß¬•åô|Ç}_¦Šr°€°Õu_gg¦ıß¥Q,ºÆÛô?ğUåÍ´¸’è\'¹.q\'úÎ[ÿ\0SÉdPâ[Ôè³ë[ºµu^ÿ\0Í{]_±$¾‚^ócİ·sá€:7>79ú_ØBÇÊf^5yâšk¸ÆXö´èK\\Æú›v¹ªĞY5;mXÖ7kâZ™·Ø+ôFßgÓ­ÿ\0á~’î¥wLÆ·cWŒön«í\r&è’?KéµìßıG!fëZ¤P®ÿÔíR Ä>I\0ÖGòv•õ¯&‹ú;»{h°[d4éí³)Ìkƒ›ëSFE—Uÿ\0	Jå]U¯°XC·²v¿|8OµÀ;s¾’‹ğïÛ%›€ì$óå\n.-ƒ£ËuÎ£ûKªdfÛa¶“¸¶¶5µTÍßÉ­‹¢ú¥—õo¥tßS¨¶›s2^l\"ÊÛaecÙC?I¿Óá÷{[şı+ÒwPÀá¡ö†™İ•k:>ÊÀ<è‰V¡\0oBìõ^±õ¨Öñ}>ïú9Xõ5–´Ïò?Egî~–·¬|zş«£†î™˜\\.`´^ÆÀ¬‘ê_U´ØÛkö~Ò±U·¡µ¿D*ìÄ·\"¼š½¯¥Áí=o¹¿ô‚Q\0u*6z­møù8}Në2mÉÃ÷ÖYqoÚ,k~­ÛFÆ6úìo­mß¦ûm£³è.Duœ;œiµõ—.©å‡Ÿä.³­uo³åõ:¼g]etìJÀ$Vi¿&—zMmunõ¾Ñîşv¿Oü\"á^gå¢pZ]fıgë@Cz…àÎxwıXrOÖ¡•OÙsr‘ŒâêkZâ5o¨imn³oò–Oo$áí±§â%$:Øtbõ;K«Æª¸6_u­kZî×°äd?÷j«ÿ\0Z_²~¨²Ú®·Åî¶ªäÿ\0&šë·c­u‹›¯#§ß‹UŸãÿ\0F-,n¯Ñ+ş{¤ã»Î-‰è‘^\r»+ú—[‹\r×¼\\HŸìT†û>¥[sÿ\0­m‡ò5ªå]sê‰ı/¿\Z¿Ş¯Qõ‡êUD–áã0‘ÑØáÿ\0ML³ıeÔ?ªâ¯©Í˜–;ÃßwşM©ÆwÕLtédÚôjÖ§t<›ÙÔ:=µ\rímy8Œo¥hÚÛê¬5•úo`kneáKşa›_hkïk&üÓ€±¹ZMƒÔWŸõPÏù>¶xnkÜ½i7êëz·O®Ü,z°éÉ›a9Õ·w¢÷{?›İKÿ\0=s} åu¼¶ãÒ6c>Ó’tmlüı¿é/wø\ZYÿ\0×®Q‘—S1i®“E,etndÃX64×k\\çlk„uH×£PduŠëS†Æ²¿N¦Ykæ}:åÍºßr£Ñ2º±éx£¬QŠE_hs…Ó¸Èµ•ËîıÅ¹öœÒØÒ>˜÷h{4m{¿5Ë;Î‡^+h²’bÛ4¸îå¯­¾Ô8ÍÚx_ÿÕãìêEÅ¯È²\0Ôî!¿ôu&Ø×ŸRÃmµío¨}ß½»óÿ\0Ír§Óÿ\0œÉøú¦«úcãü^¢õx¨q:?.[Ó­kmsµÇhÓô^×û}Gm÷î³ô‹XlC`jÒ|;é»Ú¹|/çjÿ\0Œ³ş ®§@gÄÿ\0™#u«72>¨.¥ñSÑõåLÿ\0¥ş¾	%ÇËèö¼şø¬ImN†Ïú=®TİĞ³gG°ü%tƒ‘ğUò>“?¬Ÿê[épOFÍüçÈ€Q= r	+¦üôÎì—©—™ı‘wî”ÿ\0²oıÂº7}ÿ\0š—©^—œ\"óÃT‡F¼öû×Bîÿ\0ı‡Ä~T½Jô¸±ío0¬ãô,«œKM=šÒOä[İ/úHø.Çù·|õ./Òş¦æ›«»#ôB²Öé¾F£Fı®–œŠÇóÄƒ¬A\në¿šoúşêCù×|”r¾«ÅVŒX×²v§øÃQÅ¢I$w#S÷(¿è‚ƒÿ\0û’ÕOÿÙÿíVPhotoshop 3.0\08BIM\0\0\0\0\0Z\0%G\0\0s\0\08BIM%\0\0\0\0\0ñ?3k˜³•\"X×ÂeF>8BIM:\0\0\0\0\0å\0\0\0\0\0\0\0\0\0\0\0printOutput\0\0\0\0\0\0\0PstSbool\0\0\0\0Inteenum\0\0\0\0Inte\0\0\0\0Clrm\0\0\0printSixteenBitbool\0\0\0\0printerNameTEXT\0\0\0\0\0\0\0\0printProofSetupObjc\0\0\0\0P\0r\0o\0o\0f\0 \0S\0e\0t\0u\0p\0\0\0\0\0\nproofSetup\0\0\0\0\0\0\0Bltnenum\0\0\0builtinProof\0\0\0	proofCMYK\08BIM;\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0printOutputOptions\0\0\0\0\0\0\0Cptnbool\0\0\0\0\0Clbrbool\0\0\0\0\0RgsMbool\0\0\0\0\0CrnCbool\0\0\0\0\0CntCbool\0\0\0\0\0Lblsbool\0\0\0\0\0Ngtvbool\0\0\0\0\0EmlDbool\0\0\0\0\0Intrbool\0\0\0\0\0BckgObjc\0\0\0\0\0\0\0\0\0RGBC\0\0\0\0\0\0\0Rd  doub@oà\0\0\0\0\0\0\0\0\0Grn doub@oà\0\0\0\0\0\0\0\0\0Bl  doub@oà\0\0\0\0\0\0\0\0\0BrdTUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Bld UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0RsltUntF#Pxl@R\0\0\0\0\0\0\0\0\0\nvectorDatabool\0\0\0\0PgPsenum\0\0\0\0PgPs\0\0\0\0PgPC\0\0\0\0LeftUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Top UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Scl UntF#Prc@Y\0\0\0\0\0\0\0\0\0cropWhenPrintingbool\0\0\0\0cropRectBottomlong\0\0\0\0\0\0\0cropRectLeftlong\0\0\0\0\0\0\0\rcropRectRightlong\0\0\0\0\0\0\0cropRectToplong\0\0\0\0\08BIMí\0\0\0\0\0\0H\0\0\0\0\0H\0\0\0\08BIM&\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?€\0\08BIM\r\0\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\08BIMó\0\0\0\0\0	\0\0\0\0\0\0\0\0\08BIM\'\0\0\0\0\0\n\0\0\0\0\0\0\0\08BIMõ\0\0\0\0\0H\0/ff\0\0lff\0\0\0\0\0\0\0/ff\0\0¡™š\0\0\0\0\0\0\02\0\0\0\0Z\0\0\0\0\0\0\0\0\05\0\0\0\0-\0\0\0\0\0\0\0\08BIMø\0\0\0\0\0p\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿè\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿè\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿè\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿè\0\08BIM\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\0\0\0\0\0\08BIM0\0\0\0\0\08BIM-\0\0\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\0\0\0@\0\0@\0\0\0\08BIM\0\0\0\0\0\0\0\0\08BIM\Z\0\0\0\0A\0\0\0\0\0\0\0\0\0\0\0\0\0\0´\0\0\0\0\0\0n\0i\0s\0s\0a\0n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0´\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0null\0\0\0\0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0\0´\0\0\0\0Rghtlong\0\0\0\0\0slicesVlLs\0\0\0Objc\0\0\0\0\0\0\0\0slice\0\0\0\0\0\0sliceIDlong\0\0\0\0\0\0\0groupIDlong\0\0\0\0\0\0\0originenum\0\0\0ESliceOrigin\0\0\0\rautoGenerated\0\0\0\0Typeenum\0\0\0\nESliceType\0\0\0\0Img \0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0\0´\0\0\0\0Rghtlong\0\0\0\0\0urlTEXT\0\0\0\0\0\0\0\0\0nullTEXT\0\0\0\0\0\0\0\0\0MsgeTEXT\0\0\0\0\0\0\0\0altTagTEXT\0\0\0\0\0\0\0\0cellTextIsHTMLbool\0\0\0cellTextTEXT\0\0\0\0\0\0\0\0	horzAlignenum\0\0\0ESliceHorzAlign\0\0\0default\0\0\0	vertAlignenum\0\0\0ESliceVertAlign\0\0\0default\0\0\0bgColorTypeenum\0\0\0ESliceBGColorType\0\0\0\0None\0\0\0	topOutsetlong\0\0\0\0\0\0\0\nleftOutsetlong\0\0\0\0\0\0\0bottomOutsetlong\0\0\0\0\0\0\0rightOutsetlong\0\0\0\0\08BIM(\0\0\0\0\0\0\0\0?ğ\0\0\0\0\0\08BIM\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\0\0\0 \0\0\0i\0\0à\0\0Äà\0\0ö\0\0ÿØÿí\0Adobe_CM\0ÿî\0Adobe\0d€\0\0\0ÿÛ\0„\0			\n\r\r\rÿÀ\0\0i\0 \"\0ÿİ\0\0\nÿÄ?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q2‘¡±B#$RÁb34r‚ÑC%’Sğáñcs5¢²ƒ&D“TdEÂ£t6ÒUâeò³„ÃÓuãóF\'”¤…´•ÄÔäô¥µÅÕåõVfv†–¦¶ÆÖæö7GWgw‡—§·Ç×ç÷\05\0!1AQaq\"2‘¡±B#ÁRÑğ3$bár‚’CScs4ñ%¢²ƒ&5ÂÒD“T£dEU6teâò³„ÃÓuãóF”¤…´•ÄÔäô¥µÅÕåõVfv†–¦¶ÆÖæö\'7GWgw‡—§·ÇÿÚ\0\0\0?\0¹…‚Ü<J±Zâÿ\0LA{¹q>ç;ù(¥…\\v “î×Á/²8v+DHC`Ô µTÃG™V[Š{„FãWŞã\n¦¨cT¶…m¸õx¢zGtŞ4ÑhB‰ÁiŒj|TşÏTpãW	qÌø¨™[?g¤~hKìôşë~ä¸Â¸K‹µÅM´XïÍŸÁk\ZXİ6€–ÖRãWœ0¯ÒâˆÜkN‹@9£‚¤,A¯”¦™”€\ZuĞîän–¹¾iæt h®hòù¦’Jà)³Y$jŠÆ‰çø*­°O!–Çp£!xmµ\'ñSoxU£Åª^£|SH]oÿĞÈoÖ¹]-«Ö—´±Í±íŞæ–[fıá•9öXïûgô_ñ{ßVoë%ÙUŸ±ää6Çº,{¬ÙïÇa>£±·ÿ\0…ÙèşŸş+-…Õ>ËÒó:^F?ÚÙ”ÆÙS´6»Ïè™‘mo½¬­ÏÒzx¿èÿ\0œ]\'ÕGtsÔ­ÎÀûnm÷ïªËïkET×¥ÚÙ_è÷>Æ·\ZŠùŒõ}*«K¹à¶CC£ÑD€æüåGôqîyøh—ÙFµ•Ö¾±ô¾=\'5×eéµ‘¹»¾‹²,w²Šÿ\0­úEfS¯‚6ÛsÈ>Ó¸y§m$HĞğ@<ÅÙõ»®äcdå±ÍÅcKjÇe-K}Kl´î{ÚÍÕĞÏøk—Eõ?¯u.³^GIÍËe¹Vë0-‹ªº°×=ŸMŒ÷{ºÊ¬ô­ÿ\0‹QûŞ½·]§÷Kµî?ÜŸŞ¯wİü(~´õÛ×¿7 <xÜÖÃ¸±»j­ŸEègë/[n£;$ÿ\0×O÷\'{’ì\0õ¦âİıTšû}¶6y‘r\rúå×™ôs->O‡¿j#~ºu‡9`Æº]ÿ\0Ÿ1÷ÒKİ=•Áâö;rD;s<Š›`:Æ¾W7õ³%îmne´˜ØêuıİÔ¿]gÖGµş•ø,m§†µï¤Ÿƒ2[ÏónDdğAƒ­µÓä–Çv*8øyÁÍ¤šï¬M¸Ö€ÛX?yÌüú¿áé}”-\\\r0Ä»-á¦¸­İßùTıñ	äxÁ.\"ªEé¸~t©ü©ø\"‡G‡à¤-wˆÿ\0_’SAƒZÙúDü‘CG‰KÖˆN/ziµÂŸÿÑ»õs¦ı^´U”Û0ó:‹ècßUum588÷1ï³ôÖOé½¿¤ı7øĞ3º«mU1µÔÁ\r­\rhÉc6ªêİ]78´ãç½®nEµ¸Ø\\ÛÜÖ{İ–zU×Ulşoüµ˜‡Œü›±…¢%ÎsÜÚª®¶şsì±íbŸê@,r²v¶—[ÌıŸÒ³2Ø6ÛMXÇ~ë€Ù[ÿ\0íë*kW“Ÿ]Ìcœl{®..:—Ycˆ÷:ëô—°åô¶fS~]M»økë.sNÖ™oº¯øOzÅ³ü\\tY%¬ÈÆgòrÁ»n«÷¿}ê9›+â(4úO@ú²Ìw`õ½ˆÛ¡­uô/cÚl}›_—e/³Ô²İßÑÙüİjË:?Vº÷HêLÍ4äZÚ)xªºà?f+Úûq¿GmO®Æìÿ\0„b\r¿âÃÒOQÈ¤v¯%µØØ›>í«?7ü]uÌCºvE‹Ú×¼06Ö–=ÇÛ5ïı}gò=é©m}hè™Ø=_5õÑc±.°äcØÚË˜E¿¤¾­õîmVW‘êû,ÿ\0¹¿´Öó°nıİÂÍúKØñòr¬uŒß¹ Èİ:Oæ×µÍAÍ£¥åŞ«‰£-•½¦}­m963éÿ\0&Öÿ\0mE>FçNó;Ã ˆÒå«®É\Z£À¯MwCÿ\0Ç~]ÃÓ‚;{ÃkE§ê¿ÔüèøX#ù³ÿ\0YbVª|Ï&¦zu[€°wıáÿ\0’]&VGO«ÖªÇº6Ü	.nñùíº·9¾ÿ\0jëÿ\0æOÕˆ×¤Ğ>O÷õõ#êÈÌW<–Ysê.‰ ‹x¬‡WYkë²ÇWQİSÉ-¾ƒûôŞßs™ş·×bŞéXé±Õâõ0Ám„75Ê®\'è×{›ÄÊşÂä‚ôlıÔwÔ^†~ƒrjğÙ“wışÇªîÿ\0ı+Ò}UİÊí¶5ÏŞ?KÚÿ\0j\\]•]İgWé	}oõ¢n¯÷Z<‚X=\"œVâVëî©\ZoÈ²Ò\0Ñ­ÜÖ5ŸğmE8-:±Å‡ÁÚü’\"]ÕÃÙèÉ˜Jà¤ì;ÙÛpıæê£é:9	Ö;­£ÙôÇ:¤K{PØäá¥?ÿÒè:Õî£W£RëfÀË?EUvµì¿“¿Ô¹Íõ~›¯·+gôŸğıÛÍ`mLôŸ[ìß-;½­†»u¯ş£¹Ó3ºUvg3§#ÓzËi,©§Õ·Ò£ˆË>…>®û}‹7übu{ÿ\0`ãÖÛ\\YÔn0¸<ÕPŞ[f;ØÏK}Î¥ÛÂzhC¢ºíõ{÷5´Ù½–=í±¢XâvüæÕôk±ß¡ym¦«mÆpt¸×±û‡î=™ÚÏûúÀú£Ôrs~­âœÀá•8÷oúG`k©{§÷ñì©j’›Vº·“Cù]êVÚ½€I÷VZ?tëú?ë5\r¯+šúù×lé½ĞÇvÌ çR×[KFì‡7ş3{)şİ‰)ëz_WÄiu&ÆÛ¹û_s^×µú-eŒgójÏVÃÃÎÄ³6±m6hêÏ<şnßs×7}vƒ±x?Cë9]/:¼ŠËŸX†ßX\Z:³£ëvßä¯mÃÏnFok·7h‡~óH©ÿ\0Ú©ÌINe¸İg§á|G>Ê˜àì\\ŠêWüİ¸Ù­Úÿ\0Júú_Sù‹MüßóUáı«ëù&¼¬LVs®Éª¦W[G{ngé?;ı^ºçõ#CM@:×¸»s§k[¦ã\0ı\'9;óİcbÁ] CÛ ùmqr*pğpóòêôšH£‡å‹_…H^Ü\nêõrr*İÿ\0j,nÄ_ÙŸãŸ²õZ­«óöXà#èºÇàÕ¿İùŞÅ°:»kau»k©—8¸5hî\\ı­­Œ\\îWøĞè”Üê¨¦ì¶4Ç«^Ö0Ÿø?Yì±íş_¦‚©´2¿Æeö›§åÇòšÂ´Ûjÿ\0¨Tú§×o®µ»ªt*ZËHevÓqueçŠŒ}›-wî=ÿ\0~F½?+äê¿ô¢…ÿ\0ãGêöM/ÇÉéyWQhÛmOôœÇİ{M‰)¶ÿ\0¯}db;1˜8WW]†«VC‹›`üÏÒ¶–[ùÿ\0Ì¿ü\rÿ\0¸GXÿ\0B†]Ó0±)´Vû\\,q¾Çd×·ûM\\}cê0ª1:¡§yµØåØûIµì}ßÓmkšİß‘¿şİ±t?øêt6ıÀ€P\0¢ßçR$*‹£wüé£_ÕXü×´?×XKFíÔ?ĞÄ~ÿ\0EŒş{u9HvuÌû1ëËÃ¸³6ÚÒÆ¼ÖéÙS¬²Ö¾í¹_NŸWÿ\0F*µÿ\0~IÛ…–`“5éUÒtÜÎÔzI»§×Kú~X{­kZç>ÜŠÙr78ˆ5â‚-ÄoÖ.¦ñ´#Ü)lŸ¿ÛîRgÖ ÂM€rXo—Ò¥õª7\nCöš7²°[]mõ@ö»İêúnc,wö3ìÌ.°tæØò¤!á­#ùÍÓg¹Ÿ³güójN1û«xï?ÿÓ¾oéUëkS\ZCFE@4\0Xë?XÚæı/ç=ïşÚçş±áÓÔú—CÂÄËÆ¼edZÑe.°5¥Ş€­·zÏÈ²§~çş{^êäA:x¹_®8Áê¢+v5Öú2Cši²ç5ÛK,õüvWúìõYmŠ(™X²Ê@­\Z_Sln=ıC§l5·m7×Q÷m ÛsYûíİô?º/LºKï‡+Ì~¶1:ı•½Å–1•¹Îq`ûC};\ZÖ~¬µ¬kıˆx¿Z:®0iûKÍ|4¸‹#ÃÖŸú6©mcéä=¥yçøÈ±öõlp`}`_c÷»üÚÕÜ/¯ùÚŠ²äKş	êµgıcêİªô÷QM•ßµØöRFíÅÎo£éîßü÷§µPÃ\Zì|0Ç†}šÊıA¡x¬Ï]ğßŞs=O¨ºï©Yeıìî;Ÿ‡kñŒ÷h‹±ÏıµvÏì*¬Â·÷¹®È·í/ÉÚêˆ-¯*«šßÌ¢Ú­»ôˆ?Q.qÉêXüû)º‹M˜¶;ÿ\0= \nKw¯u~³‡Ôœp¨ªìZªg¬,0÷XíÖm¨ÿ\0&½¿OÙ¿ş^è–uN¹MãÓ[{wåÍ!³ÖúŠ­=¬õ¬ùn¾ŸK¤¸´²×°ÚÑ[êñßş…û7½îúşúæú›³«é”ºªvRæ3sËá¬©Îİù¬­Œşn¤¾ªòc“‹Òz^-ŒÏôó-5—dÀ4²¾\\l®É­”ÿ\0_ô–®Yÿ\0Y>¦—10K{Ùû¿éz,\\ŸÖ­/ë7;î9¯İ.0ûŞ?íFDşgú\nV/ó‚Z£GÑmúÁõScÿ\0gà½ícœÆşÎ-ÀKCˆoÑÜ¥ÑèÅÎ¨Y‘Ñºiİe­Š±!­ªŒŠı5»ıOÓ6¼è±»fu‰ö¼êÚ^Uá§óE¯hĞi¦äAAMQì£¸}”ã: O@Âõ}&<´a~sîû6İ=F7k,¦ÿ\0ç¬¥êX­d`b0än…¾‹m¬pZ2¿Z«ƒŞÖVö?ÓµÛÿ\0›şf¿çœ¬çó“|½gÎC}ù@IºØÍ¯şôú%ısê¿N½ø·ôº«È¯is[Óª˜±¾½ÿ\0Gô›,ı\"°ß¬•åô|Ç}_¦Šr°€°Õu_gg¦ıß¥Q,ºÆÛô?ğUåÍ´¸’è\'¹.q\'úÎ[ÿ\0SÉdPâ[Ôè³ë[ºµu^ÿ\0Í{]_±$¾‚^ócİ·sá€:7>79ú_ØBÇÊf^5yâšk¸ÆXö´èK\\Æú›v¹ªĞY5;mXÖ7kâZ™·Ø+ôFßgÓ­ÿ\0á~’î¥wLÆ·cWŒön«í\r&è’?KéµìßıG!fëZ¤P®ÿÔíR Ä>I\0ÖGòv•õ¯&‹ú;»{h°[d4éí³)Ìkƒ›ëSFE—Uÿ\0	Jå]U¯°XC·²v¿|8OµÀ;s¾’‹ğïÛ%›€ì$óå\n.-ƒ£ËuÎ£ûKªdfÛa¶“¸¶¶5µTÍßÉ­‹¢ú¥—õo¥tßS¨¶›s2^l\"ÊÛaecÙC?I¿Óá÷{[şı+ÒwPÀá¡ö†™İ•k:>ÊÀ<è‰V¡\0oBìõ^±õ¨Öñ}>ïú9Xõ5–´Ïò?Egî~–·¬|zş«£†î™˜\\.`´^ÆÀ¬‘ê_U´ØÛkö~Ò±U·¡µ¿D*ìÄ·\"¼š½¯¥Áí=o¹¿ô‚Q\0u*6z­møù8}Në2mÉÃ÷ÖYqoÚ,k~­ÛFÆ6úìo­mß¦ûm£³è.Duœ;œiµõ—.©å‡Ÿä.³­uo³åõ:¼g]etìJÀ$Vi¿&—zMmunõ¾Ñîşv¿Oü\"á^gå¢pZ]fıgë@Cz…àÎxwıXrOÖ¡•OÙsr‘ŒâêkZâ5o¨imn³oò–Oo$áí±§â%$:Øtbõ;K«Æª¸6_u­kZî×°äd?÷j«ÿ\0Z_²~¨²Ú®·Åî¶ªäÿ\0&šë·c­u‹›¯#§ß‹UŸãÿ\0F-,n¯Ñ+ş{¤ã»Î-‰è‘^\r»+ú—[‹\r×¼\\HŸìT†û>¥[sÿ\0­m‡ò5ªå]sê‰ı/¿\Z¿Ş¯Qõ‡êUD–áã0‘ÑØáÿ\0ML³ıeÔ?ªâ¯©Í˜–;ÃßwşM©ÆwÕLtédÚôjÖ§t<›ÙÔ:=µ\rímy8Œo¥hÚÛê¬5•úo`kneáKşa›_hkïk&üÓ€±¹ZMƒÔWŸõPÏù>¶xnkÜ½i7êëz·O®Ü,z°éÉ›a9Õ·w¢÷{?›İKÿ\0=s} åu¼¶ãÒ6c>Ó’tmlüı¿é/wø\ZYÿ\0×®Q‘—S1i®“E,etndÃX64×k\\çlk„uH×£PduŠëS†Æ²¿N¦Ykæ}:åÍºßr£Ñ2º±éx£¬QŠE_hs…Ó¸Èµ•ËîıÅ¹öœÒØÒ>˜÷h{4m{¿5Ë;Î‡^+h²’bÛ4¸îå¯­¾Ô8ÍÚx_ÿÕãìêEÅ¯È²\0Ôî!¿ôu&Ø×ŸRÃmµío¨}ß½»óÿ\0Ír§Óÿ\0œÉøú¦«úcãü^¢õx¨q:?.[Ó­kmsµÇhÓô^×û}Gm÷î³ô‹XlC`jÒ|;é»Ú¹|/çjÿ\0Œ³ş ®§@gÄÿ\0™#u«72>¨.¥ñSÑõåLÿ\0¥ş¾	%ÇËèö¼şø¬ImN†Ïú=®TİĞ³gG°ü%tƒ‘ğUò>“?¬Ÿê[épOFÍüçÈ€Q= r	+¦üôÎì—©—™ı‘wî”ÿ\0²oıÂº7}ÿ\0š—©^—œ\"óÃT‡F¼öû×Bîÿ\0ı‡Ä~T½Jô¸±ío0¬ãô,«œKM=šÒOä[İ/úHø.Çù·|õ./Òş¦æ›«»#ôB²Öé¾F£Fı®–œŠÇóÄƒ¬A\në¿šoúşêCù×|”r¾«ÅVŒX×²v§øÃQÅ¢I$w#S÷(¿è‚ƒÿ\0û’ÕOÿÙ8BIM!\0\0\0\0\0]\0\0\0\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0 \0C\0C\0 \02\00\01\04\0\0\0\08BIM\0\0\0\0\0\0\0\0\0\0ÿáhttp://ns.adobe.com/xap/1.0/\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.5-c021 79.155772, 2014/01/13-19:44:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\" xmlns:photoshop=\"http://ns.adobe.com/photoshop/1.0/\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:DocumentID=\"adobe:docid:photoshop:0aa67734-b7f6-11e5-9c71-f2ea50208459\" xmpMM:InstanceID=\"xmp.iid:66d427bd-2c18-844b-b451-9844534210c1\" xmpMM:OriginalDocumentID=\"F1C8DF936E23926E555B6CF4CA6770CD\" dc:format=\"image/jpeg\" photoshop:ColorMode=\"3\" xmp:CreateDate=\"2016-01-11T01:50+02:00\" xmp:ModifyDate=\"2016-01-11T01:58:42+02:00\" xmp:MetadataDate=\"2016-01-11T01:58:42+02:00\"> <xmpMM:History> <rdf:Seq> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:9581f4a7-e4c2-9049-883c-a3e79e85335c\" stEvt:when=\"2016-01-11T01:52:07+02:00\" stEvt:softwareAgent=\"Adobe Photoshop CC 2014 (Windows)\" stEvt:changed=\"/\"/> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:66d427bd-2c18-844b-b451-9844534210c1\" stEvt:when=\"2016-01-11T01:58:42+02:00\" stEvt:softwareAgent=\"Adobe Photoshop CC 2014 (Windows)\" stEvt:changed=\"/\"/> </rdf:Seq> </xmpMM:History> <photoshop:DocumentAncestors> <rdf:Bag> <rdf:li>5EE3EF0C41697BF07E6C2821BB379DC6</rdf:li> <rdf:li>B64AC43936FEE6FDD6DEFC8672CB342F</rdf:li> <rdf:li>C1DD39FBB457C0FDB98FC240EF869A41</rdf:li> </rdf:Bag> </photoshop:DocumentAncestors> </rdf:Description> </rdf:RDF> </x:xmpmeta>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 <?xpacket end=\"w\"?>ÿî\0Adobe\0d\0\0\0\0ÿÛ\0„\0		\n\n\n\n\r\rÿÀ\0\0´\0ÿİ\0\0#ÿÄ¢\0\0\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\0s\0!1AQa\"q2‘¡±B#ÁRÑá3bğ$r‚ñ%C4S’¢²csÂ5D\'“£³6TdtÃÒâ&ƒ	\n„”EF¤´VÓU(\ZòãóÄÔäôeu…•¥µÅÕåõfv†–¦¶ÆÖæö7GWgw‡—§·Ç×ç÷8HXhxˆ˜¨¸ÈØèø)9IYiy‰™©¹ÉÙéù*:JZjzŠšªºÊÚêú\0m\0!1AQa\"q‘2¡±ğÁÑá#BRbrñ3$4C‚’S%¢c²ÂsÒ5âDƒT“	\n&6E\Z\'dtU7ò£³Ã()Óãó„”¤´ÄÔäôeu…•¥µÅÕåõFVfv†–¦¶ÆÖæöGWgw‡—§·Ç×ç÷8HXhxˆ˜¨¸ÈØèø9IYiy‰™©¹ÉÙéù*:JZjzŠšªºÊÚêúÿÚ\0\0\0?\0KÈ:&¡§é,÷ä­ÅÁ\rè±$ =Í>.\\Üh±Ê&Gy:ìòìÉJS®f[M4P×\r­6°Z¯q%+–6\'#jª±äcj¼@İˆ8½b¡ß]Å|1Wq«¨1U¦˜µ*°³xb…¥Î*ÑfÂ«y¹é¾*´“İF(m@?²F)\\\"Ó•UÜYNÍ\\6•xÕûàUuYé¶E*ñò¯|Š¢¢W9d˜Ú‚)Èm•ÉœSH¤P\0\n2¢¢Ğ‚>ÏêÊË0¿ˆğ¦)V|D¥°2\n¨‘J\"2Ë‘*©ê¾\nWÿĞ•š¹ĞÛª+ISÔb†¸!mZô½ñµl+«‡*â•áO¾6YUP+£«b=WzOßV¾¬ı±´®RmicYÈ;W^3i)è§ZZlçşC÷aâcE`³»¡ÃÄŠôÓæ=àãÂW2~ã$ğ¢#Ò›¿á€Í—\n*2(Ë\\„¦´Š\ZE»Pğéƒ•*\r\".ÔÀr&—~uı‘ƒ4¹l˜BÖ›ôÁÄ´¨Š‚ÓJñ¨¦D”‘(‰‘J&\";d`E)\"˜‰‰‡uÈ¢Vh‡l…2p/RÙ\0Û\ZU¿Y8ğ«ÿÑ¾™î3wÆëiI´ò6­r\\HáwÔ¨;ãÄ¼\r}WÛğª¥˜=±âZWK5°q-+­”dn£.O¨Çáƒ‰xUO„ĞáµáV[F×…¿©DFãğ¯]:1ƒ‰—\n¢Ú ¦<KÂÙµCÛ%áwÕ£\0û±ã^½¯lKÂÑ·ÀÃÄ´µ Œt8-xVzcÃ\r¢›	L$ªõA‘´ì½iÛ]Ì‰M®õ…0%¯Tb®ä¾Urºàdª²\n`Ud–”H(ˆäoæÈjé)è\rr*¨%“Ã®šüTÛ\"›]ÈŸ–+næ¾?†*ÿ\0ÿÒ—Ùy×ËWÖò\\AtDI\'%OÆ¥Ö5‘}‰nŸ²¹TK†q®¾óN‰buE¸¸ÖÓ¡W¥UP[‡¸cÀƒ’:˜€WÂ*¾[ó¦³¦¥ÑAÍ!ˆÀw<€ä\0ñäŸKn0ƒ\nMˆˆ\Z\'è¦]h¦‹ªuZbÆ–zê;àC¾³ïŠCktİFø¥Qn¤ğÅ[úÛ½1M6/ÊÒ½+. µ£\ZS&×\rI9nvñÇ…mqÔ£?,xVÚ7éüØğ­»ë«Ö¸ğ­¶·‘»`¤ª‰áhëP:ÿ\0ø«Qğ –`<\\ª®(ÄS¦MXn±Æ‘m}e¼q¥·–ğ€¶º;çCâ<6ÄÁ•¯:†õ•ëßÛ^cÒ¸ğ£‰¯®9ëñ/K·ñÁÂ¼J«r|NDÅ\"JëzÃ¾BKÅó|½ò&¸—­ôÃ½qà^%eºø×#À%ÿ\0X“#L­¿¬·ëÁÂ¶ÿ\0ÿÓåV÷—âŞà\\ˆ¦²c2ÅÄpPMA+¸ØöÌ\"É¡J-4’Ì×RòõMÜ®Y6ç¯Z‹’2%\0=+ÉşVó_Ömni%†œ’Åt¤€<Ed‘G\Z·(şòyfÇO†T\Z²H=innp¼ªzØ¸ö¹ÚF.Jš´\0üJ<r&IÚ[uZ‚»øâ,€)ı6şïjuÉ	11Qø¿›\Zğ®BAÜ¤áâZFÇ,`PºTm4¨$Y(T{ŒHá^\"„V•ÿ\0XcÄŒŸ‡`ş ĞaAŠdŒ>ßc‡‰¹ÈÔ&‡Æ¿×$ğª%›“»|> Œx—ºMNÒUzı9—†ã¥¸2ĞöÃÆ¼\nRZJH#Û$$Öbµc÷ÃliŞ®6´ß£âq´ğ·õaN¸8‘KÖÚ>íO£&T¬¶‘\nP×ç¶$ğ*ıRĞPûx‹.£´JM>üx‘Â¸ÚÓ¡¨ö88Êx%hvùáâE*\" ?f£\"m’¸ç ıx7H¥Xı>œ7ùà¤Ú¢ñ=©dİùŒUÿÔçŸ—úµ¥¿˜m%Ö-Zö\'C­¸1©3û·v`P„&´a˜ØèHZ,ËÎŞE‹HóU¬¶óİ_ÜÇ-ìzlje^H\"`=9B‹ÙşLÉ8ƒ²¶Tò5—æN»æİ7S×dºú¿ïÚi©4((±Æ(>?²Â™<bf@„X\Z§¶‹œìTfq‘kR›LD”öÈñ2áC,†«KãQ‘âO\nâŞŞİ\ZYø$KRÒ1 \0w5È\'……j¿™şS´»K;0u¹F‰ÊXì>#ÿ\0\Z†ÊÎTˆ%×Ú~ª=«éğ;@G/SÔ‘A~ÁQ·O±•ø…—zÇ”<Õ ùïG˜ÛE¡¯SÆ¿eÔÓã–Ì1Í4ÄŸšÒYË-ŒŞ\\·’úÅŒ7rú¢$.¦•áé·\ZÓ§,°qPC?ç=òıÁ?Ö•Ûõ Æ¤‹\nó¯Rÿ\0«>›ÿ\0\'ôÆ¥Ş»4?9¯[íèzsxÑÛø©Çtì¿şW\rÒt5÷À}ş™ÃÄB(+\'æ·–¥è’:ˆîŠŸ¸ ÁÆW„*¯æ–Tè·H§ö¢¹Çü50ø…DAç¯(¿ÂR·=Ç§£şë“ñKw¢bó?“dûz¼ÌE´éO™\nËŠŸ\rms¢Şô\r^Êò½9Ğ?ü•l˜ÊÀãE5œŠ~$eğ¨¦YÆÃÂ\nu+E6±\'†6ŠU&Z]éGá­7èÇá²^\"@vÁº·Á|\n¼-¹ıŸÇì—ªÚÿ\0¾ëôãºìª¦ÔS÷tùœ‚ú–£\\S³½[jÔ ®¶D°1è*:TãE–ÍóƒùWïÁºìÿ\0ÿÕã÷	-¥²$l¬D•˜‘Å—é¾ü>Y„9³¤ÊÏW×ln£×’òy&µa:‚ê§Z>l~*Û/ÚËEÓ\n—åÉ¿3üÅ¦´L¶—z×—rÆÑÎâO´±¯òÑxòøs7rI¦|!êË$¨\"‚•=vÌêhÛOqtvS‘4Ì/ç?i¾Y…Våş±¨J+o`‡ãméÉì§ùY9†èÄ¼?Íxó¿pÒ_Ü<Zicvğ|(-xõ«¬sD–àH³•¯%Ô”s•JÛØ«Pq-¹û<±ˆA@\\,°jSLnc”ÃÉ•Ùe Ğ±¥9\nüY‡¨~Hù»A°ón›aa¶÷7O-½ú;—Š@à‘9n£š¯ÁL˜ä©ßç&˜Ú_ä¸J­¾³n³€:z±üÿ\0åşË-c&îÀÖµË)4„ŒY!¥õ?dàU-ÊŠ4=r%TšS_‰E|i*‘\\²Š\0M+ò®*M^òÄ†õæ:şğ¡7Ñµ–¾œC%ÇÕİz*GÃĞµ„Pl&×v\ZŒkÎX£½ˆut˜|Á°˜±TÓ.ïEŸHÔd²¹N³Çò¼,xÿ\0ÀplFÌÈg:Ÿí&=?\\Œiº‹ü1¹jÛNâ©Ùoø­ş,²3k”Yz¼\rûyeµ¯>—fÂŠwÁüØ­;šÿ\066•Á÷?v*ß$8«|ã÷ÁHw8ÿ\0”ãIƒ¡gñÅ-‚ƒ¢â­Ô`KğÂ•ØÿÖw—?/o¼Ë¢ØŞ_h:t(G<í$©$ä9c:„$|Dø¾Òÿ\0.YqoMr‘QËú]¬o½Œ,ÇœÊ‘¨V~!KJtZfdbF¼ÕÌlzıÉØäƒ»^‚¸Ä•¤­umcc4äÉºïüŠXŸ ÇœÛ ä¹µKíSR¹Ôî§¼™ËU‰&€ÑŸ†b–şˆ yhÜ‡7=$G¦Emî¾Aü¢óÒM§K&èØB$ÚåÖRºé“êlZ»®H)Oî |Í°]é7v–×0tY¤\0\ZóàBlZ¿µÉ—4†säo6ù_Ìs®‹t›M¥åÔ8L¼ù0¹`Gû³ëŸŸZI¾òe‡˜-–¯¦Ì“:ú\0ÿ\0\rÃ%…\\z±\0ì+nMEN™k#°nLR ÷)¡ßß«E“Z=Ç ‚U{=qB	®U…ÛÃ\"–­æUºŒ+V`Â„Ó§wÚTSYÈRJÈƒ’Ğ‘Û$Ci#„H¼%V§…ÈÚŠzö\'|€4Èîö-÷G·¼3ÉÑf˜ J›0éĞı¥ÿ\0\'.¶‰\nv¡¡i7_r.¿fu5©ÿ\0)E+,fÇîı{rl5h„ĞIöXüHàwüÙr²Ó.yÒÿ\0Ël°Ş+ê¾_;?Õ°ÿ\0$æˆ)ø×	 ^µ¦_hº•”WÖÏk0¬r¥?ĞøŒ˜‘cÂ«¯ó»( ¼Ih;ƒô`E./„}4ÆÊÒÃéœ­)úPØm<!ÜbğÆĞà±×eÁj¨±)Ş˜ÚÒ¯¥õÁl”ŸÓdaµµŸkÿ×ùWÏ˜ööÑùKî#‚Cnğ\"£ÈŒü˜ªÈOÃş¿ìäqäŸ@ÆT÷›‹†°¶kÈÄwm£·¦ëSÔç6q8¶¨gºdé±¦‰¶!“üÆ¹–/%kWe–/ªÚ¨€¥ªìOn|s!İÈ€|Íb\"î	¸qm’ªj qŞ	¯L¨³Fh\Z¾Ÿ¬Ù_s‘šĞ¥Ê¥¹á(‘7K)ŒŠı–À¬ù¿ç\"üû¡´İqn¡¯÷:”1‡ÜĞGËşOtŸùÊ9Á\"\rSD´Ô!&„ÚÊcsòİÆUŸ™ÿ\0œ\Z\'›4ëIô«[Èn£·eº·‘8˜[ÔG0hü€Ù“ı–{‡åî§¦y£òïIT)<W–	öìvz/Çìâ¬oXÿ\0œĞRÃSº·´eqÆXÅÂGÒŠYxÉÇ~­ËHd5Háa:üã§\"‹ÖÒo4íN#ö),±úJÈŸ4SÕ¿-ÿ\044Æ+?•.nu’ÖXç_£‡ÅøcÄ´–Ã¡yÅVHdòŞ©\nÈ§oAš‡è‰)ŠŠù?Î,9\rÿ\0é·\n×ø7Î(êß ïÍ?ï<‡øb©Œz_™TÚ&¤ÿ\0—Y?¦$p Æ‡æYËh÷â3QCk1Øü”àJg¡İêV\nğİi×ë…øÍ¬û2íR8wZœfÂP´tºı”f’´ÑSıùËú×,ã8\nœaÑæ„Å-â4Gr¯ÈPøŠAPBÛë¶ÖÒˆÖê;›vÜ0oˆ{7¾@–ÄßIóÇ—n¯¢ÍÖÄ‡¾ÒdoİN½Ê¨5IÊ_µ‚ÒÑåŸÌË_1[FĞ\\-ëĞ=ŒÌV@ç²Õÿ\0ÉÁÆSÂYä·Y™ º¡¡ª èj2@Û)i¸sû[dØ»Ô¯S’\nß©‹Ä8U«á…+„ï-´e8ÒÛ¹â†¹i_ÿĞè—[ó&—£Mg¬Z[ÙxÒÚ;vG±ÄÊî€UÜõÌœ„nÕ[&m6RzŒ»ÅiğÖ.ju|P¾\ZSmy¢—i§–“Ğ•­Œôø=E n¿iş¾U,·É´b®h¸¬õ8â~í£‡Ä§u÷ÌrÚëï\'i7{Í¢Y\\öŸÒŸ½\nJ¿*¼¤èe¹òèàz¬ÉAîAjcJ—^~F~]ê+i-«7ílÄ}*­*]qÿ\08Á£úbK	Šz ıLü&4¬#ÍóŞrÓîâ“@í@ã:O/\Z»V¡xûâ¯Oü¬ĞuÉ–¶\ZÄ?W¼†I˜D7g,«ÉI_Øâ¯MÓe¾6é,7(ßŸF4ª¨,r+^ÀmåcAwliSşPïşË–4¨ÔÔ¦ÊÉ=³t¸ZWù×§û%ÿ\0\\U]Ş}š4—Æœ[!fÓ,ê’@|cj¸Õ+K­Äb‘²J¾¼ï—¥Ë?i8âƒõŒ	^-‰ÜôbŠwÕ7î>œ*±ôèŸíCÜãkH9ü±¤Íıí¬nOvE?­N6´—Íù}åiOÅ§[“â`„ş´ÅiqùWåYª\r¤hµ‘Ã\n— œ±ZM4Ÿ,iz*…Òôë[^#©H®G»Ë´È´Ì(é÷üCî8ƒH;¨>™g7Xı7ñM¿˜x‘Â†}`+”ìrc\"4#ÙÍq‘J|˜˜cÀØ¶cßGfÕÀØáãE,ô¤®øX¶\"l6«‚xà¶TßmiÿÑ;Ó¿>çM³_Ñÿ\0UºYß«¬­\r­”T‹\nÈÎ~Âü?k\"3…àgGó¤~nöòÒÎ[m6Dµ–u*Ò’3áA·L¾3¶&2+øçú…Á‡ûïM„~ÌEú0Ú\0Iô]\'OÒl>¡¥Â8AÉı:Ÿ‰ÛvfcûNÙ\0ØM¦\Z}Ú^Fí-Œ–§ˆáÕËì=2@¦&,— ¨Œ»n>ÎİñT|Ã¦K«	£½ƒPBbw0¹¯ÚõGÂTÛ*’¡:ûWBMqxr²¨ëBGê#oQÖmŞ(µ[…‰*Y\ZI8ƒÄnh~Õ1U9ç´8âoYX)‹‰4uaQ·ÓŠ³;{áµHBŠÿ\0N%P÷v±ÉD@!†Õé\\\nò/<Cç-T:„òO£KÂ+û:+,4øK•`k«ö›ö\n£¬´ï)Iå×Õn ‰ŞÚU†ía¶×ÔŞ9E$\'ƒ\r¹6*—~•òdÔ·Ö®ô°\Z•Iµiµ~Ë„Å(»O5óßMó»H€Ğıgêóóõ¢…¿áğÒ-7¼ÓaR>«¥^G#F’ŞE«\nmÎÖi–»ÿ\0&\0\n\n-?3µû{wšëDK¡\Zó\"ÆiC0Ÿ\n\\A[üXxVĞ6ßó‘~H2¯ÒóO•M\Z9£Jƒî9ÿ\0…À©íŸç_åÅĞ5¨Ò½¥IñâF)N-¿0|Ÿr£®X½z<j~æ#L¡ÖôÉÅa»·”œ±·ê8ª$NĞ#|Uq¡ı“÷QKYTT“O*„¹Ô´«E/s{o¦I?YªAù©ù{§×ÖÖíåjÓÓ·&f\'Àza‡ãŠVOç»›¾pXè¯P*P–8©^‡ÑˆÍ?à˜@Ai5‘kd×z´Mi`s˜)*Or­\"¯úù$Rüuå#ÿ\0oóô¤ïôeœ¬Ì#“ÌY+.§TÔ?MFÙ!  şhò²’¢„ƒM•Îÿ\0Báá+Ämõï/\\7µKV€;p©öåL<%l&mÿ\0ßÑxıµéã×!º_ÿÒéMü½ü¸ÒumGÌVzªß[êŠÑ4rñhãæBº+ÿ\0”G-”Ç³3g¶’y`[Æ-%_«q—¤>=>\"™p¶&V¡¬O§¦Ÿ/Õ]šv*±‚\r*ÌõwBWå÷Ó­Ä¶ªË4¬ÄÍ7 ÍêÈjtÿ\0WörJ¾îQë±]‡aŠµôË²È@ğÀ®7ò‰=B\'nƒ¶*¤÷\\Í[r{âª,Aßß[©}^EU@¯M€aZW©¡ÅXö£æMEâú+K‡İC8\Zí_Š§úœ¤ç\\Î.l¥Ú;\\ŠŸ]×eÒ¼aK;\0{b©EÜàJÅc!ù…”ÔƒöÅXµÇ’çÓî¼½\nŞi\Z”Mö‘$™¿QšÓƒ|Işûo³…^s­~^kR õmåµRCÅ#)ğ&X}U¯ûÅR=òûPkç{ÛØmtÛqÍäYFÄ¢¨?xÍü¨–,èS2Ñ-æwmÈvfI8­k7D†‰˜S“Hyzá†ß?í2âÁ•XşNúdÜjºıõÍä†®ÖîĞ =h¼ŒOõŸ5}ù+ ŞNg}WU2„gúÀbUzÉwë…)5×üãÎ‹(<5ËÁÿ\0aµ›ş%J§ÿ\0œlŒPy„)ì^Â\nÿ\0Â2b©|ŸóšÒ#´^mQ @l¶¯½$­1W–ù»DüÄòïÔõ+\nÿ\0ï=ÄtHåQÕ£r8µ;¥VEşLU‘ùrÛKºÔ›FÔ5«¹nÒ0²Üıi-•nY•8ğ E9òõùMÇŠñfËx6kâKõ½3\\Šüéö\Z¼wF…&Tá1ŠáiûŸQ~	yVæŸê·ÙÈÌm¤ÿ\0Î:ë7PCu¨k9š5v…’QÁˆ©JäŸÙÿ\0Î8ièÊò_@Heu·f`Fûf¦*Ÿù‡òÿ\0Íjí¤Ü[ÜÎP¤±FŸUØTsÿ\0]¸áİX§–ui­µ&°¾ŒÅh‘M-Û*¿Ö\rtÑŸ‰‰çÇ{ØVêšeŞ’aúÌ%`¹OVÖPj®§Ú^‡2c’Úe\n(UJ(\0o²k×å–Û\nDp*HU\n7,FK‰©o„údÒ¦¦ù+J[‚#éZWß§LRÿÓ\"Ñ¼»&§µ¬úÚé¾Q2µÅ¶™-ÈW(ÎHàˆ~·íÿ\0±Ç#-ïdJt9=¦ÃÌ±ªÇea5«¤0©†”\"Sé‚4ê33€8ürI|õç[Í\'Ë\Z–¤× Ïk-£^ ,òü’£ùKsş\\ª`\0Î’ğÉ¯ÌIôÏ=ÃÒ0³Ôäô.˜Nçà‘«ûAÿ\0k)¼¾ª¹—“W§!Œ¬½1U3øâ®YwÅUL¢qV;æÿ\05[ùsË·zÄ 3Æ8[Fİ\ZgÙËö›ü•Å_#k>iÔõ-R{Éåõ&™ËÉ+E‰ùô‘V}ùKù=¦ ºUëŸ©\\Q75±Ø:×ş#„+ê¯-ê‚m8Dôõmÿ\0v[¹_Ùjü°ª½äõ#Ei÷PE§O$ó,PÛüd¿ì1T~d³˜“rñµ@ëÅVÍ¨éÓ)Ãê)ØóEaO¦¸ªı6ûI±ƒêö;X,!D¥XÔ ¾*˜®¥‚¥×è8ª“ê–ÊM_áéŠÒ™ÕìŞ¸¯ÓŠ·úFÈÿ\0»ÓïÅ]õë\"?¿O¿K5ıË^`ÓfÓ5e†êÊañDÄl{2ªëû,¸­<ŠãòCTÓõ±£ÜØêÑ*zqµìík8AöS\ZºKé¼dø>ÇÅ’4¼	×’(®tûø¯õûÛFå¤‚ÎÙıNR=9I,¤/6<GlVTF¦·vàÿ\0zƒØª¢ê£c2§ª®¥h:L§AK ùr÷WM^æÆ)µ”çqZĞñû%‡f8ªï4éú^³¤Égz	ñÁ(£¯`~Ë“„X]I|šT­„Éü¹ú°!+ÄÄ\Zq÷ı¬—– ¤¶Y˜®õIfbU}B=/OaÈ´†½ğ‰–2Çô½Ë7“MÎy‘ Œ’ÂE)@ÅyîŠNÜ|BŸ#iä\Z½»rôyÑiZÿ\0{ö:×àş\\‹$øaÿÔ‘hËùm	[¶Óí$Ûª¿ª@h¼ÕË«P…Ô~Ö*Ù4Ö¯ú	¦†o/Çg¥İßYš(¥–6FPÜUÙ¾%ÇŠIáÃÿ\0<üÁlÿ\0—Vº}°µ.÷‘ıjâ™%‘‘îM6¯ìãgªĞâWÑ¡¹š9¥¸h.+ÊÓ€Ûšî¥›ÜŒACì½Q\Z–ƒ§ê#ş>­ã•¿×*9ø*áCrHEqU¦LSNW\0â´ºGø+O	ÿ\0œ‹×Ü3DF¢ª5ÔÀw.J\'ü*·ü(x}­½ÅåÊÃm’Wû(?€È« QÖôßJòBªƒğÕ‡ß…iôçå_™¥¢Y]–¬…M­Í?²OÌS\n³›‹‚HÛHõ‹Æ”Çl§àgæãÄ.ÃñÅ_owé Øa¤/mQßjãH¥/¯FÁ”µäU(ó/š/ô} Şiº]Î¯rÍéÅº3 jW”Œ ÑE/\ró\rßæn½rÓêvz“ö-ã‚d…‚ ú[âÁE•±ûÍtİAhw¬ÿ\0ŠÏ§y‰>ÕµêüãœVÔ-}?bğ}áŠ©+kë¿©xvVàV×Ey¯„àò^Ô\ZƒÊzS½zb¨‰o5ÖzR_*(iñW	|Ìßeõöàş¬UUm<ÜêR“ÛŠİ1ıXªa¦è^vu’º~¬åˆâ=+“·Ò1W­şLk˜úf©úWÒµ)´‘¤âæ\'ÙVŸ~?gù° ½¦öúµã2Plv\0‘×$‡š\\Ûê2Ë41ÜÍ°2§#â¬)L,TfÓµPÂFÔoI\0‚EíÈl)ŸE¼™T=ıã©ÜşôĞxŸ²2(âQı•¯Ön©ö?½“ìÒ•éãßÌ¬¿ÿÕ›½ÅíÔßT[&[t„Íõz„\"9ûÅòåû¾Îa÷*¢×Õn. {[=îTJL²\nm¿ÄmûããğâòOÏ;U¶òÖ™\rìV±;ŞQ\ZÑşì‚X)\'l»É;±Ë\0ÉN›ågÓ´[7½²1>£n.l.Ø‹z J€#Œ•ş|²÷k§²~Pê‰uä‹x¾;9¦·ßÃŸ¨¿ğ²¹‰e“BMiÑ0nØ¥L†qW3°ôÅ_0ş{^´Şz»Rj°Åj<)?¬äU\"òÖŸsÆ8íQÍíÀäÜ>×¡}€ÒlÎ{k´Ô†qU.Áù¶ÄlÔñÿ\0bÙ!+I›òOP6ÚÆ¯¢³©{l¾êÜ^ŸAPö—œ²\rñE<ó\'ÏfÒüÕŸ¡BÓ˜àÜÂ‘XócÇ <vY,‚Büà½¾¸Kˆ„WìŞ™·–>,[ùE)ñ{dx‹:›YİùŠõÕcÓKÔĞQ¸~ºáâ+@=Ë—w²u­ªÄ½RÍkşü`\0§ù+“İ®Âk«ë–Zq6–…9Çğ¹@8 ğ\0~ÖlR8ŞG!T¸!üÓ:ó?A\"˜8Û8˜ó­é;ê6ßğQ\\KÀcóŒ§wÔmˆïñÃıqGÍ<ßùÅæèµ;¸4ÛË{{kKˆbI\"9‰#,Ü™¹Ä¯ìæÃCˆd&ÿ\0…ÆÔÏ‚©œAæqµ{ë+›¡P_ªºĞ´‚ä·ğP75¢æ…Ü91È?2üË.‘¨İE*]\\Û,~„0†P%–c‚Ncwâ¾§$<r)N`ó³q¯Ç¦GrJL¢â)SnĞs\rÓ¯­ğbª7>póè}RşÒì3ÙÌÂv;Áğgp»üeeô¾Î*Ü>tÖ×SÕa¸Ô\Z1fdk8)2BÌÌ})~ø•>ÆLó3Eó˜Ç­üF<L¸[¶üÒÑÌè±ë¶sTÓÓõc«Ø·Ç‰<,kó_ÎoÒ…<»f±ØÍ•õÅİI?Gî€r­áÂÀ²u¹·99êÌÊ	4Ş§ılˆÿ\0œ<³¥„·qR«@êÄ{š©–h†QÇ\"««cpHnĞK	ZÕ“ñ<‘À·ë‰_÷zRµâ¿bŸk§Zü88åÜw¿ÿÖèíùaåğyF­&®ü.|Yvkø\\İ’]GòÒÔ¶›©ÜÀü(‹Ì‚M¸Ç\ZE›~pè^d‡EÓ›T¼’ú¼“É\'*@ÜÖ¼—ü¬»½MsjE•tKB²%çH\\!Tí2iUWfY?—†^À0&~dÜùl\\Ù¤PÏÄ¾¬‰!ebÀqª¸%zåËm‹Ğô¿ÎM&J	Òk2z†ıìzÿ\0Í8«+Ó|ÿ\0¡^ªúsÃ-Gì8\rÿ\0wÆÕ8MGK˜TJ¿Ì)øŒx•|¶é$GÒuou â‡Ë?v,?1®\"zÒu¾‚ŠêÈ©e_—º9v×‘2‰õÕ²eaR±H¬ âk·)WâÈÕ³–ŞX_Ú¦£¦İÂ^Kk™fI@Rjµ¤øÿ\0àqĞJ¿6>}ÑnQnšK9>R)Qßù©–1}‘¯†*òÍ_PóÌš¼$SÇÄ1^Eé³Ì=>0á¿BQg—,©’ÿ\0+ş\\WÌğëw¯‚…FŒó\rpO%—í›d<X×í|î¼%ïşZÑ­4äY¥ç+¿•1µ5yØÑì4æâÔ\"æè²;ªŸÀvP-ó/ægæÛI,š\'—å\"%o/‘¨\\÷HØnùŸö²;–|Zú”ŒjcORZ§ñÆ–İúDÿ\0¾WïÒÛGR§û¥~üim4Ğ<Ñk§[^C*8L(© \0£#Š3%Åğµs7G¨‰ş“›=)??<½ì÷‘é7¾­ÂD’,Ai.4Ûü­óFÉ-£’S/æß”^ÙmßD¾x@Œ2}iŸ£#ÈœŠ(mšVèp%^Ïó¯ËÖwV×phW?Xµ´H÷HO ¬ğnj½qT4›ŞX·Šú+_.MZŠî^mÅyÆ¨Ü~ÛtÅWj?6—¦êQ£Éõ‰íä¶ŒËxÏ^ªpfH‚V`,Ró¨®ÑW¢¤\0;¶G…6¹õ(Ü-ƒ¶øÎ<(â{¶—æ	uÊKK©}In¬dÖTJnåÄ*d¯ìREfÃv½E|¿b&sÛ3–äää+Ö¤×ÖX¿æ…kõXdHÈ–F¢»€[z\röÌMHåNFvÉ—G[¤‰@TøXuPlÍ‹ŒATıµÿ\0z£şo²¾ztÃÄ„¿ÿ×ïşŠĞ\ZŠæ-9VÓÆ)½1á[a?›ÖÏä\rSš,†1‘T}—YÄWlV|yg\r?Ì	§¬Yyiâ;cÅërÀıa¢c^([Ùä¹’7iº|ı,ñß›…Üñğë‰Bèîd@Â)65S¶ø-J2`…_Z0Ô\0]Øm›Xy²öTÔf‚œÓî5\\•…¦U¦~fùĞ©‘¢ºAüëÄŸöILlSÏ¾gƒÌÚí–¨Ğkµ‰¢t\rÍc«Öƒ|X ›z_å]½Šê¶Ú~¦¬ÎŠlƒ(6ñ™cj÷¡äÙ\\NìÉÙ[Ì—–í¯ê2	 YĞòb1V4Û~m†÷dÏ\'¸¹k-RÖ`Oúò8>Êàÿ\0°rj}H0Û£n¿OLm/‡ò¯ÌúçŸuZÎ{\r1®¥vwª<È^Š«Mø°ı¯åÀÛèİD‹G°·´¶·á1DE–Ÿ‰É†6‚Ö5é¤³²”Ší<ÕÙGuSúÎ@–b6ù÷ó[ó8?«åİP#Z¥ıâ°¿š4>Îßìr\0ÈGÍ‡GO¤¦L5ÛAœşÒÉ<VÛ^EÀ%(OùÃ¢W¡Tÿ\0ª’ÇÜ…Ş½†*¢êÂF	Äí°<qUD¯§G	Ë¿Ù®çVÛ±_¸bª-È€D´ï±ÓP•ç‚r\0¦õ~ÿ\0%Å\nI\'æbÙŸ×ŠÚ&1Î7ıëPì~?­†*ö/È	RhõMô?¥(ŠåQÅàa½7î²#›2,=:ßÊÚÌ\\Å¤¶¶)0ã9€*ú‹¹ßŒc­|rïOR_6Ã¬yrÚÁ¤1ß[Í\'Õ¡‰Y‘`5åên(—Š…ÊgŒl£1Ñ<È·w1Å;j¼=EYx¬l@â*Ù|qù°ñ<•å^­kúQúÿ\0¾W¥)Oµ“ğØøÿĞï‚é\nŠn¶b[’·ëHGJÓ·|6Ê˜çæfëÉ\Zä/)\r¤®ƒİ¨?â8bE¢\\>Ú”Z—<Ó©é‘<zuå´jóL­v’G1¾Õ%‘û»“I|ùpy1ğÉsb™y7C¸Ö<Íc¦[ÎÖÍråZá1D\nY›‰ ;•L#eôfŸù\'ù~e¹·¹¸”ĞÈÒ\\H›¹â¥@®aøÅÌ‚Vü‚òévÓ®\'ÒåíasÜá\\Áá‹ˆ<ÏWü©óÎ—«ÜXXØİ_Á+ëxÈ†Ee¢§jV—ŒÁ âcz–¼Ç¦_Åú_O¹´EFNSDÊµ¨ıªqßç“@CB‹Öõm[Ì–Vz5Åş†.ÓNšt‹ôrYfdÂ‹sàÇáôÙ“ìä·BÍZÄßù{XÑtÑ:Ô¬†ê7ıÀô”òAõ£ä¥[ö¸¢ıµVÀé\'g”^H‰}0’5qê±(û©=;Sèß$ÁœÛ~rù²Ñ_êó*\0 4`lã\nÚeüä˜¢^Î6o†Yõ“Šª·üä6§,f9ìç1‘FDº áN9d)(×ÿ\07/51´­.ßôJÍµÅÓIÍÊR…VxòñÁL¯f4¸)ûR«(Fùï’0; fòåê’D,¶èß©±b™Ú~WùÖêÜ\\Ã£^}Y¾ÌÒD\"CòiÇdÑW_Ê9Qfª|[qøz¸8‚D\n¨ü¬ó¯ü³Û/Î[ú¨px<µü«óŠ¨_ôEù¥„ş¢Ø<@¼iü£ó35^êÕO´´ÿ\0ˆ¡ÇÄ	ğÊ¼_”zê\rõE©ws¸éşêÇÅŠ|9\"“ò§W ‡Ö-€ïÄ9ÿ\0™X<H§Ã“ò©.H\núäAzPG!ş‰ğ¤Øü›³ı½eO!súÜcâ„xEZ?Ê-E?K5e€ÿ\0±ñB|%Dü°ÑapWT‘X\Z‡6Êô>42œ|@\r/Ô#Ôtıj+{KÉäÔd”[I4oÅ¥BGÂSà=i’2b}§êú-†ki>£n¯1Ç\"ú«PÊ \Zïã’ñÇ?25=*ÿ\0O°¶´ºŠâånš8fà‚ß!•eÈ\r3Æ\ngæÿ\0+¥¥¬2j‰’$GŒH` Saã–Æb˜QD‹<·ÿ\0-ñø~×_»%ÄÀ_ÿÑè’yŞÒctòğP9?¨ÂŞ¼kĞf\r—2ƒqùæÒ[o®CqZğ.²PŞêGÅÿ\0‚ÓA\rwç­*{b$¸‰¡•Jº—¥UÅS¯Ol • ù§ÎZ¥ÌÑ}VÎÍØZf(ÈMU€4cÿ\0™q•‡†ò-zäƒSä3Øynú}Zb\rç¦`µJrãÌ‚ìkì8Œ¯$IÙŠ@fR~|j<±èÂƒúe>oæs~{ù¾ËoÜ;ıÊ0øNd,¿~k&¡ÀüûS&0#óyù§æ-vİô›éùZ\\\n”§xş5ÜøÉGËa™ë>n×.ÿ\0GX˜ØZÜ$\r%¼A„Ab…bY¤;ïÅEàp™€kú¼IäåÑtØBßZıRíeX,.X²±`dôıBßa¾l“‡k+É6Û4…ëÜä•	dC±?AÅU¾µ\"Ò¼}ë€•^/TV àJ™ÔJµ\0úp«cTjÂ»Ÿ…^ƒå¯6yËñ%Ì\\õ-^•W10HüWâ¿å}¯ò²²$Ì¦7Ÿ›¶7Ng¹i›±ebÈƒ q–B`!ÛóoLU&4‘Ø…x‘SôàğŠFDoÍÛö5^‹Ìú²~\'æ®«·îx“Ò¯ı˜ø+ã(?æv°çáE?ì‰ıX| ÇÄQ?˜úët>–ş¸<0Ÿ©¯Ÿµù÷ˆ£äÄŸ®KÃñcÎşd¡fp¨6\rÄÓñÇÃâ‹ç½m›ıéP¿êTœGˆQ¶ŞÕ¡VŒi{Pãá†^#?ü¬´Ö¼áq}sy:ešW<çmÂ†rGÂ•fÊ§³!+z„^BÓd”ÛKê¡¢ÉÉC\r¨O  ä#5!Wü£F 5´’;şöµûd¸ÀGó÷—¬,t»kÍ.,îá\"æI`a`y-	**i½9`2ä	ÖŸå*5•­Ü°¸¸hQ¥«ÉFf\'á=2Î8„QG…|«Óêƒù¿¼Ÿ§Zı¬Ÿ‰¿ÿÒÌêÄezT‚îXÛV¹[e•†(–‘H)×ˆÜoòYÆÌMcË½T×nB•ûÆ<,Q’Ö9×Œˆ®§¨j7ë“KV€›Ë:lµ&Õ7ğQˆ‘Aˆ@Íå8Ôˆ”SÛ^€›Êq\nÑT¸D˜ğ ¦òÃ%~ôaã^Ú^Æ¿,<HáCÇ§4K¿ÀÀŸ—C8^ámæÈæüœkœ\rRß–©O­ÙÅÄl§ü‰—ı–Ne_<Gs¥éú>»Ãmw¢ıNIWáE¢‘şW\"$ÀUâw2>ù$!*Õv¦*Ød^£ïÀªÑÍ\nÿ\0ºƒ×õàUh¦ÒÆÒX¤ƒ¹æëú›ì¬&v·^U÷ºRšõ«»ÆÙÓÅE§ê?—ÍO[Gµ4 £†>g+©2¸²‹	ÿ\0-\\÷§×¸à\ZŸ}r$É˜N`òí†Ú6œ	î ˆıÀŒ‰2d)4´Óÿ\0/˜~ïH°¾Ñ6ñvÿ\0br$ĞOl\'Ğ!‡º[„QED5\n;\n\\Êh0¿Íß(Çæ/,­ÆˆuM,´°Ã\n2ÆÀz¨\0ı¯„:Œ·ˆ;µåˆ#gÎi/ÜĞˆ#2­ÅDÍ©]Íl-šNP†åJ\n“óÅTáB7Å(Ëh&Xâ…“JÂ8ãQVfcE\0x““êÏË6÷È^T[a¶’wÿ\0H¸yä1@¡•¾Ë‚ü+Å³S²Ø\"C4o99\Z-(\\*ŠÍ2ÍCğÖ©Æµ_åÁÆp•§ÍÖlfıX\n”	 %—³-T)¯Ï\r„Qc>p–?1éIcS‘\'VB*Bƒğ8îk‚·Ùic«XÚi¶Ö“Z¤’@Š\"Í¹ ¥h˜N8•´Oé½\'¯ÕGó½åLïWÿÓ }gAˆüSÛÄÊŸur¶j-æ­ûåeı–D;ÿ\0³ª”ŞsĞ€¥ezÉıHÅ\"Ò»Ÿ1érÅ)¶¶3¸òvåN™	RDŠkey\rÄ1•!ª«µw©Zä[FêƒR@ÜCO¸â¥a¶Œ\n7ÄWzíÓ)IkSá¯.ı±TÆ™÷®ßN+IeÎŒ”¨Øù+E\"ü·æå«âeâƒíÛNÊ¡Ye5ãÇ-áª[‡Íşo»ÕÖ6¸ilíñSŒq‡bÌ;rcS„[‘‡~øUK–øª«*\"€\\rïLTY×±û°!g5ñ9$5É»ŠµÍëãŠ·êI€¦ÕâåwV*}¶ıX­«¦«©¥8LÂÿ\0×ˆH‘D/˜µĞ\0,)Ğmı0p„ñ•Eó?˜Á¨¼’¿?é\0GECç8ÂA‹Q•iĞrğùàà¸ÊM|.ïîä»›¯1-+(\nSAµO|“¦šeÅv+O2HEE¥İ9áQÒµÈñ2ázåæ§å¯-]-ìÚl·ºÚ;¹$ZDOûê0(ùgâÊge²4÷K?4ÙÌ‹û²JHÄuï”·Raıƒ\Z“Ú Ö”¡jvTdWv§â1¨‹XÖ£‹Vµ¨ §Ñ…UXÚMöˆô¡©û(Rm6ÊHŞ€oæı˜P†ÿ\0ÛVœb§O²zR¿ÍøıœVŸÿÔâw¬C‹FFà¡GBwûæ(±ãT·™‡cğ¨E©ä*+Æƒím‘¢Õbàó™\'¶Y#^\"ˆ ‘JSÃ|\"lã:Lf×f6¢B–ü]‚Ñ\0fR(õä„tå†íe;Lô]e¤¿ÑA\Z@«¼PÈ2€+S¿ÂlÑƒ$•®Îôè|HÁMà¯’ÚDåÁ@=7<¶ñÅ*|§Ä»Óp:}Ø ¡ZKj’)ËŞ ıÇ-’5j5=ÿ\0Î¸ª[ªhv×±˜Ü0\'pW±ñD©±‹Ÿ#Êµ)sğõ“ñ$ŸˆÇ/’õ\Zí27†Çúáñøj\räëñÖAôcâ/†·ü!tõ?<|EárùfQ½¾Øñ/¿ÃîøIğÛ%ákô#íU?v<KÂïĞÒ\røã¶<KÂØÑf5¢\Zx‘ğ¸hsÿ\0&<kÂ»ôßÊp/\náåùìœmxUWË—tùtÇ‰<*ÃËW†€øŒI¥Éåç­:Ócüqâ^T~Y”ı“ò¦&KÂ˜ÙyBêf\Z;½vURkí¶@Í—6ò÷å]×¨³Ş¡q·&ŒOZ°ì£ fÎ0gyQ¨²Ğ©ì7~VM¶#íôS~2X}ªb¡JŸ¤üğ°DP(!ˆ©é·o£$«ıbƒâQ°\"§£wÖàÿ\0:7_Ÿ†)ÿÕàW?_úÈåOOãZq®ßbóLw¢½H«N<O\nV”ïËü®}?gU=OF>§§ğVœ«ß¦Ükã•AŞòõ=J_ËÇÜ©şË,*;JåõËO¥Fû¹òŞ¼«ñÖ¿ìpîÙo¥}{Ôo­ÓÑı¾_nºÆÙ&ômÇ¡ÀW§!ÇÔåö«·]°2TÖ¡úÇÚöéLSoV§Ÿ¼kïÛQ>¥vë¿İŠ©µ(yWlUG÷5ø½é×øâ«[ÓãğûÓ§_§lUF\\›Ö§\n¼=ñUÇêÕíNøßèuı,*¤~©·\ZSüúS#º6i¾¥CZS½rÄ­ÿ\0D§ÃÇÚ´Áº®P©éZÿ\0§g¨SâãNİ)_zàCètÚ•íJR«rŞÔ¦ÕPúq¥k½zÒØ7]”ÛÓâßf•øxı¬Š§ázÿ\0¦ıkíoN4éŞ˜we³$Ò¿å_ıa+ÃO_ŸÚ÷¯Ã•nÏfqaú;Óê^Ÿ§ÿ\0Ó¯o³vF\nñZmÏ¥{W¾*ºãÖâÔ§©AÊŸ,U¤û\'ìôñÂ…Ï^)CÓÃ\néÃÓ§£AO\Zş¼UkzÛÒ¼v¥|=±U¿\rëªr§ëÀ—ÿÙ'),(6,'Nissan Qashqai',120.00,'ÿØÿácExif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0·\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0¬(\0\0\0\0\0\0\01\0\0\0\0\"\0\0\0´2\0\0\0\0\0\0\0Ö‡i\0\0\0\0\0\0\0ì\0\0$\0\0\0\0\nü€\0\0\'\0\nü€\0\0\'Adobe Photoshop CC 2014 (Windows)\02016:01:11 01:52:07\0\0\0\0\0\0\0\0\00221 \0\0\0\0ÿÿ\0\0 \0\0\0\0\0\0 \0\0\0\0\0\0\0´\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0r\0\0\0\0\0\0z(\0\0\0\0\0\0\0\0\0\0\0\0\0‚\0\0\0\0\0\0Ù\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0ÿØÿí\0Adobe_CM\0ÿî\0Adobe\0d€\0\0\0ÿÛ\0„\0			\n\r\r\rÿÀ\0\0i\0 \"\0ÿİ\0\0\nÿÄ?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q2‘¡±B#$RÁb34r‚ÑC%’Sğáñcs5¢²ƒ&D“TdEÂ£t6ÒUâeò³„ÃÓuãóF\'”¤…´•ÄÔäô¥µÅÕåõVfv†–¦¶ÆÖæö7GWgw‡—§·Ç×ç÷\05\0!1AQaq\"2‘¡±B#ÁRÑğ3$bár‚’CScs4ñ%¢²ƒ&5ÂÒD“T£dEU6teâò³„ÃÓuãóF”¤…´•ÄÔäô¥µÅÕåõVfv†–¦¶ÆÖæö\'7GWgw‡—§·ÇÿÚ\0\0\0?\0Úû8ğKĞ\nÑbmŠEoCÉ/AYØŸbJk\nBD|•L§ôÊJkz!?¢ŸL¥é””ÖôBoD+^™ğHÖ|SSÑ	z!Y5”ÛJJ@*\nb ‰µ SSSŠ‡‚ \n@$¤^ˆMè„xJS_Ñ	ZÚ–ÄTÿ\0ÿĞë}$ş‰VÅcÁHT<ÖÓLPTÆ7’ºÊAìŒÊ‚VªsÆ)Rû\'’¶üœFh¨f!š‰ş·ÑAwQk~!Æ~ŒOÁÎk}ßÙKTÒ?²y\'ˆnúÇÒÅ¨zŒ%®d8áôšáUvmQwÖNßÌwù¯ÿ\0¿1‰Qìı¥öEŸo×œÃ¶6»´?óãP?çc.pewµ®q\r`ôÇ\'ÚŞE¿œhê;ø!;„,>«ÕE¾–u8×0ñe.uÈüÓ‰˜=g1‹V«1ò	mf,h—ÒğY`¼kw»gü#Eü´5«Båœr›Ğ+Qô3H’µS)*B’®ú>IÅA%SPRSú*ç¦ŠÇ‚J¦˜¤§ôJ»é½1à•ªŸÿÑïÃTÚB#©ÈHÆ…•×:Óq,4¼2ë65Ö8NßP™öé¿Ó¢«íÿ\0¶êüõªû[FÖËŒëÎĞãaoçmX][¢¸Ú}\"Ú2±\'Ò¿W4µÒË*ÈoÓk½ÛØïÌ±º‹‘×úÕnÄ¶œy°zmy\'tå\rÿ\058ë8ØØõ†€Ñô+6í`\r÷şò©“õ7¯ÔI¬’\\lônmIZ»/¡ôûíÇËÆôÅ\rÓ8–^ö—\0ıµÔ]MŸKü©ÖJİG&¬œÚø³µƒÒÌ`:¶?›¹ß½èoşŞ5«›ÈËx³İ¨P¯t~«Óÿ\0çC±:cöÖ;ÖÇ±cD3qw§hşiß¤fÏå§Êú—Ôı{Ó¬¢ì`O¢-±Ì{ş‰ïôß]»2ÍéZ©Ê~i-5´L¸¸j`è\Zïê£[1©Ê«põÇ™Ğ£>ĞÖÿ\08Äg}GúÔİE®ÿ\0Ğ?ê«E§êGÖw°Ö÷bQ_po}ƒßC§%há/SÑú«súuvÛcÍq¦ö½ÍÖÆÿ\0_éz÷«®c@sNÖ™c	,-şV=¬>®+ÿ\0â—3õ=ÁŞ·VÇg¨\"Æ×ç’?wô÷±jáıVÊÅO_Ì\0i±Œ¥ äŒ†åí@Ò„H.å9¯®²ûË¯¡¿NğÑêWÿ\0†©¯Úæÿ\0İ¬vìÿ\0KM_Î«Môí­¶ÖwW`c‡¢à²1z ¢ÏV®«–ë´İe¶°Ì!˜õÖµ0°3(ö±Îsâ·îhsçì®Ïmls½ş¢ÿ\0ƒM!{#Zmˆ§Ôc¢ï tOíşçúûÑI‰Õ+SZ…76RéÔAJRSÿÒïÁEa@\0¢×)Èg“—N#uî¯VÉÒgj_dÅuD±ÛKœ^_¡2îÎşJâ?Æ˜~E§:×UFM¹°´ÁİSiô£ù¥w¦¯}OêwçtVÓe¡÷á¿ìÖY»Úñ´[‹nÿ\0øjô‘\n/Hü<©i¦Ğà	.×@Úİ®ÿ\0«C}™´ˆs\\Ö\"@ÿ\0ÀÎßú*»¬È¡å®ÜÃ¦†TÛÔ¯oçñI±Ç»9æØ0ÑÉÔvÜƒw¨Ç¸4˜\0šh@V¬ê¯enµÅµ±.s»\0%ßÙ\\¥ã\'¤œï²[_¬Ç;iÜöú“ıG7Ğßÿ\0öSş¸’ƒ·fc1+uÖ¹ÔÔÏ¦è/NÙw¥ê{•µN®­³\'ÍÓ´‡°ı]Y½MÇõU™…g«‹xİSµĞƒµõ»v×·k½®cÿ\0I_óV.w#¡ßv_ììjíÃÌÏA¯ôßV@Ï²§SeV~‰Ï®§}:kı¥ëz¥/N\Z]«u#_ÈˆÆäëàAp\\!éUŒÜ{i¼dSYs²È}\r±îØ×Ûöª÷×U”9ölçŸúOø5W¦ÙÖ²-èùàİm/}8=Oq³,msúgR\ruf±¬c}O]•Ù³÷ìJ‘o¢\Z/çÑpÕ0˜2à7Cƒ{şrò¼ÿ\0ª¿Y±³¯£¦ßwV§Ö±.y\0ÉıÚë}¹Umı55>ßKØ‰gHÌët6«‰gNêôˆ«\'&—UN@oÑm¶†ú>·òÿ\0ğK)ı/¤duìV¸eu<z[Ám—³Ãèí.s·,n¯õ÷£ôÌFdTû³Íí{±›@s*x¬š¬?i¿oè™c}?ÑWzâ±°³N	é–ôÛ†F=VĞXæ¼3ysî¦êìö`5­ºÆ>Ì«nõ¶3õWôk¢Áú“šŞœsíõ0º~(¥´VâßVçYf^M¯¶=˜íºİµ²¯Òß³üJ{ì§dÓc-Ûëâ¿Ñ¸6H\rkş“€İô‘\\³º]c&ÏÒ¾Û2œ\\ıûD˜.ÒªCk¯İîİùïZ@î¦2”¨ÊyEOÿÓô_L)5€%¹1xNCÎŒ\\<kúY6Ë_‰“[«µ•‹\\Ógèƒv)öÛo ßç=Ë?1pTuj:^Q®­Øc}!è¹Õ¹¦¿qmí¹®£\"Û=oRÏ§Cëôı—¤}blé™8/l¶ö@ i3ÜAÛïgÓ^7ÕMïÉúoséÜÒ\rnk·9î¦Zïô-siİÿ\0¢ÒºSßôßñ†F>[‘LH{@nœ{±¬s˜ÏúÅşšè1z¯@ê0)´ãÚî…oÚÿ\0ûozó¬[°1:UX6bWcÀß{Ë%æ×}7¿œfÆş‹ôN¯ùµfSj$cïk¦·ûÛ§ügÒşÚ*§½úû•nÕëÙK¦ëì®†wÜw{Í^mƒĞC×>º­¹Ï±û\Zk nÈv5m[“ém³İéûı;=/æÕÜÎ³‘›…ö;,~Æ9¥¥Äµ¯ŸKÔ\r³Ô{v²ßkj³ÓWPÃêË»§ÛCqwUkXĞêíÃØì\'²‹çĞû_Ù,Ùéz]ŸCõŸÑä\" ëıDëVÕ{z^]¢Ü|Øû=­væú 9´=Ûƒ^ÇŞÚ‹gªÊû*Ç±v¢$OÈñú}»ÎM9\rhÆg§„ikßfE´0\\ãSZÛ[EV7ÖÈÉ·ôXÿ\0×^«Óò›Ô°±óªÜªÛl7X.c±fö¥ju1ßS!ÅÑi¯şIO3ìï Zæ›\Zã´2ÈtÎ#©µQµøøµòìÔÏ¤ëhù*øİc§õráÓ²kÊôÀi®—9 ÿ\0#ém$7_•M4ÉŠé©º—¹Œcı¦¶ºÚ¨××ºvW¬ÌLŠ2,¿Ó~öµ®;¿Ó­Ûœ¼óë·Ö6õLß°â¸?§á¸€F­¶á,²ÿ\0å×WóXßõËÿ\0Ã,›Öú§IuÎé¶6“Ö²Ç:¶<–´—¶Æ7éşâV§ÔÙ—Š÷F5Bç	 QI³İ.Ù·”¯Õ.Àé¹yV}ãW”ö7Õ°¶¦ã5ÕŞÿ\0ÎşºóL¯¬]1»rz–KØÁ‹Kÿ\0mQé±g0Kãâã÷}7!i§Ô>¢ıeÈêıMø™†³}nÔknÏgóvÖX?:¹c÷.õÍ•â¿SzwT³«âe`ÓsöZÍÙ,k›Mlk­u¹\'ô[v7Şİß¥şm{I±®\'o‡’EA¬%é©ÈJRSÿÔîşĞ<Rõ¼ÖwÚ<ÒûGš}\"Û–9¯u\n•ı?\Záïn‰ı4Æÿ\04©Vçd}^Åx;@X]GêÀ\0–…ÖúŞj{]¡J•o˜çt‹èkËî\0–ˆäU<jqúc«·$5¥Û+©­¶ÆÜíFüªİ¶ªöÿ\04ÿ\0§¾ße~——Óé¸{~—Ár=SêçRÄ§Õëce4¶ú«%Í±ççó-}¥¥«h:ªNG»1ØÔ5ùØ÷†9õ»$oû~-ÔŠ¬·íN}6Óÿ\0h®şw×®õ÷º›×›âöKdÑ…£M¹İ=­v.&]Y¬®Ìvßc\\Æ¶»Kml`k¬ı-Ìg©fÆoşkÕev35¸y\0AaoÅ%6èê÷Ôd5¤G¶×ÓÙõK¿Gc}¼ª©eŒÇu•zÃm×P³ı]S)kiwøV{ı_b‹pÜIDfd­TÖxÅÍ—‘Ú[\n\0ÀÓÎV}.×ğÃ÷+¸ÿ\0WòG¶>(«g¬[áôZ<@Õt}	˜ØkßUÖƒ\"Û˜ğ‘¾ZÏì5]Åú·¼ıËc£ãÓÛå*Uºx}JëZİÄ4jS’â•—Mu×°.\0s¢T‹uFF‰şÑæ²şÑæŸíiR­ÿÕØûB_hUR-mı¡/´*‰$¦×Ú<ÒõüÕT’Sk×Mê…Y$™şŸLJ«f%‡VŠ\"I%ªzVı¦ÎŠÎ>(á$•ªÍ¢¦ğ\Z\Z8PL’“‡€ŸÕ\nºI)².Oëª©$†×¬›×U’IOÿÙÿíöPhotoshop 3.0\08BIM\0\0\0\0\0Z\0%G\0\0s\0\08BIM%\0\0\0\0\0ñ?3k˜³•\"X×ÂeF>8BIM:\0\0\0\0\0å\0\0\0\0\0\0\0\0\0\0\0printOutput\0\0\0\0\0\0\0PstSbool\0\0\0\0Inteenum\0\0\0\0Inte\0\0\0\0Clrm\0\0\0printSixteenBitbool\0\0\0\0printerNameTEXT\0\0\0\0\0\0\0\0printProofSetupObjc\0\0\0\0P\0r\0o\0o\0f\0 \0S\0e\0t\0u\0p\0\0\0\0\0\nproofSetup\0\0\0\0\0\0\0Bltnenum\0\0\0builtinProof\0\0\0	proofCMYK\08BIM;\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0printOutputOptions\0\0\0\0\0\0\0Cptnbool\0\0\0\0\0Clbrbool\0\0\0\0\0RgsMbool\0\0\0\0\0CrnCbool\0\0\0\0\0CntCbool\0\0\0\0\0Lblsbool\0\0\0\0\0Ngtvbool\0\0\0\0\0EmlDbool\0\0\0\0\0Intrbool\0\0\0\0\0BckgObjc\0\0\0\0\0\0\0\0\0RGBC\0\0\0\0\0\0\0Rd  doub@oà\0\0\0\0\0\0\0\0\0Grn doub@oà\0\0\0\0\0\0\0\0\0Bl  doub@oà\0\0\0\0\0\0\0\0\0BrdTUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Bld UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0RsltUntF#Pxl@R\0\0\0\0\0\0\0\0\0\nvectorDatabool\0\0\0\0PgPsenum\0\0\0\0PgPs\0\0\0\0PgPC\0\0\0\0LeftUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Top UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Scl UntF#Prc@Y\0\0\0\0\0\0\0\0\0cropWhenPrintingbool\0\0\0\0cropRectBottomlong\0\0\0\0\0\0\0cropRectLeftlong\0\0\0\0\0\0\0\rcropRectRightlong\0\0\0\0\0\0\0cropRectToplong\0\0\0\0\08BIMí\0\0\0\0\0\0H\0\0\0\0\0H\0\0\0\08BIM&\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?€\0\08BIM\r\0\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\08BIMó\0\0\0\0\0	\0\0\0\0\0\0\0\0\08BIM\'\0\0\0\0\0\n\0\0\0\0\0\0\0\08BIMõ\0\0\0\0\0H\0/ff\0\0lff\0\0\0\0\0\0\0/ff\0\0¡™š\0\0\0\0\0\0\02\0\0\0\0Z\0\0\0\0\0\0\0\0\05\0\0\0\0-\0\0\0\0\0\0\0\08BIMø\0\0\0\0\0p\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿè\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿè\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿè\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿè\0\08BIM\0\0\0\0\0\0\0\0\0\0@\0\0@\0\0\0\08BIM\0\0\0\0\0\0\0\0\08BIM\Z\0\0\0\0A\0\0\0\0\0\0\0\0\0\0\0\0\0\0´\0\0\0\0\0\0n\0i\0s\0s\0a\0n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0´\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0null\0\0\0\0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0\0´\0\0\0\0Rghtlong\0\0\0\0\0slicesVlLs\0\0\0Objc\0\0\0\0\0\0\0\0slice\0\0\0\0\0\0sliceIDlong\0\0\0\0\0\0\0groupIDlong\0\0\0\0\0\0\0originenum\0\0\0ESliceOrigin\0\0\0\rautoGenerated\0\0\0\0Typeenum\0\0\0\nESliceType\0\0\0\0Img \0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0\0´\0\0\0\0Rghtlong\0\0\0\0\0urlTEXT\0\0\0\0\0\0\0\0\0nullTEXT\0\0\0\0\0\0\0\0\0MsgeTEXT\0\0\0\0\0\0\0\0altTagTEXT\0\0\0\0\0\0\0\0cellTextIsHTMLbool\0\0\0cellTextTEXT\0\0\0\0\0\0\0\0	horzAlignenum\0\0\0ESliceHorzAlign\0\0\0default\0\0\0	vertAlignenum\0\0\0ESliceVertAlign\0\0\0default\0\0\0bgColorTypeenum\0\0\0ESliceBGColorType\0\0\0\0None\0\0\0	topOutsetlong\0\0\0\0\0\0\0\nleftOutsetlong\0\0\0\0\0\0\0bottomOutsetlong\0\0\0\0\0\0\0rightOutsetlong\0\0\0\0\08BIM(\0\0\0\0\0\0\0\0?ğ\0\0\0\0\0\08BIM\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\08BIM\0\0\0\0õ\0\0\0\0\0\0 \0\0\0i\0\0à\0\0Äà\0\0Ù\0\0ÿØÿí\0Adobe_CM\0ÿî\0Adobe\0d€\0\0\0ÿÛ\0„\0			\n\r\r\rÿÀ\0\0i\0 \"\0ÿİ\0\0\nÿÄ?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q2‘¡±B#$RÁb34r‚ÑC%’Sğáñcs5¢²ƒ&D“TdEÂ£t6ÒUâeò³„ÃÓuãóF\'”¤…´•ÄÔäô¥µÅÕåõVfv†–¦¶ÆÖæö7GWgw‡—§·Ç×ç÷\05\0!1AQaq\"2‘¡±B#ÁRÑğ3$bár‚’CScs4ñ%¢²ƒ&5ÂÒD“T£dEU6teâò³„ÃÓuãóF”¤…´•ÄÔäô¥µÅÕåõVfv†–¦¶ÆÖæö\'7GWgw‡—§·ÇÿÚ\0\0\0?\0Úû8ğKĞ\nÑbmŠEoCÉ/AYØŸbJk\nBD|•L§ôÊJkz!?¢ŸL¥é””ÖôBoD+^™ğHÖ|SSÑ	z!Y5”ÛJJ@*\nb ‰µ SSSŠ‡‚ \n@$¤^ˆMè„xJS_Ñ	ZÚ–ÄTÿ\0ÿĞë}$ş‰VÅcÁHT<ÖÓLPTÆ7’ºÊAìŒÊ‚VªsÆ)Rû\'’¶üœFh¨f!š‰ş·ÑAwQk~!Æ~ŒOÁÎk}ßÙKTÒ?²y\'ˆnúÇÒÅ¨zŒ%®d8áôšáUvmQwÖNßÌwù¯ÿ\0¿1‰Qìı¥öEŸo×œÃ¶6»´?óãP?çc.pewµ®q\r`ôÇ\'ÚŞE¿œhê;ø!;„,>«ÕE¾–u8×0ñe.uÈüÓ‰˜=g1‹V«1ò	mf,h—ÒğY`¼kw»gü#Eü´5«Båœr›Ğ+Qô3H’µS)*B’®ú>IÅA%SPRSú*ç¦ŠÇ‚J¦˜¤§ôJ»é½1à•ªŸÿÑïÃTÚB#©ÈHÆ…•×:Óq,4¼2ë65Ö8NßP™öé¿Ó¢«íÿ\0¶êüõªû[FÖËŒëÎĞãaoçmX][¢¸Ú}\"Ú2±\'Ò¿W4µÒË*ÈoÓk½ÛØïÌ±º‹‘×úÕnÄ¶œy°zmy\'tå\rÿ\058ë8ØØõ†€Ñô+6í`\r÷şò©“õ7¯ÔI¬’\\lônmIZ»/¡ôûíÇËÆôÅ\rÓ8–^ö—\0ıµÔ]MŸKü©ÖJİG&¬œÚø³µƒÒÌ`:¶?›¹ß½èoşŞ5«›ÈËx³İ¨P¯t~«Óÿ\0çC±:cöÖ;ÖÇ±cD3qw§hşiß¤fÏå§Êú—Ôı{Ó¬¢ì`O¢-±Ì{ş‰ïôß]»2ÍéZ©Ê~i-5´L¸¸j`è\Zïê£[1©Ê«põÇ™Ğ£>ĞÖÿ\08Äg}GúÔİE®ÿ\0Ğ?ê«E§êGÖw°Ö÷bQ_po}ƒßC§%há/SÑú«súuvÛcÍq¦ö½ÍÖÆÿ\0_éz÷«®c@sNÖ™c	,-şV=¬>®+ÿ\0â—3õ=ÁŞ·VÇg¨\"Æ×ç’?wô÷±jáıVÊÅO_Ì\0i±Œ¥ äŒ†åí@Ò„H.å9¯®²ûË¯¡¿NğÑêWÿ\0†©¯Úæÿ\0İ¬vìÿ\0KM_Î«Môí­¶ÖwW`c‡¢à²1z ¢ÏV®«–ë´İe¶°Ì!˜õÖµ0°3(ö±Îsâ·îhsçì®Ïmls½ş¢ÿ\0ƒM!{#Zmˆ§Ôc¢ï tOíşçúûÑI‰Õ+SZ…76RéÔAJRSÿÒïÁEa@\0¢×)Èg“—N#uî¯VÉÒgj_dÅuD±ÛKœ^_¡2îÎşJâ?Æ˜~E§:×UFM¹°´ÁİSiô£ù¥w¦¯}OêwçtVÓe¡÷á¿ìÖY»Úñ´[‹nÿ\0øjô‘\n/Hü<©i¦Ğà	.×@Úİ®ÿ\0«C}™´ˆs\\Ö\"@ÿ\0ÀÎßú*»¬È¡å®ÜÃ¦†TÛÔ¯oçñI±Ç»9æØ0ÑÉÔvÜƒw¨Ç¸4˜\0šh@V¬ê¯enµÅµ±.s»\0%ßÙ\\¥ã\'¤œï²[_¬Ç;iÜöú“ıG7Ğßÿ\0öSş¸’ƒ·fc1+uÖ¹ÔÔÏ¦è/NÙw¥ê{•µN®­³\'ÍÓ´‡°ı]Y½MÇõU™…g«‹xİSµĞƒµõ»v×·k½®cÿ\0I_óV.w#¡ßv_ììjíÃÌÏA¯ôßV@Ï²§SeV~‰Ï®§}:kı¥ëz¥/N\Z]«u#_ÈˆÆäëàAp\\!éUŒÜ{i¼dSYs²È}\r±îØ×Ûöª÷×U”9ölçŸúOø5W¦ÙÖ²-èùàİm/}8=Oq³,msúgR\ruf±¬c}O]•Ù³÷ìJ‘o¢\Z/çÑpÕ0˜2à7Cƒ{şrò¼ÿ\0ª¿Y±³¯£¦ßwV§Ö±.y\0ÉıÚë}¹Umı55>ßKØ‰gHÌët6«‰gNêôˆ«\'&—UN@oÑm¶†ú>·òÿ\0ğK)ı/¤duìV¸eu<z[Ám—³Ãèí.s·,n¯õ÷£ôÌFdTû³Íí{±›@s*x¬š¬?i¿oè™c}?ÑWzâ±°³N	é–ôÛ†F=VĞXæ¼3ysî¦êìö`5­ºÆ>Ì«nõ¶3õWôk¢Áú“šŞœsíõ0º~(¥´VâßVçYf^M¯¶=˜íºİµ²¯Òß³üJ{ì§dÓc-Ûëâ¿Ñ¸6H\rkş“€İô‘\\³º]c&ÏÒ¾Û2œ\\ıûD˜.ÒªCk¯İîİùïZ@î¦2”¨ÊyEOÿÓô_L)5€%¹1xNCÎŒ\\<kúY6Ë_‰“[«µ•‹\\Ógèƒv)öÛo ßç=Ë?1pTuj:^Q®­Øc}!è¹Õ¹¦¿qmí¹®£\"Û=oRÏ§Cëôı—¤}blé™8/l¶ö@ i3ÜAÛïgÓ^7ÕMïÉúoséÜÒ\rnk·9î¦Zïô-siİÿ\0¢ÒºSßôßñ†F>[‘LH{@nœ{±¬s˜ÏúÅşšè1z¯@ê0)´ãÚî…oÚÿ\0ûozó¬[°1:UX6bWcÀß{Ë%æ×}7¿œfÆş‹ôN¯ùµfSj$cïk¦·ûÛ§ügÒşÚ*§½úû•nÕëÙK¦ëì®†wÜw{Í^mƒĞC×>º­¹Ï±û\Zk nÈv5m[“ém³İéûı;=/æÕÜÎ³‘›…ö;,~Æ9¥¥Äµ¯ŸKÔ\r³Ô{v²ßkj³ÓWPÃêË»§ÛCqwUkXĞêíÃØì\'²‹çĞû_Ù,Ùéz]ŸCõŸÑä\" ëıDëVÕ{z^]¢Ü|Øû=­væú 9´=Ûƒ^ÇŞÚ‹gªÊû*Ç±v¢$OÈñú}»ÎM9\rhÆg§„ikßfE´0\\ãSZÛ[EV7ÖÈÉ·ôXÿ\0×^«Óò›Ô°±óªÜªÛl7X.c±fö¥ju1ßS!ÅÑi¯şIO3ìï Zæ›\Zã´2ÈtÎ#©µQµøøµòìÔÏ¤ëhù*øİc§õráÓ²kÊôÀi®—9 ÿ\0#ém$7_•M4ÉŠé©º—¹Œcı¦¶ºÚ¨××ºvW¬ÌLŠ2,¿Ó~öµ®;¿Ó­Ûœ¼óë·Ö6õLß°â¸?§á¸€F­¶á,²ÿ\0å×WóXßõËÿ\0Ã,›Öú§IuÎé¶6“Ö²Ç:¶<–´—¶Æ7éşâV§ÔÙ—Š÷F5Bç	 QI³İ.Ù·”¯Õ.Àé¹yV}ãW”ö7Õ°¶¦ã5ÕŞÿ\0ÎşºóL¯¬]1»rz–KØÁ‹Kÿ\0mQé±g0Kãâã÷}7!i§Ô>¢ıeÈêıMø™†³}nÔknÏgóvÖX?:¹c÷.õÍ•â¿SzwT³«âe`ÓsöZÍÙ,k›Mlk­u¹\'ô[v7Şİß¥şm{I±®\'o‡’EA¬%é©ÈJRSÿÔîşĞ<Rõ¼ÖwÚ<ÒûGš}\"Û–9¯u\n•ı?\Záïn‰ı4Æÿ\04©Vçd}^Åx;@X]GêÀ\0–…ÖúŞj{]¡J•o˜çt‹èkËî\0–ˆäU<jqúc«·$5¥Û+©­¶ÆÜíFüªİ¶ªöÿ\04ÿ\0§¾ße~——Óé¸{~—Ár=SêçRÄ§Õëce4¶ú«%Í±ççó-}¥¥«h:ªNG»1ØÔ5ùØ÷†9õ»$oû~-ÔŠ¬·íN}6Óÿ\0h®şw×®õ÷º›×›âöKdÑ…£M¹İ=­v.&]Y¬®Ìvßc\\Æ¶»Kml`k¬ı-Ìg©fÆoşkÕev35¸y\0AaoÅ%6èê÷Ôd5¤G¶×ÓÙõK¿Gc}¼ª©eŒÇu•zÃm×P³ı]S)kiwøV{ı_b‹pÜIDfd­TÖxÅÍ—‘Ú[\n\0ÀÓÎV}.×ğÃ÷+¸ÿ\0WòG¶>(«g¬[áôZ<@Õt}	˜ØkßUÖƒ\"Û˜ğ‘¾ZÏì5]Åú·¼ıËc£ãÓÛå*Uºx}JëZİÄ4jS’â•—Mu×°.\0s¢T‹uFF‰şÑæ²şÑæŸíiR­ÿÕØûB_hUR-mı¡/´*‰$¦×Ú<ÒõüÕT’Sk×Mê…Y$™şŸLJ«f%‡VŠ\"I%ªzVı¦ÎŠÎ>(á$•ªÍ¢¦ğ\Z\Z8PL’“‡€ŸÕ\nºI)².Oëª©$†×¬›×U’IOÿÙ\08BIM!\0\0\0\0\0]\0\0\0\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0 \0C\0C\0 \02\00\01\04\0\0\0\08BIM\0\0\0\0\0\0\0\0\0\0ÿá¾http://ns.adobe.com/xap/1.0/\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.5-c021 79.155772, 2014/01/13-19:44:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\" xmlns:photoshop=\"http://ns.adobe.com/photoshop/1.0/\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:DocumentID=\"F1C8DF936E23926E555B6CF4CA6770CD\" xmpMM:InstanceID=\"xmp.iid:9581f4a7-e4c2-9049-883c-a3e79e85335c\" xmpMM:OriginalDocumentID=\"F1C8DF936E23926E555B6CF4CA6770CD\" dc:format=\"image/jpeg\" photoshop:ColorMode=\"3\" xmp:CreateDate=\"2016-01-11T01:50+02:00\" xmp:ModifyDate=\"2016-01-11T01:52:07+02:00\" xmp:MetadataDate=\"2016-01-11T01:52:07+02:00\"> <xmpMM:History> <rdf:Seq> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:9581f4a7-e4c2-9049-883c-a3e79e85335c\" stEvt:when=\"2016-01-11T01:52:07+02:00\" stEvt:softwareAgent=\"Adobe Photoshop CC 2014 (Windows)\" stEvt:changed=\"/\"/> </rdf:Seq> </xmpMM:History> </rdf:Description> </rdf:RDF> </x:xmpmeta>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 <?xpacket end=\"w\"?>ÿî\0Adobe\0d\0\0\0\0ÿÛ\0„\0		\n\n\n\n\r\rÿÀ\0\0´\0ÿİ\0\0#ÿÄ¢\0\0\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\0s\0!1AQa\"q2‘¡±B#ÁRÑá3bğ$r‚ñ%C4S’¢²csÂ5D\'“£³6TdtÃÒâ&ƒ	\n„”EF¤´VÓU(\ZòãóÄÔäôeu…•¥µÅÕåõfv†–¦¶ÆÖæö7GWgw‡—§·Ç×ç÷8HXhxˆ˜¨¸ÈØèø)9IYiy‰™©¹ÉÙéù*:JZjzŠšªºÊÚêú\0m\0!1AQa\"q‘2¡±ğÁÑá#BRbrñ3$4C‚’S%¢c²ÂsÒ5âDƒT“	\n&6E\Z\'dtU7ò£³Ã()Óãó„”¤´ÄÔäôeu…•¥µÅÕåõFVfv†–¦¶ÆÖæöGWgw‡—§·Ç×ç÷8HXhxˆ˜¨¸ÈØèø9IYiy‰™©¹ÉÙéù*:JZjzŠšªºÊÚêúÿÚ\0\0\0?\0–ıPxeí.ú¯¶*ïªûb®ú¯¶*×Õı±W}_Û]è{b­ı_Û]õlUŞğ8ªï«ŸŠ·èŠ»êşØ«¾®|*ï«ûb®ú¿¶*·Ğ>»Ñ>«_WöÅôÅ[ôO†*Ø„øbª‹ğÅ+ÄÀâ«ÖßÛoêşØ«WöÀ­ı_ÛwÕı±W}_ÛkêçÀáU¦ÜøU¯«ŸP´Ûûb«>¬<1KÿĞŸ˜†^ÒïHb«}!Š»Ò«½!Š»Ò«½!Š®ô†*ïOÛoÒªïOw§íŠ»ÓöÅ[ôñV½?lUŞ–*·€Å-z~Ø«¸b‡pÅ]Ão€ÅWÅ+ÕqUê¸ªà¸ªåA[à1Wp«¸U¿O\n­ôı±WzC5éU¯Db—ÿÑé^Ô·ÓÅ]éâ®ôñWzx«½<UŞ*ïLâ«½3Š®ô±V½3áŠ®ôı±Wz~Ø«½?lUŞŸ¶*ïOÛkÒÅVúg[éâ«xœUÜqC¸â«©Š[ªõÅ—\\¸¥v*»(wU¾8«¸â®áŠ»†*×§Š¿ÿÒê>™ËÚšôqWz8«½lUw 1WzØ«koíŠª}[Ûoê¾Øªïªûb®ú©ğ?v*ïªŸ÷b«¾«ìqW}WØıØ«T¥ßS«FÓÛZÖØª“Zûb…míŠ¬6şØ¡o£íŠµéb—ı±Uá(\\±â«Ö<RÚÇíŠ¯ôı±BïGÛw£íŠ®ôqVıUŞ*ïGÿÓë¾–\\Ôß¢|1VılUrÛûb«…·¶UâÔømUVÓÛ#i¥U²öÆÖ—‹!á­7õ/lmiwÔ‡†6´ï©{ckMıKÛZ]õ/lmißPö8²oê#kêÇ­ki¶<J¤öØm(=—¶6´¢Ö~Ç%h¥&´öÆÖ–}WÛ»ê¾Ø«¾¬1VÅ¿¶*½mı±UëoíŠ¯{b­ı_Û]è{b­ı_Û]õl6´ï«ûckNú¿¶FÖŸÿÔí~†\\Ö¿ĞªåƒÛ\\ ªªÛ­+-°ÆÖ•’Ù~ş˜+­ŸjoáŠ¯[?lVš)\042(>îªŸU¯lU¿ªŠW¶*ãj]±M4c„uu21İik=šŠ´Ñ¨ñ,£øä¨¡>·£Aöæ¯ú‰#~¡A¿š´¡ö`¹õ\"ş&ÃAÙşcy*êèÚ~‘[[¥n\rÏîèÃöyw_§[#6èÈ$RlW‚BE*2Z×oìÅ4 öƒÃ\r±¤;Z{ckJFÛÛ\n)oÕ½±ZkêŞØU¿CÛ\\°{b«ÄØ«bUx€b­ˆ1UŞ†*ß¡‘K½UŞ†§ÿÕîŞZÅz¦*½cÅUU]\"È¥¿¦*¨æ8¡3Jx¢îÍND’i°Ò-\'Ÿ^‘‹-¼ã²ó?ÉA¶N–ÒkÍu}UŠòu3>ÉÒÉ Wefˆ™*A*Mqë\'§Â.=ı8à›î™eü1¦$¥º®¿ªèöI4µÕ£\ZVÂpRh\rY¾8ë¶Øğ$”¶?9ës\0ÿ\0RŒFECMu)Ø{“àcjSyÎøuÉ>bY?[Gñ ¥óåïóÚ­:úVª?âløğ/\Z]7æ¶§’@$P7áèàOşeêiÉ«áÉWş\"©Šñ*EçË©z@ÏOøº_ù«%™?—­u+d{Í6è&PT™ÙÉ\r¿W\nkï‹Qú›i¡DaÓf¾ÑECz^©¸¶¯qéÍÍü¯I“—ìÉ!“*¶óÜ0óÕ [’µÕ,ƒ4B¿ïøH’xÉ`ÓÇşüš,Ä“ˆıˆxe‚@\Z9P†F¡V¾JoşIéŠ¨´Rh±V½’C^Å\\#ÅWğÅ[áŠ®	Š®ôı±Vı<Uw§Š»ÓÅZà2)ÿÖï¼rÖ+•qUE\\UYb¨„\"•F)oM!#5Úƒ\n°CÍ³_jVV…R;Ry%b§kY1ğ†vd.|Ù¹r’/ØÉ\0ÂĞú¾©§¤E½mÉ~ˆÇîÓı‚¦N–ŞuaªÁqç)¯Ø†Ú7hÔl9\"‹mşÒğÓY,ÌêÖ«\0••ØïôŒi‰’.ÃV°ÕV{yz…XLB$^4.@ëO±5~Ô¾~<›m–Àõx[HºŸN™xÑì]êCÂ:«•õÉ[-{©ËüØÚ)	m}ÎÉq\'\n£pjĞs=+­)&´RÒX\0ŞF¾\0u¡È¢Ú²0^Ü¬r:ÆdZ))Ë—ù;ş¼VÑW6i×\n¾¡ã0ÙûıØ­½+òÓÌ‚ê	´Ë‡¬öõhªgö€ù7ïın?³‹Y×2>/‰¯È„–Óú– \r‘OÀ}ŠïOö9q\"lã…®š]2a¤êrÒÀG;+–5©’.‰!©ÿ\0Hƒ„şîi»Êœ›	Í–°³N,o :~¦¿V‘ƒ$€u{y>Ì±ö\'û¶(±J5âQ1b«xP³ÓöÅ]Ãk*İ0«t8ªüU¼U¼UØ«tÀ—ÿ×ôZÅxÅW¢â”DKŠ¢QNÃ¹é‘Kóœš–‰{gb~8ÔUªÁxjzzˆ\Z*şÏ<“ğË4Ü6§¨İ±+Sº–x¤Iê5û5i¾5ÿ\0Šòë`¡¨y‰å,…œô¡¨ÆÕ)Ò$¸{‰d’GD\n€±!Õ;yñ¶Êï´o5İ¤	gc+Â‹»1_)mŠAwæ,_[İ^Ú5¼ˆA‹—‰À4(Y*8²ìËö²6Ø7×­í¼İå˜ïtÓ]BÜ	-ÙÉ7?Íğ¼Nßñãléä“^úêZœH4)Üí’¶—<çZS$ôÈÚÒ­½á‚ê­8:Ÿ ñµ¤û\\Ôôû« Ğ9õ!pUHìv;ı8±¥º/™$Ò5k=J#^’Æ?hµëXÿ\0ÙòÅiè²~møÈö6æ7¡Ev²LªİÛŠƒåõqaÂÈ­<ùå[ÅQàˆ·ìNìš‰øâ¼)”úŞ’‘Ö{ëuSöKJ€ı¸8Y„F™ç-jöÇMÕæŠâ5?»‘[âVZÑãu5FşFN,¿Ï€Å´I¡/—u;Q¨^=ÆƒvLš€fø‘.~Ã:ı™=9—îâø=HÍ–¤Nh’-|\ZVÌCîë…+@ôïÓXÉ½;â«Z<U®9%v*ìPÕF*»ouqWÿĞïë–±^¸ªª`J.5ÅTïoQ¡f˜3<€TF££0ï€*Roîc&8sÅSÍXqcï’bÂ¼ÃùK·}6¥¤Î¶OuûÉíåSÇÕ?¶|JÍOŞSÔåö¾ßÛ±¦}ù;æë\'õ8.À­Çítûk6´Šò†¬h\Z…éÔìŞiÖ_ô‰(Q8àÅ•¨•:ãl@Nôÿ\01i);=æ¡o<^f)£ŒŠ{òclÄXß?0¼‡¡ŞØÁ©As$ŸİGS!ç^¼•Jrÿ\0(J¿\'<Á$º¶¡a‰­\0ÆAû%è¤ÁFíş³âÉ4ó×åMõæ­&¥¢Ío³~òêÒnQ£»nò#*È¿¼wWÿ\0v~ó\r±¦)/åæ3ı›%ÿ\0Ræ!ÿ\0#ZCÉùEù©û\Z*Iş­İ§üm&¥±~Qşn6ÇËÁùWì>ä”œV“É?Ì‹ƒIŞÇOåÔÜ4€ÂÇ&JÑÂÈì?ç|Á\'¬ù¢ÙWö’Ş\'ÜY£Æ×…8ƒşqÏOıëóü¤uzQ)ú\n¾6Æßşqÿ\0Èqïq%ıÑÿ\0‹nÙü“á¯\niiù+ùmlÊWG:ôk‹»·?òv™&\\!8OËŸ(¬\\-4›óˆù?ŞåñâG\no§ùe¬bôl£8kÈ¢ŠCÇítı’1$2L£³zqš>ê*¿E]%Ü[§©$# ˆaşÀìp%hğL…•¹öø’¬½qUV·æ¿ğ;mTReÅVÅZÂ…˜ªêŒUÜ±WrÅ_ÿÑïË–±^˜ª¼y¢ãÅ[UF¹”0©ô” öbqBKq¤ÜK«,P†^R1¡ˆ«©ğÿ\0y’UYo¯m J(]¾$ ó\\*¥>­ ŠIŞ&u‹´ »\ZôøV¸ªÈïíg^k%†õ¡QQ¸5ë…XÛşWşZNK7–t¹y±w‘í¿&ïSÉ¾Xª[{ù1ùa-¼«ƒmmÉH\r%5ö¡Å‚]åŸ è\\¹˜é–_V•×„’w,ä>)æÅY{Ej,Òìi)}ÀÛõrğ8³U{‰£4FR}€ÅW¦¦ãûÔ\rò\n?†*‰êÑ÷.cí°®*¨åıÄá‡òÖŸñ,\n‡y$=ÿ\0ÏèÅWG}2÷åóÅUEôjÈPÿ\02LU¦±òpGò“Å¾ãŠ©	¥NqUXõ+”ÿ\0vU˜o¿/˜ÁJÌÔşò/ø¡îuxZq5ªúSşÕv\'çÛpó5ÏNşŞµ[Mgë!%P¾¦ÂŸÍJş¬H[G:õöë*,¸ª“d·uF*·–*îXUÿÒïjÙk@Øª\"<ŠQqb©?˜üÅi¢8’á˜;ª€±Šš\nÔâ™húõ¡f“£rV\0ó]*GPGòä©»‰-Hã7şVÕÆ•	>“§Ü¬‘©ô™Ô|qšwğÅPÒùwŠÒ	H_¦J[>}«Dÿ\02×õ(B˜î™½6õç¿êÁlSKo.¹¶õ\\Õ›¨ÆÕ,¿±Xè:×f—2H¢ÊÈ?”ÑÇü7Åÿ\0ª™kŠU–9ˆ%?ê¦H\"üÆĞ’å­¯£¹Óî”•kyâ =}—á?ÍŠ¦ğùÏË2H©úVÚ)uŠi#Ùe*pRxo-§¡‚d—–ãƒ¨ú4ªş›‘Z\ZR½;b­ˆœôS÷b¶Ø‚QJƒ¿LRã¾«^“ÿ\0)û¾œ*²B\"^RÒ­°ğïŠ¥W~pò•¤”»Ö,áä{˜¹ÿ\0Àò®<JÆuÏË%§é®åµ†YÇüBŸ<J’ù·óÆM+Ëºv³¤èÆHu†,g¾L\r=I=ıBôõöãÃ&)7åWš|Óæ›Ÿ6ëšõüÓGee6ÖÑV8bk‹€Ü\"‰OU“â.ò/÷’61WÑú£§¢Zİ…dõQIjû×çdˆ|	Ql’b«qV±WaWÿÓï\0œµŠ lUdRŒ…±WËŸó”š¦©¨~bé¾[³i$Hìâ• F¡yæy)Èl¿¥Aû)Ëâû8B\n{ù\ræ½R#qå½ZZŞ@9n|•vj0Ø¶Ü+ÿ\0òı¼˜b^Ç6¡+÷Å\nk¨L’lç¦*Š\\¸_¶IÀ¨¨üÂ§íŠâ¨˜õ›6*¼üh0R¬m}cNTû#á4©ÿ\0›l-&\r©İÃnÎ+ÅÙQ©ãÆ¸xY¦6ƒBÖ­ÅŒÑÈ Ğ\\[º²‚;$ãÂ©Eİ¬Ö³43ÈnèGM¾ìUŠùÛÉÚg™4ÃÌ%®!ZÅ<aDÈO_LÔrÿ\0*3ğ·ìâ¬#É×úuÖ‹.‡¨êÛK¦2Åu,aÄ‰gíªŸ>/N9¿ß,ŸÍ“¶	_”áŸZÔo&ÔaŠ8måÒ2[Fctã#2`¬íø²ümÏüµÆÕ~£¦êÖĞ4ºuñ‚öy[êšdÑ@I¡P¼Ö3ñSû–çÿ\0=1áR›ykÎ~Fó%¹Ğ<Óo{åím¤5:æá1ğò•UÏ\n}¯÷d_ñ‹Ç0?-¿4ü±Ôôß1êzÇ—ØsŠşÒúå×ó7OŸ÷_å`æË‰æMæÿ\0:+qo0êÊÛloîÁß§û³+!˜,¿Èß˜×&A£ù’g¿‚â©owu<À«ÂI4oœı™¹rş&ørj’ş`y.}2éïb3\\éÀrL“@Iâ#•9©?\nL/Ø—ãûj«y	à‡AÖ½=@i2;[™o¢\n·Àµoİ½Aˆ­0R-OÎVÚTºnªÙÜÉ{5Ì’ÚItç{«ªvœJŞŸ­\nÔ_ØøŞ6Æ–ÙW|¿­ŞÚyÊ:m»İ^ØÙÏ#D§dk“\0g‘º\"V›%$=\'È–ú¿•|­©iH`ÔçÖV6Ô89¶1<D•ÊÊé\"|_‘båû8ÅQòjßXÛkÙDò½Z^hê£hÇ†Ù†E.D²wl’¬åŠµŠ»v*ÿ\0ÿÔï¾Ÿ¶XÅpV†£!\\UòçüäDo¥şojêİ§²m&Ún;Ñ•%xœ\nn´sş^†?¤k¿£¼ã¡Kiw‚ÚùáE‰%†f‘Â XÑßÒ‘‚§/İ²ı¹2a‰}!¤kš5ôHdK«CÑâaÍ}èÂÉlP™I£‚Ía8OTØ0ùŒU-›sIğ Œ\n¥êÓ®ß<UR9Oß…RŸ6y…4MkÒÀÊ£„ˆÔ`zÿ\0ª ¶*ùCÌ?šZÆ¡3Ù„•×3†g“ü #!ÄÍ>ü»üßÔ,uxŠËõ\rA¨±Ü©&GûêT?°}Ù—ıO·‡‰_Tèşj°ón„—°\rí±ãykZ˜¥ {ÆËÑ¿ßñğÒ¡Ç!±Jõ)ùsRºK»Ë(ÍêÓ…ì»˜qû?¼‹ƒ>ßëa¶(¯Ë«k›/©Ûê7qD§÷EœJÑíÆªHôş|mZO!kË¯+‹-VúÊBö÷7‚[9\0Ÿ¤—&ê§tÃÄ¥ç\'òóÇ_»×.-­ïî¤•¦;;˜Œ?ìÒqãÄÄ‡®ù.âûËšr“¦jW:…ÄgÖÒâHĞMÊµioø¶¿ğy)\0Z£lJÿ\0òH×õ[İcX´ı=ëÃJb\"€Ÿ´ÅÊşöI?o÷qÇü±äoŠA¨Î/iL\nÙkWvç 7Ç(©èOÛÛSŸ,ş^ù£A°›MÔ/ ó–ÊQ£t—Ó#‹DÉ!u’>f²óÿ\0u¨«	Ô\'L:é¿òæªÚdmWKwä’2ßh-\n¿’Ağÿ\0—…Š£şW¥[ßê-s«_ÚŠ[4¨¶öñPò¤Q~/Œæıëb¯PÓ,£¶F’tndşù—¯Ià	ßôı®XÉQï{oPª\n¢ôTş½ñŠ«éÚû¶\n8GÎäÄ×\"Ê¥È–AøUDâ®®*º§v*ÿ\0ÿÕôG¥“Bá*¨‘âªè¸«É?ç#ô+MCHÑ®êÓN¸Šâku½½<!d	Lİ8Êbø¿áq/[•ƒH–ŞÑ ½´Ÿ÷ú­ú2ŸQ´¢RÉG#Í•ø\\U’>2+sôÓ$Å1Ó¼Ç¦¡âŞY´«Å [¨	x‰ñ+ö‡İ&ZJÓ/Ñÿ\08oôùÑ/ø\\§A}fÁŸåF~Öô²-=3DüÕĞµdÉ,wİaqéJ?ç›S—û„ğ[ùzı‡¡7Õ¥=J\nı\ZTös`ÿ\0\r}™0«Â?ç%uç¶Ò-4øœ©œ1*\r~ÑãZLR	¦hÖb1>¥!Œ2™\"·§Úª’{Tn2™ò´Öë$\Z%ôp½}1õgNaiT¯\'ëû9 ~VyîçDÖêëñ´Õ£j©1ÉÔşÜ,y«Íİ¹#%}p0e`TŠ‚\rA\"UDb©º¡û$§Nm‚ £L„+LUPÙi÷÷<C® ñû±T”Íbddt<•©PA}8ªÖ¹´^Šÿ\0†*¤ÚŠ°W¥Z¸X!$Õ%qU„‘Ó`ãjb¨i¯nL’……UG\n\0éRÀ`f›V„pW¼Wi~Â[ƒ#7ÙûX†ÙÓ¢b¨{]cL»¼KH¥’âCÀ“P”\r˜7àv¥d©<—Ï™ŞlÓ|Ï©èÖÚÚÙÌ‘‘ƒF¯ñç]Û\ZZz/åœ\'óŸİ²FÒTŠé¨ Ô1ÉNÕZƒşZd=¶@	 ê:Œ‰d^<R¤bÅZôqWzgÃoÓöÅ_ÿÖô}M\râ­ŒUÆ`:š|ñWœş}é^ü»º´ÂKy¡™d¥J\n˜‹SÛÔåşÇ>kÔ¾«ªºŠ$·º´´ŠïÓ]‹ÛË§§ÁA·(ğpÿ\0Œ“;}¬“DW×)Xå<GÙ|¨M“:òo“üÇ¯Ø=ıb²µ\n^ÊæfP³2·zdÉø6f‹,*¯{eæ¸^[—·dZOŞ»Çÿ\0$òÍ˜Òs¢~bßÙ\"ª]¼(>ÌRÿ\0¤Ã÷7ïı‹ã²Ó>Ò?6ækq¡nZö¦²oZ!ş´F²\'ü”À‡—şuë:^»®é·Ò‹«\"2ÉÔbiFVû<™Õ[ılRÄîÒûGÓmu …ua^Hõ„ıZ/Ù\"+é]ÌŒ\'voNH­ä‹Ñdõf“\"K$Ï_¿\Z×å>…qp}k­QÂY^¬Şœ±úñõ·ÈJ/u«¸/-í®O¬-­ …‹šÊ¬P;ÑÍí¹ùç¦Uô_å?š?MyFfs%Ö˜~©(\'â(zN|kî¿Ö‹&™rÅ\nÑÎW¦øª&)e’Ÿ^›â©”·S±ôıìOqóÅR&”sëŠ°¯ÌßÌx|£¦ …c¸Õ¯v´·²ª»4²¿¦Ÿ³üø«Ã5ÍÌùÉ¬<!¿bİV.\n­ÿ\0…õ?Ë¿3émùoéÍzKÙ$¹å=õÂúä†e¯7YJqğo‰>ÇV”¯|ıùafäÜëÏ} VDÎxÂ™Z^($_…Û”e¤øxF¿±‘°É#½üğòmº•Ó<½=ìË°òDˆ¹¢-Kƒ<Ÿî¤ê?gT‚÷óûÍf/CH²±Ò QÅ8ÚB¿\"ÇÓÿ\0\'û¯³ƒ‰X£­jš¥íÅíôí5åËçd©P¢p§A³_É¯9IåızI§WÄª™”ÈúliË¿ÃOöXX‡ÚñÍÄi<T0ÌÄÃz‚*İ‘dœR·*î8«¨1WqÅ_ÿ×ôo,š\Zõ1W4øª\ZæSŠ±1Ê÷WSĞ\\FñÉòuâiş¯Ú_ò²JùkÏLš}ıô3ÄéªÜ$Pš¯PÂ™!éQ4qGÈ~Ëb¬*[‹‰R8¤fè(h>g*WªØk‡MÒm4è‰)oBİ>*|FŸå7,°*_yæ›†©\0¨=º“ó®ØU^_£ÉÉa™~÷U±5³BêëÑĞšıİ6Â–êZ•Íş›\r³2óWôÌ RFõ\r~6ûG¦6´›ëú/›4}kSãI’ëI»NXTs†Kx-Ï(yy\"@¾Œßiù“Ô¢ÉNÆÉlô‹»+³\"yÌ²Zê3©V·šÚ¦34CzüF1şîTuâß±Š©é¾^µÕoïõ^÷ê:\n\\Iş”M\Zn,i5şòŠ¿±ˆVyùM¯é¶¾{¹°°I¡Ò5H¸YÅ8d~Q$mF ñeõ=?õ—$¯uG_,µ¿ò¯ÜqU=GÌ\Z‰\\^]Åj›ò·¡éRÔŠ¥\ZwŸ<¯­Nc°ÕmîfªÇ4oJôû,qUM{\\²Ğô»­OPNÚÕ;­C@«âÌz.¯“|Ùæ«ï2k×\Z­İUæjG5Hâ]£Eÿ\0Qzÿ\03rÈ•I½céÓö¼r¾&Å¼$¨ ÛÂ=zì1âWcáôïú±¥u4­©hªIğ¸i\n±Ú´ß‡ÓAß¡úo§\ZViäï/ëÚÔPèzl÷eØ¬\"1?Ê’fšÿ\0²l›û;LT´Ó-,ÙıCoq4ƒ«@§l‰d‚@zRß1ãŠ»–*×,U¾X«ÿĞôÖ=òhk×÷ÅV™ıñU’MÏ®*–Ş[G7Q…X¶­åĞLÖé.ÛPÔöñV5qùqb¯ÎtSşJÓ\r*Usä$şA÷`T‡PòPN‘şUŒj>V’?Ø§ÑŠ±ë­£êùäP–ÜÄaˆ¸«+šœU1¸ó/›,/.\"¶ÖnKG7î£fªMVŒª¸zÀãŠ¢$ºÕı$Ô5+©]Ï2é÷¶ò¹<9üi½}8èËñ¢*·÷ŠØªİGL½ÓFù{ÌZUî™}j×ªJ\0Êå]]#–)}fnŸ$~<¸/ï1VüÃ¨­¾§.«-åÕ½¼1Ãz­ÁãH—‚*È›óEÙª>,’ªÚş`ù¾ßûŸ0]¯úÓ?äèl,S›_ÍÌ4şïWi×Šİ¿\\xªİcÎšî³då¡†úúh…µÒ:Fdà]Ùd‚6èì=0ín9£\'ûç†(bÚ.‘cª[ê:„2éöÒ‰ZêJÀà)©ôUø¼®Ëğúqgû/ğb©§›|ëæÿ\04¢Ûß9ı	-\r¤jv^_Ìü~øl%,Ií%hş°È•S\"QÔÓæFC…›TÌ¸ğªÒ±wb*©şê2ÿ\0*Ìü¯äı6üsÕnå¶CÒŞİB‘şÉù¯ü&\ZC×ü³äï éÜßM†âq¸¸º&wØ?$_ö¸Ò½ËTEŒ$d_°‹Ğ|¨Gã…Šm OC‘dŠ÷ß¢Vãß]ëâ®úÀñ«¾°<F*ÿ\0ÿÑí¿Y9:cnúÉÆ–İõ|imiŸ\Z[S3{ãKk	8ÒÚÇød©mFX\"~¨1¥´¶ëJ‚OØVØö§å˜¤ı€q[aZ¿”ÿ\0Èü0-°ÍkË4Æ«BT€iß¶ ·2[ØKqjœ5;r º¹5\"ªŠğf5†Y>Ú¢§M¤lŠ¢u(F›å\"¨¸Ô\'}BBë\ZB§¹Ê§eún§oæ;»¯+ù†òSa¨ğÔ¼·¨ÎÅÂâí}B©È6îÏè¼•9/Ãñ;>IXv¹ êº)¾ƒ\\‰…êH[»’Êéø2@¬mX“şF\'ÛLU \Z)±,‹öIN<kJÃR¼^AdäŸÊÁ[î4a´S’éù‚‘D»õ…??‡ˆÚÒ¼Z¥ì?İª} œm4²MFõû¯İ­(7®ıÇİ‹%ém^ƒFE¦ÄıcÈÒ§Zp_²€cJÈôØdN•É¡šè²]5¨ùâ¬ÏOy}ñ[Oí\ZOVÓ8g#®\n[E%×¾4¶»ëù\Z[kë^øÒÛ¾µï-¿ÿÒë?Y>9s[¾²|qW}døâ®úÉñÅZúÇ¾*ï¬{â«MÇ¾hÏŠ¬i½ğ*›´o×Kîìc›¨\\\nÆµo.ƒÊŠ*òŸ9y#P¶¸:¶•©2‚.-¸òæ´âHSö¹\'ÂÉö›ö~,‹&%­j¿â	í§wÖX!X>¬UÌCo‰J‰k_±öâÜU\Z–ºÓ´é5]BIdÓÖHšÚÌ:<±4­,këÊ£Òâd‘Y‘%“ìñÃj•y›ÌwaÕ\ríÍ	 HÓâ¯&…Wáÿ\0/í~Óãj”€OMşY\Zd¯£·ZãJ¬¶cT³ö8ª¨±ö8²V]=ÏE®*ªšD¿Ë’chûmsÑ+ò­§V^V¸n«øa[d6Mvû@˜8­²M?ÊĞGÕkôb†Eg¤¤²*›AiÛZ5\'CŠÚ°¸#\nÚï¬œVÛú×¾·}kß·}kß·ÿÓèŸY÷ËÚõŸ|UßZ÷Å]õŸ|UßY÷Å]õ¯|U¯¬ûâ®úÏ¾*´Üûâ­}cßZg÷ÅV»Æßk|U5•¤İS#L­‰kß•şUÖ\'i§·1Ü7ÚšQ›ıj|/şÏ–4¶Å®¿$´t<£¸ºÿ\0T´dÄ0ğ-¥Ó~UÁØ¿Öß´F’‘ş&ÔO”îS¢¸ãKk‡–¦şOÃ\Z[W‹Ê×=ıØÒÚ>\'Ü´´ùŒim2·òb £\Z[M-¼£j¿mk’`›[yzİ?`b©œ:l	Ñ*Œ“¶*‰B‰Ğbª©(ñª ¸÷ÅÅÏ¾*ï­{â­ıløâ®úÙñÅ]õ³ãŠµõ³Š¿ÿÔ—ıkß/jwÖ½ñU¿Y÷ÅW}kßwÖ½ñU¿Y÷ÅW}kß[õŸ|U¿¬Š»ëÄb­}dxŒU¯¬{â®úÇ¾*×¬<qU¦Tn£U\"~ª¸Ú¡Òê«ŠT_M·şUÅTÿ\0GAşOİŠ¯[S¢UPZÅáŠ¯ÇáŠ¯<1B #Ç\\xâ­ú£Ço×÷Å]ëûâ«½|PßÖ=ñW}cßwÖ=ñW}cß[õ“Š»ë\'ÿÕ>ıî^ÔïŞâ®ıî*ïŞâ®ıî*ïŞâ®ıæ*ïŞb®ıæ*ïŞb­~óo÷˜«¿yŠ»÷˜«¿yŠµûÌUß¼Å]ûÌUØªßwÇŠ»ãÅ[ıæ*ïŞb®ıæ*ïŞb®ıæ*ïŞb®ıî*ïŞâ®ıî(wïqW~÷k÷˜«¿yŠ¿ÿÙ'),(7,'Nissan Qashqai',120.00,'ÿØÿácExif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0·\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0¬(\0\0\0\0\0\0\01\0\0\0\0\"\0\0\0´2\0\0\0\0\0\0\0Ö‡i\0\0\0\0\0\0\0ì\0\0$\0\0\0\0\nü€\0\0\'\0\nü€\0\0\'Adobe Photoshop CC 2014 (Windows)\02016:01:11 01:52:07\0\0\0\0\0\0\0\0\00221 \0\0\0\0ÿÿ\0\0 \0\0\0\0\0\0 \0\0\0\0\0\0\0´\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0r\0\0\0\0\0\0z(\0\0\0\0\0\0\0\0\0\0\0\0\0‚\0\0\0\0\0\0Ù\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0ÿØÿí\0Adobe_CM\0ÿî\0Adobe\0d€\0\0\0ÿÛ\0„\0			\n\r\r\rÿÀ\0\0i\0 \"\0ÿİ\0\0\nÿÄ?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q2‘¡±B#$RÁb34r‚ÑC%’Sğáñcs5¢²ƒ&D“TdEÂ£t6ÒUâeò³„ÃÓuãóF\'”¤…´•ÄÔäô¥µÅÕåõVfv†–¦¶ÆÖæö7GWgw‡—§·Ç×ç÷\05\0!1AQaq\"2‘¡±B#ÁRÑğ3$bár‚’CScs4ñ%¢²ƒ&5ÂÒD“T£dEU6teâò³„ÃÓuãóF”¤…´•ÄÔäô¥µÅÕåõVfv†–¦¶ÆÖæö\'7GWgw‡—§·ÇÿÚ\0\0\0?\0Úû8ğKĞ\nÑbmŠEoCÉ/AYØŸbJk\nBD|•L§ôÊJkz!?¢ŸL¥é””ÖôBoD+^™ğHÖ|SSÑ	z!Y5”ÛJJ@*\nb ‰µ SSSŠ‡‚ \n@$¤^ˆMè„xJS_Ñ	ZÚ–ÄTÿ\0ÿĞë}$ş‰VÅcÁHT<ÖÓLPTÆ7’ºÊAìŒÊ‚VªsÆ)Rû\'’¶üœFh¨f!š‰ş·ÑAwQk~!Æ~ŒOÁÎk}ßÙKTÒ?²y\'ˆnúÇÒÅ¨zŒ%®d8áôšáUvmQwÖNßÌwù¯ÿ\0¿1‰Qìı¥öEŸo×œÃ¶6»´?óãP?çc.pewµ®q\r`ôÇ\'ÚŞE¿œhê;ø!;„,>«ÕE¾–u8×0ñe.uÈüÓ‰˜=g1‹V«1ò	mf,h—ÒğY`¼kw»gü#Eü´5«Båœr›Ğ+Qô3H’µS)*B’®ú>IÅA%SPRSú*ç¦ŠÇ‚J¦˜¤§ôJ»é½1à•ªŸÿÑïÃTÚB#©ÈHÆ…•×:Óq,4¼2ë65Ö8NßP™öé¿Ó¢«íÿ\0¶êüõªû[FÖËŒëÎĞãaoçmX][¢¸Ú}\"Ú2±\'Ò¿W4µÒË*ÈoÓk½ÛØïÌ±º‹‘×úÕnÄ¶œy°zmy\'tå\rÿ\058ë8ØØõ†€Ñô+6í`\r÷şò©“õ7¯ÔI¬’\\lônmIZ»/¡ôûíÇËÆôÅ\rÓ8–^ö—\0ıµÔ]MŸKü©ÖJİG&¬œÚø³µƒÒÌ`:¶?›¹ß½èoşŞ5«›ÈËx³İ¨P¯t~«Óÿ\0çC±:cöÖ;ÖÇ±cD3qw§hşiß¤fÏå§Êú—Ôı{Ó¬¢ì`O¢-±Ì{ş‰ïôß]»2ÍéZ©Ê~i-5´L¸¸j`è\Zïê£[1©Ê«põÇ™Ğ£>ĞÖÿ\08Äg}GúÔİE®ÿ\0Ğ?ê«E§êGÖw°Ö÷bQ_po}ƒßC§%há/SÑú«súuvÛcÍq¦ö½ÍÖÆÿ\0_éz÷«®c@sNÖ™c	,-şV=¬>®+ÿ\0â—3õ=ÁŞ·VÇg¨\"Æ×ç’?wô÷±jáıVÊÅO_Ì\0i±Œ¥ äŒ†åí@Ò„H.å9¯®²ûË¯¡¿NğÑêWÿ\0†©¯Úæÿ\0İ¬vìÿ\0KM_Î«Môí­¶ÖwW`c‡¢à²1z ¢ÏV®«–ë´İe¶°Ì!˜õÖµ0°3(ö±Îsâ·îhsçì®Ïmls½ş¢ÿ\0ƒM!{#Zmˆ§Ôc¢ï tOíşçúûÑI‰Õ+SZ…76RéÔAJRSÿÒïÁEa@\0¢×)Èg“—N#uî¯VÉÒgj_dÅuD±ÛKœ^_¡2îÎşJâ?Æ˜~E§:×UFM¹°´ÁİSiô£ù¥w¦¯}OêwçtVÓe¡÷á¿ìÖY»Úñ´[‹nÿ\0øjô‘\n/Hü<©i¦Ğà	.×@Úİ®ÿ\0«C}™´ˆs\\Ö\"@ÿ\0ÀÎßú*»¬È¡å®ÜÃ¦†TÛÔ¯oçñI±Ç»9æØ0ÑÉÔvÜƒw¨Ç¸4˜\0šh@V¬ê¯enµÅµ±.s»\0%ßÙ\\¥ã\'¤œï²[_¬Ç;iÜöú“ıG7Ğßÿ\0öSş¸’ƒ·fc1+uÖ¹ÔÔÏ¦è/NÙw¥ê{•µN®­³\'ÍÓ´‡°ı]Y½MÇõU™…g«‹xİSµĞƒµõ»v×·k½®cÿ\0I_óV.w#¡ßv_ììjíÃÌÏA¯ôßV@Ï²§SeV~‰Ï®§}:kı¥ëz¥/N\Z]«u#_ÈˆÆäëàAp\\!éUŒÜ{i¼dSYs²È}\r±îØ×Ûöª÷×U”9ölçŸúOø5W¦ÙÖ²-èùàİm/}8=Oq³,msúgR\ruf±¬c}O]•Ù³÷ìJ‘o¢\Z/çÑpÕ0˜2à7Cƒ{şrò¼ÿ\0ª¿Y±³¯£¦ßwV§Ö±.y\0ÉıÚë}¹Umı55>ßKØ‰gHÌët6«‰gNêôˆ«\'&—UN@oÑm¶†ú>·òÿ\0ğK)ı/¤duìV¸eu<z[Ám—³Ãèí.s·,n¯õ÷£ôÌFdTû³Íí{±›@s*x¬š¬?i¿oè™c}?ÑWzâ±°³N	é–ôÛ†F=VĞXæ¼3ysî¦êìö`5­ºÆ>Ì«nõ¶3õWôk¢Áú“šŞœsíõ0º~(¥´VâßVçYf^M¯¶=˜íºİµ²¯Òß³üJ{ì§dÓc-Ûëâ¿Ñ¸6H\rkş“€İô‘\\³º]c&ÏÒ¾Û2œ\\ıûD˜.ÒªCk¯İîİùïZ@î¦2”¨ÊyEOÿÓô_L)5€%¹1xNCÎŒ\\<kúY6Ë_‰“[«µ•‹\\Ógèƒv)öÛo ßç=Ë?1pTuj:^Q®­Øc}!è¹Õ¹¦¿qmí¹®£\"Û=oRÏ§Cëôı—¤}blé™8/l¶ö@ i3ÜAÛïgÓ^7ÕMïÉúoséÜÒ\rnk·9î¦Zïô-siİÿ\0¢ÒºSßôßñ†F>[‘LH{@nœ{±¬s˜ÏúÅşšè1z¯@ê0)´ãÚî…oÚÿ\0ûozó¬[°1:UX6bWcÀß{Ë%æ×}7¿œfÆş‹ôN¯ùµfSj$cïk¦·ûÛ§ügÒşÚ*§½úû•nÕëÙK¦ëì®†wÜw{Í^mƒĞC×>º­¹Ï±û\Zk nÈv5m[“ém³İéûı;=/æÕÜÎ³‘›…ö;,~Æ9¥¥Äµ¯ŸKÔ\r³Ô{v²ßkj³ÓWPÃêË»§ÛCqwUkXĞêíÃØì\'²‹çĞû_Ù,Ùéz]ŸCõŸÑä\" ëıDëVÕ{z^]¢Ü|Øû=­væú 9´=Ûƒ^ÇŞÚ‹gªÊû*Ç±v¢$OÈñú}»ÎM9\rhÆg§„ikßfE´0\\ãSZÛ[EV7ÖÈÉ·ôXÿ\0×^«Óò›Ô°±óªÜªÛl7X.c±fö¥ju1ßS!ÅÑi¯şIO3ìï Zæ›\Zã´2ÈtÎ#©µQµøøµòìÔÏ¤ëhù*øİc§õráÓ²kÊôÀi®—9 ÿ\0#ém$7_•M4ÉŠé©º—¹Œcı¦¶ºÚ¨××ºvW¬ÌLŠ2,¿Ó~öµ®;¿Ó­Ûœ¼óë·Ö6õLß°â¸?§á¸€F­¶á,²ÿ\0å×WóXßõËÿ\0Ã,›Öú§IuÎé¶6“Ö²Ç:¶<–´—¶Æ7éşâV§ÔÙ—Š÷F5Bç	 QI³İ.Ù·”¯Õ.Àé¹yV}ãW”ö7Õ°¶¦ã5ÕŞÿ\0ÎşºóL¯¬]1»rz–KØÁ‹Kÿ\0mQé±g0Kãâã÷}7!i§Ô>¢ıeÈêıMø™†³}nÔknÏgóvÖX?:¹c÷.õÍ•â¿SzwT³«âe`ÓsöZÍÙ,k›Mlk­u¹\'ô[v7Şİß¥şm{I±®\'o‡’EA¬%é©ÈJRSÿÔîşĞ<Rõ¼ÖwÚ<ÒûGš}\"Û–9¯u\n•ı?\Záïn‰ı4Æÿ\04©Vçd}^Åx;@X]GêÀ\0–…ÖúŞj{]¡J•o˜çt‹èkËî\0–ˆäU<jqúc«·$5¥Û+©­¶ÆÜíFüªİ¶ªöÿ\04ÿ\0§¾ße~——Óé¸{~—Ár=SêçRÄ§Õëce4¶ú«%Í±ççó-}¥¥«h:ªNG»1ØÔ5ùØ÷†9õ»$oû~-ÔŠ¬·íN}6Óÿ\0h®şw×®õ÷º›×›âöKdÑ…£M¹İ=­v.&]Y¬®Ìvßc\\Æ¶»Kml`k¬ı-Ìg©fÆoşkÕev35¸y\0AaoÅ%6èê÷Ôd5¤G¶×ÓÙõK¿Gc}¼ª©eŒÇu•zÃm×P³ı]S)kiwøV{ı_b‹pÜIDfd­TÖxÅÍ—‘Ú[\n\0ÀÓÎV}.×ğÃ÷+¸ÿ\0WòG¶>(«g¬[áôZ<@Õt}	˜ØkßUÖƒ\"Û˜ğ‘¾ZÏì5]Åú·¼ıËc£ãÓÛå*Uºx}JëZİÄ4jS’â•—Mu×°.\0s¢T‹uFF‰şÑæ²şÑæŸíiR­ÿÕØûB_hUR-mı¡/´*‰$¦×Ú<ÒõüÕT’Sk×Mê…Y$™şŸLJ«f%‡VŠ\"I%ªzVı¦ÎŠÎ>(á$•ªÍ¢¦ğ\Z\Z8PL’“‡€ŸÕ\nºI)².Oëª©$†×¬›×U’IOÿÙÿíöPhotoshop 3.0\08BIM\0\0\0\0\0Z\0%G\0\0s\0\08BIM%\0\0\0\0\0ñ?3k˜³•\"X×ÂeF>8BIM:\0\0\0\0\0å\0\0\0\0\0\0\0\0\0\0\0printOutput\0\0\0\0\0\0\0PstSbool\0\0\0\0Inteenum\0\0\0\0Inte\0\0\0\0Clrm\0\0\0printSixteenBitbool\0\0\0\0printerNameTEXT\0\0\0\0\0\0\0\0printProofSetupObjc\0\0\0\0P\0r\0o\0o\0f\0 \0S\0e\0t\0u\0p\0\0\0\0\0\nproofSetup\0\0\0\0\0\0\0Bltnenum\0\0\0builtinProof\0\0\0	proofCMYK\08BIM;\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0printOutputOptions\0\0\0\0\0\0\0Cptnbool\0\0\0\0\0Clbrbool\0\0\0\0\0RgsMbool\0\0\0\0\0CrnCbool\0\0\0\0\0CntCbool\0\0\0\0\0Lblsbool\0\0\0\0\0Ngtvbool\0\0\0\0\0EmlDbool\0\0\0\0\0Intrbool\0\0\0\0\0BckgObjc\0\0\0\0\0\0\0\0\0RGBC\0\0\0\0\0\0\0Rd  doub@oà\0\0\0\0\0\0\0\0\0Grn doub@oà\0\0\0\0\0\0\0\0\0Bl  doub@oà\0\0\0\0\0\0\0\0\0BrdTUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Bld UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0RsltUntF#Pxl@R\0\0\0\0\0\0\0\0\0\nvectorDatabool\0\0\0\0PgPsenum\0\0\0\0PgPs\0\0\0\0PgPC\0\0\0\0LeftUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Top UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Scl UntF#Prc@Y\0\0\0\0\0\0\0\0\0cropWhenPrintingbool\0\0\0\0cropRectBottomlong\0\0\0\0\0\0\0cropRectLeftlong\0\0\0\0\0\0\0\rcropRectRightlong\0\0\0\0\0\0\0cropRectToplong\0\0\0\0\08BIMí\0\0\0\0\0\0H\0\0\0\0\0H\0\0\0\08BIM&\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?€\0\08BIM\r\0\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\08BIMó\0\0\0\0\0	\0\0\0\0\0\0\0\0\08BIM\'\0\0\0\0\0\n\0\0\0\0\0\0\0\08BIMõ\0\0\0\0\0H\0/ff\0\0lff\0\0\0\0\0\0\0/ff\0\0¡™š\0\0\0\0\0\0\02\0\0\0\0Z\0\0\0\0\0\0\0\0\05\0\0\0\0-\0\0\0\0\0\0\0\08BIMø\0\0\0\0\0p\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿè\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿè\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿè\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿè\0\08BIM\0\0\0\0\0\0\0\0\0\0@\0\0@\0\0\0\08BIM\0\0\0\0\0\0\0\0\08BIM\Z\0\0\0\0A\0\0\0\0\0\0\0\0\0\0\0\0\0\0´\0\0\0\0\0\0n\0i\0s\0s\0a\0n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0´\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0null\0\0\0\0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0\0´\0\0\0\0Rghtlong\0\0\0\0\0slicesVlLs\0\0\0Objc\0\0\0\0\0\0\0\0slice\0\0\0\0\0\0sliceIDlong\0\0\0\0\0\0\0groupIDlong\0\0\0\0\0\0\0originenum\0\0\0ESliceOrigin\0\0\0\rautoGenerated\0\0\0\0Typeenum\0\0\0\nESliceType\0\0\0\0Img \0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0\0´\0\0\0\0Rghtlong\0\0\0\0\0urlTEXT\0\0\0\0\0\0\0\0\0nullTEXT\0\0\0\0\0\0\0\0\0MsgeTEXT\0\0\0\0\0\0\0\0altTagTEXT\0\0\0\0\0\0\0\0cellTextIsHTMLbool\0\0\0cellTextTEXT\0\0\0\0\0\0\0\0	horzAlignenum\0\0\0ESliceHorzAlign\0\0\0default\0\0\0	vertAlignenum\0\0\0ESliceVertAlign\0\0\0default\0\0\0bgColorTypeenum\0\0\0ESliceBGColorType\0\0\0\0None\0\0\0	topOutsetlong\0\0\0\0\0\0\0\nleftOutsetlong\0\0\0\0\0\0\0bottomOutsetlong\0\0\0\0\0\0\0rightOutsetlong\0\0\0\0\08BIM(\0\0\0\0\0\0\0\0?ğ\0\0\0\0\0\08BIM\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\08BIM\0\0\0\0õ\0\0\0\0\0\0 \0\0\0i\0\0à\0\0Äà\0\0Ù\0\0ÿØÿí\0Adobe_CM\0ÿî\0Adobe\0d€\0\0\0ÿÛ\0„\0			\n\r\r\rÿÀ\0\0i\0 \"\0ÿİ\0\0\nÿÄ?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q2‘¡±B#$RÁb34r‚ÑC%’Sğáñcs5¢²ƒ&D“TdEÂ£t6ÒUâeò³„ÃÓuãóF\'”¤…´•ÄÔäô¥µÅÕåõVfv†–¦¶ÆÖæö7GWgw‡—§·Ç×ç÷\05\0!1AQaq\"2‘¡±B#ÁRÑğ3$bár‚’CScs4ñ%¢²ƒ&5ÂÒD“T£dEU6teâò³„ÃÓuãóF”¤…´•ÄÔäô¥µÅÕåõVfv†–¦¶ÆÖæö\'7GWgw‡—§·ÇÿÚ\0\0\0?\0Úû8ğKĞ\nÑbmŠEoCÉ/AYØŸbJk\nBD|•L§ôÊJkz!?¢ŸL¥é””ÖôBoD+^™ğHÖ|SSÑ	z!Y5”ÛJJ@*\nb ‰µ SSSŠ‡‚ \n@$¤^ˆMè„xJS_Ñ	ZÚ–ÄTÿ\0ÿĞë}$ş‰VÅcÁHT<ÖÓLPTÆ7’ºÊAìŒÊ‚VªsÆ)Rû\'’¶üœFh¨f!š‰ş·ÑAwQk~!Æ~ŒOÁÎk}ßÙKTÒ?²y\'ˆnúÇÒÅ¨zŒ%®d8áôšáUvmQwÖNßÌwù¯ÿ\0¿1‰Qìı¥öEŸo×œÃ¶6»´?óãP?çc.pewµ®q\r`ôÇ\'ÚŞE¿œhê;ø!;„,>«ÕE¾–u8×0ñe.uÈüÓ‰˜=g1‹V«1ò	mf,h—ÒğY`¼kw»gü#Eü´5«Båœr›Ğ+Qô3H’µS)*B’®ú>IÅA%SPRSú*ç¦ŠÇ‚J¦˜¤§ôJ»é½1à•ªŸÿÑïÃTÚB#©ÈHÆ…•×:Óq,4¼2ë65Ö8NßP™öé¿Ó¢«íÿ\0¶êüõªû[FÖËŒëÎĞãaoçmX][¢¸Ú}\"Ú2±\'Ò¿W4µÒË*ÈoÓk½ÛØïÌ±º‹‘×úÕnÄ¶œy°zmy\'tå\rÿ\058ë8ØØõ†€Ñô+6í`\r÷şò©“õ7¯ÔI¬’\\lônmIZ»/¡ôûíÇËÆôÅ\rÓ8–^ö—\0ıµÔ]MŸKü©ÖJİG&¬œÚø³µƒÒÌ`:¶?›¹ß½èoşŞ5«›ÈËx³İ¨P¯t~«Óÿ\0çC±:cöÖ;ÖÇ±cD3qw§hşiß¤fÏå§Êú—Ôı{Ó¬¢ì`O¢-±Ì{ş‰ïôß]»2ÍéZ©Ê~i-5´L¸¸j`è\Zïê£[1©Ê«põÇ™Ğ£>ĞÖÿ\08Äg}GúÔİE®ÿ\0Ğ?ê«E§êGÖw°Ö÷bQ_po}ƒßC§%há/SÑú«súuvÛcÍq¦ö½ÍÖÆÿ\0_éz÷«®c@sNÖ™c	,-şV=¬>®+ÿ\0â—3õ=ÁŞ·VÇg¨\"Æ×ç’?wô÷±jáıVÊÅO_Ì\0i±Œ¥ äŒ†åí@Ò„H.å9¯®²ûË¯¡¿NğÑêWÿ\0†©¯Úæÿ\0İ¬vìÿ\0KM_Î«Môí­¶ÖwW`c‡¢à²1z ¢ÏV®«–ë´İe¶°Ì!˜õÖµ0°3(ö±Îsâ·îhsçì®Ïmls½ş¢ÿ\0ƒM!{#Zmˆ§Ôc¢ï tOíşçúûÑI‰Õ+SZ…76RéÔAJRSÿÒïÁEa@\0¢×)Èg“—N#uî¯VÉÒgj_dÅuD±ÛKœ^_¡2îÎşJâ?Æ˜~E§:×UFM¹°´ÁİSiô£ù¥w¦¯}OêwçtVÓe¡÷á¿ìÖY»Úñ´[‹nÿ\0øjô‘\n/Hü<©i¦Ğà	.×@Úİ®ÿ\0«C}™´ˆs\\Ö\"@ÿ\0ÀÎßú*»¬È¡å®ÜÃ¦†TÛÔ¯oçñI±Ç»9æØ0ÑÉÔvÜƒw¨Ç¸4˜\0šh@V¬ê¯enµÅµ±.s»\0%ßÙ\\¥ã\'¤œï²[_¬Ç;iÜöú“ıG7Ğßÿ\0öSş¸’ƒ·fc1+uÖ¹ÔÔÏ¦è/NÙw¥ê{•µN®­³\'ÍÓ´‡°ı]Y½MÇõU™…g«‹xİSµĞƒµõ»v×·k½®cÿ\0I_óV.w#¡ßv_ììjíÃÌÏA¯ôßV@Ï²§SeV~‰Ï®§}:kı¥ëz¥/N\Z]«u#_ÈˆÆäëàAp\\!éUŒÜ{i¼dSYs²È}\r±îØ×Ûöª÷×U”9ölçŸúOø5W¦ÙÖ²-èùàİm/}8=Oq³,msúgR\ruf±¬c}O]•Ù³÷ìJ‘o¢\Z/çÑpÕ0˜2à7Cƒ{şrò¼ÿ\0ª¿Y±³¯£¦ßwV§Ö±.y\0ÉıÚë}¹Umı55>ßKØ‰gHÌët6«‰gNêôˆ«\'&—UN@oÑm¶†ú>·òÿ\0ğK)ı/¤duìV¸eu<z[Ám—³Ãèí.s·,n¯õ÷£ôÌFdTû³Íí{±›@s*x¬š¬?i¿oè™c}?ÑWzâ±°³N	é–ôÛ†F=VĞXæ¼3ysî¦êìö`5­ºÆ>Ì«nõ¶3õWôk¢Áú“šŞœsíõ0º~(¥´VâßVçYf^M¯¶=˜íºİµ²¯Òß³üJ{ì§dÓc-Ûëâ¿Ñ¸6H\rkş“€İô‘\\³º]c&ÏÒ¾Û2œ\\ıûD˜.ÒªCk¯İîİùïZ@î¦2”¨ÊyEOÿÓô_L)5€%¹1xNCÎŒ\\<kúY6Ë_‰“[«µ•‹\\Ógèƒv)öÛo ßç=Ë?1pTuj:^Q®­Øc}!è¹Õ¹¦¿qmí¹®£\"Û=oRÏ§Cëôı—¤}blé™8/l¶ö@ i3ÜAÛïgÓ^7ÕMïÉúoséÜÒ\rnk·9î¦Zïô-siİÿ\0¢ÒºSßôßñ†F>[‘LH{@nœ{±¬s˜ÏúÅşšè1z¯@ê0)´ãÚî…oÚÿ\0ûozó¬[°1:UX6bWcÀß{Ë%æ×}7¿œfÆş‹ôN¯ùµfSj$cïk¦·ûÛ§ügÒşÚ*§½úû•nÕëÙK¦ëì®†wÜw{Í^mƒĞC×>º­¹Ï±û\Zk nÈv5m[“ém³İéûı;=/æÕÜÎ³‘›…ö;,~Æ9¥¥Äµ¯ŸKÔ\r³Ô{v²ßkj³ÓWPÃêË»§ÛCqwUkXĞêíÃØì\'²‹çĞû_Ù,Ùéz]ŸCõŸÑä\" ëıDëVÕ{z^]¢Ü|Øû=­væú 9´=Ûƒ^ÇŞÚ‹gªÊû*Ç±v¢$OÈñú}»ÎM9\rhÆg§„ikßfE´0\\ãSZÛ[EV7ÖÈÉ·ôXÿ\0×^«Óò›Ô°±óªÜªÛl7X.c±fö¥ju1ßS!ÅÑi¯şIO3ìï Zæ›\Zã´2ÈtÎ#©µQµøøµòìÔÏ¤ëhù*øİc§õráÓ²kÊôÀi®—9 ÿ\0#ém$7_•M4ÉŠé©º—¹Œcı¦¶ºÚ¨××ºvW¬ÌLŠ2,¿Ó~öµ®;¿Ó­Ûœ¼óë·Ö6õLß°â¸?§á¸€F­¶á,²ÿ\0å×WóXßõËÿ\0Ã,›Öú§IuÎé¶6“Ö²Ç:¶<–´—¶Æ7éşâV§ÔÙ—Š÷F5Bç	 QI³İ.Ù·”¯Õ.Àé¹yV}ãW”ö7Õ°¶¦ã5ÕŞÿ\0ÎşºóL¯¬]1»rz–KØÁ‹Kÿ\0mQé±g0Kãâã÷}7!i§Ô>¢ıeÈêıMø™†³}nÔknÏgóvÖX?:¹c÷.õÍ•â¿SzwT³«âe`ÓsöZÍÙ,k›Mlk­u¹\'ô[v7Şİß¥şm{I±®\'o‡’EA¬%é©ÈJRSÿÔîşĞ<Rõ¼ÖwÚ<ÒûGš}\"Û–9¯u\n•ı?\Záïn‰ı4Æÿ\04©Vçd}^Åx;@X]GêÀ\0–…ÖúŞj{]¡J•o˜çt‹èkËî\0–ˆäU<jqúc«·$5¥Û+©­¶ÆÜíFüªİ¶ªöÿ\04ÿ\0§¾ße~——Óé¸{~—Ár=SêçRÄ§Õëce4¶ú«%Í±ççó-}¥¥«h:ªNG»1ØÔ5ùØ÷†9õ»$oû~-ÔŠ¬·íN}6Óÿ\0h®şw×®õ÷º›×›âöKdÑ…£M¹İ=­v.&]Y¬®Ìvßc\\Æ¶»Kml`k¬ı-Ìg©fÆoşkÕev35¸y\0AaoÅ%6èê÷Ôd5¤G¶×ÓÙõK¿Gc}¼ª©eŒÇu•zÃm×P³ı]S)kiwøV{ı_b‹pÜIDfd­TÖxÅÍ—‘Ú[\n\0ÀÓÎV}.×ğÃ÷+¸ÿ\0WòG¶>(«g¬[áôZ<@Õt}	˜ØkßUÖƒ\"Û˜ğ‘¾ZÏì5]Åú·¼ıËc£ãÓÛå*Uºx}JëZİÄ4jS’â•—Mu×°.\0s¢T‹uFF‰şÑæ²şÑæŸíiR­ÿÕØûB_hUR-mı¡/´*‰$¦×Ú<ÒõüÕT’Sk×Mê…Y$™şŸLJ«f%‡VŠ\"I%ªzVı¦ÎŠÎ>(á$•ªÍ¢¦ğ\Z\Z8PL’“‡€ŸÕ\nºI)².Oëª©$†×¬›×U’IOÿÙ\08BIM!\0\0\0\0\0]\0\0\0\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0 \0C\0C\0 \02\00\01\04\0\0\0\08BIM\0\0\0\0\0\0\0\0\0\0ÿá¾http://ns.adobe.com/xap/1.0/\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.5-c021 79.155772, 2014/01/13-19:44:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\" xmlns:photoshop=\"http://ns.adobe.com/photoshop/1.0/\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:DocumentID=\"F1C8DF936E23926E555B6CF4CA6770CD\" xmpMM:InstanceID=\"xmp.iid:9581f4a7-e4c2-9049-883c-a3e79e85335c\" xmpMM:OriginalDocumentID=\"F1C8DF936E23926E555B6CF4CA6770CD\" dc:format=\"image/jpeg\" photoshop:ColorMode=\"3\" xmp:CreateDate=\"2016-01-11T01:50+02:00\" xmp:ModifyDate=\"2016-01-11T01:52:07+02:00\" xmp:MetadataDate=\"2016-01-11T01:52:07+02:00\"> <xmpMM:History> <rdf:Seq> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:9581f4a7-e4c2-9049-883c-a3e79e85335c\" stEvt:when=\"2016-01-11T01:52:07+02:00\" stEvt:softwareAgent=\"Adobe Photoshop CC 2014 (Windows)\" stEvt:changed=\"/\"/> </rdf:Seq> </xmpMM:History> </rdf:Description> </rdf:RDF> </x:xmpmeta>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 <?xpacket end=\"w\"?>ÿî\0Adobe\0d\0\0\0\0ÿÛ\0„\0		\n\n\n\n\r\rÿÀ\0\0´\0ÿİ\0\0#ÿÄ¢\0\0\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\0s\0!1AQa\"q2‘¡±B#ÁRÑá3bğ$r‚ñ%C4S’¢²csÂ5D\'“£³6TdtÃÒâ&ƒ	\n„”EF¤´VÓU(\ZòãóÄÔäôeu…•¥µÅÕåõfv†–¦¶ÆÖæö7GWgw‡—§·Ç×ç÷8HXhxˆ˜¨¸ÈØèø)9IYiy‰™©¹ÉÙéù*:JZjzŠšªºÊÚêú\0m\0!1AQa\"q‘2¡±ğÁÑá#BRbrñ3$4C‚’S%¢c²ÂsÒ5âDƒT“	\n&6E\Z\'dtU7ò£³Ã()Óãó„”¤´ÄÔäôeu…•¥µÅÕåõFVfv†–¦¶ÆÖæöGWgw‡—§·Ç×ç÷8HXhxˆ˜¨¸ÈØèø9IYiy‰™©¹ÉÙéù*:JZjzŠšªºÊÚêúÿÚ\0\0\0?\0–ıPxeí.ú¯¶*ïªûb®ú¯¶*×Õı±W}_Û]è{b­ı_Û]õlUŞğ8ªï«ŸŠ·èŠ»êşØ«¾®|*ï«ûb®ú¿¶*·Ğ>»Ñ>«_WöÅôÅ[ôO†*Ø„øbª‹ğÅ+ÄÀâ«ÖßÛoêşØ«WöÀ­ı_ÛwÕı±W}_ÛkêçÀáU¦ÜøU¯«ŸP´Ûûb«>¬<1KÿĞŸ˜†^ÒïHb«}!Š»Ò«½!Š»Ò«½!Š®ô†*ïOÛoÒªïOw§íŠ»ÓöÅ[ôñV½?lUŞ–*·€Å-z~Ø«¸b‡pÅ]Ão€ÅWÅ+ÕqUê¸ªà¸ªåA[à1Wp«¸U¿O\n­ôı±WzC5éU¯Db—ÿÑé^Ô·ÓÅ]éâ®ôñWzx«½<UŞ*ïLâ«½3Š®ô±V½3áŠ®ôı±Wz~Ø«½?lUŞŸ¶*ïOÛkÒÅVúg[éâ«xœUÜqC¸â«©Š[ªõÅ—\\¸¥v*»(wU¾8«¸â®áŠ»†*×§Š¿ÿÒê>™ËÚšôqWz8«½lUw 1WzØ«koíŠª}[Ûoê¾Øªïªûb®ú©ğ?v*ïªŸ÷b«¾«ìqW}WØıØ«T¥ßS«FÓÛZÖØª“Zûb…míŠ¬6şØ¡o£íŠµéb—ı±Uá(\\±â«Ö<RÚÇíŠ¯ôı±BïGÛw£íŠ®ôqVıUŞ*ïGÿÓë¾–\\Ôß¢|1VılUrÛûb«…·¶UâÔømUVÓÛ#i¥U²öÆÖ—‹!á­7õ/lmiwÔ‡†6´ï©{ckMıKÛZ]õ/lmißPö8²oê#kêÇ­ki¶<J¤öØm(=—¶6´¢Ö~Ç%h¥&´öÆÖ–}WÛ»ê¾Ø«¾¬1VÅ¿¶*½mı±UëoíŠ¯{b­ı_Û]è{b­ı_Û]õl6´ï«ûckNú¿¶FÖŸÿÔí~†\\Ö¿ĞªåƒÛ\\ ªªÛ­+-°ÆÖ•’Ù~ş˜+­ŸjoáŠ¯[?lVš)\042(>îªŸU¯lU¿ªŠW¶*ãj]±M4c„uu21İik=šŠ´Ñ¨ñ,£øä¨¡>·£Aöæ¯ú‰#~¡A¿š´¡ö`¹õ\"ş&ÃAÙşcy*êèÚ~‘[[¥n\rÏîèÃöyw_§[#6èÈ$RlW‚BE*2Z×oìÅ4 öƒÃ\r±¤;Z{ckJFÛÛ\n)oÕ½±ZkêŞØU¿CÛ\\°{b«ÄØ«bUx€b­ˆ1UŞ†*ß¡‘K½UŞ†§ÿÕîŞZÅz¦*½cÅUU]\"È¥¿¦*¨æ8¡3Jx¢îÍND’i°Ò-\'Ÿ^‘‹-¼ã²ó?ÉA¶N–ÒkÍu}UŠòu3>ÉÒÉ Wefˆ™*A*Mqë\'§Â.=ı8à›î™eü1¦$¥º®¿ªèöI4µÕ£\ZVÂpRh\rY¾8ë¶Øğ$”¶?9ës\0ÿ\0RŒFECMu)Ø{“àcjSyÎøuÉ>bY?[Gñ ¥óåïóÚ­:úVª?âløğ/\Z]7æ¶§’@$P7áèàOşeêiÉ«áÉWş\"©Šñ*EçË©z@ÏOøº_ù«%™?—­u+d{Í6è&PT™ÙÉ\r¿W\nkï‹Qú›i¡DaÓf¾ÑECz^©¸¶¯qéÍÍü¯I“—ìÉ!“*¶óÜ0óÕ [’µÕ,ƒ4B¿ïøH’xÉ`ÓÇşüš,Ä“ˆıˆxe‚@\Z9P†F¡V¾JoşIéŠ¨´Rh±V½’C^Å\\#ÅWğÅ[áŠ®	Š®ôı±Vı<Uw§Š»ÓÅZà2)ÿÖï¼rÖ+•qUE\\UYb¨„\"•F)oM!#5Úƒ\n°CÍ³_jVV…R;Ry%b§kY1ğ†vd.|Ù¹r’/ØÉ\0ÂĞú¾©§¤E½mÉ~ˆÇîÓı‚¦N–ŞuaªÁqç)¯Ø†Ú7hÔl9\"‹mşÒğÓY,ÌêÖ«\0••ØïôŒi‰’.ÃV°ÕV{yz…XLB$^4.@ëO±5~Ô¾~<›m–Àõx[HºŸN™xÑì]êCÂ:«•õÉ[-{©ËüØÚ)	m}ÎÉq\'\n£pjĞs=+­)&´RÒX\0ŞF¾\0u¡È¢Ú²0^Ü¬r:ÆdZ))Ë—ù;ş¼VÑW6i×\n¾¡ã0ÙûıØ­½+òÓÌ‚ê	´Ë‡¬öõhªgö€ù7ïın?³‹Y×2>/‰¯È„–Óú– \r‘OÀ}ŠïOö9q\"lã…®š]2a¤êrÒÀG;+–5©’.‰!©ÿ\0Hƒ„şîi»Êœ›	Í–°³N,o :~¦¿V‘ƒ$€u{y>Ì±ö\'û¶(±J5âQ1b«xP³ÓöÅ]Ãk*İ0«t8ªüU¼U¼UØ«tÀ—ÿ×ôZÅxÅW¢â”DKŠ¢QNÃ¹é‘Kóœš–‰{gb~8ÔUªÁxjzzˆ\Z*şÏ<“ğË4Ü6§¨İ±+Sº–x¤Iê5û5i¾5ÿ\0Šòë`¡¨y‰å,…œô¡¨ÆÕ)Ò$¸{‰d’GD\n€±!Õ;yñ¶Êï´o5İ¤	gc+Â‹»1_)mŠAwæ,_[İ^Ú5¼ˆA‹—‰À4(Y*8²ìËö²6Ø7×­í¼İå˜ïtÓ]BÜ	-ÙÉ7?Íğ¼Nßñãléä“^úêZœH4)Üí’¶—<çZS$ôÈÚÒ­½á‚ê­8:Ÿ ñµ¤û\\Ôôû« Ğ9õ!pUHìv;ı8±¥º/™$Ò5k=J#^’Æ?hµëXÿ\0ÙòÅiè²~møÈö6æ7¡Ev²LªİÛŠƒåõqaÂÈ­<ùå[ÅQàˆ·ìNìš‰øâ¼)”úŞ’‘Ö{ëuSöKJ€ı¸8Y„F™ç-jöÇMÕæŠâ5?»‘[âVZÑãu5FşFN,¿Ï€Å´I¡/—u;Q¨^=ÆƒvLš€fø‘.~Ã:ı™=9—îâø=HÍ–¤Nh’-|\ZVÌCîë…+@ôïÓXÉ½;â«Z<U®9%v*ìPÕF*»ouqWÿĞïë–±^¸ªª`J.5ÅTïoQ¡f˜3<€TF££0ï€*Roîc&8sÅSÍXqcï’bÂ¼ÃùK·}6¥¤Î¶OuûÉíåSÇÕ?¶|JÍOŞSÔåö¾ßÛ±¦}ù;æë\'õ8.À­Çítûk6´Šò†¬h\Z…éÔìŞiÖ_ô‰(Q8àÅ•¨•:ãl@Nôÿ\01i);=æ¡o<^f)£ŒŠ{òclÄXß?0¼‡¡ŞØÁ©As$ŸİGS!ç^¼•Jrÿ\0(J¿\'<Á$º¶¡a‰­\0ÆAû%è¤ÁFíş³âÉ4ó×åMõæ­&¥¢Ío³~òêÒnQ£»nò#*È¿¼wWÿ\0v~ó\r±¦)/åæ3ı›%ÿ\0Ræ!ÿ\0#ZCÉùEù©û\Z*Iş­İ§üm&¥±~Qşn6ÇËÁùWì>ä”œV“É?Ì‹ƒIŞÇOåÔÜ4€ÂÇ&JÑÂÈì?ç|Á\'¬ù¢ÙWö’Ş\'ÜY£Æ×…8ƒşqÏOıëóü¤uzQ)ú\n¾6Æßşqÿ\0Èqïq%ıÑÿ\0‹nÙü“á¯\niiù+ùmlÊWG:ôk‹»·?òv™&\\!8OËŸ(¬\\-4›óˆù?ŞåñâG\no§ùe¬bôl£8kÈ¢ŠCÇítı’1$2L£³zqš>ê*¿E]%Ü[§©$# ˆaşÀìp%hğL…•¹öø’¬½qUV·æ¿ğ;mTReÅVÅZÂ…˜ªêŒUÜ±WrÅ_ÿÑïË–±^˜ª¼y¢ãÅ[UF¹”0©ô” öbqBKq¤ÜK«,P†^R1¡ˆ«©ğÿ\0y’UYo¯m J(]¾$ ó\\*¥>­ ŠIŞ&u‹´ »\ZôøV¸ªÈïíg^k%†õ¡QQ¸5ë…XÛşWşZNK7–t¹y±w‘í¿&ïSÉ¾Xª[{ù1ùa-¼«ƒmmÉH\r%5ö¡Å‚]åŸ è\\¹˜é–_V•×„’w,ä>)æÅY{Ej,Òìi)}ÀÛõrğ8³U{‰£4FR}€ÅW¦¦ãûÔ\rò\n?†*‰êÑ÷.cí°®*¨åıÄá‡òÖŸñ,\n‡y$=ÿ\0ÏèÅWG}2÷åóÅUEôjÈPÿ\02LU¦±òpGò“Å¾ãŠ©	¥NqUXõ+”ÿ\0vU˜o¿/˜ÁJÌÔşò/ø¡îuxZq5ªúSşÕv\'çÛpó5ÏNşŞµ[Mgë!%P¾¦ÂŸÍJş¬H[G:õöë*,¸ª“d·uF*·–*îXUÿÒïjÙk@Øª\"<ŠQqb©?˜üÅi¢8’á˜;ª€±Šš\nÔâ™húõ¡f“£rV\0ó]*GPGòä©»‰-Hã7şVÕÆ•	>“§Ü¬‘©ô™Ô|qšwğÅPÒùwŠÒ	H_¦J[>}«Dÿ\02×õ(B˜î™½6õç¿êÁlSKo.¹¶õ\\Õ›¨ÆÕ,¿±Xè:×f—2H¢ÊÈ?”ÑÇü7Åÿ\0ª™kŠU–9ˆ%?ê¦H\"üÆĞ’å­¯£¹Óî”•kyâ =}—á?ÍŠ¦ğùÏË2H©úVÚ)uŠi#Ùe*pRxo-§¡‚d—–ãƒ¨ú4ªş›‘Z\ZR½;b­ˆœôS÷b¶Ø‚QJƒ¿LRã¾«^“ÿ\0)û¾œ*²B\"^RÒ­°ğïŠ¥W~pò•¤”»Ö,áä{˜¹ÿ\0Àò®<JÆuÏË%§é®åµ†YÇüBŸ<J’ù·óÆM+Ëºv³¤èÆHu†,g¾L\r=I=ıBôõöãÃ&)7åWš|Óæ›Ÿ6ëšõüÓGee6ÖÑV8bk‹€Ü\"‰OU“â.ò/÷’61WÑú£§¢Zİ…dõQIjû×çdˆ|	Ql’b«qV±WaWÿÓï\0œµŠ lUdRŒ…±WËŸó”š¦©¨~bé¾[³i$Hìâ• F¡yæy)Èl¿¥Aû)Ëâû8B\n{ù\ræ½R#qå½ZZŞ@9n|•vj0Ø¶Ü+ÿ\0òı¼˜b^Ç6¡+÷Å\nk¨L’lç¦*Š\\¸_¶IÀ¨¨üÂ§íŠâ¨˜õ›6*¼üh0R¬m}cNTû#á4©ÿ\0›l-&\r©İÃnÎ+ÅÙQ©ãÆ¸xY¦6ƒBÖ­ÅŒÑÈ Ğ\\[º²‚;$ãÂ©Eİ¬Ö³43ÈnèGM¾ìUŠùÛÉÚg™4ÃÌ%®!ZÅ<aDÈO_LÔrÿ\0*3ğ·ìâ¬#É×úuÖ‹.‡¨êÛK¦2Åu,aÄ‰gíªŸ>/N9¿ß,ŸÍ“¶	_”áŸZÔo&ÔaŠ8måÒ2[Fctã#2`¬íø²ümÏüµÆÕ~£¦êÖĞ4ºuñ‚öy[êšdÑ@I¡P¼Ö3ñSû–çÿ\0=1áR›ykÎ~Fó%¹Ğ<Óo{åím¤5:æá1ğò•UÏ\n}¯÷d_ñ‹Ç0?-¿4ü±Ôôß1êzÇ—ØsŠşÒúå×ó7OŸ÷_å`æË‰æMæÿ\0:+qo0êÊÛloîÁß§û³+!˜,¿Èß˜×&A£ù’g¿‚â©owu<À«ÂI4oœı™¹rş&ørj’ş`y.}2éïb3\\éÀrL“@Iâ#•9©?\nL/Ø—ãûj«y	à‡AÖ½=@i2;[™o¢\n·Àµoİ½Aˆ­0R-OÎVÚTºnªÙÜÉ{5Ì’ÚItç{«ªvœJŞŸ­\nÔ_ØøŞ6Æ–ÙW|¿­ŞÚyÊ:m»İ^ØÙÏ#D§dk“\0g‘º\"V›%$=\'È–ú¿•|­©iH`ÔçÖV6Ô89¶1<D•ÊÊé\"|_‘båû8ÅQòjßXÛkÙDò½Z^hê£hÇ†Ù†E.D²wl’¬åŠµŠ»v*ÿ\0ÿÔï¾Ÿ¶XÅpV†£!\\UòçüäDo¥şojêİ§²m&Ún;Ñ•%xœ\nn´sş^†?¤k¿£¼ã¡Kiw‚ÚùáE‰%†f‘Â XÑßÒ‘‚§/İ²ı¹2a‰}!¤kš5ôHdK«CÑâaÍ}èÂÉlP™I£‚Ía8OTØ0ùŒU-›sIğ Œ\n¥êÓ®ß<UR9Oß…RŸ6y…4MkÒÀÊ£„ˆÔ`zÿ\0ª ¶*ùCÌ?šZÆ¡3Ù„•×3†g“ü #!ÄÍ>ü»üßÔ,uxŠËõ\rA¨±Ü©&GûêT?°}Ù—ıO·‡‰_Tèşj°ón„—°\rí±ãykZ˜¥ {ÆËÑ¿ßñğÒ¡Ç!±Jõ)ùsRºK»Ë(ÍêÓ…ì»˜qû?¼‹ƒ>ßëa¶(¯Ë«k›/©Ûê7qD§÷EœJÑíÆªHôş|mZO!kË¯+‹-VúÊBö÷7‚[9\0Ÿ¤—&ê§tÃÄ¥ç\'òóÇ_»×.-­ïî¤•¦;;˜Œ?ìÒqãÄÄ‡®ù.âûËšr“¦jW:…ÄgÖÒâHĞMÊµioø¶¿ğy)\0Z£lJÿ\0òH×õ[İcX´ı=ëÃJb\"€Ÿ´ÅÊşöI?o÷qÇü±äoŠA¨Î/iL\nÙkWvç 7Ç(©èOÛÛSŸ,ş^ù£A°›MÔ/ ó–ÊQ£t—Ó#‹DÉ!u’>f²óÿ\0u¨«	Ô\'L:é¿òæªÚdmWKwä’2ßh-\n¿’Ağÿ\0—…Š£şW¥[ßê-s«_ÚŠ[4¨¶öñPò¤Q~/Œæıëb¯PÓ,£¶F’tndşù—¯Ià	ßôı®XÉQï{oPª\n¢ôTş½ñŠ«éÚû¶\n8GÎäÄ×\"Ê¥È–AøUDâ®®*º§v*ÿ\0ÿÕôG¥“Bá*¨‘âªè¸«É?ç#ô+MCHÑ®êÓN¸Šâku½½<!d	Lİ8Êbø¿áq/[•ƒH–ŞÑ ½´Ÿ÷ú­ú2ŸQ´¢RÉG#Í•ø\\U’>2+sôÓ$Å1Ó¼Ç¦¡âŞY´«Å [¨	x‰ñ+ö‡İ&ZJÓ/Ñÿ\08oôùÑ/ø\\§A}fÁŸåF~Öô²-=3DüÕĞµdÉ,wİaqéJ?ç›S—û„ğ[ùzı‡¡7Õ¥=J\nı\ZTös`ÿ\0\r}™0«Â?ç%uç¶Ò-4øœ©œ1*\r~ÑãZLR	¦hÖb1>¥!Œ2™\"·§Úª’{Tn2™ò´Öë$\Z%ôp½}1õgNaiT¯\'ëû9 ~VyîçDÖêëñ´Õ£j©1ÉÔşÜ,y«Íİ¹#%}p0e`TŠ‚\rA\"UDb©º¡û$§Nm‚ £L„+LUPÙi÷÷<C® ñû±T”Íbddt<•©PA}8ªÖ¹´^Šÿ\0†*¤ÚŠ°W¥Z¸X!$Õ%qU„‘Ó`ãjb¨i¯nL’……UG\n\0éRÀ`f›V„pW¼Wi~Â[ƒ#7ÙûX†ÙÓ¢b¨{]cL»¼KH¥’âCÀ“P”\r˜7àv¥d©<—Ï™ŞlÓ|Ï©èÖÚÚÙÌ‘‘ƒF¯ñç]Û\ZZz/åœ\'óŸİ²FÒTŠé¨ Ô1ÉNÕZƒşZd=¶@	 ê:Œ‰d^<R¤bÅZôqWzgÃoÓöÅ_ÿÖô}M\râ­ŒUÆ`:š|ñWœş}é^ü»º´ÂKy¡™d¥J\n˜‹SÛÔåşÇ>kÔ¾«ªºŠ$·º´´ŠïÓ]‹ÛË§§ÁA·(ğpÿ\0Œ“;}¬“DW×)Xå<GÙ|¨M“:òo“üÇ¯Ø=ıb²µ\n^ÊæfP³2·zdÉø6f‹,*¯{eæ¸^[—·dZOŞ»Çÿ\0$òÍ˜Òs¢~bßÙ\"ª]¼(>ÌRÿ\0¤Ã÷7ïı‹ã²Ó>Ò?6ækq¡nZö¦²oZ!ş´F²\'ü”À‡—şuë:^»®é·Ò‹«\"2ÉÔbiFVû<™Õ[ılRÄîÒûGÓmu …ua^Hõ„ıZ/Ù\"+é]ÌŒ\'voNH­ä‹Ñdõf“\"K$Ï_¿\Z×å>…qp}k­QÂY^¬Şœ±úñõ·ÈJ/u«¸/-í®O¬-­ …‹šÊ¬P;ÑÍí¹ùç¦Uô_å?š?MyFfs%Ö˜~©(\'â(zN|kî¿Ö‹&™rÅ\nÑÎW¦øª&)e’Ÿ^›â©”·S±ôıìOqóÅR&”sëŠ°¯ÌßÌx|£¦ …c¸Õ¯v´·²ª»4²¿¦Ÿ³üø«Ã5ÍÌùÉ¬<!¿bİV.\n­ÿ\0…õ?Ë¿3émùoéÍzKÙ$¹å=õÂúä†e¯7YJqğo‰>ÇV”¯|ıùafäÜëÏ} VDÎxÂ™Z^($_…Û”e¤øxF¿±‘°É#½üğòmº•Ó<½=ìË°òDˆ¹¢-Kƒ<Ÿî¤ê?gT‚÷óûÍf/CH²±Ò QÅ8ÚB¿\"ÇÓÿ\0\'û¯³ƒ‰X£­jš¥íÅíôí5åËçd©P¢p§A³_É¯9IåızI§WÄª™”ÈúliË¿ÃOöXX‡ÚñÍÄi<T0ÌÄÃz‚*İ‘dœR·*î8«¨1WqÅ_ÿ×ôo,š\Zõ1W4øª\ZæSŠ±1Ê÷WSĞ\\FñÉòuâiş¯Ú_ò²JùkÏLš}ıô3ÄéªÜ$Pš¯PÂ™!éQ4qGÈ~Ëb¬*[‹‰R8¤fè(h>g*WªØk‡MÒm4è‰)oBİ>*|FŸå7,°*_yæ›†©\0¨=º“ó®ØU^_£ÉÉa™~÷U±5³BêëÑĞšıİ6Â–êZ•Íş›\r³2óWôÌ RFõ\r~6ûG¦6´›ëú/›4}kSãI’ëI»NXTs†Kx-Ï(yy\"@¾Œßiù“Ô¢ÉNÆÉlô‹»+³\"yÌ²Zê3©V·šÚ¦34CzüF1şîTuâß±Š©é¾^µÕoïõ^÷ê:\n\\Iş”M\Zn,i5şòŠ¿±ˆVyùM¯é¶¾{¹°°I¡Ò5H¸YÅ8d~Q$mF ñeõ=?õ—$¯uG_,µ¿ò¯ÜqU=GÌ\Z‰\\^]Åj›ò·¡éRÔŠ¥\ZwŸ<¯­Nc°ÕmîfªÇ4oJôû,qUM{\\²Ğô»­OPNÚÕ;­C@«âÌz.¯“|Ùæ«ï2k×\Z­İUæjG5Hâ]£Eÿ\0Qzÿ\03rÈ•I½céÓö¼r¾&Å¼$¨ ÛÂ=zì1âWcáôïú±¥u4­©hªIğ¸i\n±Ú´ß‡ÓAß¡úo§\ZViäï/ëÚÔPèzl÷eØ¬\"1?Ê’fšÿ\0²l›û;LT´Ó-,ÙıCoq4ƒ«@§l‰d‚@zRß1ãŠ»–*×,U¾X«ÿĞôÖ=òhk×÷ÅV™ıñU’MÏ®*–Ş[G7Q…X¶­åĞLÖé.ÛPÔöñV5qùqb¯ÎtSşJÓ\r*Usä$şA÷`T‡PòPN‘şUŒj>V’?Ø§ÑŠ±ë­£êùäP–ÜÄaˆ¸«+šœU1¸ó/›,/.\"¶ÖnKG7î£fªMVŒª¸zÀãŠ¢$ºÕı$Ô5+©]Ï2é÷¶ò¹<9üi½}8èËñ¢*·÷ŠØªİGL½ÓFù{ÌZUî™}j×ªJ\0Êå]]#–)}fnŸ$~<¸/ï1VüÃ¨­¾§.«-åÕ½¼1Ãz­ÁãH—‚*È›óEÙª>,’ªÚş`ù¾ßûŸ0]¯úÓ?äèl,S›_ÍÌ4şïWi×Šİ¿\\xªİcÎšî³då¡†úúh…µÒ:Fdà]Ùd‚6èì=0ín9£\'ûç†(bÚ.‘cª[ê:„2éöÒ‰ZêJÀà)©ôUø¼®Ëğúqgû/ğb©§›|ëæÿ\04¢Ûß9ı	-\r¤jv^_Ìü~øl%,Ií%hş°È•S\"QÔÓæFC…›TÌ¸ğªÒ±wb*©şê2ÿ\0*Ìü¯äı6üsÕnå¶CÒŞİB‘şÉù¯ü&\ZC×ü³äï éÜßM†âq¸¸º&wØ?$_ö¸Ò½ËTEŒ$d_°‹Ğ|¨Gã…Šm OC‘dŠ÷ß¢Vãß]ëâ®úÀñ«¾°<F*ÿ\0ÿÑí¿Y9:cnúÉÆ–İõ|imiŸ\Z[S3{ãKk	8ÒÚÇød©mFX\"~¨1¥´¶ëJ‚OØVØö§å˜¤ı€q[aZ¿”ÿ\0Èü0-°ÍkË4Æ«BT€iß¶ ·2[ØKqjœ5;r º¹5\"ªŠğf5†Y>Ú¢§M¤lŠ¢u(F›å\"¨¸Ô\'}BBë\ZB§¹Ê§eún§oæ;»¯+ù†òSa¨ğÔ¼·¨ÎÅÂâí}B©È6îÏè¼•9/Ãñ;>IXv¹ êº)¾ƒ\\‰…êH[»’Êéø2@¬mX“şF\'ÛLU \Z)±,‹öIN<kJÃR¼^AdäŸÊÁ[î4a´S’éù‚‘D»õ…??‡ˆÚÒ¼Z¥ì?İª} œm4²MFõû¯İ­(7®ıÇİ‹%ém^ƒFE¦ÄıcÈÒ§Zp_²€cJÈôØdN•É¡šè²]5¨ùâ¬ÏOy}ñ[Oí\ZOVÓ8g#®\n[E%×¾4¶»ëù\Z[kë^øÒÛ¾µï-¿ÿÒë?Y>9s[¾²|qW}døâ®úÉñÅZúÇ¾*ï¬{â«MÇ¾hÏŠ¬i½ğ*›´o×Kîìc›¨\\\nÆµo.ƒÊŠ*òŸ9y#P¶¸:¶•©2‚.-¸òæ´âHSö¹\'ÂÉö›ö~,‹&%­j¿â	í§wÖX!X>¬UÌCo‰J‰k_±öâÜU\Z–ºÓ´é5]BIdÓÖHšÚÌ:<±4­,këÊ£Òâd‘Y‘%“ìñÃj•y›ÌwaÕ\ríÍ	 HÓâ¯&…Wáÿ\0/í~Óãj”€OMşY\Zd¯£·ZãJ¬¶cT³ö8ª¨±ö8²V]=ÏE®*ªšD¿Ë’chûmsÑ+ò­§V^V¸n«øa[d6Mvû@˜8­²M?ÊĞGÕkôb†Eg¤¤²*›AiÛZ5\'CŠÚ°¸#\nÚï¬œVÛú×¾·}kß·}kß·ÿÓèŸY÷ËÚõŸ|UßZ÷Å]õŸ|UßY÷Å]õ¯|U¯¬ûâ®úÏ¾*´Üûâ­}cßZg÷ÅV»Æßk|U5•¤İS#L­‰kß•şUÖ\'i§·1Ü7ÚšQ›ıj|/şÏ–4¶Å®¿$´t<£¸ºÿ\0T´dÄ0ğ-¥Ó~UÁØ¿Öß´F’‘ş&ÔO”îS¢¸ãKk‡–¦şOÃ\Z[W‹Ê×=ıØÒÚ>\'Ü´´ùŒim2·òb £\Z[M-¼£j¿mk’`›[yzİ?`b©œ:l	Ñ*Œ“¶*‰B‰Ğbª©(ñª ¸÷ÅÅÏ¾*ï­{â­ıløâ®úÙñÅ]õ³ãŠµõ³Š¿ÿÔ—ıkß/jwÖ½ñU¿Y÷ÅW}kßwÖ½ñU¿Y÷ÅW}kß[õŸ|U¿¬Š»ëÄb­}dxŒU¯¬{â®úÇ¾*×¬<qU¦Tn£U\"~ª¸Ú¡Òê«ŠT_M·şUÅTÿ\0GAşOİŠ¯[S¢UPZÅáŠ¯ÇáŠ¯<1B #Ç\\xâ­ú£Ço×÷Å]ëûâ«½|PßÖ=ñW}cßwÖ=ñW}cß[õ“Š»ë\'ÿÕ>ıî^ÔïŞâ®ıî*ïŞâ®ıî*ïŞâ®ıæ*ïŞb®ıæ*ïŞb­~óo÷˜«¿yŠ»÷˜«¿yŠµûÌUß¼Å]ûÌUØªßwÇŠ»ãÅ[ıæ*ïŞb®ıæ*ïŞb®ıæ*ïŞb®ıî*ïŞâ®ıî(wïqW~÷k÷˜«¿yŠ¿ÿÙ'),(8,'Nissan Qashqai',110.00,'ÿØÿácExif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0·\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0¬(\0\0\0\0\0\0\01\0\0\0\0\"\0\0\0´2\0\0\0\0\0\0\0Ö‡i\0\0\0\0\0\0\0ì\0\0$\0\0\0\0\nü€\0\0\'\0\nü€\0\0\'Adobe Photoshop CC 2014 (Windows)\02016:01:11 01:52:07\0\0\0\0\0\0\0\0\00221 \0\0\0\0ÿÿ\0\0 \0\0\0\0\0\0 \0\0\0\0\0\0\0´\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0r\0\0\0\0\0\0z(\0\0\0\0\0\0\0\0\0\0\0\0\0‚\0\0\0\0\0\0Ù\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0ÿØÿí\0Adobe_CM\0ÿî\0Adobe\0d€\0\0\0ÿÛ\0„\0			\n\r\r\rÿÀ\0\0i\0 \"\0ÿİ\0\0\nÿÄ?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q2‘¡±B#$RÁb34r‚ÑC%’Sğáñcs5¢²ƒ&D“TdEÂ£t6ÒUâeò³„ÃÓuãóF\'”¤…´•ÄÔäô¥µÅÕåõVfv†–¦¶ÆÖæö7GWgw‡—§·Ç×ç÷\05\0!1AQaq\"2‘¡±B#ÁRÑğ3$bár‚’CScs4ñ%¢²ƒ&5ÂÒD“T£dEU6teâò³„ÃÓuãóF”¤…´•ÄÔäô¥µÅÕåõVfv†–¦¶ÆÖæö\'7GWgw‡—§·ÇÿÚ\0\0\0?\0Úû8ğKĞ\nÑbmŠEoCÉ/AYØŸbJk\nBD|•L§ôÊJkz!?¢ŸL¥é””ÖôBoD+^™ğHÖ|SSÑ	z!Y5”ÛJJ@*\nb ‰µ SSSŠ‡‚ \n@$¤^ˆMè„xJS_Ñ	ZÚ–ÄTÿ\0ÿĞë}$ş‰VÅcÁHT<ÖÓLPTÆ7’ºÊAìŒÊ‚VªsÆ)Rû\'’¶üœFh¨f!š‰ş·ÑAwQk~!Æ~ŒOÁÎk}ßÙKTÒ?²y\'ˆnúÇÒÅ¨zŒ%®d8áôšáUvmQwÖNßÌwù¯ÿ\0¿1‰Qìı¥öEŸo×œÃ¶6»´?óãP?çc.pewµ®q\r`ôÇ\'ÚŞE¿œhê;ø!;„,>«ÕE¾–u8×0ñe.uÈüÓ‰˜=g1‹V«1ò	mf,h—ÒğY`¼kw»gü#Eü´5«Båœr›Ğ+Qô3H’µS)*B’®ú>IÅA%SPRSú*ç¦ŠÇ‚J¦˜¤§ôJ»é½1à•ªŸÿÑïÃTÚB#©ÈHÆ…•×:Óq,4¼2ë65Ö8NßP™öé¿Ó¢«íÿ\0¶êüõªû[FÖËŒëÎĞãaoçmX][¢¸Ú}\"Ú2±\'Ò¿W4µÒË*ÈoÓk½ÛØïÌ±º‹‘×úÕnÄ¶œy°zmy\'tå\rÿ\058ë8ØØõ†€Ñô+6í`\r÷şò©“õ7¯ÔI¬’\\lônmIZ»/¡ôûíÇËÆôÅ\rÓ8–^ö—\0ıµÔ]MŸKü©ÖJİG&¬œÚø³µƒÒÌ`:¶?›¹ß½èoşŞ5«›ÈËx³İ¨P¯t~«Óÿ\0çC±:cöÖ;ÖÇ±cD3qw§hşiß¤fÏå§Êú—Ôı{Ó¬¢ì`O¢-±Ì{ş‰ïôß]»2ÍéZ©Ê~i-5´L¸¸j`è\Zïê£[1©Ê«põÇ™Ğ£>ĞÖÿ\08Äg}GúÔİE®ÿ\0Ğ?ê«E§êGÖw°Ö÷bQ_po}ƒßC§%há/SÑú«súuvÛcÍq¦ö½ÍÖÆÿ\0_éz÷«®c@sNÖ™c	,-şV=¬>®+ÿ\0â—3õ=ÁŞ·VÇg¨\"Æ×ç’?wô÷±jáıVÊÅO_Ì\0i±Œ¥ äŒ†åí@Ò„H.å9¯®²ûË¯¡¿NğÑêWÿ\0†©¯Úæÿ\0İ¬vìÿ\0KM_Î«Môí­¶ÖwW`c‡¢à²1z ¢ÏV®«–ë´İe¶°Ì!˜õÖµ0°3(ö±Îsâ·îhsçì®Ïmls½ş¢ÿ\0ƒM!{#Zmˆ§Ôc¢ï tOíşçúûÑI‰Õ+SZ…76RéÔAJRSÿÒïÁEa@\0¢×)Èg“—N#uî¯VÉÒgj_dÅuD±ÛKœ^_¡2îÎşJâ?Æ˜~E§:×UFM¹°´ÁİSiô£ù¥w¦¯}OêwçtVÓe¡÷á¿ìÖY»Úñ´[‹nÿ\0øjô‘\n/Hü<©i¦Ğà	.×@Úİ®ÿ\0«C}™´ˆs\\Ö\"@ÿ\0ÀÎßú*»¬È¡å®ÜÃ¦†TÛÔ¯oçñI±Ç»9æØ0ÑÉÔvÜƒw¨Ç¸4˜\0šh@V¬ê¯enµÅµ±.s»\0%ßÙ\\¥ã\'¤œï²[_¬Ç;iÜöú“ıG7Ğßÿ\0öSş¸’ƒ·fc1+uÖ¹ÔÔÏ¦è/NÙw¥ê{•µN®­³\'ÍÓ´‡°ı]Y½MÇõU™…g«‹xİSµĞƒµõ»v×·k½®cÿ\0I_óV.w#¡ßv_ììjíÃÌÏA¯ôßV@Ï²§SeV~‰Ï®§}:kı¥ëz¥/N\Z]«u#_ÈˆÆäëàAp\\!éUŒÜ{i¼dSYs²È}\r±îØ×Ûöª÷×U”9ölçŸúOø5W¦ÙÖ²-èùàİm/}8=Oq³,msúgR\ruf±¬c}O]•Ù³÷ìJ‘o¢\Z/çÑpÕ0˜2à7Cƒ{şrò¼ÿ\0ª¿Y±³¯£¦ßwV§Ö±.y\0ÉıÚë}¹Umı55>ßKØ‰gHÌët6«‰gNêôˆ«\'&—UN@oÑm¶†ú>·òÿ\0ğK)ı/¤duìV¸eu<z[Ám—³Ãèí.s·,n¯õ÷£ôÌFdTû³Íí{±›@s*x¬š¬?i¿oè™c}?ÑWzâ±°³N	é–ôÛ†F=VĞXæ¼3ysî¦êìö`5­ºÆ>Ì«nõ¶3õWôk¢Áú“šŞœsíõ0º~(¥´VâßVçYf^M¯¶=˜íºİµ²¯Òß³üJ{ì§dÓc-Ûëâ¿Ñ¸6H\rkş“€İô‘\\³º]c&ÏÒ¾Û2œ\\ıûD˜.ÒªCk¯İîİùïZ@î¦2”¨ÊyEOÿÓô_L)5€%¹1xNCÎŒ\\<kúY6Ë_‰“[«µ•‹\\Ógèƒv)öÛo ßç=Ë?1pTuj:^Q®­Øc}!è¹Õ¹¦¿qmí¹®£\"Û=oRÏ§Cëôı—¤}blé™8/l¶ö@ i3ÜAÛïgÓ^7ÕMïÉúoséÜÒ\rnk·9î¦Zïô-siİÿ\0¢ÒºSßôßñ†F>[‘LH{@nœ{±¬s˜ÏúÅşšè1z¯@ê0)´ãÚî…oÚÿ\0ûozó¬[°1:UX6bWcÀß{Ë%æ×}7¿œfÆş‹ôN¯ùµfSj$cïk¦·ûÛ§ügÒşÚ*§½úû•nÕëÙK¦ëì®†wÜw{Í^mƒĞC×>º­¹Ï±û\Zk nÈv5m[“ém³İéûı;=/æÕÜÎ³‘›…ö;,~Æ9¥¥Äµ¯ŸKÔ\r³Ô{v²ßkj³ÓWPÃêË»§ÛCqwUkXĞêíÃØì\'²‹çĞû_Ù,Ùéz]ŸCõŸÑä\" ëıDëVÕ{z^]¢Ü|Øû=­væú 9´=Ûƒ^ÇŞÚ‹gªÊû*Ç±v¢$OÈñú}»ÎM9\rhÆg§„ikßfE´0\\ãSZÛ[EV7ÖÈÉ·ôXÿ\0×^«Óò›Ô°±óªÜªÛl7X.c±fö¥ju1ßS!ÅÑi¯şIO3ìï Zæ›\Zã´2ÈtÎ#©µQµøøµòìÔÏ¤ëhù*øİc§õráÓ²kÊôÀi®—9 ÿ\0#ém$7_•M4ÉŠé©º—¹Œcı¦¶ºÚ¨××ºvW¬ÌLŠ2,¿Ó~öµ®;¿Ó­Ûœ¼óë·Ö6õLß°â¸?§á¸€F­¶á,²ÿ\0å×WóXßõËÿ\0Ã,›Öú§IuÎé¶6“Ö²Ç:¶<–´—¶Æ7éşâV§ÔÙ—Š÷F5Bç	 QI³İ.Ù·”¯Õ.Àé¹yV}ãW”ö7Õ°¶¦ã5ÕŞÿ\0ÎşºóL¯¬]1»rz–KØÁ‹Kÿ\0mQé±g0Kãâã÷}7!i§Ô>¢ıeÈêıMø™†³}nÔknÏgóvÖX?:¹c÷.õÍ•â¿SzwT³«âe`ÓsöZÍÙ,k›Mlk­u¹\'ô[v7Şİß¥şm{I±®\'o‡’EA¬%é©ÈJRSÿÔîşĞ<Rõ¼ÖwÚ<ÒûGš}\"Û–9¯u\n•ı?\Záïn‰ı4Æÿ\04©Vçd}^Åx;@X]GêÀ\0–…ÖúŞj{]¡J•o˜çt‹èkËî\0–ˆäU<jqúc«·$5¥Û+©­¶ÆÜíFüªİ¶ªöÿ\04ÿ\0§¾ße~——Óé¸{~—Ár=SêçRÄ§Õëce4¶ú«%Í±ççó-}¥¥«h:ªNG»1ØÔ5ùØ÷†9õ»$oû~-ÔŠ¬·íN}6Óÿ\0h®şw×®õ÷º›×›âöKdÑ…£M¹İ=­v.&]Y¬®Ìvßc\\Æ¶»Kml`k¬ı-Ìg©fÆoşkÕev35¸y\0AaoÅ%6èê÷Ôd5¤G¶×ÓÙõK¿Gc}¼ª©eŒÇu•zÃm×P³ı]S)kiwøV{ı_b‹pÜIDfd­TÖxÅÍ—‘Ú[\n\0ÀÓÎV}.×ğÃ÷+¸ÿ\0WòG¶>(«g¬[áôZ<@Õt}	˜ØkßUÖƒ\"Û˜ğ‘¾ZÏì5]Åú·¼ıËc£ãÓÛå*Uºx}JëZİÄ4jS’â•—Mu×°.\0s¢T‹uFF‰şÑæ²şÑæŸíiR­ÿÕØûB_hUR-mı¡/´*‰$¦×Ú<ÒõüÕT’Sk×Mê…Y$™şŸLJ«f%‡VŠ\"I%ªzVı¦ÎŠÎ>(á$•ªÍ¢¦ğ\Z\Z8PL’“‡€ŸÕ\nºI)².Oëª©$†×¬›×U’IOÿÙÿíöPhotoshop 3.0\08BIM\0\0\0\0\0Z\0%G\0\0s\0\08BIM%\0\0\0\0\0ñ?3k˜³•\"X×ÂeF>8BIM:\0\0\0\0\0å\0\0\0\0\0\0\0\0\0\0\0printOutput\0\0\0\0\0\0\0PstSbool\0\0\0\0Inteenum\0\0\0\0Inte\0\0\0\0Clrm\0\0\0printSixteenBitbool\0\0\0\0printerNameTEXT\0\0\0\0\0\0\0\0printProofSetupObjc\0\0\0\0P\0r\0o\0o\0f\0 \0S\0e\0t\0u\0p\0\0\0\0\0\nproofSetup\0\0\0\0\0\0\0Bltnenum\0\0\0builtinProof\0\0\0	proofCMYK\08BIM;\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0printOutputOptions\0\0\0\0\0\0\0Cptnbool\0\0\0\0\0Clbrbool\0\0\0\0\0RgsMbool\0\0\0\0\0CrnCbool\0\0\0\0\0CntCbool\0\0\0\0\0Lblsbool\0\0\0\0\0Ngtvbool\0\0\0\0\0EmlDbool\0\0\0\0\0Intrbool\0\0\0\0\0BckgObjc\0\0\0\0\0\0\0\0\0RGBC\0\0\0\0\0\0\0Rd  doub@oà\0\0\0\0\0\0\0\0\0Grn doub@oà\0\0\0\0\0\0\0\0\0Bl  doub@oà\0\0\0\0\0\0\0\0\0BrdTUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Bld UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0RsltUntF#Pxl@R\0\0\0\0\0\0\0\0\0\nvectorDatabool\0\0\0\0PgPsenum\0\0\0\0PgPs\0\0\0\0PgPC\0\0\0\0LeftUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Top UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Scl UntF#Prc@Y\0\0\0\0\0\0\0\0\0cropWhenPrintingbool\0\0\0\0cropRectBottomlong\0\0\0\0\0\0\0cropRectLeftlong\0\0\0\0\0\0\0\rcropRectRightlong\0\0\0\0\0\0\0cropRectToplong\0\0\0\0\08BIMí\0\0\0\0\0\0H\0\0\0\0\0H\0\0\0\08BIM&\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?€\0\08BIM\r\0\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\08BIMó\0\0\0\0\0	\0\0\0\0\0\0\0\0\08BIM\'\0\0\0\0\0\n\0\0\0\0\0\0\0\08BIMõ\0\0\0\0\0H\0/ff\0\0lff\0\0\0\0\0\0\0/ff\0\0¡™š\0\0\0\0\0\0\02\0\0\0\0Z\0\0\0\0\0\0\0\0\05\0\0\0\0-\0\0\0\0\0\0\0\08BIMø\0\0\0\0\0p\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿè\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿè\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿè\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿè\0\08BIM\0\0\0\0\0\0\0\0\0\0@\0\0@\0\0\0\08BIM\0\0\0\0\0\0\0\0\08BIM\Z\0\0\0\0A\0\0\0\0\0\0\0\0\0\0\0\0\0\0´\0\0\0\0\0\0n\0i\0s\0s\0a\0n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0´\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0null\0\0\0\0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0\0´\0\0\0\0Rghtlong\0\0\0\0\0slicesVlLs\0\0\0Objc\0\0\0\0\0\0\0\0slice\0\0\0\0\0\0sliceIDlong\0\0\0\0\0\0\0groupIDlong\0\0\0\0\0\0\0originenum\0\0\0ESliceOrigin\0\0\0\rautoGenerated\0\0\0\0Typeenum\0\0\0\nESliceType\0\0\0\0Img \0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0\0´\0\0\0\0Rghtlong\0\0\0\0\0urlTEXT\0\0\0\0\0\0\0\0\0nullTEXT\0\0\0\0\0\0\0\0\0MsgeTEXT\0\0\0\0\0\0\0\0altTagTEXT\0\0\0\0\0\0\0\0cellTextIsHTMLbool\0\0\0cellTextTEXT\0\0\0\0\0\0\0\0	horzAlignenum\0\0\0ESliceHorzAlign\0\0\0default\0\0\0	vertAlignenum\0\0\0ESliceVertAlign\0\0\0default\0\0\0bgColorTypeenum\0\0\0ESliceBGColorType\0\0\0\0None\0\0\0	topOutsetlong\0\0\0\0\0\0\0\nleftOutsetlong\0\0\0\0\0\0\0bottomOutsetlong\0\0\0\0\0\0\0rightOutsetlong\0\0\0\0\08BIM(\0\0\0\0\0\0\0\0?ğ\0\0\0\0\0\08BIM\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\08BIM\0\0\0\0õ\0\0\0\0\0\0 \0\0\0i\0\0à\0\0Äà\0\0Ù\0\0ÿØÿí\0Adobe_CM\0ÿî\0Adobe\0d€\0\0\0ÿÛ\0„\0			\n\r\r\rÿÀ\0\0i\0 \"\0ÿİ\0\0\nÿÄ?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q2‘¡±B#$RÁb34r‚ÑC%’Sğáñcs5¢²ƒ&D“TdEÂ£t6ÒUâeò³„ÃÓuãóF\'”¤…´•ÄÔäô¥µÅÕåõVfv†–¦¶ÆÖæö7GWgw‡—§·Ç×ç÷\05\0!1AQaq\"2‘¡±B#ÁRÑğ3$bár‚’CScs4ñ%¢²ƒ&5ÂÒD“T£dEU6teâò³„ÃÓuãóF”¤…´•ÄÔäô¥µÅÕåõVfv†–¦¶ÆÖæö\'7GWgw‡—§·ÇÿÚ\0\0\0?\0Úû8ğKĞ\nÑbmŠEoCÉ/AYØŸbJk\nBD|•L§ôÊJkz!?¢ŸL¥é””ÖôBoD+^™ğHÖ|SSÑ	z!Y5”ÛJJ@*\nb ‰µ SSSŠ‡‚ \n@$¤^ˆMè„xJS_Ñ	ZÚ–ÄTÿ\0ÿĞë}$ş‰VÅcÁHT<ÖÓLPTÆ7’ºÊAìŒÊ‚VªsÆ)Rû\'’¶üœFh¨f!š‰ş·ÑAwQk~!Æ~ŒOÁÎk}ßÙKTÒ?²y\'ˆnúÇÒÅ¨zŒ%®d8áôšáUvmQwÖNßÌwù¯ÿ\0¿1‰Qìı¥öEŸo×œÃ¶6»´?óãP?çc.pewµ®q\r`ôÇ\'ÚŞE¿œhê;ø!;„,>«ÕE¾–u8×0ñe.uÈüÓ‰˜=g1‹V«1ò	mf,h—ÒğY`¼kw»gü#Eü´5«Båœr›Ğ+Qô3H’µS)*B’®ú>IÅA%SPRSú*ç¦ŠÇ‚J¦˜¤§ôJ»é½1à•ªŸÿÑïÃTÚB#©ÈHÆ…•×:Óq,4¼2ë65Ö8NßP™öé¿Ó¢«íÿ\0¶êüõªû[FÖËŒëÎĞãaoçmX][¢¸Ú}\"Ú2±\'Ò¿W4µÒË*ÈoÓk½ÛØïÌ±º‹‘×úÕnÄ¶œy°zmy\'tå\rÿ\058ë8ØØõ†€Ñô+6í`\r÷şò©“õ7¯ÔI¬’\\lônmIZ»/¡ôûíÇËÆôÅ\rÓ8–^ö—\0ıµÔ]MŸKü©ÖJİG&¬œÚø³µƒÒÌ`:¶?›¹ß½èoşŞ5«›ÈËx³İ¨P¯t~«Óÿ\0çC±:cöÖ;ÖÇ±cD3qw§hşiß¤fÏå§Êú—Ôı{Ó¬¢ì`O¢-±Ì{ş‰ïôß]»2ÍéZ©Ê~i-5´L¸¸j`è\Zïê£[1©Ê«põÇ™Ğ£>ĞÖÿ\08Äg}GúÔİE®ÿ\0Ğ?ê«E§êGÖw°Ö÷bQ_po}ƒßC§%há/SÑú«súuvÛcÍq¦ö½ÍÖÆÿ\0_éz÷«®c@sNÖ™c	,-şV=¬>®+ÿ\0â—3õ=ÁŞ·VÇg¨\"Æ×ç’?wô÷±jáıVÊÅO_Ì\0i±Œ¥ äŒ†åí@Ò„H.å9¯®²ûË¯¡¿NğÑêWÿ\0†©¯Úæÿ\0İ¬vìÿ\0KM_Î«Môí­¶ÖwW`c‡¢à²1z ¢ÏV®«–ë´İe¶°Ì!˜õÖµ0°3(ö±Îsâ·îhsçì®Ïmls½ş¢ÿ\0ƒM!{#Zmˆ§Ôc¢ï tOíşçúûÑI‰Õ+SZ…76RéÔAJRSÿÒïÁEa@\0¢×)Èg“—N#uî¯VÉÒgj_dÅuD±ÛKœ^_¡2îÎşJâ?Æ˜~E§:×UFM¹°´ÁİSiô£ù¥w¦¯}OêwçtVÓe¡÷á¿ìÖY»Úñ´[‹nÿ\0øjô‘\n/Hü<©i¦Ğà	.×@Úİ®ÿ\0«C}™´ˆs\\Ö\"@ÿ\0ÀÎßú*»¬È¡å®ÜÃ¦†TÛÔ¯oçñI±Ç»9æØ0ÑÉÔvÜƒw¨Ç¸4˜\0šh@V¬ê¯enµÅµ±.s»\0%ßÙ\\¥ã\'¤œï²[_¬Ç;iÜöú“ıG7Ğßÿ\0öSş¸’ƒ·fc1+uÖ¹ÔÔÏ¦è/NÙw¥ê{•µN®­³\'ÍÓ´‡°ı]Y½MÇõU™…g«‹xİSµĞƒµõ»v×·k½®cÿ\0I_óV.w#¡ßv_ììjíÃÌÏA¯ôßV@Ï²§SeV~‰Ï®§}:kı¥ëz¥/N\Z]«u#_ÈˆÆäëàAp\\!éUŒÜ{i¼dSYs²È}\r±îØ×Ûöª÷×U”9ölçŸúOø5W¦ÙÖ²-èùàİm/}8=Oq³,msúgR\ruf±¬c}O]•Ù³÷ìJ‘o¢\Z/çÑpÕ0˜2à7Cƒ{şrò¼ÿ\0ª¿Y±³¯£¦ßwV§Ö±.y\0ÉıÚë}¹Umı55>ßKØ‰gHÌët6«‰gNêôˆ«\'&—UN@oÑm¶†ú>·òÿ\0ğK)ı/¤duìV¸eu<z[Ám—³Ãèí.s·,n¯õ÷£ôÌFdTû³Íí{±›@s*x¬š¬?i¿oè™c}?ÑWzâ±°³N	é–ôÛ†F=VĞXæ¼3ysî¦êìö`5­ºÆ>Ì«nõ¶3õWôk¢Áú“šŞœsíõ0º~(¥´VâßVçYf^M¯¶=˜íºİµ²¯Òß³üJ{ì§dÓc-Ûëâ¿Ñ¸6H\rkş“€İô‘\\³º]c&ÏÒ¾Û2œ\\ıûD˜.ÒªCk¯İîİùïZ@î¦2”¨ÊyEOÿÓô_L)5€%¹1xNCÎŒ\\<kúY6Ë_‰“[«µ•‹\\Ógèƒv)öÛo ßç=Ë?1pTuj:^Q®­Øc}!è¹Õ¹¦¿qmí¹®£\"Û=oRÏ§Cëôı—¤}blé™8/l¶ö@ i3ÜAÛïgÓ^7ÕMïÉúoséÜÒ\rnk·9î¦Zïô-siİÿ\0¢ÒºSßôßñ†F>[‘LH{@nœ{±¬s˜ÏúÅşšè1z¯@ê0)´ãÚî…oÚÿ\0ûozó¬[°1:UX6bWcÀß{Ë%æ×}7¿œfÆş‹ôN¯ùµfSj$cïk¦·ûÛ§ügÒşÚ*§½úû•nÕëÙK¦ëì®†wÜw{Í^mƒĞC×>º­¹Ï±û\Zk nÈv5m[“ém³İéûı;=/æÕÜÎ³‘›…ö;,~Æ9¥¥Äµ¯ŸKÔ\r³Ô{v²ßkj³ÓWPÃêË»§ÛCqwUkXĞêíÃØì\'²‹çĞû_Ù,Ùéz]ŸCõŸÑä\" ëıDëVÕ{z^]¢Ü|Øû=­væú 9´=Ûƒ^ÇŞÚ‹gªÊû*Ç±v¢$OÈñú}»ÎM9\rhÆg§„ikßfE´0\\ãSZÛ[EV7ÖÈÉ·ôXÿ\0×^«Óò›Ô°±óªÜªÛl7X.c±fö¥ju1ßS!ÅÑi¯şIO3ìï Zæ›\Zã´2ÈtÎ#©µQµøøµòìÔÏ¤ëhù*øİc§õráÓ²kÊôÀi®—9 ÿ\0#ém$7_•M4ÉŠé©º—¹Œcı¦¶ºÚ¨××ºvW¬ÌLŠ2,¿Ó~öµ®;¿Ó­Ûœ¼óë·Ö6õLß°â¸?§á¸€F­¶á,²ÿ\0å×WóXßõËÿ\0Ã,›Öú§IuÎé¶6“Ö²Ç:¶<–´—¶Æ7éşâV§ÔÙ—Š÷F5Bç	 QI³İ.Ù·”¯Õ.Àé¹yV}ãW”ö7Õ°¶¦ã5ÕŞÿ\0ÎşºóL¯¬]1»rz–KØÁ‹Kÿ\0mQé±g0Kãâã÷}7!i§Ô>¢ıeÈêıMø™†³}nÔknÏgóvÖX?:¹c÷.õÍ•â¿SzwT³«âe`ÓsöZÍÙ,k›Mlk­u¹\'ô[v7Şİß¥şm{I±®\'o‡’EA¬%é©ÈJRSÿÔîşĞ<Rõ¼ÖwÚ<ÒûGš}\"Û–9¯u\n•ı?\Záïn‰ı4Æÿ\04©Vçd}^Åx;@X]GêÀ\0–…ÖúŞj{]¡J•o˜çt‹èkËî\0–ˆäU<jqúc«·$5¥Û+©­¶ÆÜíFüªİ¶ªöÿ\04ÿ\0§¾ße~——Óé¸{~—Ár=SêçRÄ§Õëce4¶ú«%Í±ççó-}¥¥«h:ªNG»1ØÔ5ùØ÷†9õ»$oû~-ÔŠ¬·íN}6Óÿ\0h®şw×®õ÷º›×›âöKdÑ…£M¹İ=­v.&]Y¬®Ìvßc\\Æ¶»Kml`k¬ı-Ìg©fÆoşkÕev35¸y\0AaoÅ%6èê÷Ôd5¤G¶×ÓÙõK¿Gc}¼ª©eŒÇu•zÃm×P³ı]S)kiwøV{ı_b‹pÜIDfd­TÖxÅÍ—‘Ú[\n\0ÀÓÎV}.×ğÃ÷+¸ÿ\0WòG¶>(«g¬[áôZ<@Õt}	˜ØkßUÖƒ\"Û˜ğ‘¾ZÏì5]Åú·¼ıËc£ãÓÛå*Uºx}JëZİÄ4jS’â•—Mu×°.\0s¢T‹uFF‰şÑæ²şÑæŸíiR­ÿÕØûB_hUR-mı¡/´*‰$¦×Ú<ÒõüÕT’Sk×Mê…Y$™şŸLJ«f%‡VŠ\"I%ªzVı¦ÎŠÎ>(á$•ªÍ¢¦ğ\Z\Z8PL’“‡€ŸÕ\nºI)².Oëª©$†×¬›×U’IOÿÙ\08BIM!\0\0\0\0\0]\0\0\0\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0 \0C\0C\0 \02\00\01\04\0\0\0\08BIM\0\0\0\0\0\0\0\0\0\0ÿá¾http://ns.adobe.com/xap/1.0/\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.5-c021 79.155772, 2014/01/13-19:44:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\" xmlns:photoshop=\"http://ns.adobe.com/photoshop/1.0/\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:DocumentID=\"F1C8DF936E23926E555B6CF4CA6770CD\" xmpMM:InstanceID=\"xmp.iid:9581f4a7-e4c2-9049-883c-a3e79e85335c\" xmpMM:OriginalDocumentID=\"F1C8DF936E23926E555B6CF4CA6770CD\" dc:format=\"image/jpeg\" photoshop:ColorMode=\"3\" xmp:CreateDate=\"2016-01-11T01:50+02:00\" xmp:ModifyDate=\"2016-01-11T01:52:07+02:00\" xmp:MetadataDate=\"2016-01-11T01:52:07+02:00\"> <xmpMM:History> <rdf:Seq> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:9581f4a7-e4c2-9049-883c-a3e79e85335c\" stEvt:when=\"2016-01-11T01:52:07+02:00\" stEvt:softwareAgent=\"Adobe Photoshop CC 2014 (Windows)\" stEvt:changed=\"/\"/> </rdf:Seq> </xmpMM:History> </rdf:Description> </rdf:RDF> </x:xmpmeta>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 <?xpacket end=\"w\"?>ÿî\0Adobe\0d\0\0\0\0ÿÛ\0„\0		\n\n\n\n\r\rÿÀ\0\0´\0ÿİ\0\0#ÿÄ¢\0\0\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\0s\0!1AQa\"q2‘¡±B#ÁRÑá3bğ$r‚ñ%C4S’¢²csÂ5D\'“£³6TdtÃÒâ&ƒ	\n„”EF¤´VÓU(\ZòãóÄÔäôeu…•¥µÅÕåõfv†–¦¶ÆÖæö7GWgw‡—§·Ç×ç÷8HXhxˆ˜¨¸ÈØèø)9IYiy‰™©¹ÉÙéù*:JZjzŠšªºÊÚêú\0m\0!1AQa\"q‘2¡±ğÁÑá#BRbrñ3$4C‚’S%¢c²ÂsÒ5âDƒT“	\n&6E\Z\'dtU7ò£³Ã()Óãó„”¤´ÄÔäôeu…•¥µÅÕåõFVfv†–¦¶ÆÖæöGWgw‡—§·Ç×ç÷8HXhxˆ˜¨¸ÈØèø9IYiy‰™©¹ÉÙéù*:JZjzŠšªºÊÚêúÿÚ\0\0\0?\0–ıPxeí.ú¯¶*ïªûb®ú¯¶*×Õı±W}_Û]è{b­ı_Û]õlUŞğ8ªï«ŸŠ·èŠ»êşØ«¾®|*ï«ûb®ú¿¶*·Ğ>»Ñ>«_WöÅôÅ[ôO†*Ø„øbª‹ğÅ+ÄÀâ«ÖßÛoêşØ«WöÀ­ı_ÛwÕı±W}_ÛkêçÀáU¦ÜøU¯«ŸP´Ûûb«>¬<1KÿĞŸ˜†^ÒïHb«}!Š»Ò«½!Š»Ò«½!Š®ô†*ïOÛoÒªïOw§íŠ»ÓöÅ[ôñV½?lUŞ–*·€Å-z~Ø«¸b‡pÅ]Ão€ÅWÅ+ÕqUê¸ªà¸ªåA[à1Wp«¸U¿O\n­ôı±WzC5éU¯Db—ÿÑé^Ô·ÓÅ]éâ®ôñWzx«½<UŞ*ïLâ«½3Š®ô±V½3áŠ®ôı±Wz~Ø«½?lUŞŸ¶*ïOÛkÒÅVúg[éâ«xœUÜqC¸â«©Š[ªõÅ—\\¸¥v*»(wU¾8«¸â®áŠ»†*×§Š¿ÿÒê>™ËÚšôqWz8«½lUw 1WzØ«koíŠª}[Ûoê¾Øªïªûb®ú©ğ?v*ïªŸ÷b«¾«ìqW}WØıØ«T¥ßS«FÓÛZÖØª“Zûb…míŠ¬6şØ¡o£íŠµéb—ı±Uá(\\±â«Ö<RÚÇíŠ¯ôı±BïGÛw£íŠ®ôqVıUŞ*ïGÿÓë¾–\\Ôß¢|1VılUrÛûb«…·¶UâÔømUVÓÛ#i¥U²öÆÖ—‹!á­7õ/lmiwÔ‡†6´ï©{ckMıKÛZ]õ/lmißPö8²oê#kêÇ­ki¶<J¤öØm(=—¶6´¢Ö~Ç%h¥&´öÆÖ–}WÛ»ê¾Ø«¾¬1VÅ¿¶*½mı±UëoíŠ¯{b­ı_Û]è{b­ı_Û]õl6´ï«ûckNú¿¶FÖŸÿÔí~†\\Ö¿ĞªåƒÛ\\ ªªÛ­+-°ÆÖ•’Ù~ş˜+­ŸjoáŠ¯[?lVš)\042(>îªŸU¯lU¿ªŠW¶*ãj]±M4c„uu21İik=šŠ´Ñ¨ñ,£øä¨¡>·£Aöæ¯ú‰#~¡A¿š´¡ö`¹õ\"ş&ÃAÙşcy*êèÚ~‘[[¥n\rÏîèÃöyw_§[#6èÈ$RlW‚BE*2Z×oìÅ4 öƒÃ\r±¤;Z{ckJFÛÛ\n)oÕ½±ZkêŞØU¿CÛ\\°{b«ÄØ«bUx€b­ˆ1UŞ†*ß¡‘K½UŞ†§ÿÕîŞZÅz¦*½cÅUU]\"È¥¿¦*¨æ8¡3Jx¢îÍND’i°Ò-\'Ÿ^‘‹-¼ã²ó?ÉA¶N–ÒkÍu}UŠòu3>ÉÒÉ Wefˆ™*A*Mqë\'§Â.=ı8à›î™eü1¦$¥º®¿ªèöI4µÕ£\ZVÂpRh\rY¾8ë¶Øğ$”¶?9ës\0ÿ\0RŒFECMu)Ø{“àcjSyÎøuÉ>bY?[Gñ ¥óåïóÚ­:úVª?âløğ/\Z]7æ¶§’@$P7áèàOşeêiÉ«áÉWş\"©Šñ*EçË©z@ÏOøº_ù«%™?—­u+d{Í6è&PT™ÙÉ\r¿W\nkï‹Qú›i¡DaÓf¾ÑECz^©¸¶¯qéÍÍü¯I“—ìÉ!“*¶óÜ0óÕ [’µÕ,ƒ4B¿ïøH’xÉ`ÓÇşüš,Ä“ˆıˆxe‚@\Z9P†F¡V¾JoşIéŠ¨´Rh±V½’C^Å\\#ÅWğÅ[áŠ®	Š®ôı±Vı<Uw§Š»ÓÅZà2)ÿÖï¼rÖ+•qUE\\UYb¨„\"•F)oM!#5Úƒ\n°CÍ³_jVV…R;Ry%b§kY1ğ†vd.|Ù¹r’/ØÉ\0ÂĞú¾©§¤E½mÉ~ˆÇîÓı‚¦N–ŞuaªÁqç)¯Ø†Ú7hÔl9\"‹mşÒğÓY,ÌêÖ«\0••ØïôŒi‰’.ÃV°ÕV{yz…XLB$^4.@ëO±5~Ô¾~<›m–Àõx[HºŸN™xÑì]êCÂ:«•õÉ[-{©ËüØÚ)	m}ÎÉq\'\n£pjĞs=+­)&´RÒX\0ŞF¾\0u¡È¢Ú²0^Ü¬r:ÆdZ))Ë—ù;ş¼VÑW6i×\n¾¡ã0ÙûıØ­½+òÓÌ‚ê	´Ë‡¬öõhªgö€ù7ïın?³‹Y×2>/‰¯È„–Óú– \r‘OÀ}ŠïOö9q\"lã…®š]2a¤êrÒÀG;+–5©’.‰!©ÿ\0Hƒ„şîi»Êœ›	Í–°³N,o :~¦¿V‘ƒ$€u{y>Ì±ö\'û¶(±J5âQ1b«xP³ÓöÅ]Ãk*İ0«t8ªüU¼U¼UØ«tÀ—ÿ×ôZÅxÅW¢â”DKŠ¢QNÃ¹é‘Kóœš–‰{gb~8ÔUªÁxjzzˆ\Z*şÏ<“ğË4Ü6§¨İ±+Sº–x¤Iê5û5i¾5ÿ\0Šòë`¡¨y‰å,…œô¡¨ÆÕ)Ò$¸{‰d’GD\n€±!Õ;yñ¶Êï´o5İ¤	gc+Â‹»1_)mŠAwæ,_[İ^Ú5¼ˆA‹—‰À4(Y*8²ìËö²6Ø7×­í¼İå˜ïtÓ]BÜ	-ÙÉ7?Íğ¼Nßñãléä“^úêZœH4)Üí’¶—<çZS$ôÈÚÒ­½á‚ê­8:Ÿ ñµ¤û\\Ôôû« Ğ9õ!pUHìv;ı8±¥º/™$Ò5k=J#^’Æ?hµëXÿ\0ÙòÅiè²~møÈö6æ7¡Ev²LªİÛŠƒåõqaÂÈ­<ùå[ÅQàˆ·ìNìš‰øâ¼)”úŞ’‘Ö{ëuSöKJ€ı¸8Y„F™ç-jöÇMÕæŠâ5?»‘[âVZÑãu5FşFN,¿Ï€Å´I¡/—u;Q¨^=ÆƒvLš€fø‘.~Ã:ı™=9—îâø=HÍ–¤Nh’-|\ZVÌCîë…+@ôïÓXÉ½;â«Z<U®9%v*ìPÕF*»ouqWÿĞïë–±^¸ªª`J.5ÅTïoQ¡f˜3<€TF££0ï€*Roîc&8sÅSÍXqcï’bÂ¼ÃùK·}6¥¤Î¶OuûÉíåSÇÕ?¶|JÍOŞSÔåö¾ßÛ±¦}ù;æë\'õ8.À­Çítûk6´Šò†¬h\Z…éÔìŞiÖ_ô‰(Q8àÅ•¨•:ãl@Nôÿ\01i);=æ¡o<^f)£ŒŠ{òclÄXß?0¼‡¡ŞØÁ©As$ŸİGS!ç^¼•Jrÿ\0(J¿\'<Á$º¶¡a‰­\0ÆAû%è¤ÁFíş³âÉ4ó×åMõæ­&¥¢Ío³~òêÒnQ£»nò#*È¿¼wWÿ\0v~ó\r±¦)/åæ3ı›%ÿ\0Ræ!ÿ\0#ZCÉùEù©û\Z*Iş­İ§üm&¥±~Qşn6ÇËÁùWì>ä”œV“É?Ì‹ƒIŞÇOåÔÜ4€ÂÇ&JÑÂÈì?ç|Á\'¬ù¢ÙWö’Ş\'ÜY£Æ×…8ƒşqÏOıëóü¤uzQ)ú\n¾6Æßşqÿ\0Èqïq%ıÑÿ\0‹nÙü“á¯\niiù+ùmlÊWG:ôk‹»·?òv™&\\!8OËŸ(¬\\-4›óˆù?ŞåñâG\no§ùe¬bôl£8kÈ¢ŠCÇítı’1$2L£³zqš>ê*¿E]%Ü[§©$# ˆaşÀìp%hğL…•¹öø’¬½qUV·æ¿ğ;mTReÅVÅZÂ…˜ªêŒUÜ±WrÅ_ÿÑïË–±^˜ª¼y¢ãÅ[UF¹”0©ô” öbqBKq¤ÜK«,P†^R1¡ˆ«©ğÿ\0y’UYo¯m J(]¾$ ó\\*¥>­ ŠIŞ&u‹´ »\ZôøV¸ªÈïíg^k%†õ¡QQ¸5ë…XÛşWşZNK7–t¹y±w‘í¿&ïSÉ¾Xª[{ù1ùa-¼«ƒmmÉH\r%5ö¡Å‚]åŸ è\\¹˜é–_V•×„’w,ä>)æÅY{Ej,Òìi)}ÀÛõrğ8³U{‰£4FR}€ÅW¦¦ãûÔ\rò\n?†*‰êÑ÷.cí°®*¨åıÄá‡òÖŸñ,\n‡y$=ÿ\0ÏèÅWG}2÷åóÅUEôjÈPÿ\02LU¦±òpGò“Å¾ãŠ©	¥NqUXõ+”ÿ\0vU˜o¿/˜ÁJÌÔşò/ø¡îuxZq5ªúSşÕv\'çÛpó5ÏNşŞµ[Mgë!%P¾¦ÂŸÍJş¬H[G:õöë*,¸ª“d·uF*·–*îXUÿÒïjÙk@Øª\"<ŠQqb©?˜üÅi¢8’á˜;ª€±Šš\nÔâ™húõ¡f“£rV\0ó]*GPGòä©»‰-Hã7şVÕÆ•	>“§Ü¬‘©ô™Ô|qšwğÅPÒùwŠÒ	H_¦J[>}«Dÿ\02×õ(B˜î™½6õç¿êÁlSKo.¹¶õ\\Õ›¨ÆÕ,¿±Xè:×f—2H¢ÊÈ?”ÑÇü7Åÿ\0ª™kŠU–9ˆ%?ê¦H\"üÆĞ’å­¯£¹Óî”•kyâ =}—á?ÍŠ¦ğùÏË2H©úVÚ)uŠi#Ùe*pRxo-§¡‚d—–ãƒ¨ú4ªş›‘Z\ZR½;b­ˆœôS÷b¶Ø‚QJƒ¿LRã¾«^“ÿ\0)û¾œ*²B\"^RÒ­°ğïŠ¥W~pò•¤”»Ö,áä{˜¹ÿ\0Àò®<JÆuÏË%§é®åµ†YÇüBŸ<J’ù·óÆM+Ëºv³¤èÆHu†,g¾L\r=I=ıBôõöãÃ&)7åWš|Óæ›Ÿ6ëšõüÓGee6ÖÑV8bk‹€Ü\"‰OU“â.ò/÷’61WÑú£§¢Zİ…dõQIjû×çdˆ|	Ql’b«qV±WaWÿÓï\0œµŠ lUdRŒ…±WËŸó”š¦©¨~bé¾[³i$Hìâ• F¡yæy)Èl¿¥Aû)Ëâû8B\n{ù\ræ½R#qå½ZZŞ@9n|•vj0Ø¶Ü+ÿ\0òı¼˜b^Ç6¡+÷Å\nk¨L’lç¦*Š\\¸_¶IÀ¨¨üÂ§íŠâ¨˜õ›6*¼üh0R¬m}cNTû#á4©ÿ\0›l-&\r©İÃnÎ+ÅÙQ©ãÆ¸xY¦6ƒBÖ­ÅŒÑÈ Ğ\\[º²‚;$ãÂ©Eİ¬Ö³43ÈnèGM¾ìUŠùÛÉÚg™4ÃÌ%®!ZÅ<aDÈO_LÔrÿ\0*3ğ·ìâ¬#É×úuÖ‹.‡¨êÛK¦2Åu,aÄ‰gíªŸ>/N9¿ß,ŸÍ“¶	_”áŸZÔo&ÔaŠ8måÒ2[Fctã#2`¬íø²ümÏüµÆÕ~£¦êÖĞ4ºuñ‚öy[êšdÑ@I¡P¼Ö3ñSû–çÿ\0=1áR›ykÎ~Fó%¹Ğ<Óo{åím¤5:æá1ğò•UÏ\n}¯÷d_ñ‹Ç0?-¿4ü±Ôôß1êzÇ—ØsŠşÒúå×ó7OŸ÷_å`æË‰æMæÿ\0:+qo0êÊÛloîÁß§û³+!˜,¿Èß˜×&A£ù’g¿‚â©owu<À«ÂI4oœı™¹rş&ørj’ş`y.}2éïb3\\éÀrL“@Iâ#•9©?\nL/Ø—ãûj«y	à‡AÖ½=@i2;[™o¢\n·Àµoİ½Aˆ­0R-OÎVÚTºnªÙÜÉ{5Ì’ÚItç{«ªvœJŞŸ­\nÔ_ØøŞ6Æ–ÙW|¿­ŞÚyÊ:m»İ^ØÙÏ#D§dk“\0g‘º\"V›%$=\'È–ú¿•|­©iH`ÔçÖV6Ô89¶1<D•ÊÊé\"|_‘båû8ÅQòjßXÛkÙDò½Z^hê£hÇ†Ù†E.D²wl’¬åŠµŠ»v*ÿ\0ÿÔï¾Ÿ¶XÅpV†£!\\UòçüäDo¥şojêİ§²m&Ún;Ñ•%xœ\nn´sş^†?¤k¿£¼ã¡Kiw‚ÚùáE‰%†f‘Â XÑßÒ‘‚§/İ²ı¹2a‰}!¤kš5ôHdK«CÑâaÍ}èÂÉlP™I£‚Ía8OTØ0ùŒU-›sIğ Œ\n¥êÓ®ß<UR9Oß…RŸ6y…4MkÒÀÊ£„ˆÔ`zÿ\0ª ¶*ùCÌ?šZÆ¡3Ù„•×3†g“ü #!ÄÍ>ü»üßÔ,uxŠËõ\rA¨±Ü©&GûêT?°}Ù—ıO·‡‰_Tèşj°ón„—°\rí±ãykZ˜¥ {ÆËÑ¿ßñğÒ¡Ç!±Jõ)ùsRºK»Ë(ÍêÓ…ì»˜qû?¼‹ƒ>ßëa¶(¯Ë«k›/©Ûê7qD§÷EœJÑíÆªHôş|mZO!kË¯+‹-VúÊBö÷7‚[9\0Ÿ¤—&ê§tÃÄ¥ç\'òóÇ_»×.-­ïî¤•¦;;˜Œ?ìÒqãÄÄ‡®ù.âûËšr“¦jW:…ÄgÖÒâHĞMÊµioø¶¿ğy)\0Z£lJÿ\0òH×õ[İcX´ı=ëÃJb\"€Ÿ´ÅÊşöI?o÷qÇü±äoŠA¨Î/iL\nÙkWvç 7Ç(©èOÛÛSŸ,ş^ù£A°›MÔ/ ó–ÊQ£t—Ó#‹DÉ!u’>f²óÿ\0u¨«	Ô\'L:é¿òæªÚdmWKwä’2ßh-\n¿’Ağÿ\0—…Š£şW¥[ßê-s«_ÚŠ[4¨¶öñPò¤Q~/Œæıëb¯PÓ,£¶F’tndşù—¯Ià	ßôı®XÉQï{oPª\n¢ôTş½ñŠ«éÚû¶\n8GÎäÄ×\"Ê¥È–AøUDâ®®*º§v*ÿ\0ÿÕôG¥“Bá*¨‘âªè¸«É?ç#ô+MCHÑ®êÓN¸Šâku½½<!d	Lİ8Êbø¿áq/[•ƒH–ŞÑ ½´Ÿ÷ú­ú2ŸQ´¢RÉG#Í•ø\\U’>2+sôÓ$Å1Ó¼Ç¦¡âŞY´«Å [¨	x‰ñ+ö‡İ&ZJÓ/Ñÿ\08oôùÑ/ø\\§A}fÁŸåF~Öô²-=3DüÕĞµdÉ,wİaqéJ?ç›S—û„ğ[ùzı‡¡7Õ¥=J\nı\ZTös`ÿ\0\r}™0«Â?ç%uç¶Ò-4øœ©œ1*\r~ÑãZLR	¦hÖb1>¥!Œ2™\"·§Úª’{Tn2™ò´Öë$\Z%ôp½}1õgNaiT¯\'ëû9 ~VyîçDÖêëñ´Õ£j©1ÉÔşÜ,y«Íİ¹#%}p0e`TŠ‚\rA\"UDb©º¡û$§Nm‚ £L„+LUPÙi÷÷<C® ñû±T”Íbddt<•©PA}8ªÖ¹´^Šÿ\0†*¤ÚŠ°W¥Z¸X!$Õ%qU„‘Ó`ãjb¨i¯nL’……UG\n\0éRÀ`f›V„pW¼Wi~Â[ƒ#7ÙûX†ÙÓ¢b¨{]cL»¼KH¥’âCÀ“P”\r˜7àv¥d©<—Ï™ŞlÓ|Ï©èÖÚÚÙÌ‘‘ƒF¯ñç]Û\ZZz/åœ\'óŸİ²FÒTŠé¨ Ô1ÉNÕZƒşZd=¶@	 ê:Œ‰d^<R¤bÅZôqWzgÃoÓöÅ_ÿÖô}M\râ­ŒUÆ`:š|ñWœş}é^ü»º´ÂKy¡™d¥J\n˜‹SÛÔåşÇ>kÔ¾«ªºŠ$·º´´ŠïÓ]‹ÛË§§ÁA·(ğpÿ\0Œ“;}¬“DW×)Xå<GÙ|¨M“:òo“üÇ¯Ø=ıb²µ\n^ÊæfP³2·zdÉø6f‹,*¯{eæ¸^[—·dZOŞ»Çÿ\0$òÍ˜Òs¢~bßÙ\"ª]¼(>ÌRÿ\0¤Ã÷7ïı‹ã²Ó>Ò?6ækq¡nZö¦²oZ!ş´F²\'ü”À‡—şuë:^»®é·Ò‹«\"2ÉÔbiFVû<™Õ[ılRÄîÒûGÓmu …ua^Hõ„ıZ/Ù\"+é]ÌŒ\'voNH­ä‹Ñdõf“\"K$Ï_¿\Z×å>…qp}k­QÂY^¬Şœ±úñõ·ÈJ/u«¸/-í®O¬-­ …‹šÊ¬P;ÑÍí¹ùç¦Uô_å?š?MyFfs%Ö˜~©(\'â(zN|kî¿Ö‹&™rÅ\nÑÎW¦øª&)e’Ÿ^›â©”·S±ôıìOqóÅR&”sëŠ°¯ÌßÌx|£¦ …c¸Õ¯v´·²ª»4²¿¦Ÿ³üø«Ã5ÍÌùÉ¬<!¿bİV.\n­ÿ\0…õ?Ë¿3émùoéÍzKÙ$¹å=õÂúä†e¯7YJqğo‰>ÇV”¯|ıùafäÜëÏ} VDÎxÂ™Z^($_…Û”e¤øxF¿±‘°É#½üğòmº•Ó<½=ìË°òDˆ¹¢-Kƒ<Ÿî¤ê?gT‚÷óûÍf/CH²±Ò QÅ8ÚB¿\"ÇÓÿ\0\'û¯³ƒ‰X£­jš¥íÅíôí5åËçd©P¢p§A³_É¯9IåızI§WÄª™”ÈúliË¿ÃOöXX‡ÚñÍÄi<T0ÌÄÃz‚*İ‘dœR·*î8«¨1WqÅ_ÿ×ôo,š\Zõ1W4øª\ZæSŠ±1Ê÷WSĞ\\FñÉòuâiş¯Ú_ò²JùkÏLš}ıô3ÄéªÜ$Pš¯PÂ™!éQ4qGÈ~Ëb¬*[‹‰R8¤fè(h>g*WªØk‡MÒm4è‰)oBİ>*|FŸå7,°*_yæ›†©\0¨=º“ó®ØU^_£ÉÉa™~÷U±5³BêëÑĞšıİ6Â–êZ•Íş›\r³2óWôÌ RFõ\r~6ûG¦6´›ëú/›4}kSãI’ëI»NXTs†Kx-Ï(yy\"@¾Œßiù“Ô¢ÉNÆÉlô‹»+³\"yÌ²Zê3©V·šÚ¦34CzüF1şîTuâß±Š©é¾^µÕoïõ^÷ê:\n\\Iş”M\Zn,i5şòŠ¿±ˆVyùM¯é¶¾{¹°°I¡Ò5H¸YÅ8d~Q$mF ñeõ=?õ—$¯uG_,µ¿ò¯ÜqU=GÌ\Z‰\\^]Åj›ò·¡éRÔŠ¥\ZwŸ<¯­Nc°ÕmîfªÇ4oJôû,qUM{\\²Ğô»­OPNÚÕ;­C@«âÌz.¯“|Ùæ«ï2k×\Z­İUæjG5Hâ]£Eÿ\0Qzÿ\03rÈ•I½céÓö¼r¾&Å¼$¨ ÛÂ=zì1âWcáôïú±¥u4­©hªIğ¸i\n±Ú´ß‡ÓAß¡úo§\ZViäï/ëÚÔPèzl÷eØ¬\"1?Ê’fšÿ\0²l›û;LT´Ó-,ÙıCoq4ƒ«@§l‰d‚@zRß1ãŠ»–*×,U¾X«ÿĞôÖ=òhk×÷ÅV™ıñU’MÏ®*–Ş[G7Q…X¶­åĞLÖé.ÛPÔöñV5qùqb¯ÎtSşJÓ\r*Usä$şA÷`T‡PòPN‘şUŒj>V’?Ø§ÑŠ±ë­£êùäP–ÜÄaˆ¸«+šœU1¸ó/›,/.\"¶ÖnKG7î£fªMVŒª¸zÀãŠ¢$ºÕı$Ô5+©]Ï2é÷¶ò¹<9üi½}8èËñ¢*·÷ŠØªİGL½ÓFù{ÌZUî™}j×ªJ\0Êå]]#–)}fnŸ$~<¸/ï1VüÃ¨­¾§.«-åÕ½¼1Ãz­ÁãH—‚*È›óEÙª>,’ªÚş`ù¾ßûŸ0]¯úÓ?äèl,S›_ÍÌ4şïWi×Šİ¿\\xªİcÎšî³då¡†úúh…µÒ:Fdà]Ùd‚6èì=0ín9£\'ûç†(bÚ.‘cª[ê:„2éöÒ‰ZêJÀà)©ôUø¼®Ëğúqgû/ğb©§›|ëæÿ\04¢Ûß9ı	-\r¤jv^_Ìü~øl%,Ií%hş°È•S\"QÔÓæFC…›TÌ¸ğªÒ±wb*©şê2ÿ\0*Ìü¯äı6üsÕnå¶CÒŞİB‘şÉù¯ü&\ZC×ü³äï éÜßM†âq¸¸º&wØ?$_ö¸Ò½ËTEŒ$d_°‹Ğ|¨Gã…Šm OC‘dŠ÷ß¢Vãß]ëâ®úÀñ«¾°<F*ÿ\0ÿÑí¿Y9:cnúÉÆ–İõ|imiŸ\Z[S3{ãKk	8ÒÚÇød©mFX\"~¨1¥´¶ëJ‚OØVØö§å˜¤ı€q[aZ¿”ÿ\0Èü0-°ÍkË4Æ«BT€iß¶ ·2[ØKqjœ5;r º¹5\"ªŠğf5†Y>Ú¢§M¤lŠ¢u(F›å\"¨¸Ô\'}BBë\ZB§¹Ê§eún§oæ;»¯+ù†òSa¨ğÔ¼·¨ÎÅÂâí}B©È6îÏè¼•9/Ãñ;>IXv¹ êº)¾ƒ\\‰…êH[»’Êéø2@¬mX“şF\'ÛLU \Z)±,‹öIN<kJÃR¼^AdäŸÊÁ[î4a´S’éù‚‘D»õ…??‡ˆÚÒ¼Z¥ì?İª} œm4²MFõû¯İ­(7®ıÇİ‹%ém^ƒFE¦ÄıcÈÒ§Zp_²€cJÈôØdN•É¡šè²]5¨ùâ¬ÏOy}ñ[Oí\ZOVÓ8g#®\n[E%×¾4¶»ëù\Z[kë^øÒÛ¾µï-¿ÿÒë?Y>9s[¾²|qW}døâ®úÉñÅZúÇ¾*ï¬{â«MÇ¾hÏŠ¬i½ğ*›´o×Kîìc›¨\\\nÆµo.ƒÊŠ*òŸ9y#P¶¸:¶•©2‚.-¸òæ´âHSö¹\'ÂÉö›ö~,‹&%­j¿â	í§wÖX!X>¬UÌCo‰J‰k_±öâÜU\Z–ºÓ´é5]BIdÓÖHšÚÌ:<±4­,këÊ£Òâd‘Y‘%“ìñÃj•y›ÌwaÕ\ríÍ	 HÓâ¯&…Wáÿ\0/í~Óãj”€OMşY\Zd¯£·ZãJ¬¶cT³ö8ª¨±ö8²V]=ÏE®*ªšD¿Ë’chûmsÑ+ò­§V^V¸n«øa[d6Mvû@˜8­²M?ÊĞGÕkôb†Eg¤¤²*›AiÛZ5\'CŠÚ°¸#\nÚï¬œVÛú×¾·}kß·}kß·ÿÓèŸY÷ËÚõŸ|UßZ÷Å]õŸ|UßY÷Å]õ¯|U¯¬ûâ®úÏ¾*´Üûâ­}cßZg÷ÅV»Æßk|U5•¤İS#L­‰kß•şUÖ\'i§·1Ü7ÚšQ›ıj|/şÏ–4¶Å®¿$´t<£¸ºÿ\0T´dÄ0ğ-¥Ó~UÁØ¿Öß´F’‘ş&ÔO”îS¢¸ãKk‡–¦şOÃ\Z[W‹Ê×=ıØÒÚ>\'Ü´´ùŒim2·òb £\Z[M-¼£j¿mk’`›[yzİ?`b©œ:l	Ñ*Œ“¶*‰B‰Ğbª©(ñª ¸÷ÅÅÏ¾*ï­{â­ıløâ®úÙñÅ]õ³ãŠµõ³Š¿ÿÔ—ıkß/jwÖ½ñU¿Y÷ÅW}kßwÖ½ñU¿Y÷ÅW}kß[õŸ|U¿¬Š»ëÄb­}dxŒU¯¬{â®úÇ¾*×¬<qU¦Tn£U\"~ª¸Ú¡Òê«ŠT_M·şUÅTÿ\0GAşOİŠ¯[S¢UPZÅáŠ¯ÇáŠ¯<1B #Ç\\xâ­ú£Ço×÷Å]ëûâ«½|PßÖ=ñW}cßwÖ=ñW}cß[õ“Š»ë\'ÿÕ>ıî^ÔïŞâ®ıî*ïŞâ®ıî*ïŞâ®ıæ*ïŞb®ıæ*ïŞb­~óo÷˜«¿yŠ»÷˜«¿yŠµûÌUß¼Å]ûÌUØªßwÇŠ»ãÅ[ıæ*ïŞb®ıæ*ïŞb®ıæ*ïŞb®ıî*ïŞâ®ıî(wïqW~÷k÷˜«¿yŠ¿ÿÙ'),(9,'Ford Mustang',200.00,NULL);
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_en` varchar(100) NOT NULL,
  `name_uk` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Kyiv','ĞšĞ¸Ñ—Ğ²'),(2,'Chernigiv','Ğ§ĞµÑ€Ğ½Ñ–Ğ³Ñ–Ğ²'),(3,'Dnipropetrovsk','Ğ”Ğ½Ñ–Ğ¿Ñ€Ğ¾Ğ¿ĞµÑ‚Ñ€Ğ¾Ğ²ÑÑŒĞº'),(4,'Chernivtsi','Ğ§ĞµÑ€Ğ½Ñ–Ğ²Ñ†Ñ–'),(5,'Odesa','ĞĞ´ĞµÑĞ°'),(6,'Mykolaiv','ĞœĞ¸ĞºĞ¾Ğ»Ğ°Ñ—Ğ²'),(7,'Poltava','ĞŸĞ¾Ğ»Ñ‚Ğ°Ğ²Ğ°');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `idUser` int(11) NOT NULL,
  `surname` varchar(250) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `secondName` varchar(100) DEFAULT NULL,
  `passportNumber` varchar(8) NOT NULL,
  `dateOfIssue` date NOT NULL,
  `validUntil` date DEFAULT NULL,
  `issuedBy` varchar(350) NOT NULL,
  `birthday` date NOT NULL,
  `address` varchar(450) NOT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE KEY `idUser_UNIQUE` (`idUser`),
  KEY `idUser_idx` (`idUser`),
  CONSTRAINT `user` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'domchenko','tanya','tanya-tanya','ET112233','2000-01-01',NULL,'AAA BBB','2015-03-05','ukraine'),(2,'ĞĞ´Ğ¼Ñ–Ğ½Ñ–ÑÑ‚Ñ€Ğ°Ñ‚Ğ¾Ñ€','ĞĞ´Ğ¼Ñ–Ğ½Ñ–ÑÑ‚Ñ€Ğ°Ñ‚Ğ¾Ñ€','ĞĞ´Ğ¼Ñ–Ğ½Ñ–ÑÑ‚Ñ€Ğ°Ñ‚Ğ¾Ğ²Ğ¸Ñ‡','CM242404','2016-01-17',NULL,'Ğ“Ğ£ ĞœĞ’Ğ¡ ĞšĞ˜Ğ‡Ğ’','2016-01-01','Ğ¼Ñ–ÑÑ‚Ğ¾ ĞšĞ¸Ñ—Ğ²'),(4,'Ivanov','Ivan','','12','2016-01-01','2016-12-31','ABB','2016-01-01','Kyiv'),(7,'ĞŸĞµÑ‚Ñ€ĞµĞ½ĞºĞ¾','ĞŸĞµÑ‚Ñ€Ğ¾','ĞŸĞµÑ‚Ñ€Ğ¾Ğ²Ğ¸Ñ‡','Ğ¡Ğš020220','2016-01-01',NULL,'Ğ“Ğ£ ĞœĞ’Ğ¡ ĞšĞ¸Ñ—Ğ²','1992-01-30','ĞšĞ¸Ñ—Ğ²');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_states`
--

DROP TABLE IF EXISTS `order_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_en` varchar(45) NOT NULL,
  `name_uk` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_states`
--

LOCK TABLES `order_states` WRITE;
/*!40000 ALTER TABLE `order_states` DISABLE KEYS */;
INSERT INTO `order_states` VALUES (1,'new','Ğ½Ğ¾Ğ²Ğµ'),(2,'done','Ğ²Ğ¸ĞºĞ¾Ğ½Ğ°Ğ½Ğµ'),(3,'paid','Ğ¾Ğ¿Ğ»Ğ°Ñ‡ĞµĞ½Ğµ'),(4,'unpaid','Ğ½ĞµĞ¾Ğ¿Ğ»Ğ°Ñ‡ĞµĞ½Ğµ'),(5,'executing','Ğ²Ğ¸ĞºĞ¾Ğ½ÑƒÑ”Ñ‚ÑŒÑÑ'),(6,'accident','Ğ·Ğ±Ğ¸Ñ‚ĞºĞ¸');
/*!40000 ALTER TABLE `order_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `idApplication` int(11) NOT NULL,
  `idPayment` int(11) NOT NULL,
  `idState` int(11) NOT NULL,
  PRIMARY KEY (`idApplication`,`idPayment`),
  KEY `idApplication_idx` (`idApplication`),
  KEY `idType_idx` (`idState`),
  KEY `idPayment_idx` (`idPayment`),
  CONSTRAINT `idApplication` FOREIGN KEY (`idApplication`) REFERENCES `applications` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idPayment` FOREIGN KEY (`idPayment`) REFERENCES `payments` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idType` FOREIGN KEY (`idState`) REFERENCES `order_states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (13,13,2),(14,14,2),(20,16,2),(22,19,2),(15,15,4),(14,17,6),(20,18,6);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idClient` int(11) NOT NULL,
  `sum` float NOT NULL,
  `currencyCode` varchar(3) NOT NULL DEFAULT 'UAH',
  `dateOpen` date NOT NULL,
  `dateClose` date DEFAULT NULL,
  `note` varchar(200) NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (13,1,1000,'UAH','2016-01-22','2016-01-22','Universal Bank, MFO 123456, account N. 456060687342, invoice N.13'),(14,1,440,'UAH','2016-01-22','2016-01-22','Universal Bank, MFO 123456, account N. 456060687342, invoice N.14'),(15,1,330,'UAH','2016-01-22',NULL,'Universal Bank, MFO 123456, account N. 456060687342, invoice N.15'),(16,4,120,'UAH','2016-01-22','2016-01-22','Universal Bank, MFO 123456, account N. 456060687342, invoice N.20'),(17,1,101,'UAH','2016-01-22','2016-01-22','Universal Bank, MFO 123456, account N. 456060687342, invoice N.14, Repair expenses'),(18,4,145,'UAH','2016-01-22','2016-01-24','Universal Bank, MFO 123456, account N. 456060687342, invoice N.20, Repair expenses'),(19,1,400,'UAH','2016-01-24','2016-01-24','Universal Bank, MFO 123456, account N. 456060687342, invoice N.22');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `places` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idCity` int(11) NOT NULL,
  `name_en` varchar(100) NOT NULL,
  `name_uk` varchar(100) DEFAULT NULL,
  `address_en` varchar(500) NOT NULL,
  `address_uk` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `idCity_idx` (`idCity`),
  CONSTRAINT `idCity2` FOREIGN KEY (`idCity`) REFERENCES `cities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places`
--

LOCK TABLES `places` WRITE;
/*!40000 ALTER TABLE `places` DISABLE KEYS */;
INSERT INTO `places` VALUES (1,1,'Airport','ĞĞµÑ€Ğ¾Ğ¿Ğ¾Ñ€Ñ‚ ĞšĞ¸Ñ—Ğ²','2 Medova St.','ĞœĞµĞ´Ğ¾Ğ²Ğ° 2'),(2,1,'Central Railway Station','Ğ¦ĞµĞ½Ñ‚Ñ€Ğ°Ğ»ÑŒĞ½Ğ¸Ğ¹ Ğ·Ğ°Ğ»Ñ–Ğ·Ğ½Ğ¸Ñ‡Ğ½Ğ¸Ğ¹ Ğ²Ğ¾ĞºĞ·Ğ°Ğ»','1 Vokzalna St.','Ğ’Ğ¾ĞºĞ·Ğ°Ğ»ÑŒĞ½Ğ° 1'),(3,2,'CarRental','ĞĞ²Ñ‚Ğ¾Ğ¿Ñ€Ğ¾ĞºĞ°Ñ‚','14 Peremogy St.','ĞŸĞµÑ€ĞµĞ¼Ğ¾Ğ³Ğ¸ 14'),(4,4,'Avtocenter','ĞĞ²Ñ‚Ğ¾Ñ†ĞµĞ½Ñ‚Ñ€','125 Golovna St.','Ğ“Ğ¾Ğ»Ğ¾Ğ²Ğ½Ğ° 145'),(5,3,'Vi-Di Avto','Ğ’Ñ–-Ğ”Ñ– ĞĞ²Ñ‚Ğ¾','18 Rylskogo Av.','Ğ Ğ¸Ğ»ÑŒÑÑŒĞºĞ¾Ğ³Ğ¾ 18'),(6,5,'AC Perrspektyva','ĞĞ¦ ĞŸĞµÑ€ÑĞ¿ĞµĞºÑ‚Ğ¸Ğ²Ğ°','27 Lisova St.','Ğ›Ñ–ÑĞ¾Ğ²Ğ° 27'),(7,6,'Bus Station','ĞĞ²Ñ‚Ğ¾Ğ²Ğ¾ĞºĞ·Ğ°Ğ»','7 Skoropadskogo St.','Ğ¡ĞºĞ¾Ñ€Ğ¾Ğ¿Ğ°Ğ´ÑÑŒĞºĞ¾Ğ³Ğ¾ 7'),(8,7,'Paritet Motors','ĞŸĞ°Ñ€Ğ¸Ñ‚ĞµÑ‚ ĞœĞ¾Ñ‚Ğ¾Ñ€Ñ','31 Tolstogo St.','Ğ¢Ğ¾Ğ»ÑÑ‚Ğ¾Ğ³Ğ¾ 31');
/*!40000 ALTER TABLE `places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `isAdmin` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'tanya','1','\0'),(2,'admin','admin',''),(4,'vanya','1','\0'),(6,'katya','1','\0'),(7,'abc','1','\0');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'rental'
--
/*!50003 DROP PROCEDURE IF EXISTS `add_Application` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_Application`( IN idClient int, idCar int, dateFrom date, dateTo date, 
idPlaceFrom int, idPlaceTo int, dateOperation date, idState int, note varchar(250) )
BEGIN
	insert into applications ( idClient, idCar, dateFrom, dateTo, idPlaceFrom, idPlaceTo, 
		dateOperation, idState, note )
	values( idClient, idCar, dateFrom, dateTo, idPlaceFrom, idPlaceTo, 
		dateOperation, idState, note );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_Client` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_Client`( IN idUser int,
	surname varchar(250), firstName varchar(100), secondName varchar(100),
	passportNumber varchar(8), dateOfIssue date, validUntil date,
	issuedBy varchar(350), birthday date, address varchar(450) )
BEGIN
	insert into clients ( idUser, surname, firstName, secondName,
		passportNumber, dateOfIssue, validUntil, issuedBy, birthday, address )
    values ( idUser, surname, firstName, secondName,
		passportNumber, dateOfIssue, validUntil, issuedBy, birthday, address );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_Order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_Order`( IN applicationId int, sum float, note varchar(250), 
	OUT orderId int )
BEGIN
	declare paymentId int;
    declare orderStateId int;
    
    update applications
    set idState = 2, /* confirmed */
		note = note
    where id = applicationId;
    
    insert into payments ( idClient, sum, currencyCode, dateOpen, dateClose, note )
    select a.idClient, 
		sum, 'UAH', 
		CURDATE(), null,
		CONCAT( 'Universal Bank, MFO 123456, account N. 456060687342, invoice N.', applicationId ) 
    from applications a
    where a.id = applicationId;
	
    select LAST_INSERT_ID() into paymentId;
    
    set orderStateId = 1; /* new */
    
    insert into orders ( idApplication, idPayment, idState )
    values ( applicationId, paymentId, orderStateId );
    
    select LAST_INSERT_ID() into orderId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_User` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_User`( IN login varchar(45), password varchar(45), isAdmin bit(1) )
BEGIN
	insert into users ( login, password, isAdmin )
    values ( login, password, isAdmin );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_ApplicationsByState` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_ApplicationsByState`( IN stateId int )
BEGIN
	select a.*
    from applications a
    where a.idState = stateId
    order by a.dateOperation;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_ApplicationsByUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_ApplicationsByUser`( IN clientId int, stateId int )
BEGIN
	select *
    from applications 
    where idClient = clientId and idState = stateId
    order by dateFrom;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_FreeCarsByPlace` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_FreeCarsByPlace`( 
  IN placeId long, dateFrom date, dateTo date )
BEGIN
	select min( c.id ) as id, c.model, c.price
    from car_park cp
      join cars c on c.id = cp.idCar
    where cp.idPlace = placeId
      and ( select count(*) from applications ap 
            where ap.idCar = cp.idCar 
              and ap.dateFrom <= dateTo and ap.dateTo >= dateFrom ) = 0
	group by c.model, c.price
	order by c.model;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_PaymentsByApplication` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_PaymentsByApplication`( IN applicationId int )
BEGIN
	select p.*
    from payments p 
		join orders o on o.idPayment = p.id
    where o.idApplication = applicationId
    order by dateOpen;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_PaymentsByState` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_PaymentsByState`( IN stateId int )
BEGIN
	select p.*
    from orders o 
      join payments p on p.id = o.idPayment
    where o.idState = stateId
    order by p.dateOpen, p.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_PaymentsByUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_PaymentsByUser`( IN clientId int, stateId int )
BEGIN
	select p.*
    from payments p
      join orders o on o.idPayment = p.id and o.idState = stateId
    where idClient = clientId 
    order by dateOpen;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_UserAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_UserAccount`( IN login varchar(45), password varchar(45) )
BEGIN
	select *
	from users u
	where u.login = login and u.password = password;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `set_OrderPaid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `set_OrderPaid`( IN paymentId int )
BEGIN
	declare applicationId int;
    
    update orders
    set idState = 3 -- paid
    where idPayment = paymentId;
    
    select idApplication into applicationId
    from orders
    where idPayment = paymentId;
    
	update applications
    set idState = 4 -- done
    where id = applicationId;
    
    update payments
    set dateClose = CURDATE()
    where id = paymentId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `set_OrderReturnCar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `set_OrderReturnCar`( IN applicationId int, newStateId int, damageSum float )
BEGIN
	declare carId int;
    declare placeToId int;
    declare paymentId int;
    
	update orders
    set idState = 2 -- done
    where idApplication = applicationId;
    
    select idCar into carId
	from applications
	where id = applicationId;
        
    -- move car ->
    select idPlaceTo into placeToId
	from applications 
	where id = applicationId;
        
	update car_park
	set idPlace = placeToId
	where idCar = carId;
    -- move car <-
        
    if ( newStateId = 6 ) then -- accident
		insert into payments ( idClient, sum, currencyCode, dateOpen, dateClose, note )
        select a.idClient, 
			damageSum, 'UAH', 
			CURDATE(), null,
			CONCAT( 
				CONCAT( 'Universal Bank, MFO 123456, account N. 456060687342, invoice N.', applicationId ),
                ', Repair expenses' )
		from applications a
		where a.id = applicationId;
        
        select LAST_INSERT_ID() into paymentId;
        
        insert into orders ( idApplication, idPayment, idState )
		values ( applicationId, paymentId, newStateId );
    end if;    
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `set_OrderUnpaid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `set_OrderUnpaid`( IN paymentId int, reason varchar(250) )
BEGIN
	declare applicationId int;
    
    update orders
    set idState = 4 -- unpaid
    where idPayment = paymentId;
    
    select idApplication into applicationId
    from orders
    where idPayment = paymentId;
    
	update applications
    set idState = 3, -- rejected 
		note = reason
    where id = applicationId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-24 22:03:32
