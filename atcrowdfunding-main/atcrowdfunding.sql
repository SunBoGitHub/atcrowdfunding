drop table if exists t_account_type_cert;

drop table if exists t_advertisement;

drop table if exists t_cert;

drop table if exists t_dictionary;

drop table if exists t_member;

drop table if exists t_member_address;

drop table if exists t_member_cert;

drop table if exists t_member_project_follow;

drop table if exists t_message;

drop table if exists t_order;

drop table if exists t_param;

drop table if exists t_permission;

drop table if exists t_project;

drop table if exists t_project_tag;

drop table if exists t_project_type;

drop table if exists t_return;

drop table if exists t_role;

drop table if exists t_role_permission;

drop table if exists t_tag;

drop table if exists t_type;

drop table if exists t_user;

drop table if exists t_user_role;

/*==============================================================*/
/* Table: t_account_type_cert                                   */
/*==============================================================*/
create table t_account_type_cert
(
   id                   int(11) not null auto_increment,
   accttype             char(1),
   certid               int(11),
   primary key (id)
);

/*==============================================================*/
/* Table: t_advertisement                                       */
/*==============================================================*/
create table t_advertisement
(
   id                   int(11) not null auto_increment,
   name                 varchar(255),
   iconpath             varchar(255),
   status               char(1) comment '0 - 草稿， 1 - 未审核， 2 - 审核完成， 3 - 发布',
   url                  varchar(255),
   userid               int(11),
   primary key (id)
);

/*==============================================================*/
/* Table: t_cert                                                */
/*==============================================================*/
create table t_cert
(
   id                   int(11) not null auto_increment,
   name                 varchar(255),
   primary key (id)
);

/*==============================================================*/
/* Table: t_dictionary                                          */
/*==============================================================*/
create table t_dictionary
(
   id                   int(11) not null auto_increment,
   name                 varchar(255),
   code                 varchar(255),
   subcode              varchar(255),
   val                  varchar(255),
   primary key (id)
);

/*==============================================================*/
/* Table: t_member                                              */
/*==============================================================*/
create table t_member
(
   id                   int(11) not null auto_increment,
   loginacct            varchar(255) not null,
   userpswd             char(32) not null,
   username             varchar(255) not null,
   email                varchar(255) not null,
   authstatus           char(1) not null comment '实名认证状态 0 - 未实名认证， 1 - 实名认证申请中， 2 - 已实名认证',
   usertype             char(1) not null comment ' 0 - 个人， 1 - 企业',
   realname             varchar(255),
   cardnum              varchar(255),
   accttype             char(1) comment '0 - 企业， 1 - 个体， 2 - 个人， 3 - 政府',
   UNIQUE KEY loginacct (loginacct),
   primary key (id)
);

/*==============================================================*/
/* Table: t_member_address                                      */
/*==============================================================*/
create table t_member_address
(
   id                   int(11) not null auto_increment,
   memberid             int(11),
   address              varchar(255),
   primary key (id)
);

/*==============================================================*/
/* Table: t_member_cert                                         */
/*==============================================================*/
create table t_member_cert
(
   id                   int(11) not null auto_increment,
   memberid             int(11),
   certid               int(11),
   iconpath             varchar(255),
   primary key (id)
);

/*==============================================================*/
/* Table: t_member_project_follow                               */
/*==============================================================*/
create table t_member_project_follow
(
   id                   int(11) not null auto_increment,
   projectid            int(11),
   memberid             int(11),
   primary key (id)
);

/*==============================================================*/
/* Table: t_message                                             */
/*==============================================================*/
create table t_message
(
   id                   int(11) not null auto_increment,
   memberid             int(11),
   content              varchar(255),
   senddate             char(19),
   primary key (id)
);

/*==============================================================*/
/* Table: t_order                                               */
/*==============================================================*/
create table t_order
(
   id                   int(11) not null auto_increment,
   memberid             int(11),
   projectid            int(11),
   returnid             int(11),
   ordernum             varchar(255),
   createdate           char(19),
   money                int(11),
   rtncount             int(11),
   status               char(1) comment '0 - 待付款， 1 - 交易完成， 9 - 交易关闭',
   address              varchar(255),
   invoice              char(1) comment '0 - 不开发票， 1 - 开发票',
   invoictitle          varchar(255),
   remark               varchar(255),
   primary key (id)
);

/*==============================================================*/
/* Table: t_param                                               */
/*==============================================================*/
create table t_param
(
   id                   int(11) not null auto_increment,
   name                 varchar(255),
   code                 varchar(255),
   val                  varchar(255),
   primary key (id)
);

/*==============================================================*/
/* Table: t_permission                                          */
/*==============================================================*/
create table t_permission
(
   id                   int(11) not null auto_increment,
   pid                  int(11),
   name                 varchar(255),
   icon                 varchar(255),
   url                  varchar(255),
   primary key (id)
);

insert into `t_permission` (`id`, `pid`, `name`, `icon`, `url`) values('1',NULL,'系统权限菜单','glyphicon glyphicon-th-list',NULL);
insert into `t_permission` (`id`, `pid`, `name`, `icon`, `url`) values('2','1','控制面板','glyphicon glyphicon-dashboard','main.htm');
insert into `t_permission` (`id`, `pid`, `name`, `icon`, `url`) values('3','1','权限管理','glyphicon glyphicon glyphicon-tasks',NULL);
insert into `t_permission` (`id`, `pid`, `name`, `icon`, `url`) values('4','3','用户维护','glyphicon glyphicon-user','user/index.htm');
insert into `t_permission` (`id`, `pid`, `name`, `icon`, `url`) values('5','3','角色维护','glyphicon glyphicon-king','role/index.htm');
insert into `t_permission` (`id`, `pid`, `name`, `icon`, `url`) values('6','3','许可维护','glyphicon glyphicon-lock','permission/index.htm');
insert into `t_permission` (`id`, `pid`, `name`, `icon`, `url`) values('7','1','业务审核','glyphicon glyphicon-ok',NULL);
insert into `t_permission` (`id`, `pid`, `name`, `icon`, `url`) values('8','7','实名认证审核','glyphicon glyphicon-check','auth_cert/index.htm');
insert into `t_permission` (`id`, `pid`, `name`, `icon`, `url`) values('9','7','广告审核','glyphicon glyphicon-check','auth_adv/index.htm');
insert into `t_permission` (`id`, `pid`, `name`, `icon`, `url`) values('10','7','项目审核','glyphicon glyphicon-check','auth_project/index.htm');
insert into `t_permission` (`id`, `pid`, `name`, `icon`, `url`) values('11','1','业务管理','glyphicon glyphicon-th-large',NULL);
insert into `t_permission` (`id`, `pid`, `name`, `icon`, `url`) values('12','11','资质维护','glyphicon glyphicon-picture','cert/index.htm');
insert into `t_permission` (`id`, `pid`, `name`, `icon`, `url`) values('13','11','分类管理','glyphicon glyphicon-equalizer','type/index.htm');
insert into `t_permission` (`id`, `pid`, `name`, `icon`, `url`) values('14','11','流程管理','glyphicon glyphicon-random','process/index.htm');
insert into `t_permission` (`id`, `pid`, `name`, `icon`, `url`) values('15','11','广告管理','glyphicon glyphicon-hdd','advert/index.htm');
insert into `t_permission` (`id`, `pid`, `name`, `icon`, `url`) values('16','11','消息模板','glyphicon glyphicon-comment','message/index.htm');
insert into `t_permission` (`id`, `pid`, `name`, `icon`, `url`) values('17','11','项目分类','glyphicon glyphicon-list','projectType/index.htm');
insert into `t_permission` (`id`, `pid`, `name`, `icon`, `url`) values('18','11','项目标签','glyphicon glyphicon-tags','tag/index.htm');
insert into `t_permission` (`id`, `pid`, `name`, `icon`, `url`) values('19','1','参数管理','glyphicon glyphicon-list-alt','param/index.htm');


/*==============================================================*/
/* Table: t_project                                             */
/*==============================================================*/
create table t_project
(
   id                   int(11) not null auto_increment,
   name                 varchar(255),
   remark               varchar(255),
   money                bigint (11),
   day                  int(11),
   status               char(1) comment '0 - 即将开始， 1 - 众筹中， 2 - 众筹成功， 3 - 众筹失败',
   deploydate           char(10),
   supportmoney         bigint(11),
   supporter            int(11),
   completion           int(3),
   memberid             int(11),
   createdate           char(19),
   follower             int(11),
   primary key (id)
);

/*==============================================================*/
/* Table: t_project_tag                                         */
/*==============================================================*/
create table t_project_tag
(
   id                   int(11) not null auto_increment,
   projectid            int(11),
   tagid                int(11),
   primary key (id)
);

/*==============================================================*/
/* Table: t_project_type                                        */
/*==============================================================*/
create table t_project_type
(
   id                   int not null auto_increment,
   projectid            int(11),
   typeid               int(11),
   primary key (id)
);

/*==============================================================*/
/* Table: t_return                                              */
/*==============================================================*/
create table t_return
(
   id                   int(11) not null auto_increment,
   projectid            int(11),
   type                 char(1) comment '0 - 实物回报， 1 虚拟物品回报',
   supportmoney         int(11),
   content              varchar(255),
   count                int(11) comment '“0”为不限回报数量',
   signalpurchase       int(11),
   purchase             int(11),
   freight              int(11),
   invoice              char(1) comment '0 - 不开发票， 1 - 开发票',
   rtndate              int(11),
   primary key (id)
);

/*==============================================================*/
/* Table: t_role                                                */
/*==============================================================*/
create table t_role
(
   id                   int(11) not null auto_increment,
   name                 varchar(255),
   primary key (id)
);

/*==============================================================*/
/* Table: t_role_permission                                     */
/*==============================================================*/
create table t_role_permission
(
   id                   int(11) not null auto_increment,
   roleid               int(11),
   permissionid         int(11),
   primary key (id)
);

/*==============================================================*/
/* Table: t_tag                                                 */
/*==============================================================*/
create table t_tag
(
   id                   int(11) not null auto_increment,
   pid                  int(11),
   name                 varchar(255),
   primary key (id)
);

/*==============================================================*/
/* Table: t_type                                                */
/*==============================================================*/
create table t_type
(
   id                   int(11) not null auto_increment,
   name                 varchar(255),
   remark               varchar(255),
   primary key (id)
);

/*==============================================================*/
/* Table: t_user                                                */
/*==============================================================*/
create table t_user
(
   id                   int not null auto_increment,
   loginacct            varchar(255) not null,
   userpswd             char(32) not null,
   username             varchar(255) not null,
   email                varchar(255) not null,
   createtime           char(19),
   UNIQUE KEY loginacct (loginacct),
   primary key (id)
);

/*==============================================================*/
/* Table: t_user_role                                           */
/*==============================================================*/
create table t_user_role
(
   id                   int(11) not null auto_increment,
   userid               int(11),
   roleid               int(11),
   primary key (id)
);
