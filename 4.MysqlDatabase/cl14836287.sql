-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: cl14836287
-- ------------------------------------------------------
-- Server version	5.7.31

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
-- Current Database: `cl14836287`
--

/*!40000 DROP DATABASE IF EXISTS `cl14836287`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cl14836287` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `cl14836287`;

--
-- Table structure for table `baoxiuchuli`
--

DROP TABLE IF EXISTS `baoxiuchuli`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baoxiuchuli` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `sheshibianhao` varchar(200) DEFAULT NULL COMMENT '设施编号',
  `sheshimingcheng` varchar(200) DEFAULT NULL COMMENT '设施名称',
  `tupian` longtext COMMENT '图片',
  `chulixiangqing` longtext COMMENT '处理详情',
  `chulishijian` datetime DEFAULT NULL COMMENT '处理时间',
  `yonghuzhanghao` varchar(200) DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) DEFAULT NULL COMMENT '用户姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COMMENT='报修处理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baoxiuchuli`
--

LOCK TABLES `baoxiuchuli` WRITE;
/*!40000 ALTER TABLE `baoxiuchuli` DISABLE KEYS */;
INSERT INTO `baoxiuchuli` VALUES (91,'2024-03-29 06:16:01','设施编号1','设施名称1','file/baoxiuchuliTupian1.jpg,file/baoxiuchuliTupian2.jpg,file/baoxiuchuliTupian3.jpg','处理详情1','2024-03-29 14:16:01','用户账号1','用户姓名1'),(92,'2024-03-29 06:16:01','设施编号2','设施名称2','file/baoxiuchuliTupian2.jpg,file/baoxiuchuliTupian3.jpg,file/baoxiuchuliTupian4.jpg','处理详情2','2024-03-29 14:16:01','用户账号2','用户姓名2'),(93,'2024-03-29 06:16:01','设施编号3','设施名称3','file/baoxiuchuliTupian3.jpg,file/baoxiuchuliTupian4.jpg,file/baoxiuchuliTupian5.jpg','处理详情3','2024-03-29 14:16:01','用户账号3','用户姓名3'),(94,'2024-03-29 06:16:01','设施编号4','设施名称4','file/baoxiuchuliTupian4.jpg,file/baoxiuchuliTupian5.jpg,file/baoxiuchuliTupian6.jpg','处理详情4','2024-03-29 14:16:01','用户账号4','用户姓名4'),(95,'2024-03-29 06:16:01','设施编号5','设施名称5','file/baoxiuchuliTupian5.jpg,file/baoxiuchuliTupian6.jpg,file/baoxiuchuliTupian7.jpg','处理详情5','2024-03-29 14:16:01','用户账号5','用户姓名5'),(96,'2024-03-29 06:16:01','设施编号6','设施名称6','file/baoxiuchuliTupian6.jpg,file/baoxiuchuliTupian7.jpg,file/baoxiuchuliTupian8.jpg','处理详情6','2024-03-29 14:16:01','用户账号6','用户姓名6');
/*!40000 ALTER TABLE `baoxiuchuli` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'swiper1','file/swiperPicture1.jpg'),(2,'swiper2','file/swiperPicture2.jpg'),(3,'swiper3','file/swiperPicture3.jpg');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussshequhuodong`
--

DROP TABLE IF EXISTS `discussshequhuodong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussshequhuodong` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `avatarurl` longtext COMMENT '头像',
  `nickname` varchar(200) DEFAULT NULL COMMENT '用户名',
  `content` longtext NOT NULL COMMENT '评论内容',
  `reply` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='社区活动评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussshequhuodong`
--

LOCK TABLES `discussshequhuodong` WRITE;
/*!40000 ALTER TABLE `discussshequhuodong` DISABLE KEYS */;
/*!40000 ALTER TABLE `discussshequhuodong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum`
--

DROP TABLE IF EXISTS `forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) DEFAULT NULL COMMENT '帖子标题',
  `content` longtext NOT NULL COMMENT '帖子内容',
  `parentid` bigint(20) DEFAULT NULL COMMENT '父节点id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `avatarurl` longtext COMMENT '头像',
  `isdone` varchar(200) DEFAULT NULL COMMENT '状态',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='论坛交流';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum`
--

LOCK TABLES `forum` WRITE;
/*!40000 ALTER TABLE `forum` DISABLE KEYS */;
INSERT INTO `forum` VALUES (31,'2024-03-29 06:16:01','帖子标题1','帖子内容1',0,'用户名1','file/forumAvatarurl1.jpg,file/forumAvatarurl2.jpg,file/forumAvatarurl3.jpg','开放',1),(32,'2024-03-29 06:16:01','帖子标题2','帖子内容2',0,'用户名2','file/forumAvatarurl2.jpg,file/forumAvatarurl3.jpg,file/forumAvatarurl4.jpg','开放',2),(33,'2024-03-29 06:16:01','帖子标题3','帖子内容3',0,'用户名3','file/forumAvatarurl3.jpg,file/forumAvatarurl4.jpg,file/forumAvatarurl5.jpg','开放',3),(34,'2024-03-29 06:16:01','帖子标题4','帖子内容4',0,'用户名4','file/forumAvatarurl4.jpg,file/forumAvatarurl5.jpg,file/forumAvatarurl6.jpg','开放',4),(35,'2024-03-29 06:16:01','帖子标题5','帖子内容5',0,'用户名5','file/forumAvatarurl5.jpg,file/forumAvatarurl6.jpg,file/forumAvatarurl7.jpg','开放',5),(36,'2024-03-29 06:16:01','帖子标题6','帖子内容6',0,'用户名6','file/forumAvatarurl6.jpg,file/forumAvatarurl7.jpg,file/forumAvatarurl8.jpg','开放',6);
/*!40000 ALTER TABLE `forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `huodongbaoming`
--

DROP TABLE IF EXISTS `huodongbaoming`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `huodongbaoming` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `huodongbianhao` varchar(200) DEFAULT NULL COMMENT '活动编号',
  `huodongmingcheng` varchar(200) DEFAULT NULL COMMENT '活动名称',
  `huodongdidian` varchar(200) DEFAULT NULL COMMENT '活动地点',
  `renshu` int(11) DEFAULT NULL COMMENT '参加人数',
  `yonghuzhanghao` varchar(200) DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) DEFAULT NULL COMMENT '用户姓名',
  `dianhuahaoma` varchar(200) DEFAULT NULL COMMENT '电话号码',
  `sfsh` varchar(200) DEFAULT NULL COMMENT '是否审核',
  `shhf` longtext COMMENT '回复内容',
  `crossuserid` bigint(20) DEFAULT NULL COMMENT '跨表用户id',
  `crossrefid` bigint(20) DEFAULT NULL COMMENT '跨表主键id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='活动报名';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `huodongbaoming`
--

LOCK TABLES `huodongbaoming` WRITE;
/*!40000 ALTER TABLE `huodongbaoming` DISABLE KEYS */;
INSERT INTO `huodongbaoming` VALUES (71,'2024-03-29 06:16:01','活动编号1','活动名称1','活动地点1',1,'用户账号1','用户姓名1','电话号码1','是','',1,1),(72,'2024-03-29 06:16:01','活动编号2','活动名称2','活动地点2',2,'用户账号2','用户姓名2','电话号码2','是','',2,2),(73,'2024-03-29 06:16:01','活动编号3','活动名称3','活动地点3',3,'用户账号3','用户姓名3','电话号码3','是','',3,3),(74,'2024-03-29 06:16:01','活动编号4','活动名称4','活动地点4',4,'用户账号4','用户姓名4','电话号码4','是','',4,4),(75,'2024-03-29 06:16:01','活动编号5','活动名称5','活动地点5',5,'用户账号5','用户姓名5','电话号码5','是','',5,5),(76,'2024-03-29 06:16:01','活动编号6','活动名称6','活动地点6',6,'用户账号6','用户姓名6','电话号码6','是','',6,6);
/*!40000 ALTER TABLE `huodongbaoming` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `menujson` longtext COMMENT '菜单',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'2024-03-29 06:16:02','[{\"backMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-qrcode\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"管理员\",\"menuJump\":\"列表\",\"tableName\":\"users\"},{\"appFrontIcon\":\"cuIcon-goodsnew\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"用户\",\"menuJump\":\"列表\",\"tableName\":\"yonghu\"}],\"fontClass\":\"icon-common33\",\"menu\":\"用户管理\",\"unicode\":\"&#xee6a;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-full\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"社区消息\",\"menuJump\":\"列表\",\"tableName\":\"shequxiaoxi\"}],\"fontClass\":\"icon-common43\",\"menu\":\"社区消息管理\",\"unicode\":\"&#xef27;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-brand\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"查看评论\"],\"menu\":\"社区活动\",\"menuJump\":\"列表\",\"tableName\":\"shequhuodong\"},{\"appFrontIcon\":\"cuIcon-form\",\"buttons\":[\"查看\",\"删除\",\"审核\"],\"menu\":\"活动报名\",\"menuJump\":\"列表\",\"tableName\":\"huodongbaoming\"}],\"fontClass\":\"icon-common17\",\"menu\":\"社区活动管理\",\"unicode\":\"&#xedfe;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-explore\",\"buttons\":[\"查看\",\"新增\",\"修改\",\"删除\",\"处理\"],\"menu\":\"设施报修\",\"menuJump\":\"列表\",\"tableName\":\"sheshibaoxiu\"},{\"appFrontIcon\":\"cuIcon-vip\",\"buttons\":[\"查看\",\"修改\",\"删除\"],\"menu\":\"报修处理\",\"menuJump\":\"列表\",\"tableName\":\"baoxiuchuli\"}],\"fontClass\":\"icon-common33\",\"menu\":\"设施报修管理\",\"unicode\":\"&#xee6a;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-paint\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"水电费信息\",\"menuJump\":\"列表\",\"tableName\":\"shuidianfeixinxi\"},{\"appFrontIcon\":\"cuIcon-goods\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"物业费信息\",\"menuJump\":\"列表\",\"tableName\":\"wuyefeixinxi\"}],\"fontClass\":\"icon-common9\",\"menu\":\"缴费信息管理\",\"unicode\":\"&#xedc9;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-cardboard\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"轮播图\",\"menuJump\":\"列表\",\"tableName\":\"config\"}],\"fontClass\":\"icon-common4\",\"menu\":\"轮播图管理\",\"unicode\":\"&#xedab;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-wenzi\",\"buttons\":[\"查看\",\"删除\",\"查看评论\",\"修改\"],\"menu\":\"论坛交流\",\"tableName\":\"forum\"}],\"fontClass\":\"icon-common26\",\"menu\":\"论坛管理\",\"unicode\":\"&#xee2b;\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-album\",\"buttons\":[\"查看\"],\"fontClass\":\"icon-common7\",\"menu\":\"社区消息\",\"menuJump\":\"列表\",\"tableName\":\"shequxiaoxi\",\"unicode\":\"&#xedb4;\"}],\"fontClass\":\"icon-common7\",\"menu\":\"社区消息\",\"unicode\":\"&#xedb4;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-goods\",\"buttons\":[\"查看\",\"报名\"],\"fontClass\":\"icon-common4\",\"menu\":\"社区活动\",\"menuJump\":\"列表\",\"tableName\":\"shequhuodong\",\"unicode\":\"&#xedab;\"}],\"fontClass\":\"icon-common4\",\"menu\":\"社区活动\",\"unicode\":\"&#xedab;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-flashlightopen\",\"buttons\":[\"新增\",\"查看\"],\"fontClass\":\"icon-common19\",\"menu\":\"设施报修\",\"menuJump\":\"列表\",\"tableName\":\"sheshibaoxiu\",\"unicode\":\"&#xee00;\"}],\"fontClass\":\"icon-common19\",\"menu\":\"设施报修\",\"unicode\":\"&#xee00;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-album\",\"buttons\":[\"查看\",\"新增\"],\"fontClass\":\"icon-common33\",\"menu\":\"论坛交流\",\"menuJump\":\"列表\",\"tableName\":\"forum\",\"unicode\":\"&#xee6a;\"}],\"fontClass\":\"icon-common33\",\"menu\":\"论坛交流\",\"unicode\":\"&#xee6a;\"}],\"hasBackLogin\":\"是\",\"hasBackRegister\":\"否\",\"hasFrontLogin\":\"否\",\"hasFrontRegister\":\"否\",\"roleName\":\"管理员\",\"tableName\":\"users\"},{\"backMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-form\",\"buttons\":[\"查看\"],\"menu\":\"活动报名\",\"menuJump\":\"列表\",\"tableName\":\"huodongbaoming\"}],\"fontClass\":\"icon-common17\",\"menu\":\"社区活动管理\",\"unicode\":\"&#xedfe;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-explore\",\"buttons\":[\"查看\",\"修改\",\"删除\"],\"menu\":\"设施报修\",\"menuJump\":\"列表\",\"tableName\":\"sheshibaoxiu\"},{\"appFrontIcon\":\"cuIcon-vip\",\"buttons\":[\"查看\"],\"menu\":\"报修处理\",\"menuJump\":\"列表\",\"tableName\":\"baoxiuchuli\"}],\"fontClass\":\"icon-common33\",\"menu\":\"设施报修管理\",\"unicode\":\"&#xee6a;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-paint\",\"buttons\":[\"查看\",\"支付\"],\"menu\":\"水电费信息\",\"menuJump\":\"列表\",\"tableName\":\"shuidianfeixinxi\"},{\"appFrontIcon\":\"cuIcon-goods\",\"buttons\":[\"查看\",\"支付\"],\"menu\":\"物业费信息\",\"menuJump\":\"列表\",\"tableName\":\"wuyefeixinxi\"}],\"fontClass\":\"icon-common9\",\"menu\":\"缴费信息管理\",\"unicode\":\"&#xedc9;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-discover\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"我的收藏\",\"menuJump\":\"1\",\"tableName\":\"storeup\"}],\"fontClass\":\"icon-common1\",\"menu\":\"我的收藏管理\",\"unicode\":\"&#xeda3;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-wenzi\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"我的发布\",\"menuJump\":\"14\",\"tableName\":\"forum\"}],\"fontClass\":\"icon-common26\",\"menu\":\"论坛管理\",\"unicode\":\"&#xee2b;\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-album\",\"buttons\":[\"查看\"],\"fontClass\":\"icon-common7\",\"menu\":\"社区消息\",\"menuJump\":\"列表\",\"tableName\":\"shequxiaoxi\",\"unicode\":\"&#xedb4;\"}],\"fontClass\":\"icon-common7\",\"menu\":\"社区消息\",\"unicode\":\"&#xedb4;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-goods\",\"buttons\":[\"查看\",\"报名\"],\"fontClass\":\"icon-common4\",\"menu\":\"社区活动\",\"menuJump\":\"列表\",\"tableName\":\"shequhuodong\",\"unicode\":\"&#xedab;\"}],\"fontClass\":\"icon-common4\",\"menu\":\"社区活动\",\"unicode\":\"&#xedab;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-flashlightopen\",\"buttons\":[\"新增\",\"查看\"],\"fontClass\":\"icon-common19\",\"menu\":\"设施报修\",\"menuJump\":\"列表\",\"tableName\":\"sheshibaoxiu\",\"unicode\":\"&#xee00;\"}],\"fontClass\":\"icon-common19\",\"menu\":\"设施报修\",\"unicode\":\"&#xee00;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-album\",\"buttons\":[\"查看\",\"新增\"],\"fontClass\":\"icon-common33\",\"menu\":\"论坛交流\",\"menuJump\":\"列表\",\"tableName\":\"forum\",\"unicode\":\"&#xee6a;\"}],\"fontClass\":\"icon-common33\",\"menu\":\"论坛交流\",\"unicode\":\"&#xee6a;\"}],\"hasBackLogin\":\"否\",\"hasBackRegister\":\"否\",\"hasFrontLogin\":\"是\",\"hasFrontRegister\":\"是\",\"roleName\":\"用户\",\"tableName\":\"yonghu\"}]');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shequhuodong`
--

DROP TABLE IF EXISTS `shequhuodong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shequhuodong` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `huodongbianhao` varchar(200) DEFAULT NULL COMMENT '活动编号',
  `huodongmingcheng` varchar(200) NOT NULL COMMENT '活动名称',
  `huodongtupian` longtext COMMENT '活动图片',
  `kaishishijian` datetime DEFAULT NULL COMMENT '开始时间',
  `jieshushijian` datetime DEFAULT NULL COMMENT '结束时间',
  `renshu` int(11) DEFAULT NULL COMMENT '已参加人数',
  `huodongdidian` varchar(200) DEFAULT NULL COMMENT '活动地点',
  `huodongneirong` longtext COMMENT '活动内容',
  `fabushijian` datetime DEFAULT NULL COMMENT '发布时间',
  `thumbsupnum` int(11) DEFAULT NULL COMMENT '赞',
  `crazilynum` int(11) DEFAULT NULL COMMENT '踩',
  `storeupnum` int(11) DEFAULT NULL COMMENT '收藏数量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `huodongbianhao` (`huodongbianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='社区活动';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shequhuodong`
--

LOCK TABLES `shequhuodong` WRITE;
/*!40000 ALTER TABLE `shequhuodong` DISABLE KEYS */;
INSERT INTO `shequhuodong` VALUES (61,'2024-03-29 06:16:01','1111111111','活动名称1','file/shequhuodongHuodongtupian1.jpg,file/shequhuodongHuodongtupian2.jpg,file/shequhuodongHuodongtupian3.jpg','2024-03-29 14:16:01','2024-03-29 14:16:01',1,'活动地点1','活动内容1','2024-03-29 14:16:01',1,1,1),(62,'2024-03-29 06:16:01','2222222222','活动名称2','file/shequhuodongHuodongtupian2.jpg,file/shequhuodongHuodongtupian3.jpg,file/shequhuodongHuodongtupian4.jpg','2024-03-29 14:16:01','2024-03-29 14:16:01',2,'活动地点2','活动内容2','2024-03-29 14:16:01',2,2,2),(63,'2024-03-29 06:16:01','3333333333','活动名称3','file/shequhuodongHuodongtupian3.jpg,file/shequhuodongHuodongtupian4.jpg,file/shequhuodongHuodongtupian5.jpg','2024-03-29 14:16:01','2024-03-29 14:16:01',3,'活动地点3','活动内容3','2024-03-29 14:16:01',3,3,3),(64,'2024-03-29 06:16:01','4444444444','活动名称4','file/shequhuodongHuodongtupian4.jpg,file/shequhuodongHuodongtupian5.jpg,file/shequhuodongHuodongtupian6.jpg','2024-03-29 14:16:01','2024-03-29 14:16:01',4,'活动地点4','活动内容4','2024-03-29 14:16:01',4,4,4),(65,'2024-03-29 06:16:01','5555555555','活动名称5','file/shequhuodongHuodongtupian5.jpg,file/shequhuodongHuodongtupian6.jpg,file/shequhuodongHuodongtupian7.jpg','2024-03-29 14:16:01','2024-03-29 14:16:01',5,'活动地点5','活动内容5','2024-03-29 14:16:01',5,5,5),(66,'2024-03-29 06:16:01','6666666666','活动名称6','file/shequhuodongHuodongtupian6.jpg,file/shequhuodongHuodongtupian7.jpg,file/shequhuodongHuodongtupian8.jpg','2024-03-29 14:16:01','2024-03-29 14:16:01',6,'活动地点6','活动内容6','2024-03-29 14:16:01',6,6,6);
/*!40000 ALTER TABLE `shequhuodong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shequxiaoxi`
--

DROP TABLE IF EXISTS `shequxiaoxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shequxiaoxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `biaoti` varchar(200) DEFAULT NULL COMMENT '标题',
  `fengmian` longtext COMMENT '封面',
  `neirong` longtext COMMENT '内容',
  `fabushijian` datetime DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='社区消息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shequxiaoxi`
--

LOCK TABLES `shequxiaoxi` WRITE;
/*!40000 ALTER TABLE `shequxiaoxi` DISABLE KEYS */;
INSERT INTO `shequxiaoxi` VALUES (51,'2024-03-29 06:16:01','标题1','file/shequxiaoxiFengmian1.jpg,file/shequxiaoxiFengmian2.jpg,file/shequxiaoxiFengmian3.jpg','内容1','2024-03-29 14:16:01'),(52,'2024-03-29 06:16:01','标题2','file/shequxiaoxiFengmian2.jpg,file/shequxiaoxiFengmian3.jpg,file/shequxiaoxiFengmian4.jpg','内容2','2024-03-29 14:16:01'),(53,'2024-03-29 06:16:01','标题3','file/shequxiaoxiFengmian3.jpg,file/shequxiaoxiFengmian4.jpg,file/shequxiaoxiFengmian5.jpg','内容3','2024-03-29 14:16:01'),(54,'2024-03-29 06:16:01','标题4','file/shequxiaoxiFengmian4.jpg,file/shequxiaoxiFengmian5.jpg,file/shequxiaoxiFengmian6.jpg','内容4','2024-03-29 14:16:01'),(55,'2024-03-29 06:16:01','标题5','file/shequxiaoxiFengmian5.jpg,file/shequxiaoxiFengmian6.jpg,file/shequxiaoxiFengmian7.jpg','内容5','2024-03-29 14:16:01'),(56,'2024-03-29 06:16:01','标题6','file/shequxiaoxiFengmian6.jpg,file/shequxiaoxiFengmian7.jpg,file/shequxiaoxiFengmian8.jpg','内容6','2024-03-29 14:16:01');
/*!40000 ALTER TABLE `shequxiaoxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sheshibaoxiu`
--

DROP TABLE IF EXISTS `sheshibaoxiu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sheshibaoxiu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `sheshibianhao` varchar(200) DEFAULT NULL COMMENT '设施编号',
  `sheshimingcheng` varchar(200) DEFAULT NULL COMMENT '设施名称',
  `sheshitupian` longtext COMMENT '设施图片',
  `suozaididian` varchar(200) DEFAULT NULL COMMENT '所在地点',
  `guzhangmiaoshu` longtext COMMENT '故障描述',
  `yonghuzhanghao` varchar(200) DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) DEFAULT NULL COMMENT '用户姓名',
  `shenbaoshijian` datetime DEFAULT NULL COMMENT '申报时间',
  `baoxiuzhuangtai` varchar(200) DEFAULT NULL COMMENT '报修状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COMMENT='设施报修';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sheshibaoxiu`
--

LOCK TABLES `sheshibaoxiu` WRITE;
/*!40000 ALTER TABLE `sheshibaoxiu` DISABLE KEYS */;
INSERT INTO `sheshibaoxiu` VALUES (81,'2024-03-29 06:16:01','设施编号1','设施名称1','file/sheshibaoxiuSheshitupian1.jpg,file/sheshibaoxiuSheshitupian2.jpg,file/sheshibaoxiuSheshitupian3.jpg','所在地点1','故障描述1','用户账号1','用户姓名1','2024-03-29 14:16:01','已处理'),(82,'2024-03-29 06:16:01','设施编号2','设施名称2','file/sheshibaoxiuSheshitupian2.jpg,file/sheshibaoxiuSheshitupian3.jpg,file/sheshibaoxiuSheshitupian4.jpg','所在地点2','故障描述2','用户账号2','用户姓名2','2024-03-29 14:16:01','已处理'),(83,'2024-03-29 06:16:01','设施编号3','设施名称3','file/sheshibaoxiuSheshitupian3.jpg,file/sheshibaoxiuSheshitupian4.jpg,file/sheshibaoxiuSheshitupian5.jpg','所在地点3','故障描述3','用户账号3','用户姓名3','2024-03-29 14:16:01','已处理'),(84,'2024-03-29 06:16:01','设施编号4','设施名称4','file/sheshibaoxiuSheshitupian4.jpg,file/sheshibaoxiuSheshitupian5.jpg,file/sheshibaoxiuSheshitupian6.jpg','所在地点4','故障描述4','用户账号4','用户姓名4','2024-03-29 14:16:01','已处理'),(85,'2024-03-29 06:16:01','设施编号5','设施名称5','file/sheshibaoxiuSheshitupian5.jpg,file/sheshibaoxiuSheshitupian6.jpg,file/sheshibaoxiuSheshitupian7.jpg','所在地点5','故障描述5','用户账号5','用户姓名5','2024-03-29 14:16:01','已处理'),(86,'2024-03-29 06:16:01','设施编号6','设施名称6','file/sheshibaoxiuSheshitupian6.jpg,file/sheshibaoxiuSheshitupian7.jpg,file/sheshibaoxiuSheshitupian8.jpg','所在地点6','故障描述6','用户账号6','用户姓名6','2024-03-29 14:16:01','已处理');
/*!40000 ALTER TABLE `sheshibaoxiu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shuidianfeixinxi`
--

DROP TABLE IF EXISTS `shuidianfeixinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shuidianfeixinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `dingdanhao` varchar(200) DEFAULT NULL COMMENT '订单号',
  `yonghuzhanghao` varchar(200) DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) DEFAULT NULL COMMENT '用户姓名',
  `jiatingzhuzhi` varchar(200) DEFAULT NULL COMMENT '家庭住址',
  `yongdianliang` double DEFAULT NULL COMMENT '用电量（度）',
  `dianfeidanjia` double DEFAULT NULL COMMENT '电费单价',
  `yongshuiliang` double DEFAULT NULL COMMENT '用水量(m³)',
  `shuifeidanjia` double DEFAULT NULL COMMENT '水费单价',
  `yingshoushuidianfei` double DEFAULT NULL COMMENT '应收水电费',
  `jifeiriqi` date DEFAULT NULL COMMENT '计费日期',
  `jiezhiriqi` date DEFAULT NULL COMMENT '截止日期',
  `ispay` varchar(200) DEFAULT NULL COMMENT '是否支付',
  `jiaofeiriqi` datetime DEFAULT NULL COMMENT '缴费日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dingdanhao` (`dingdanhao`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COMMENT='水电费信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shuidianfeixinxi`
--

LOCK TABLES `shuidianfeixinxi` WRITE;
/*!40000 ALTER TABLE `shuidianfeixinxi` DISABLE KEYS */;
INSERT INTO `shuidianfeixinxi` VALUES (101,'2024-03-29 06:16:01','1111111111','用户账号1','用户姓名1','家庭住址1',1,1,1,1,1,'2024-03-29','2024-03-29','未支付','2024-03-29 14:16:01'),(102,'2024-03-29 06:16:01','2222222222','用户账号2','用户姓名2','家庭住址2',2,2,2,2,2,'2024-03-29','2024-03-29','未支付','2024-03-29 14:16:01'),(103,'2024-03-29 06:16:01','3333333333','用户账号3','用户姓名3','家庭住址3',3,3,3,3,3,'2024-03-29','2024-03-29','未支付','2024-03-29 14:16:01'),(104,'2024-03-29 06:16:01','4444444444','用户账号4','用户姓名4','家庭住址4',4,4,4,4,4,'2024-03-29','2024-03-29','未支付','2024-03-29 14:16:01'),(105,'2024-03-29 06:16:01','5555555555','用户账号5','用户姓名5','家庭住址5',5,5,5,5,5,'2024-03-29','2024-03-29','未支付','2024-03-29 14:16:01'),(106,'2024-03-29 06:16:01','6666666666','用户账号6','用户姓名6','家庭住址6',6,6,6,6,6,'2024-03-29','2024-03-29','未支付','2024-03-29 14:16:01');
/*!40000 ALTER TABLE `shuidianfeixinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeup`
--

DROP TABLE IF EXISTS `storeup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storeup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) DEFAULT NULL COMMENT 'refid',
  `tablename` varchar(200) DEFAULT NULL COMMENT '表名',
  `name` varchar(200) NOT NULL COMMENT '名称',
  `picture` longtext NOT NULL COMMENT '图片',
  `type` varchar(200) DEFAULT NULL COMMENT '类型(1:收藏,21:赞,22:踩,31:竞拍参与,41:关注)',
  `inteltype` varchar(200) DEFAULT NULL COMMENT '推荐类型',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='我的收藏';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeup`
--

LOCK TABLES `storeup` WRITE;
/*!40000 ALTER TABLE `storeup` DISABLE KEYS */;
/*!40000 ALTER TABLE `storeup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='token表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,1,'admin','users','管理员','ncvv7cfvxan3cz2qbm9es9gztcrxjjoo','2024-03-29 06:21:03','2024-03-29 07:21:03');
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `username` varchar(200) NOT NULL COMMENT '用户名',
  `password` varchar(200) NOT NULL COMMENT '密码',
  `role` varchar(200) DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2024-03-29 06:16:02','admin','admin','管理员');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wuyefeixinxi`
--

DROP TABLE IF EXISTS `wuyefeixinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wuyefeixinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `dingdanhao` varchar(200) DEFAULT NULL COMMENT '订单号',
  `yonghuzhanghao` varchar(200) DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) DEFAULT NULL COMMENT '用户姓名',
  `jiatingzhuzhi` varchar(200) DEFAULT NULL COMMENT '家庭住址',
  `jidu` varchar(200) DEFAULT NULL COMMENT '季度',
  `wuyefei` double DEFAULT NULL COMMENT '物业费',
  `ispay` varchar(200) DEFAULT NULL COMMENT '是否支付',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dingdanhao` (`dingdanhao`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COMMENT='物业费信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wuyefeixinxi`
--

LOCK TABLES `wuyefeixinxi` WRITE;
/*!40000 ALTER TABLE `wuyefeixinxi` DISABLE KEYS */;
INSERT INTO `wuyefeixinxi` VALUES (111,'2024-03-29 06:16:01','1111111111','用户账号1','用户姓名1','家庭住址1','季度1',1,'未支付'),(112,'2024-03-29 06:16:01','2222222222','用户账号2','用户姓名2','家庭住址2','季度2',2,'未支付'),(113,'2024-03-29 06:16:01','3333333333','用户账号3','用户姓名3','家庭住址3','季度3',3,'未支付'),(114,'2024-03-29 06:16:01','4444444444','用户账号4','用户姓名4','家庭住址4','季度4',4,'未支付'),(115,'2024-03-29 06:16:01','5555555555','用户账号5','用户姓名5','家庭住址5','季度5',5,'未支付'),(116,'2024-03-29 06:16:01','6666666666','用户账号6','用户姓名6','家庭住址6','季度6',6,'未支付');
/*!40000 ALTER TABLE `wuyefeixinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yonghu`
--

DROP TABLE IF EXISTS `yonghu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yonghu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuzhanghao` varchar(200) NOT NULL COMMENT '用户账号',
  `yonghumima` varchar(200) NOT NULL COMMENT '用户密码',
  `yonghuxingming` varchar(200) NOT NULL COMMENT '用户姓名',
  `touxiang` longtext COMMENT '头像',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `dianhuahaoma` varchar(200) DEFAULT NULL COMMENT '电话号码',
  `shenfenzhenghaoma` varchar(200) DEFAULT NULL COMMENT '身份证号码',
  `jiatingzhuzhi` varchar(200) DEFAULT NULL COMMENT '家庭住址',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yonghuzhanghao` (`yonghuzhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yonghu`
--

LOCK TABLES `yonghu` WRITE;
/*!40000 ALTER TABLE `yonghu` DISABLE KEYS */;
INSERT INTO `yonghu` VALUES (41,'2024-03-29 06:16:01','用户账号1','123456','用户姓名1','file/yonghuTouxiang1.jpg','男','19819881111','441622200101010001','家庭住址1'),(42,'2024-03-29 06:16:01','用户账号2','123456','用户姓名2','file/yonghuTouxiang2.jpg','男','19819881112','441622200202020002','家庭住址2'),(43,'2024-03-29 06:16:01','用户账号3','123456','用户姓名3','file/yonghuTouxiang3.jpg','男','19819881113','441622200303030003','家庭住址3'),(44,'2024-03-29 06:16:01','用户账号4','123456','用户姓名4','file/yonghuTouxiang4.jpg','男','19819881114','441622200404040004','家庭住址4'),(45,'2024-03-29 06:16:01','用户账号5','123456','用户姓名5','file/yonghuTouxiang5.jpg','男','19819881115','441622200505050005','家庭住址5'),(46,'2024-03-29 06:16:01','用户账号6','123456','用户姓名6','file/yonghuTouxiang6.jpg','男','19819881116','441622200606060006','家庭住址6');
/*!40000 ALTER TABLE `yonghu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-31 14:38:57
