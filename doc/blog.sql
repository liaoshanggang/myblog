drop tablespace blog;
select tablespace_name,file_id,file_name,bytes from dba_data_files
where tablespace_name='blog';

--创建表空间, 最好创建到oracle安装的目录下，避免不小删除了。sys:change_on_install D:\oracle\datafiles\
create tablespace blog
datafile 'D:\app\Administrator\oradata\orcl\blog.dbf'
size 50M
autoextend on;

--删除用户, cascade级联删除该用户创建的数据库对象
--drop user blog cascade;
/*
创建用户并为用户分配表空间
新创建的用户开始是没有登录到Oracle的权限，要用系统管理员sys给blog授权
*/
create user blog
identified by blog
default tablespace USERS;

grant connect,resource to blog;
--grant create table,create any view,create procedure to blog;

--修改用户密码
--alter user blog identified by blog;

drop table blog_users;
drop table arti_category;
drop table article;
drop table comt;
drop table REPLY2;
drop table album;
drop table visitor;
drop table collection;

--用户信息表（id、用户名、密码、邮箱、手机号、性别、出生日期、简介、用户类型、学历）
create table blog_users(
  user_id integer not null primary key, 			--用户id
	user_name VARCHAR2(50 CHAR) not null unique, 	--用户名
	user_nickname VARCHAR2(50 CHAR),				--用户昵称
	user_password VARCHAR2(50 CHAR) not null, 		--密码
	user_email varchar2(50),						--邮箱
	user_mobile varchar2(11),						--用户手机
	user_sex varchar2(5), 							--性别
	user_birthday date,								--出生日期
	user_address varchar2(255),						--用户地址
	user_profile varchar2(255),						--简介
	user_type number(2), 							--用户类型（1.博主 2.普通用户访问者）
	user_image_url varchar2(255) NOT NULL,		 	--用户头像存储路径
	edu_Background varchar2(20)  					--学历
);

insert into blog_users (user_id, user_name, user_password,user_image_url)
values (blog_users_seq.nextval, 'admin', 'admin','admin');
select * from blog_users;

--文章分类表（id,类别）
create table arti_category(
	catg_id integer not null primary key, 	 	--类别id
	catg_name varchar2(100) not null
);			--类别
select * from arti_category;

--文章表（id,发表人，文章标题，文章内容，分类，文章链接地址，发表时间）
create table article(
	arti_id integer not null primary key, 	 				--文章id
	arti_title varchar(128) not null,						--文章标题
	arti_content clob not null,								--文章内容
	arti_catg_id not null references arti_category(catg_id),		--文章类别
	arti_user_id not null references blog_users(user_id),	--发表人
	arti_time timestamp default systimestamp not null,		--发表时间
	arti_comt_number integer,								--评论数量
	arti_page_view	integer									--浏览阅读量
	--content_link,											--文章链接地址
);

--评论表（id,要评论的文章，评论内容，评论人，评论时间）
create table comt(
	comt_id integer not null primary key,					--评论id
	comt_arti_id not null references article(arti_id),		--文章id
	comt_content varchar2(255) not null, 							--评论内容
	comt_user_id not null references blog_users(user_id),	--评论人id
	comt_time timestamp default systimestamp not null);--评论时间缺少右括号？？？？？？？

--回复(id,要回复的评论，回复内容，回复时间)
create table reply(
	reply_id integer not null primary key,					--回复id
	reply_comt_id not null references comt(comt_id),		--回复评论的id
	reply_content varchar2(255) not null,							--回复内容
	reply_time timestamp default systimestamp not null		
);--回复时间

--相册表
create table album(
	album_id integer not null primary key,					--相册id
	album_name varchar(255) not null,						--相册名
	album_src varchar(255) not null,						--相册路径
	album_description varchar(255) not null,				--相册描述
	upload_time timestamp default systimestamp not null		--图片上传时间 linkAddr,相册地址
);

--visitor 最近访客表
CREATE TABLE visitor (
	visitor_id integer not null primary key,				--访客ID
	visitor_time timestamp default systimestamp not null,	--访问时间
	visitor_ip varchar(15) NOT NULL,						--访客IP地址
	arti_id not null references article(arti_id)
);			--访问文章id

--collection收藏(id、收藏人，收藏名，链接地址，描述)
CREATE TABLE collection (
	colt_id integer not null primary key,					--收藏ID
	colt_user_id not null references blog_users(user_id),	--收藏人id
	colt_title varchar(255) NOT NULL,						--收藏名
	link_url varchar(255)NOT NULL,								--链接地址
	colt_description varchar(255) not null
  );					--收藏描述
--file_info(file_id，文件名，文件路径，文件图标存储路径，文件描述)
CREATE TABLE file_info (
	file_id integer not null primary key,					  --文件ID
	file_name varchar(255) not null,						  --文件名
	file_ext varchar(8),									  --文件扩展名
	file_path varchar(255) not null,						  --文件路径
	file_icon_url varchar(255)NOT NULL,					 	  --文件图标存储路径
	file_size integer,										  --文件大小
	file_modify_date timestamp default systimestamp not null, --文件更新时间
	file_create_date timestamp default systimestamp not null, --文件上传时间
	is_delete number(1),								  	  --0代表没有删除，1代表删除了
	is_folder number(1),								      --0代表不是文件夹，1代表是文件夹
	parent_id integer,
	file_description varchar(255)
  );
drop sequence blog_users_seq ;
drop sequence arti_category_seq ;
drop sequence article_seq ;
drop sequence comt_seq ;
drop sequence reply_seq ;
drop sequence album_seq ;
drop sequence visitor_seq ;
drop sequence collection_seq ;
drop sequence file_info_seq ;

create sequence file_info_seq start with 1;
create sequence blog_users_seq start with 1;
create sequence arti_category_seq start with 1;
create sequence article_seq start with 1;
create sequence comt_seq start with 1;
create sequence reply_seq start with 1;
create sequence album_seq start with 1;
create sequence visitor_seq start with 1;
create sequence collection_seq start with 1;

