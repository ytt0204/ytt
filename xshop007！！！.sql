/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50525
Source Host           : localhost:3306
Source Database       : xshop

Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2013-10-31 11:21:30
*/

SET FOREIGN_KEY_CHECKS=0;

create database xshop;
use xshop;

-- ----------------------------
-- Table structure for `addressbook`
-- ----------------------------
DROP TABLE IF EXISTS `addressbook`;
CREATE TABLE `addressbook` (
  `addressid` int(11) NOT NULL AUTO_INCREMENT COMMENT '地址薄id',
  `receiver` varchar(20) NOT NULL COMMENT '收件人',
  `phone` varchar(20) NOT NULL COMMENT '电话',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `username` varchar(20) DEFAULT NULL COMMENT '谁的地址薄',
  PRIMARY KEY (`addressid`),
  KEY `FK_addressbook_username` (`username`),
  CONSTRAINT `FK_addressbook_username` FOREIGN KEY (`username`) REFERENCES `customer` (`uname`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='地址薄';

-- ----------------------------
-- Records of addressbook
-- ----------------------------
INSERT INTO `addressbook` VALUES ('5', '张三', '1234567', '郑州市金水区花园路144号', 'ss');

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminname` varchar(20) NOT NULL COMMENT '用户名',
  `adminpwd` varchar(20) DEFAULT NULL COMMENT '密码',
  `state` varchar(11) DEFAULT NULL COMMENT '状态 0标示正常，1为禁用',
  PRIMARY KEY (`adminname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('admin', 'admin', '正常');

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT '类别id',
  `cname` varchar(255) NOT NULL COMMENT '类别名',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='产品类别表';

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '衬衫');
INSERT INTO `category` VALUES ('2', '针织衫');
INSERT INTO `category` VALUES ('3', '卫衣');
INSERT INTO `category` VALUES ('4', '休闲裤');
INSERT INTO `category` VALUES ('5', '法兰绒');
INSERT INTO `category` VALUES ('6', '帆布鞋');
INSERT INTO `category` VALUES ('7', 'T恤');
INSERT INTO `category` VALUES ('8', '羽绒服');
INSERT INTO `category` VALUES ('9', '分类');

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `uname` varchar(255) NOT NULL COMMENT '用户名',
  `upwd` varchar(20) DEFAULT NULL COMMENT '密码',
  `regdate` datetime DEFAULT NULL COMMENT '注册时间',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `tel` varchar(20) DEFAULT NULL COMMENT '电话',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('qq', 'qq', '2013-10-30 18:42:35', 'qq', '1111', '河南省', '正常');
INSERT INTO `customer` VALUES ('ss', 'ss', '2013-10-24 10:27:11', 'ss', '123', '河南省', '禁用');

-- ----------------------------
-- Table structure for `orderitems`
-- ----------------------------
DROP TABLE IF EXISTS `orderitems`;
CREATE TABLE `orderitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `orderid` varchar(255) DEFAULT NULL COMMENT '订单号',
  `pid` int(11) DEFAULT NULL COMMENT '产品id',
  `count` int(11) DEFAULT NULL COMMENT '此商品购买的数量',
  `price` double DEFAULT NULL COMMENT '当时购买的单价',
  `pname` varchar(255) DEFAULT NULL,
  `imagepath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_orderitems_pid` (`pid`),
  KEY `FK_orderitems_orderid` (`orderid`),
  CONSTRAINT `FK_orderitems_orderid` FOREIGN KEY (`orderid`) REFERENCES `orders` (`oid`),
  CONSTRAINT `FK_orderitems_pid` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='订单详情表';

-- ----------------------------
-- Records of orderitems
-- ----------------------------
INSERT INTO `orderitems` VALUES ('15', '2013-10-30-18-57-48-5748qq', '8', '1', '199', '加绒保暖长袖衬衫', 'uploadfile/2013/10/30/2013-10-30-09-41-14-4114-0.jpg');
INSERT INTO `orderitems` VALUES ('16', '2013-10-31-10-04-22-422ss', '17', '1', '129', '经典户外双层绒布卫衣', 'uploadfile/2013/10/31/2013-10-31-09-32-59-3259-0.jpg');
INSERT INTO `orderitems` VALUES ('17', '2013-10-31-10-04-22-422ss', '27', '1', '89', 'Sweety系列帆布女鞋', 'uploadfile/2013/10/31/2013-10-31-09-34-51-3451-0.jpg');
INSERT INTO `orderitems` VALUES ('18', '2013-10-31-10-21-52-2152ss', '23', '1', '129', '法兰绒棋盘格纹双袋格纹', 'uploadfile/2013/10/31/2013-10-31-09-34-06-346-0.jpg');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `oid` varchar(255) NOT NULL COMMENT '订单号 ',
  `totalprice` double NOT NULL COMMENT '订单总价',
  `posttime` datetime NOT NULL COMMENT '下单日期',
  `pname` varchar(1000) NOT NULL COMMENT '点单的商品数量',
  `state` varchar(11) NOT NULL COMMENT '订单状态 0为未付款，1为已付款等待发货，2已完成',
  `usernmae` varchar(20) NOT NULL COMMENT '订单拥有者',
  `addressid` int(11) NOT NULL COMMENT '收货地址',
  PRIMARY KEY (`oid`),
  KEY `FK_orders_usernmae` (`usernmae`),
  KEY `FK_orders_addressid` (`addressid`),
  CONSTRAINT `FK_orders_addressid` FOREIGN KEY (`addressid`) REFERENCES `addressbook` (`addressid`),
  CONSTRAINT `FK_orders_usernmae` FOREIGN KEY (`usernmae`) REFERENCES `customer` (`uname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('2013-10-30-18-57-48-5748qq', '199', '2013-10-30 18:57:48', '加绒保暖长袖衬衫,', '已发货', 'qq', '5');
INSERT INTO `orders` VALUES ('2013-10-31-10-04-22-422ss', '218', '2013-10-31 10:04:22', '经典户外双层绒布卫衣,Sweety系列帆布女鞋,', '已发货', 'ss', '5');
INSERT INTO `orders` VALUES ('2013-10-31-10-21-52-2152ss', '129', '2013-10-31 10:21:52', '法兰绒棋盘格纹双袋格纹,', '已下单', 'ss', '5');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pid` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品编号',
  `pname` varchar(255) NOT NULL COMMENT '产品名称',
  `price` double DEFAULT NULL COMMENT '产品单价',
  `discount` double DEFAULT NULL COMMENT '折扣',
  `pcount` int(11) DEFAULT NULL COMMENT '库存',
  `imagepath` varchar(255) DEFAULT NULL COMMENT '产品对应的图片',
  `description` varchar(8000) DEFAULT NULL COMMENT '描述',
  `posttime` datetime DEFAULT NULL COMMENT '最后一次修改日期',
  `author` varchar(20) DEFAULT NULL COMMENT '谁添加的商品',
  `cid` int(11) DEFAULT NULL COMMENT '类别id',
  `hot` varchar(11) DEFAULT NULL COMMENT '是否设为推荐商品 0为正常，1为推荐',
  `state` varchar(11) DEFAULT NULL COMMENT '上下架状态 0为上架，1为下架',
  `clickcount` int(11) DEFAULT NULL COMMENT '点击量',
  `sellCount` int(11) DEFAULT NULL COMMENT '售出量',
  PRIMARY KEY (`pid`),
  KEY `FK_product_author` (`author`),
  KEY `FK_product_cid` (`cid`),
  CONSTRAINT `FK_product_author` FOREIGN KEY (`author`) REFERENCES `admin` (`adminname`),
  CONSTRAINT `FK_product_cid` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='产品表';

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('8', '加绒保暖长袖衬衫', '199', '0.9', '1000', 'uploadfile/2013/10/31/2013-10-31-09-31-15-3115-0.jpg', '<p>13秋冬推出全新的法兰绒加绒保暖衬衫， 衬衫里衬选用优质绒面料，质地柔软、手 感滑爽富有弹性，具有很好的舒适感和极 佳的保暖性</p>\r\n', '2013-10-31 09:31:15', null, '1', '正常', '下架', '7', '2');
INSERT INTO `product` VALUES ('9', '纯棉条纹休闲衬衫', '149', '0.8', '1000', 'uploadfile/2013/10/31/2013-10-31-09-31-22-3122-0.jpg', '<p>衬衫采用100%纯棉材质，经水洗工艺 处理细腻、柔滑、舒适，肌肤触感极 佳穿着更加舒适。经典的条纹设计， 简约时尚</p>\r\n', '2013-10-31 09:31:22', null, '1', '正常', '下架', '2', null);
INSERT INTO `product` VALUES ('10', '羊羔绒保暖情侣衬衫', '249', '0.7', '1000', 'uploadfile/2013/10/31/2013-10-31-09-31-31-3131-0.jpg', '<p>13秋冬推出全新的羊羔绒保暖衬衫，衬衫里衬 选用优质羊羔绒，质地柔软、手感滑爽富有弹 性，具有很好的舒适感和极佳的保暖性.</p>\r\n', '2013-10-31 09:31:31', null, '1', '正常', '下架', null, '2');
INSERT INTO `product` VALUES ('11', '外套款夹棉长袖衬衫', '249', '0.9', '1000', 'uploadfile/2013/10/31/2013-10-31-09-31-38-3138-0.jpg', '<p>13秋冬推出全新的夹棉保暖衬衫。衬衫衣身 采用了流行的撞色拼接设计，增添的衬衫的 时尚气息，穿着更显档次。款式整体采用了 聚酯纤维材质，柔软光滑，不易起皱。衬衫 内里填料充实，保暖性极佳</p>\r\n', '2013-10-31 09:31:38', null, '1', '正常', '下架', null, null);
INSERT INTO `product` VALUES ('12', '法兰绒特色加厚双袋衬衫', '169', '0.9', '1000', 'uploadfile/2013/10/31/2013-10-31-09-31-55-3155-0.jpg', '<p>13秋冬推出全新的纯色法兰绒系列，款式采用100% 纯棉法兰绒面料，天然亲肤，经过请拉毛工艺处理， 衣服更加柔软舒适。 该款法兰绒衬衫使用加厚面料 保暖性更强</p>\r\n', '2013-10-31 09:31:55', null, '1', '正常', '下架', '2', null);
INSERT INTO `product` VALUES ('13', '纯棉多彩V领针织套衫', '99', '0.9', '1000', 'uploadfile/2013/10/31/2013-10-31-09-32-19-3219-0.jpg', '<p>经久不衰的纯棉针织套衫，与以往不同的是在领部加入了多彩彩条，领边的精致卷边处理，插肩袖的设计都是今年的流行点，搭配非常丰富多彩的配色，总有一件是适合您的。针织衫讲究穿着的舒适和易搭配，本季采用100%精梳棉面料，提高您的穿着体验。</p>\r\n', '2013-10-31 09:32:19', null, '2', '正常', '下架', '2', null);
INSERT INTO `product` VALUES ('14', 'Franky V领莫代尔针织套件', '129', '0.9', '1000', 'uploadfile/2013/10/31/2013-10-31-09-32-28-3228-0.jpg', '<p>简约V领套头衫，可随意搭配衬衫、t恤穿着，可正式也可休闲的百搭单品。采用面料为莫代尔棉，莫代尔面料为纯天然材料，对人体无害，丝面光泽，具有宜人的柔软触摸感觉和悬垂感以及极好的耐穿性能。<br />\r\n&nbsp; &nbsp; 【成分】：棉 52.1% 莫代尔纤维 47.9%</p>\r\n', '2013-10-31 09:32:28', null, '2', '正常', '下架', '2', null);
INSERT INTO `product` VALUES ('15', '棉质多彩加厚半拉链针织套衫', '149', '0.9', '1000', 'uploadfile/2013/10/31/2013-10-31-09-32-36-3236-0.jpg', '<p>此款针织衫衫领口处别具匠心的半开襟拉链设计，简洁大方，加厚版更加舒适暖和，棉质材质舒适吸汗，质感极佳。强调简约优雅、强调精致舒适的材质，一如既往的精巧做工。此款半门襟套衫简约百搭，是秋冬季节不可缺少的搭配单品。<br />\r\n&nbsp; &nbsp; 【成分】：51.2%腈纶+48.8%棉</p>\r\n', '2013-10-31 09:32:36', null, '2', '正常', '下架', null, null);
INSERT INTO `product` VALUES ('16', '简约素色连帽套头卫衣', '119', '0.9', '1000', 'uploadfile/2013/10/31/2013-10-31-09-32-50-3250-0.jpg', '<p>简约素色连帽套头卫衣是采用经典抓毛布制成的基础连帽套头帽衫。在添加了其必备的保暖功的同时又确保舒爽的肌肤触感。帽里配布为高密度华孚格，展现出其贴心的设计，简洁贴身的版型更适合秋冬作为内搭穿着。</p>\r\n', '2013-10-31 09:32:50', null, '3', '正常', '下架', '4', null);
INSERT INTO `product` VALUES ('17', '经典户外双层绒布卫衣', '129', '0.9', '1000', 'uploadfile/2013/10/31/2013-10-31-09-32-59-3259-0.jpg', '<p>VANCL推出了户外双层绒布连帽卫衣。大身面料采用100%棉的针织摇粒绒复合布，结实耐磨，内里是100%聚酯纤维摇粒绒的，而且采用上乘microfleece,微型摇粒绒质感滑腻，使您在穿着时更加舒适与温暖。松紧帽绳设计，在户外时更好的起到头部保暖作用。此款有多种颜色可供选择，同时还有同款的男款可供情侣们选择。</p>\r\n', '2013-10-31 09:32:59', null, '3', '正常', '下架', '4', '1');
INSERT INTO `product` VALUES ('18', '基础百搭弹力炫彩九分铅笔裤', '129', '0.9', '1000', 'uploadfile/2013/10/31/2013-10-31-09-33-14-3314-0.jpg', '<p>VANCL基础百搭弹力炫彩九分铅笔裤，色彩来袭，势不可挡！本款除了采用了经典色和时下最in色，还大胆的将嫩绿、嫩粉等甜美的色系融入产品的灵魂，赋予了铅笔裤更多的清新和唯美，让乐想女们的休闲生活更为多姿多彩!</p>\r\n', '2013-10-31 09:33:14', null, '4', '正常', '下架', null, null);
INSERT INTO `product` VALUES ('19', 'skyeisle 天空岛韩国夏季新款', '78', '0.9', '1000', 'uploadfile/2013/10/31/2013-10-31-09-33-25-3325-0.jpg', '<p>产品面料&nbsp; &nbsp; &nbsp; &nbsp; 100%棉<br />\r\n穿着季节 &nbsp; &nbsp; &nbsp; &nbsp; 夏<br />\r\n洗涤说明 &nbsp; &nbsp; &nbsp; &nbsp; 建议反面轻柔洗涤，不宜用热水清洗，悬挂晾干，分色洗涤，以免衣服染色。<br />\r\n设计亮点 &nbsp; &nbsp; &nbsp; &nbsp; 面料舒适修身、日常休闲必备良品<br />\r\n选款师推荐&nbsp; &nbsp; &nbsp; 韩国最热卖的一款休闲七分裤，穿上它甜美的气质怎么也盖不住的~ 亮色的格调，让你灵动自如，心情始终甜蜜。穿出别样的韵味。适合任何身材的MM们穿着。<br />\r\n温馨提示<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * 因个人显示器明亮、对比显示差异,图片与实物可能会有细微色差;<br />\r\n<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * 因测量方式不同,若有1-2cm误差皆属合理范围,此种不属于质量问题<br />\r\n<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * 本品牌为韩版尺码，与国内尺码相比偏小，顾客按照下方尺寸表挑选。</p>\r\n', '2013-10-31 09:33:25', null, '4', '正常', '下架', null, null);
INSERT INTO `product` VALUES ('20', '约翰逊女士纯棉休闲裤', '59', '0.9', '1000', 'uploadfile/2013/10/31/2013-10-31-09-33-33-3333-0.jpg', '<p>女士时尚休闲九分裤</p>\r\n', '2013-10-31 09:33:33', null, '4', '正常', '下架', '4', null);
INSERT INTO `product` VALUES ('21', '加绒保暖拼接法兰绒', '199', '0.9', '1000', 'uploadfile/2013/10/31/2013-10-31-09-33-46-3346-0.jpg', '<p>13秋冬推出全新的法兰绒加绒保暖衬衫， 衬衫里衬选用优质绒面料，质地柔软、手 感滑爽富有弹性，具有很好的舒适感和极 佳的保暖性</p>\r\n', '2013-10-31 09:33:46', null, '5', '正常', '下架', null, null);
INSERT INTO `product` VALUES ('22', '法兰绒特色加厚双袋休闲', '179', '0.9', '1000', 'uploadfile/2013/10/31/2013-10-31-09-33-55-3355-0.jpg', '<p>13凡客推出全新特色舒双穿法兰绒，衬衫采用了纯棉法兰绒材质，柔软舒适。且用料厚实，保暖性极佳。独特的两面双穿设计紧随时尚潮流，内外不同的格纹修饰，让您传出不一样的感觉</p>\r\n', '2013-10-31 09:33:55', null, '5', '正常', '下架', null, null);
INSERT INTO `product` VALUES ('23', '法兰绒棋盘格纹双袋格纹', '129', '0.9', '1000', 'uploadfile/2013/10/31/2013-10-31-09-34-06-346-0.jpg', '<p>13秋冬推出全新的纯色法兰绒系列，款式采用100% 纯棉法兰绒面料，天然亲肤，经过请拉毛工艺处理， 衣服更加柔软舒适。款式采用经典的棋盘格格纹样式 颜色亮丽柔和，带来浓厚学院风采。</p>\r\n', '2013-10-31 09:34:06', null, '5', '正常', '下架', '2', '1');
INSERT INTO `product` VALUES ('24', '狂欢派对系列帆布鞋', '139', '0.9', '1000', 'uploadfile/2013/10/31/2013-10-31-09-34-24-3424-0.jpg', '<p>经典低帮款鞋型，纯棉帆布，穿着舒服透气；天然橡胶制作而成的大底，质感轻便，纹路清晰美观，鞋底防滑耐磨有弹性。经典撞色款，鞋头锯齿橡胶设计，透着万圣节的炫彩，让我们一起狂欢吧。<br />\r\n<br />\r\n保养说明：<br />\r\n&nbsp; &nbsp; 1、请不要和酸、碱、盐等化学物质接触，以免腐蚀脱胶变形。<br />\r\n&nbsp; &nbsp; 2、可以轻柔均匀刷洗，但是切勿用力猛刷，以免断线、掉色或刷掉鞋身的图案及装饰部件。<br />\r\n&nbsp; &nbsp; 3、清洗后放通风阴凉处自然晾干，不要放在烈日下爆晒或放高温的地方烘烤，以防退胶或脱胶变形。<br />\r\n&nbsp; &nbsp; 4、尽可能避免和锋利尖锐的物品接触，以防划伤划破鞋底鞋身</p>\r\n', '2013-10-31 09:34:24', null, '6', '正常', '下架', null, null);
INSERT INTO `product` VALUES ('25', '基础简约系列帆布鞋', '139', '0.9', '1000', 'uploadfile/2013/10/31/2013-10-31-09-34-34-3434-0.jpg', '<p>基础简约高帮帆布鞋，粗纹路帆布搭配牛反绒皮，质感卓越，帅气十足，穿着舒服透气；天然橡胶制作而成的大底，质感轻便，纹路清晰美观，鞋底防滑耐磨有弹性。经典百搭款，不同材质拼接，低调透着奢华。<br />\r\n<br />\r\n保养说明：<br />\r\n&nbsp; &nbsp; 1、请不要和酸、碱、盐等化学物质接触，以免腐蚀脱胶变形。<br />\r\n&nbsp; &nbsp; 2、可以轻柔均匀刷洗，但是切勿用力猛刷，以免断线、掉色或刷掉鞋身的图案及装饰部件。<br />\r\n&nbsp; &nbsp; 3、清洗后放通风阴凉处自然晾干，不要放在烈日下爆晒或放高温的地方烘烤，以防退胶或脱胶变形。<br />\r\n&nbsp; &nbsp; 4、尽可能避免和锋利尖锐的物品接触，以防划伤划破鞋底鞋身</p>\r\n', '2013-10-31 09:34:34', null, '6', '正常', '下架', null, null);
INSERT INTO `product` VALUES ('26', 'Cowboy系列帆布鞋', '119', '0.9', '1000', 'uploadfile/2013/10/31/2013-10-31-09-34-44-3444-0.jpg', '', '2013-10-31 09:34:44', null, '6', '正常', '下架', null, null);
INSERT INTO `product` VALUES ('27', 'Sweety系列帆布女鞋', '89', '0.9', '1000', 'uploadfile/2013/10/31/2013-10-31-09-34-51-3451-0.jpg', '', '2013-10-31 09:34:52', null, '6', '正常', '下架', '2', '1');
INSERT INTO `product` VALUES ('28', '圆领条纹T恤', '138', '0.9', '1000', 'uploadfile/2013/10/31/2013-10-31-09-35-04-354-0.jpg', '<p>此款以H型为主，大身主要以蓝白色条纹贯穿而成，与条纹面料相配色的藏蓝色 纯色面料相拼接，条纹的贴袋设计，整体简约的设计感，营造一种纯粹的美感；大身接缝处以拷边技术进行密拷，使整体没有毛边，彰显品质感。</p>\r\n', '2013-10-31 09:35:05', null, '7', '正常', '下架', null, null);
INSERT INTO `product` VALUES ('29', 'VANCS短袖时尚休闲', '78', '0.9', '1000', 'uploadfile/2013/10/31/2013-10-31-09-35-16-3516-0.jpg', '<p>2013时尚夏季简约修身圆领短袖t恤</p>\r\n', '2013-10-31 09:35:16', null, '7', '正常', '下架', null, null);
INSERT INTO `product` VALUES ('30', 'ONE—T凡兔英伦时尚', '59', '0.9', '1000', 'uploadfile/2013/10/31/2013-10-31-09-35-24-3524-0.jpg', '<p>品牌类型: 时尚潮牌<br />\r\n袖长: 长袖（袖长57cm）<br />\r\n货号: T248<br />\r\n领型: 圆领<br />\r\n款式细节: 渐变色<br />\r\n工艺处理: 吊染<br />\r\n品牌: ONE－T/凡兔<br />\r\n袖型: 常规袖<br />\r\n花型图案: 巴黎铁塔<br />\r\n版型: 修身型<br />\r\n主材含量: 棉质<br />\r\n棉含量: 95%以上<br />\r\n适用季节: 春<br />\r\n年份: 2013<br />\r\n场合: 休闲<br />\r\n消费群体: 青年<br />\r\n男装-面料材质: 棉<br />\r\n男装-基础风格: 时尚都市<br />\r\n男装-细分风格: 潮<br />\r\nT恤-印花主题分类: 艺术绘画<br />\r\n男装-纱支等级分类: 细支纱（28s-60s）<br />\r\n男装-纱线后加工分类: 烧毛<br />\r\n男装-面料工艺等级: 全工艺（烧毛-前处理-丝光-染色-定型-预缩）<br />\r\n男装-纱线工艺分类: 全精梳</p>\r\n', '2013-10-31 09:35:24', null, '7', '正常', '下架', null, null);
INSERT INTO `product` VALUES ('31', '小熊帽子撞色短款羽绒服', '399', '0.9', '1000', 'uploadfile/2013/10/31/2013-10-31-09-35-39-3539-0.jpg', '<p>面料：100%聚酯纤维<br />\r\n里料：100%聚酯纤维<br />\r\n内袋：两个内袋设计<br />\r\n充绒量：94g-126g<br />\r\n含绒量：80%<br />\r\n填充物：灰鸭绒<br />\r\n<br />\r\n仿棉感温暖舒适面料，可爱卖萌的羊羔绒小熊耳朵羽绒夹克，是年轻女孩子的首选。<br />\r\n<br />\r\n致尊敬的顾客：此类商品由于面料特性，有可能有轻微绒丝外溢的现象。如有绒丝溢出，请勿硬拽，请从里侧轻轻拉回。<br />\r\n<br />\r\n【洗涤信息】40℃低温，轻柔手洗，不可漂白，不可翻转干燥，与其它衣物分开洗涤。在阴凉处悬挂晾干，干燥后，请轻轻拍打，恢复羽绒蓬松度。不可熨烫，不可干洗。</p>\r\n', '2013-10-31 09:35:39', null, '8', '正常', '下架', null, null);
INSERT INTO `product` VALUES ('32', '品质绅贵中长款羽绒服', '669', '0.9', '1000', 'uploadfile/2013/10/31/2013-10-31-09-35-48-3548-0.jpg', '<p>面料：100%聚酯纤维<br />\r\n里料：100%聚酯纤维<br />\r\n胆布：100%聚酯纤维<br />\r\n罗纹：98%聚酯纤维+2%氨纶&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br />\r\n填充物1：白鸭绒<br />\r\n填充物2：100%聚酯纤维<br />\r\n充绒量： 248g-298g<br />\r\n含绒量：80%<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br />\r\n采用高品质的白鸭绒和可拆卸连帽款式，轻便又温暖，防风御寒性好；周身多处的口袋设计；功能性极强；帽领收缩橡筋&amp;按扣设计，保暖性出众；合体的款型，贴合身形，突显气质。<br />\r\n<br />\r\n致尊敬的顾客：此类商品由于面料特性，有可能有轻微绒丝外溢的现象。如有绒丝溢出，请勿硬拽，请从里侧轻轻拉回。<br />\r\n<br />\r\n【洗涤信息】30℃低温，轻柔手洗</p>\r\n', '2013-10-31 09:35:48', null, '8', '正常', '下架', null, null);
