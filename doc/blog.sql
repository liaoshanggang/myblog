drop tablespace blog;
select tablespace_name,file_id,file_name,bytes from dba_data_files
where tablespace_name='blog';

--������ռ�, ��ô�����oracle��װ��Ŀ¼�£����ⲻСɾ���ˡ�sys:change_on_install D:\oracle\datafiles\
create tablespace blog
datafile 'D:\app\Administrator\oradata\orcl\blog.dbf'
size 50M
autoextend on;

--ɾ���û�, cascade����ɾ�����û����������ݿ����
--drop user blog cascade;
/*
�����û���Ϊ�û������ռ�
�´������û���ʼ��û�е�¼��Oracle��Ȩ�ޣ�Ҫ��ϵͳ����Աsys��blog��Ȩ
*/
create user blog
identified by blog
default tablespace USERS;

grant connect,resource to blog;
--grant create table,create any view,create procedure to blog;

--�޸��û�����
--alter user blog identified by blog;

drop table blog_users;
drop table arti_category;
drop table article;
drop table comt;
drop table reply;
drop table album;
drop table visitor;
drop table collection;

--�û���Ϣ��id���û��������롢���䡢�ֻ��š��Ա𡢳������ڡ���顢�û����͡�ѧ����
create table blog_users(
  user_id integer not null primary key, 			--�û�id
	user_name VARCHAR2(50 CHAR) not null unique, 	--�û���
	user_nickname VARCHAR2(50 CHAR),				--�û��ǳ�
	user_password VARCHAR2(50 CHAR) not null, 		--����
	user_email varchar2(50),						--����
	user_mobile varchar2(11),						--�û��ֻ�
	user_sex varchar2(5), 							--�Ա�
	user_birthday date,								--��������
	user_address varchar2(255),						--�û���ַ
	user_profile varchar2(255),						--���
	user_type number(2), 							--�û����ͣ�1.���� 2.��ͨ�û������ߣ�
	user_image_url varchar2(255) NOT NULL,		 	--�û�ͷ��洢·��
	edu_Background varchar2(20)  					--ѧ��
);

insert into blog_users (user_id, user_name, user_password,user_image_url)
values (blog_users_seq.nextval, 'admin', 'admin','admin');
select * from blog_users;

--���·����id,���
create table arti_category(
	catg_id integer not null primary key, 	 	--���id
	catg_name varchar2(100) not null
);			--���
select * from arti_category;

--���±�id,�����ˣ����±��⣬�������ݣ����࣬�������ӵ�ַ������ʱ�䣩
create table article(
	arti_id integer not null primary key, 	 				--����id
	arti_title varchar(128) not null,						--���±���
	arti_content clob not null,								--��������
	arti_catg_id not null references arti_category(catg_id),		--�������
	arti_user_id not null references blog_users(user_id),	--������
	arti_time timestamp default systimestamp not null,		--����ʱ��
	arti_comt_number integer,								--��������
	arti_page_view	integer									--����Ķ���
	--content_link,											--�������ӵ�ַ
);

--���۱�id,Ҫ���۵����£��������ݣ������ˣ�����ʱ�䣩
create table comt(
	comt_id integer not null primary key,					--����id
	comt_arti_id not null references article(arti_id),		--����id
	comt_content varchar2(255) not null, 							--��������
	comt_user_id not null references blog_users(user_id),	--������id
	comt_time timestamp default systimestamp not null);--����ʱ��ȱ�������ţ�������������

--�ظ�(id,Ҫ�ظ������ۣ��ظ����ݣ��ظ�ʱ��)
create table reply(
	reply_id integer not null primary key,					--�ظ�id
	reply_comt_id not null references comt(comt_id),		--�ظ����۵�id
	reply_content varchar2(255) not null,							--�ظ�����
	reply_time timestamp default systimestamp not null		
);--�ظ�ʱ��

--����
create table album(
	album_id integer not null primary key,					--���id
	album_name varchar(255) not null,						--�����
	album_src varchar(255) not null,						--���·��
	album_description varchar(255) not null,				--�������
	upload_time timestamp default systimestamp not null		--ͼƬ�ϴ�ʱ�� linkAddr,����ַ
);

--visitor ����ÿͱ�
CREATE TABLE visitor (
	visitor_id integer not null primary key,				--�ÿ�ID
	visitor_time timestamp default systimestamp not null,	--����ʱ��
	visitor_ip varchar(15) NOT NULL,						--�ÿ�IP��ַ
	arti_id not null references article(arti_id)
);			--��������id

--collection�ղ�(id���ղ��ˣ��ղ��������ӵ�ַ������)
CREATE TABLE collection (
	colt_id integer not null primary key,					--�ղ�ID
	colt_user_id not null references blog_users(user_id),	--�ղ���id
	colt_title varchar(255) NOT NULL,						--�ղ���
	link_url varchar(255)NOT NULL,								--���ӵ�ַ
	colt_description varchar(255) not null
  );					--�ղ�����

drop sequence blog_users_seq ;
drop sequence arti_category_seq ;
drop sequence article_seq ;
drop sequence comt_seq ;
drop sequence reply_seq ;
drop sequence album_seq ;
drop sequence visitor_seq ;
drop sequence collection_seq ;

create sequence blog_users_seq start with 1;
create sequence arti_category_seq start with 1;
create sequence article_seq start with 1;
create sequence comt_seq start with 1;
create sequence reply_seq start with 1;
create sequence album_seq start with 1;
create sequence visitor_seq start with 1;
create sequence collection_seq start with 1;

