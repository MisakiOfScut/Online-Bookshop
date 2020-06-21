-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: booksys
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `pwd` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin1','42349262e19ce2c6d7376fcbfdde27dd'),(2,'admin2','42349262e19ce2c6d7376fcbfdde27dd');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booklist`
--

DROP TABLE IF EXISTS `booklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booklist` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `category` varchar(45) NOT NULL,
  `quantity` int unsigned DEFAULT NULL,
  `price` int unsigned DEFAULT NULL,
  `introduction` varchar(1024) DEFAULT NULL,
  `filedir` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10032 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booklist`
--

LOCK TABLES `booklist` WRITE;
/*!40000 ALTER TABLE `booklist` DISABLE KEYS */;
INSERT INTO `booklist` VALUES (10002,'基督山伯爵','大仲马','文学艺术',10,85,'《基督山伯爵》是法国作家大仲马创作的长篇小说，首次发表于1844—1846年。','../data/img/140.jpg'),(10011,'软件文化形象评选活动','1','文学艺术',10,1,'1','../data/img/140.jpg'),(10014,'基督山伯爵','大仲马','文学艺术',10,85,'《基督山伯爵》是法国作家大仲马创作的长篇小说，首次发表于1844—1846年。 故事讲述19世纪法国皇帝拿破仑“百日王朝”时期，法老号大副爱德蒙·唐泰斯受船长委托，为拿破仑党人送了一封信，遭到两个卑鄙小人和法官的陷害，被打入黑牢。期间狱友法利亚神甫向他传授各种知识，并在临终前把埋于基督山岛上的一批宝藏的秘密告诉了他。被陷害入狱十四年后，唐泰斯越狱后找到了宝藏，成为巨富，从此化名基督山伯爵（水手辛巴德、布索尼神父、威尔莫勋爵），经过精心策划，报答了恩人，惩罚了仇人。 该小说以基督山扬善惩恶、报恩复仇为故事发展的中心线索，主要情节跌宕起伏，迂回曲折，从中又演化出若干次要情节，小插曲紧凑精彩，却不喧宾夺主，情节离奇却不违反生活真实。全书出色地运用了“悬念”、“突发”、“发现”、“戏剧”等手法，在叙述上有较大的叙述密度和复杂的人物关系。这一切使这部小说充满了叙述的张力，洋溢着叙述本身所产生的美。因此，《基督山伯爵》被公认为通俗小说的典范。 这部小说出版后，很快就赢得了广大读者的青睐，被翻译成几十种文字出版，在法国和美国等地多次被拍成电影。','../data/img/141.jpg'),(10013,'基督山','1','文学艺术',1,1,'1','../data/img/140.jpg'),(10015,'基督山伯爵','大仲马','文学艺术',10,85,'《基督山伯爵》是法国作家大仲马创作的长篇小说，首次发表于1844—1846年。 故事讲述19世纪法国皇帝拿破仑“百日王朝”时期，法老号大副爱德蒙·唐泰斯受船长委托，为拿破仑党人送了一封信，遭到两个卑鄙小人和法官的陷害，被打入黑牢。期间狱友法利亚神甫向他传授各种知识，并在临终前把埋于基督山岛上的一批宝藏的秘密告诉了他。被陷害入狱十四年后，唐泰斯越狱后找到了宝藏，成为巨富，从此化名基督山伯爵（水手辛巴德、布索尼神父、威尔莫勋爵），经过精心策划，报答了恩人，惩罚了仇人。 该小说以基督山扬善惩恶、报恩复仇为故事发展的中心线索，主要情节跌宕起伏，迂回曲折，从中又演化出若干次要情节，小插曲紧凑精彩，却不喧宾夺主，情节离奇却不违反生活真实。全书出色地运用了“悬念”、“突发”、“发现”、“戏剧”等手法，在叙述上有较大的叙述密度和复杂的人物关系。这一切使这部小说充满了叙述的张力，洋溢着叙述本身所产生的美。因此，《基督山伯爵》被公认为通俗小说的典范。 这部小说出版后，很快就赢得了广大读者的青睐，被翻译成几十种文字出版，在法国和美国等地多次被拍成电影。','../data/img/142.jpg'),(10016,'基督山伯爵','大仲马','文学艺术',10,85,'《基督山伯爵》是法国作家大仲马创作的长篇小说，首次发表于1844—1846年。 故事讲述19世纪法国皇帝拿破仑“百日王朝”时期，法老号大副爱德蒙·唐泰斯受船长委托，为拿破仑党人送了一封信，遭到两个卑鄙小人和法官的陷害，被打入黑牢。期间狱友法利亚神甫向他传授各种知识，并在临终前把埋于基督山岛上的一批宝藏的秘密告诉了他。被陷害入狱十四年后，唐泰斯越狱后找到了宝藏，成为巨富，从此化名基督山伯爵（水手辛巴德、布索尼神父、威尔莫勋爵），经过精心策划，报答了恩人，惩罚了仇人。 该小说以基督山扬善惩恶、报恩复仇为故事发展的中心线索，主要情节跌宕起伏，迂回曲折，从中又演化出若干次要情节，小插曲紧凑精彩，却不喧宾夺主，情节离奇却不违反生活真实。全书出色地运用了“悬念”、“突发”、“发现”、“戏剧”等手法，在叙述上有较大的叙述密度和复杂的人物关系。这一切使这部小说充满了叙述的张力，洋溢着叙述本身所产生的美。因此，《基督山伯爵》被公认为通俗小说的典范。 这部小说出版后，很快就赢得了广大读者的青睐，被翻译成几十种文字出版，在法国和美国等地多次被拍成电影。','../data/img/142.jpg'),(10017,'基督山伯爵','大仲马','文学艺术',10,85,'《基督山伯爵》是法国作家大仲马创作的长篇小说，首次发表于1844—1846年。 故事讲述19世纪法国皇帝拿破仑“百日王朝”时期，法老号大副爱德蒙·唐泰斯受船长委托，为拿破仑党人送了一封信，遭到两个卑鄙小人和法官的陷害，被打入黑牢。期间狱友法利亚神甫向他传授各种知识，并在临终前把埋于基督山岛上的一批宝藏的秘密告诉了他。被陷害入狱十四年后，唐泰斯越狱后找到了宝藏，成为巨富，从此化名基督山伯爵（水手辛巴德、布索尼神父、威尔莫勋爵），经过精心策划，报答了恩人，惩罚了仇人。 该小说以基督山扬善惩恶、报恩复仇为故事发展的中心线索，主要情节跌宕起伏，迂回曲折，从中又演化出若干次要情节，小插曲紧凑精彩，却不喧宾夺主，情节离奇却不违反生活真实。全书出色地运用了“悬念”、“突发”、“发现”、“戏剧”等手法，在叙述上有较大的叙述密度和复杂的人物关系。这一切使这部小说充满了叙述的张力，洋溢着叙述本身所产生的美。因此，《基督山伯爵》被公认为通俗小说的典范。 这部小说出版后，很快就赢得了广大读者的青睐，被翻译成几十种文字出版，在法国和美国等地多次被拍成电影。','../data/img/144.jpg'),(10018,'基督山伯爵','大仲马','文学艺术',10,85,'《基督山伯爵》是法国作家大仲马创作的长篇小说，首次发表于1844—1846年。 故事讲述19世纪法国皇帝拿破仑“百日王朝”时期，法老号大副爱德蒙·唐泰斯受船长委托，为拿破仑党人送了一封信，遭到两个卑鄙小人和法官的陷害，被打入黑牢。期间狱友法利亚神甫向他传授各种知识，并在临终前把埋于基督山岛上的一批宝藏的秘密告诉了他。被陷害入狱十四年后，唐泰斯越狱后找到了宝藏，成为巨富，从此化名基督山伯爵（水手辛巴德、布索尼神父、威尔莫勋爵），经过精心策划，报答了恩人，惩罚了仇人。 该小说以基督山扬善惩恶、报恩复仇为故事发展的中心线索，主要情节跌宕起伏，迂回曲折，从中又演化出若干次要情节，小插曲紧凑精彩，却不喧宾夺主，情节离奇却不违反生活真实。全书出色地运用了“悬念”、“突发”、“发现”、“戏剧”等手法，在叙述上有较大的叙述密度和复杂的人物关系。这一切使这部小说充满了叙述的张力，洋溢着叙述本身所产生的美。因此，《基督山伯爵》被公认为通俗小说的典范。 这部小说出版后，很快就赢得了广大读者的青睐，被翻译成几十种文字出版，在法国和美国等地多次被拍成电影。','../data/img/145.jpg'),(10019,'基督山伯爵','大仲马','文学艺术',10,85,'《基督山伯爵》是法国作家大仲马创作的长篇小说，首次发表于1844—1846年。 故事讲述19世纪法国皇帝拿破仑“百日王朝”时期，法老号大副爱德蒙·唐泰斯受船长委托，为拿破仑党人送了一封信，遭到两个卑鄙小人和法官的陷害，被打入黑牢。期间狱友法利亚神甫向他传授各种知识，并在临终前把埋于基督山岛上的一批宝藏的秘密告诉了他。被陷害入狱十四年后，唐泰斯越狱后找到了宝藏，成为巨富，从此化名基督山伯爵（水手辛巴德、布索尼神父、威尔莫勋爵），经过精心策划，报答了恩人，惩罚了仇人。 该小说以基督山扬善惩恶、报恩复仇为故事发展的中心线索，主要情节跌宕起伏，迂回曲折，从中又演化出若干次要情节，小插曲紧凑精彩，却不喧宾夺主，情节离奇却不违反生活真实。全书出色地运用了“悬念”、“突发”、“发现”、“戏剧”等手法，在叙述上有较大的叙述密度和复杂的人物关系。这一切使这部小说充满了叙述的张力，洋溢着叙述本身所产生的美。因此，《基督山伯爵》被公认为通俗小说的典范。 这部小说出版后，很快就赢得了广大读者的青睐，被翻译成几十种文字出版，在法国和美国等地多次被拍成电影。','../data/img/146.jpg'),(10020,'基督山伯爵','大仲马','文学艺术',10,85,'《基督山伯爵》是法国作家大仲马创作的长篇小说，首次发表于1844—1846年。 故事讲述19世纪法国皇帝拿破仑“百日王朝”时期，法老号大副爱德蒙·唐泰斯受船长委托，为拿破仑党人送了一封信，遭到两个卑鄙小人和法官的陷害，被打入黑牢。期间狱友法利亚神甫向他传授各种知识，并在临终前把埋于基督山岛上的一批宝藏的秘密告诉了他。被陷害入狱十四年后，唐泰斯越狱后找到了宝藏，成为巨富，从此化名基督山伯爵（水手辛巴德、布索尼神父、威尔莫勋爵），经过精心策划，报答了恩人，惩罚了仇人。 该小说以基督山扬善惩恶、报恩复仇为故事发展的中心线索，主要情节跌宕起伏，迂回曲折，从中又演化出若干次要情节，小插曲紧凑精彩，却不喧宾夺主，情节离奇却不违反生活真实。全书出色地运用了“悬念”、“突发”、“发现”、“戏剧”等手法，在叙述上有较大的叙述密度和复杂的人物关系。这一切使这部小说充满了叙述的张力，洋溢着叙述本身所产生的美。因此，《基督山伯爵》被公认为通俗小说的典范。 这部小说出版后，很快就赢得了广大读者的青睐，被翻译成几十种文字出版，在法国和美国等地多次被拍成电影。','../data/img/147.jpg'),(10021,'基督山伯爵','大仲马','文学艺术',10,85,'《基督山伯爵》是法国作家大仲马创作的长篇小说，首次发表于1844—1846年。 故事讲述19世纪法国皇帝拿破仑“百日王朝”时期，法老号大副爱德蒙·唐泰斯受船长委托，为拿破仑党人送了一封信，遭到两个卑鄙小人和法官的陷害，被打入黑牢。期间狱友法利亚神甫向他传授各种知识，并在临终前把埋于基督山岛上的一批宝藏的秘密告诉了他。被陷害入狱十四年后，唐泰斯越狱后找到了宝藏，成为巨富，从此化名基督山伯爵（水手辛巴德、布索尼神父、威尔莫勋爵），经过精心策划，报答了恩人，惩罚了仇人。 该小说以基督山扬善惩恶、报恩复仇为故事发展的中心线索，主要情节跌宕起伏，迂回曲折，从中又演化出若干次要情节，小插曲紧凑精彩，却不喧宾夺主，情节离奇却不违反生活真实。全书出色地运用了“悬念”、“突发”、“发现”、“戏剧”等手法，在叙述上有较大的叙述密度和复杂的人物关系。这一切使这部小说充满了叙述的张力，洋溢着叙述本身所产生的美。因此，《基督山伯爵》被公认为通俗小说的典范。 这部小说出版后，很快就赢得了广大读者的青睐，被翻译成几十种文字出版，在法国和美国等地多次被拍成电影。','../data/img/148.jpg'),(10022,'基督山伯爵','大仲马','文学艺术',10,85,'《基督山伯爵》是法国作家大仲马创作的长篇小说，首次发表于1844—1846年。 故事讲述19世纪法国皇帝拿破仑“百日王朝”时期，法老号大副爱德蒙·唐泰斯受船长委托，为拿破仑党人送了一封信，遭到两个卑鄙小人和法官的陷害，被打入黑牢。期间狱友法利亚神甫向他传授各种知识，并在临终前把埋于基督山岛上的一批宝藏的秘密告诉了他。被陷害入狱十四年后，唐泰斯越狱后找到了宝藏，成为巨富，从此化名基督山伯爵（水手辛巴德、布索尼神父、威尔莫勋爵），经过精心策划，报答了恩人，惩罚了仇人。 该小说以基督山扬善惩恶、报恩复仇为故事发展的中心线索，主要情节跌宕起伏，迂回曲折，从中又演化出若干次要情节，小插曲紧凑精彩，却不喧宾夺主，情节离奇却不违反生活真实。全书出色地运用了“悬念”、“突发”、“发现”、“戏剧”等手法，在叙述上有较大的叙述密度和复杂的人物关系。这一切使这部小说充满了叙述的张力，洋溢着叙述本身所产生的美。因此，《基督山伯爵》被公认为通俗小说的典范。 这部小说出版后，很快就赢得了广大读者的青睐，被翻译成几十种文字出版，在法国和美国等地多次被拍成电影。','../data/img/148.jpg'),(10023,'基督山伯爵','大仲马','文学艺术',10,85,'《基督山伯爵》是法国作家大仲马创作的长篇小说，首次发表于1844—1846年。 故事讲述19世纪法国皇帝拿破仑“百日王朝”时期，法老号大副爱德蒙·唐泰斯受船长委托，为拿破仑党人送了一封信，遭到两个卑鄙小人和法官的陷害，被打入黑牢。期间狱友法利亚神甫向他传授各种知识，并在临终前把埋于基督山岛上的一批宝藏的秘密告诉了他。被陷害入狱十四年后，唐泰斯越狱后找到了宝藏，成为巨富，从此化名基督山伯爵（水手辛巴德、布索尼神父、威尔莫勋爵），经过精心策划，报答了恩人，惩罚了仇人。 该小说以基督山扬善惩恶、报恩复仇为故事发展的中心线索，主要情节跌宕起伏，迂回曲折，从中又演化出若干次要情节，小插曲紧凑精彩，却不喧宾夺主，情节离奇却不违反生活真实。全书出色地运用了“悬念”、“突发”、“发现”、“戏剧”等手法，在叙述上有较大的叙述密度和复杂的人物关系。这一切使这部小说充满了叙述的张力，洋溢着叙述本身所产生的美。因此，《基督山伯爵》被公认为通俗小说的典范。 这部小说出版后，很快就赢得了广大读者的青睐，被翻译成几十种文字出版，在法国和美国等地多次被拍成电影。','../data/img/149.jpg'),(10024,'基督山伯爵','大仲马','文学艺术',10,85,'《基督山伯爵》是法国作家大仲马创作的长篇小说，首次发表于1844—1846年。 故事讲述19世纪法国皇帝拿破仑“百日王朝”时期，法老号大副爱德蒙·唐泰斯受船长委托，为拿破仑党人送了一封信，遭到两个卑鄙小人和法官的陷害，被打入黑牢。期间狱友法利亚神甫向他传授各种知识，并在临终前把埋于基督山岛上的一批宝藏的秘密告诉了他。被陷害入狱十四年后，唐泰斯越狱后找到了宝藏，成为巨富，从此化名基督山伯爵（水手辛巴德、布索尼神父、威尔莫勋爵），经过精心策划，报答了恩人，惩罚了仇人。 该小说以基督山扬善惩恶、报恩复仇为故事发展的中心线索，主要情节跌宕起伏，迂回曲折，从中又演化出若干次要情节，小插曲紧凑精彩，却不喧宾夺主，情节离奇却不违反生活真实。全书出色地运用了“悬念”、“突发”、“发现”、“戏剧”等手法，在叙述上有较大的叙述密度和复杂的人物关系。这一切使这部小说充满了叙述的张力，洋溢着叙述本身所产生的美。因此，《基督山伯爵》被公认为通俗小说的典范。 这部小说出版后，很快就赢得了广大读者的青睐，被翻译成几十种文字出版，在法国和美国等地多次被拍成电影。','../data/img/150.jpg'),(10025,'基督山伯爵','大仲马','文学艺术',10,85,'《基督山伯爵》是法国作家大仲马创作的长篇小说，首次发表于1844—1846年。 故事讲述19世纪法国皇帝拿破仑“百日王朝”时期，法老号大副爱德蒙·唐泰斯受船长委托，为拿破仑党人送了一封信，遭到两个卑鄙小人和法官的陷害，被打入黑牢。期间狱友法利亚神甫向他传授各种知识，并在临终前把埋于基督山岛上的一批宝藏的秘密告诉了他。被陷害入狱十四年后，唐泰斯越狱后找到了宝藏，成为巨富，从此化名基督山伯爵（水手辛巴德、布索尼神父、威尔莫勋爵），经过精心策划，报答了恩人，惩罚了仇人。 该小说以基督山扬善惩恶、报恩复仇为故事发展的中心线索，主要情节跌宕起伏，迂回曲折，从中又演化出若干次要情节，小插曲紧凑精彩，却不喧宾夺主，情节离奇却不违反生活真实。全书出色地运用了“悬念”、“突发”、“发现”、“戏剧”等手法，在叙述上有较大的叙述密度和复杂的人物关系。这一切使这部小说充满了叙述的张力，洋溢着叙述本身所产生的美。因此，《基督山伯爵》被公认为通俗小说的典范。 这部小说出版后，很快就赢得了广大读者的青睐，被翻译成几十种文字出版，在法国和美国等地多次被拍成电影。','../data/img/151.jpg'),(10026,'基督山伯爵','大仲马','文学艺术',10,85,'《基督山伯爵》是法国作家大仲马创作的长篇小说，首次发表于1844—1846年。 故事讲述19世纪法国皇帝拿破仑“百日王朝”时期，法老号大副爱德蒙·唐泰斯受船长委托，为拿破仑党人送了一封信，遭到两个卑鄙小人和法官的陷害，被打入黑牢。期间狱友法利亚神甫向他传授各种知识，并在临终前把埋于基督山岛上的一批宝藏的秘密告诉了他。被陷害入狱十四年后，唐泰斯越狱后找到了宝藏，成为巨富，从此化名基督山伯爵（水手辛巴德、布索尼神父、威尔莫勋爵），经过精心策划，报答了恩人，惩罚了仇人。 该小说以基督山扬善惩恶、报恩复仇为故事发展的中心线索，主要情节跌宕起伏，迂回曲折，从中又演化出若干次要情节，小插曲紧凑精彩，却不喧宾夺主，情节离奇却不违反生活真实。全书出色地运用了“悬念”、“突发”、“发现”、“戏剧”等手法，在叙述上有较大的叙述密度和复杂的人物关系。这一切使这部小说充满了叙述的张力，洋溢着叙述本身所产生的美。因此，《基督山伯爵》被公认为通俗小说的典范。 这部小说出版后，很快就赢得了广大读者的青睐，被翻译成几十种文字出版，在法国和美国等地多次被拍成电影。','../data/img/152.jpg'),(10027,'基督山伯爵','大仲马','文学艺术',10,85,'《基督山伯爵》是法国作家大仲马创作的长篇小说，首次发表于1844—1846年。 故事讲述19世纪法国皇帝拿破仑“百日王朝”时期，法老号大副爱德蒙·唐泰斯受船长委托，为拿破仑党人送了一封信，遭到两个卑鄙小人和法官的陷害，被打入黑牢。期间狱友法利亚神甫向他传授各种知识，并在临终前把埋于基督山岛上的一批宝藏的秘密告诉了他。被陷害入狱十四年后，唐泰斯越狱后找到了宝藏，成为巨富，从此化名基督山伯爵（水手辛巴德、布索尼神父、威尔莫勋爵），经过精心策划，报答了恩人，惩罚了仇人。 该小说以基督山扬善惩恶、报恩复仇为故事发展的中心线索，主要情节跌宕起伏，迂回曲折，从中又演化出若干次要情节，小插曲紧凑精彩，却不喧宾夺主，情节离奇却不违反生活真实。全书出色地运用了“悬念”、“突发”、“发现”、“戏剧”等手法，在叙述上有较大的叙述密度和复杂的人物关系。这一切使这部小说充满了叙述的张力，洋溢着叙述本身所产生的美。因此，《基督山伯爵》被公认为通俗小说的典范。 这部小说出版后，很快就赢得了广大读者的青睐，被翻译成几十种文字出版，在法国和美国等地多次被拍成电影。','../data/img/153.jpg'),(10028,'基督山伯爵','大仲马','文学艺术',10,85,'《基督山伯爵》是法国作家大仲马创作的长篇小说，首次发表于1844—1846年。 故事讲述19世纪法国皇帝拿破仑“百日王朝”时期，法老号大副爱德蒙·唐泰斯受船长委托，为拿破仑党人送了一封信，遭到两个卑鄙小人和法官的陷害，被打入黑牢。期间狱友法利亚神甫向他传授各种知识，并在临终前把埋于基督山岛上的一批宝藏的秘密告诉了他。被陷害入狱十四年后，唐泰斯越狱后找到了宝藏，成为巨富，从此化名基督山伯爵（水手辛巴德、布索尼神父、威尔莫勋爵），经过精心策划，报答了恩人，惩罚了仇人。 该小说以基督山扬善惩恶、报恩复仇为故事发展的中心线索，主要情节跌宕起伏，迂回曲折，从中又演化出若干次要情节，小插曲紧凑精彩，却不喧宾夺主，情节离奇却不违反生活真实。全书出色地运用了“悬念”、“突发”、“发现”、“戏剧”等手法，在叙述上有较大的叙述密度和复杂的人物关系。这一切使这部小说充满了叙述的张力，洋溢着叙述本身所产生的美。因此，《基督山伯爵》被公认为通俗小说的典范。 这部小说出版后，很快就赢得了广大读者的青睐，被翻译成几十种文字出版，在法国和美国等地多次被拍成电影。','../data/img/154.jpg'),(10029,'基督山伯爵','大仲马','文学艺术',10,85,'《基督山伯爵》是法国作家大仲马创作的长篇小说，首次发表于1844—1846年。 故事讲述19世纪法国皇帝拿破仑“百日王朝”时期，法老号大副爱德蒙·唐泰斯受船长委托，为拿破仑党人送了一封信，遭到两个卑鄙小人和法官的陷害，被打入黑牢。期间狱友法利亚神甫向他传授各种知识，并在临终前把埋于基督山岛上的一批宝藏的秘密告诉了他。被陷害入狱十四年后，唐泰斯越狱后找到了宝藏，成为巨富，从此化名基督山伯爵（水手辛巴德、布索尼神父、威尔莫勋爵），经过精心策划，报答了恩人，惩罚了仇人。 该小说以基督山扬善惩恶、报恩复仇为故事发展的中心线索，主要情节跌宕起伏，迂回曲折，从中又演化出若干次要情节，小插曲紧凑精彩，却不喧宾夺主，情节离奇却不违反生活真实。全书出色地运用了“悬念”、“突发”、“发现”、“戏剧”等手法，在叙述上有较大的叙述密度和复杂的人物关系。这一切使这部小说充满了叙述的张力，洋溢着叙述本身所产生的美。因此，《基督山伯爵》被公认为通俗小说的典范。 这部小说出版后，很快就赢得了广大读者的青睐，被翻译成几十种文字出版，在法国和美国等地多次被拍成电影。','../data/img/155.jpg'),(10030,'基督山伯爵','大仲马','文学艺术',10,85,'《基督山伯爵》是法国作家大仲马创作的长篇小说，首次发表于1844—1846年。 故事讲述19世纪法国皇帝拿破仑“百日王朝”时期，法老号大副爱德蒙·唐泰斯受船长委托，为拿破仑党人送了一封信，遭到两个卑鄙小人和法官的陷害，被打入黑牢。期间狱友法利亚神甫向他传授各种知识，并在临终前把埋于基督山岛上的一批宝藏的秘密告诉了他。被陷害入狱十四年后，唐泰斯越狱后找到了宝藏，成为巨富，从此化名基督山伯爵（水手辛巴德、布索尼神父、威尔莫勋爵），经过精心策划，报答了恩人，惩罚了仇人。 该小说以基督山扬善惩恶、报恩复仇为故事发展的中心线索，主要情节跌宕起伏，迂回曲折，从中又演化出若干次要情节，小插曲紧凑精彩，却不喧宾夺主，情节离奇却不违反生活真实。全书出色地运用了“悬念”、“突发”、“发现”、“戏剧”等手法，在叙述上有较大的叙述密度和复杂的人物关系。这一切使这部小说充满了叙述的张力，洋溢着叙述本身所产生的美。因此，《基督山伯爵》被公认为通俗小说的典范。 这部小说出版后，很快就赢得了广大读者的青睐，被翻译成几十种文字出版，在法国和美国等地多次被拍成电影。','../data/img/156.jpg'),(10031,'基督山伯爵','大仲马','文学艺术',10,85,'《基督山伯爵》是法国作家大仲马创作的长篇小说，首次发表于1844—1846年。 故事讲述19世纪法国皇帝拿破仑“百日王朝”时期，法老号大副爱德蒙·唐泰斯受船长委托，为拿破仑党人送了一封信，遭到两个卑鄙小人和法官的陷害，被打入黑牢。期间狱友法利亚神甫向他传授各种知识，并在临终前把埋于基督山岛上的一批宝藏的秘密告诉了他。被陷害入狱十四年后，唐泰斯越狱后找到了宝藏，成为巨富，从此化名基督山伯爵（水手辛巴德、布索尼神父、威尔莫勋爵），经过精心策划，报答了恩人，惩罚了仇人。 该小说以基督山扬善惩恶、报恩复仇为故事发展的中心线索，主要情节跌宕起伏，迂回曲折，从中又演化出若干次要情节，小插曲紧凑精彩，却不喧宾夺主，情节离奇却不违反生活真实。全书出色地运用了“悬念”、“突发”、“发现”、“戏剧”等手法，在叙述上有较大的叙述密度和复杂的人物关系。这一切使这部小说充满了叙述的张力，洋溢着叙述本身所产生的美。因此，《基督山伯爵》被公认为通俗小说的典范。 这部小说出版后，很快就赢得了广大读者的青睐，被翻译成几十种文字出版，在法国和美国等地多次被拍成电影。','../data/img/157.jpg');
/*!40000 ALTER TABLE `booklist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-07 15:07:01
