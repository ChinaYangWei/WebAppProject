﻿--注意，如果想手机访问数据库需要ctrl+f把127.0.0.1本地域名换成本地电脑ip
SET NAMES UTF8;
DROP DATABASE IF EXISTS dji;
CREATE DATABASE djiApp CHARSET=UTF8;
USE djiApp;

CREATE TABLE dji_user(
  user_id INT PRIMARY KEY AUTO_INCREMENT comment '用户的id',
  reg_way VARCHAR(16) comment '用户注册方式',
  user_phone CHAR(11) comment '用户手机号',
  user_email VARCHAR(64) comment '用户邮箱',
  user_pwd VARCHAR(128) comment '用户密码'
);
INSERT INTO dji_user VALUES
(NULL,"phone",15555555555,"2585351891@qq.com","123456..");

CREATE TABLE dji_cart(
  cart_id INT PRIMARY KEY AUTO_INCREMENT comment '购物车的id',
  user_id INT comment '用户的id',
  product_id INT comment '商品的id',
  product_count INT comment '商品的数量',
  product_isSelect CHAR(1) comment '商品的选中状态'
);

CREATE TABLE dji_product(
  product_id INT PRIMARY KEY AUTO_INCREMENT comment '商品的id',
  product_img VARCHAR(128) comment '商品的图片',
  product_ify VARCHAR(28) comment '商品的分类',
  product_title VARCHAR(128) comment '商品的介绍',
  product_Oprice DECIMAL(8,2) comment '商品的本来的价格',
  product_Nprice DECIMAL(8,2) comment '商品的打折后的价格',
  product_select VARCHAR(1) comment '商品是否为推荐商品',
  relevancy_id INT comment '关联的子产品id'
);
INSERT INTO dji_product VALUES
(NULL,'http://127.0.0.1:3000/images/Osmo1_one.jpg','灵眸 Osmo','口袋云台相机',2499,0,0,7),
(NULL,'http://127.0.0.1:3000/images/Osmo2_one.jpg','灵眸 Osmo','手机云台2',899,0,1,7),
(NULL,'http://127.0.0.1:3000/images/Mavic1_one.jpg','"御" Mavic','2',9888,0,1,NULL),
(NULL,'http://127.0.0.1:3000/images/Mavic2_one.jpg','"御" Mavic','Air',4999,0,0,NULL),
(NULL,'http://127.0.0.1:3000/images/Mavic3_one.jpg','"御" Mavic','Pro 铂金版',6499,0,0,NULL),
(NULL,'http://127.0.0.1:3000/images/spark1_one.jpg','"晓" Spark','操控套装',3199,0,1,NULL),
(NULL,'http://127.0.0.1:3000/images/mobile1_relevancy.jpg',"闪迪 microSD卡","64GB",119,0,1,NULL);

CREATE TABLE dji_img(
  img_id INT PRIMARY KEY AUTO_INCREMENT comment '图片的id',
  relevancy_id INT comment '图片关联的商品id',
  img_url VARCHAR(128) comment '图片的地址'
);
INSERT INTO dji_img VALUES
(NULL,'1','http://127.0.0.1:3000/images/Osmo1_one.jpg'),
(NULL,'1','http://127.0.0.1:3000/images/Osmo1_two.jpg'),
(NULL,'1','http://127.0.0.1:3000/images/Osmo1_three.jpg'),
(NULL,'2','http://127.0.0.1:3000/images/Osmo2_one.jpg'),
(NULL,'2','http://127.0.0.1:3000/images/Osmo2_two.jpg'),
(NULL,'2','http://127.0.0.1:3000/images/Osmo2_three.jpg'),
(NULL,'3','http://127.0.0.1:3000/images/Mavic1_one.jpg'),
(NULL,'3','http://127.0.0.1:3000/images/Mavic1_two.jpg'),
(NULL,'3','http://127.0.0.1:3000/images/Mavic1_three.jpg'),
(NULL,'4','http://127.0.0.1:3000/images/Mavic2_one.jpg'),
(NULL,'4','http://127.0.0.1:3000/images/Mavic2_two.jpg'),
(NULL,'4','http://127.0.0.1:3000/images/Mavic2_three.jpg'),
(NULL,'5','http://127.0.0.1:3000/images/Mavic3_one.jpg'),
(NULL,'5','http://127.0.0.1:3000/images/Mavic3_two.jpg'),
(NULL,'5','http://127.0.0.1:3000/images/Mavic3_three.jpg'),
(NULL,'6','http://127.0.0.1:3000/images/spark1_one.jpg'),
(NULL,'6','http://127.0.0.1:3000/images/spark1_two.jpg'),
(NULL,'6','http://127.0.0.1:3000/images/spark1_three.jpg'),
(NULL,'7','http://127.0.0.1:3000/images/mobile1_relevancy.jpg'),
(NULL,'7','http://127.0.0.1:3000/images/mobile2_relevancy.jpg'),
(NULL,'7','http://127.0.0.1:3000/images/mobile3_relevancy.jpg');

CREATE TABLE dji_banner(
  banner_id INT PRIMARY KEY AUTO_INCREMENT comment '轮播图的id',
  banner_href VARCHAR(128) comment '轮播图的超链接',
  banner_img VARCHAR(128) comment '轮播图的地址',
  banner_productLnTop VARCHAR(128) comment '轮播图的简介(上)',
  banner_productLnBottom VARCHAR(128) comment '轮播图的简介(下)'
);
INSERT INTO dji_banner VALUES
(NULL,null,'http://127.0.0.1:3000/images/swipe1.png',"御 MAVIC 2","画质旗舰，变焦先锋"),
(NULL,null,'http://127.0.0.1:3000/images/swipe2.png',"灵眸 OSMO 口袋云台相机","转动随心，灵感不停");

CREATE TABLE dji_shaky(
  shaky_id INT PRIMARY KEY AUTO_INCREMENT comment '活动的id',
  shaky_title VARCHAR(128) comment '活动的介绍',
  shaky_a VARCHAR(128) comment '活动的链接',
  shaky_imgUrl VARCHAR(128) comment '活动的图片地址'
);

INSERT INTO dji_shaky VALUES
(NULL,"DJI Select 会员计划 7项会员权益｜最高5折优惠",NULL,'http://127.0.0.1:3000/images/select.png');

CREATE TABLE dji_favourable(
  favourable_id INT PRIMARY KEY AUTO_INCREMENT comment '优惠的id',
  favourable_title VARCHAR(128) comment '优惠的介绍',
  favourable_a VARCHAR(128) comment '优惠的链接',
  favourable_imgUrl VARCHAR(128) comment '优惠的图片地址'
);
INSERT INTO dji_favourable VALUES
(NULL,"翻新机 实惠价格 | 质量保证 | 同等保修",NULL,'http://127.0.0.1:3000/images/refurbished.png'),
(NULL,"教育折扣 最高九折",NULL,'http://127.0.0.1:3000/images/edu_discount.png');

