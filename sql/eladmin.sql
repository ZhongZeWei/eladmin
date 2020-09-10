
-- ----------------------------
-- Table structure for code_column_config
-- ----------------------------
DROP TABLE IF EXISTS "code_column_config";
CREATE TABLE "code_column_config" (
  "column_id" bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  "table_name" varchar(255) DEFAULT NULL,
  "column_name" varchar(255) DEFAULT NULL,
  "column_type" varchar(255) DEFAULT NULL,
  "dict_name" varchar(255) DEFAULT NULL,
  "extra" varchar(255) DEFAULT NULL,
  "form_show" bit(1) DEFAULT NULL,
  "form_type" varchar(255) DEFAULT NULL,
  "key_type" varchar(255) DEFAULT NULL,
  "list_show" bit(1) DEFAULT NULL,
  "not_null" bit(1) DEFAULT NULL,
  "query_type" varchar(255) DEFAULT NULL,
  "remark" varchar(255) DEFAULT NULL,
  "date_annotation" varchar(255) DEFAULT NULL,
  PRIMARY KEY ("column_id") USING BTREE,
  KEY "idx_table_name" ("table_name")
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='代码生成字段信息存储';

-- ----------------------------
-- Table structure for code_gen_config
-- ----------------------------
DROP TABLE IF EXISTS "code_gen_config";
CREATE TABLE "code_gen_config" (
  "config_id" bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  "table_name" varchar(255) DEFAULT NULL COMMENT '表名',
  "author" varchar(255) DEFAULT NULL COMMENT '作者',
  "cover" bit(1) DEFAULT NULL COMMENT '是否覆盖',
  "module_name" varchar(255) DEFAULT NULL COMMENT '模块名称',
  "pack" varchar(255) DEFAULT NULL COMMENT '至于哪个包下',
  "path" varchar(255) DEFAULT NULL COMMENT '前端代码生成的路径',
  "api_path" varchar(255) DEFAULT NULL COMMENT '前端Api文件路径',
  "prefix" varchar(255) DEFAULT NULL COMMENT '表前缀',
  "api_alias" varchar(255) DEFAULT NULL COMMENT '接口名称',
  PRIMARY KEY ("config_id") USING BTREE,
  KEY "idx_table_name" ("table_name"(100))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='代码生成器配置';

-- ----------------------------
-- Table structure for mnt_app
-- ----------------------------
DROP TABLE IF EXISTS "mnt_app";
CREATE TABLE "mnt_app" (
  "app_id" bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  "name" varchar(255) DEFAULT NULL COMMENT '应用名称',
  "upload_path" varchar(255) DEFAULT NULL COMMENT '上传目录',
  "deploy_path" varchar(255) DEFAULT NULL COMMENT '部署路径',
  "backup_path" varchar(255) DEFAULT NULL COMMENT '备份路径',
  "port" int(255) DEFAULT NULL COMMENT '应用端口',
  "start_script" varchar(4000) DEFAULT NULL COMMENT '启动脚本',
  "deploy_script" varchar(4000) DEFAULT NULL COMMENT '部署脚本',
  "create_by" varchar(255) DEFAULT NULL COMMENT '创建者',
  "update_by" varchar(255) DEFAULT NULL COMMENT '更新者',
  "create_time" datetime DEFAULT NULL COMMENT '创建日期',
  "update_time" datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY ("app_id") USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='应用管理';

-- ----------------------------
-- Records of mnt_app
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for mnt_database
-- ----------------------------
DROP TABLE IF EXISTS "mnt_database";
DROP SEQUENCE IF EXISTS "public"."mnt_database_seq";
-- 序列
CREATE SEQUENCE "public"."mnt_database_seq" INCREMENT 1 START 1  MINVALUE 1 MAXVALUE 99999999  CACHE 1;
ALTER SEQUENCE "public"."mnt_database_seq"  OWNER TO root;

CREATE TABLE "mnt_database" (
  "db_id" varchar(50) NOT NULL ,
  "name" varchar(255) NOT NULL ,
  "jdbc_url" varchar(255) NOT NULL ,
  "user_name" varchar(255) NOT NULL ,
  "pwd" varchar(255) NOT NULL ,
  "create_by" varchar(255) DEFAULT NULL COMMENT '创建者',
  "update_by" varchar(255) DEFAULT NULL COMMENT '更新者',
  "create_time" datetime DEFAULT NULL COMMENT '创建时间',
  "update_time" datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY ("db_id") USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='数据库管理';


-- 修改表名称
COMMENT ON COLUMN "public"."mnt_database"."db_id" IS 'ID';
COMMENT ON COLUMN "public"."mnt_database"."name" IS '名称';
COMMENT ON COLUMN "public"."mnt_database"."jdbc_url" IS 'jdbc连接';
COMMENT ON COLUMN "public"."mnt_database"."user_name" IS '账号';
COMMENT ON COLUMN "public"."mnt_database"."pwd" IS '密码';
COMMENT ON COLUMN "public"."mnt_database"."create_by" IS '创建者';
COMMENT ON COLUMN "public"."mnt_database"."update_by" IS '更新者';
COMMENT ON COLUMN "public"."mnt_database"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."mnt_database"."update_time" IS '更新时间';
-- 修改表备注
comment on table "public"."mnt_database" is '数据库管理';
-- 设置表的所有人
ALTER TABLE "public"."mnt_database" OWNER TO "root";



-- ----------------------------
-- Records of mnt_database
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for mnt_deploy
-- ----------------------------
DROP TABLE IF EXISTS "mnt_deploy";
DROP SEQUENCE IF EXISTS "public"."mnt_deploy_seq";
-- 序列
CREATE SEQUENCE "public"."mnt_deploy_seq" INCREMENT 1 START 1  MINVALUE 1 MAXVALUE 99999999  CACHE 1;
ALTER SEQUENCE "public"."mnt_deploy_seq"  OWNER TO root;
CREATE TABLE "mnt_deploy" (
  "deploy_id" bigint NOT NULL DEFAULT nextval('mnt_deploy_seq'::regclass) ,
  "app_id" bigint DEFAULT NULL ,
  "create_by" varchar(255) DEFAULT NULL ,
  "update_by" varchar(255) DEFAULT NULL ,
  "create_time" date DEFAULT NULL,
  "update_time" date DEFAULT NULL,
  CONSTRAINT "mnt_deploy_pkey" PRIMARY KEY ("deploy_id")
) ;

-- 修改表名称
COMMENT ON COLUMN "public"."mnt_deploy"."deploy_id" IS 'ID';
COMMENT ON COLUMN "public"."mnt_deploy"."app_id" IS '应用编号';
COMMENT ON COLUMN "public"."mnt_deploy"."create_by" IS '创建者';
COMMENT ON COLUMN "public"."mnt_deploy"."update_by" IS '更新者';
COMMENT ON COLUMN "public"."mnt_deploy"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."mnt_deploy"."update_time" IS '更新时间';
-- 修改表备注
comment on table "public"."mnt_deploy" is '部署管理';
-- 设置表的所有人
ALTER TABLE "public"."mnt_deploy" OWNER TO "root";


-- ----------------------------
-- Records of mnt_deploy
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for mnt_deploy_history    ok
-- ----------------------------
DROP TABLE IF EXISTS "public"."mnt_deploy_history";
CREATE TABLE "public"."mnt_deploy_history" (
  "history_id" varchar(50) NOT NULL ,
  "app_name" varchar(255) NOT NULL ,
  "deploy_date" date NOT NULL,
  "deploy_user" varchar(50) NOT NULL ,
  "ip" varchar(20) NOT NULL ,
  "deploy_id" int4 ,
  CONSTRAINT "mnt_deploy_history_pkey" PRIMARY KEY ("history_id")
) ;
-- 修改表名称
COMMENT ON COLUMN "public"."mnt_deploy_history"."history_id" IS 'ID';
COMMENT ON COLUMN "public"."mnt_deploy_history"."app_name" IS '应用名称';
COMMENT ON COLUMN "public"."mnt_deploy_history"."deploy_date" IS '部署日期';
COMMENT ON COLUMN "public"."mnt_deploy_history"."deploy_user" IS '部署用户';
COMMENT ON COLUMN "public"."mnt_deploy_history"."ip" IS '服务器IP';
COMMENT ON COLUMN "public"."mnt_deploy_history"."deploy_id" IS '部署编号';
-- 修改表备注
comment on table "public"."mnt_deploy_history" is '部署历史管理';
-- 设置表的所有人
ALTER TABLE "public"."mnt_deploy_history" OWNER TO "root";
-- ----------------------------
-- Records of mnt_deploy_history
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for mnt_deploy_server
-- ----------------------------
DROP TABLE IF EXISTS "public"."mnt_deploy_server";
CREATE TABLE "public"."mnt_deploy_server" (
  "deploy_id" bigint NOT NULL ,
  "server_id" bigint NOT NULL,
  CONSTRAINT "mnt_deploy_server_pkey" PRIMARY KEY ("deploy_id","server_id")
) ;

COMMENT ON COLUMN "public"."mnt_deploy_server"."deploy_id" IS '部署ID';
COMMENT ON COLUMN "public"."mnt_deploy_server"."server_id" IS '服务ID';

comment on table "public"."mnt_deploy_server" is '应用与服务器关联';

ALTER TABLE "public"."mnt_deploy_server" OWNER TO "root";


-- ----------------------------
-- Records of mnt_deploy_server
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for mnt_server
-- ----------------------------

DROP TABLE IF EXISTS "public"."mnt_server";
DROP SEQUENCE IF EXISTS "public"."mnt_server_seq";
-- 序列
CREATE SEQUENCE "public"."mnt_server_seq" INCREMENT 1 START 1  MINVALUE 1 MAXVALUE 99999999  CACHE 1;
ALTER SEQUENCE "public"."mnt_server_seq"  OWNER TO root;

CREATE TABLE "public"."mnt_server" (
  "server_id" bigint NOT NULL DEFAULT nextval('mnt_server_seq'::regclass) ,
  "account" varchar(50) ,
  "ip" varchar(20) ,
  "name" varchar(100) ,
  "password" varchar(100),
  "port" int4 ,
  "create_by" varchar(255) ,
  "update_by" varchar(255) ,
  "create_time" date ,
  "update_time" date ,
  CONSTRAINT "mnt_server_pkey" PRIMARY KEY ("server_id")
) ;


-- 修改表名称
COMMENT ON COLUMN "public"."mnt_server"."server_id" IS 'ID';
COMMENT ON COLUMN "public"."mnt_server"."account" IS '账号';
COMMENT ON COLUMN "public"."mnt_server"."ip" IS 'IP地址';
COMMENT ON COLUMN "public"."mnt_server"."password" IS '密码';
COMMENT ON COLUMN "public"."mnt_server"."port" IS '端口';
COMMENT ON COLUMN "public"."mnt_server"."create_by" IS '创建者';
COMMENT ON COLUMN "public"."mnt_server"."update_by" IS '更新者';
COMMENT ON COLUMN "public"."mnt_server"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."mnt_server"."update_time" IS '更新时间';
-- 修改表备注
comment on table "public"."mnt_server" is '服务器管理';
-- 设置表的所有人
ALTER TABLE "public"."mnt_server" OWNER TO "root";


-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_dept";
DROP SEQUENCE IF EXISTS "public"."sys_dept_seq";
-- 序列
CREATE SEQUENCE "public"."sys_dept_seq" INCREMENT 1 START 1  MINVALUE 1 MAXVALUE 99999999  CACHE 1;
ALTER SEQUENCE "public"."sys_dept_seq"  OWNER TO root;

CREATE TABLE "public"."sys_dept" (
  "dept_id" bigint NOT NULL DEFAULT nextval('sys_dept_seq'::regclass),
  "pid" bigint DEFAULT NULL ,
  "sub_count" int4 DEFAULT 0 ,
  "name" varchar(255) NOT NULL ,
  "dept_sort" int4 DEFAULT 999 ,
  "enabled" int4 NOT NULL ,
  "create_by" varchar(255) DEFAULT NULL ,
  "update_by" varchar(255) DEFAULT NULL,
  "create_time" date DEFAULT NULL ,
  "update_time" date DEFAULT NULL ,
   CONSTRAINT "sys_dept_pkey" PRIMARY KEY ("dept_id")
);



-- 修改表名称
COMMENT ON COLUMN "public"."sys_dept"."dept_id" IS 'ID';
COMMENT ON COLUMN "public"."sys_dept"."pid" IS '上级部门';
COMMENT ON COLUMN "public"."sys_dept"."sub_count" IS '子部门数目';
COMMENT ON COLUMN "public"."sys_dept"."name" IS '名称';
COMMENT ON COLUMN "public"."sys_dept"."dept_sort" IS '排序';
COMMENT ON COLUMN "public"."sys_dept"."enabled" IS '状态';
COMMENT ON COLUMN "public"."sys_dept"."create_by" IS '更新者';
COMMENT ON COLUMN "public"."sys_dept"."update_by" IS '创建时间';
COMMENT ON COLUMN "public"."sys_dept"."create_time" IS '更新时间';
COMMENT ON COLUMN "public"."sys_dept"."update_time" IS '更新时间';
-- 修改表备注
comment on table "public"."sys_dept" is '部门';
-- 设置表的所有人
ALTER TABLE "public"."sys_dept" OWNER TO "root";



-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO "sys_dept" VALUES (2, 7, 1, '研发部', 3, '1', 'admin', 'admin', '2019-03-25 09:15:32', '2020-08-02 14:48:47');
INSERT INTO "sys_dept" VALUES (5, 7, 0, '运维部', 4, '1', 'admin', 'admin', '2019-03-25 09:20:44', '2020-05-17 14:27:27');
INSERT INTO "sys_dept" VALUES (6, 8, 0, '测试部', 6, '1', 'admin', 'admin', '2019-03-25 09:52:18', '2020-06-08 11:59:21');
INSERT INTO "sys_dept" VALUES (7, NULL, 2, '华南分部', 0, '1', 'admin', 'admin', '2019-03-25 11:04:50', '2020-06-08 12:08:56');
INSERT INTO "sys_dept" VALUES (8, NULL, 2, '华北分部', 1, '1', 'admin', 'admin', '2019-03-25 11:04:53', '2020-05-14 12:54:00');
INSERT INTO "sys_dept" VALUES (15, 8, 0, 'UI部门', 7, '1', 'admin', 'admin', '2020-05-13 22:56:53', '2020-05-14 12:54:13');
INSERT INTO "sys_dept" VALUES (17, 2, 0, '研发一组', 999, '1', 'admin', 'admin', '2020-08-02 14:49:07', '2020-08-02 14:49:07');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_dict";
DROP SEQUENCE IF EXISTS "public"."sys_dict_seq";
-- 序列
CREATE SEQUENCE "public"."sys_dict_seq" INCREMENT 1 START 1  MINVALUE 1 MAXVALUE 99999999  CACHE 1;
ALTER SEQUENCE "public"."sys_dict_seq"  OWNER TO root;

CREATE TABLE "public"."sys_dict" (
  "dict_id" bigint NOT NULL  DEFAULT nextval('sys_dict_seq'::regclass) ,
  "name" varchar(255) NOT NULL,
  "description" varchar(255) DEFAULT NULL ,
  "create_by" varchar(255) DEFAULT NULL ,
  "update_by" varchar(255) DEFAULT NULL ,
  "create_time" date DEFAULT NULL ,
  "update_time" date DEFAULT NULL ,
   CONSTRAINT "sys_dict_pkey" PRIMARY KEY ("dict_id")
) ;

-- 修改表名称
COMMENT ON COLUMN "public"."sys_dict"."dict_id" IS 'ID';
COMMENT ON COLUMN "public"."sys_dict"."name" IS '字典名称';
COMMENT ON COLUMN "public"."sys_dict"."description" IS '描述';
COMMENT ON COLUMN "public"."sys_dict"."create_by" IS '创建者';
COMMENT ON COLUMN "public"."sys_dict"."update_by" IS '更新者';
COMMENT ON COLUMN "public"."sys_dict"."create_time" IS '创建日期';
COMMENT ON COLUMN "public"."sys_dict"."update_time" IS '更新时间';

-- 修改表备注
comment on table "public"."sys_dict" is '数据字典';
-- 设置表的所有人
ALTER TABLE "public"."sys_dict" OWNER TO "root";



-- ----------------------------
-- Records of sys_dict
-- ----------------------------
BEGIN;
INSERT INTO "sys_dict" VALUES (1, 'user_status', '用户状态', NULL, NULL, '2019-10-27 20:31:36', NULL);
INSERT INTO "sys_dict" VALUES (4, 'dept_status', '部门状态', NULL, NULL, '2019-10-27 20:31:36', NULL);
INSERT INTO "sys_dict" VALUES (5, 'job_status', '岗位状态', NULL, NULL, '2019-10-27 20:31:36', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_detail
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_dict_detail";
DROP SEQUENCE IF EXISTS "public"."sys_dict_detail_seq";
-- 序列
CREATE SEQUENCE "public"."sys_dict_detail_seq" INCREMENT 1 START 1  MINVALUE 1 MAXVALUE 99999999  CACHE 1;
ALTER SEQUENCE "public"."sys_dict_detail_seq"  OWNER TO root;

CREATE TABLE "public"."sys_dict_detail" (
  "detail_id" bigint NOT NULL  DEFAULT nextval('sys_dict_detail_seq'::regclass) ,
  "dict_id" bigint DEFAULT NULL,
  "label" varchar(255) NOT NULL ,
  "value" varchar(255) NOT NULL ,
  "dict_sort" int4 DEFAULT NULL ,
  "create_by" varchar(255) DEFAULT NULL ,
  "update_by" varchar(255) DEFAULT NULL ,
  "create_time" date DEFAULT NULL ,
  "update_time" date DEFAULT NULL ,
  CONSTRAINT "sys_dict_detail_pkey" PRIMARY KEY ("detail_id")
) ;


-- 修改表名称
COMMENT ON COLUMN "public"."sys_dict_detail"."detail_id" IS 'ID';
COMMENT ON COLUMN "public"."sys_dict_detail"."dict_id" IS '字典id';
COMMENT ON COLUMN "public"."sys_dict_detail"."label" IS '字典标签';
COMMENT ON COLUMN "public"."sys_dict_detail"."value" IS '字典值';
COMMENT ON COLUMN "public"."sys_dict_detail"."dict_sort" IS '排序';
COMMENT ON COLUMN "public"."sys_dict_detail"."create_by" IS '创建者';
COMMENT ON COLUMN "public"."sys_dict_detail"."update_by" IS '更新者';
COMMENT ON COLUMN "public"."sys_dict_detail"."create_time" IS '创建日期';
COMMENT ON COLUMN "public"."sys_dict_detail"."update_time" IS '更新时间';

-- 修改表备注
comment on table "public"."sys_dict_detail" is '数据字典详情';
-- 设置表的所有人
ALTER TABLE "public"."sys_dict_detail" OWNER TO "root";

-- ----------------------------
-- Records of sys_dict_detail
-- ----------------------------
BEGIN;
INSERT INTO "sys_dict_detail" VALUES (1, 1, '激活', 'true', 1, NULL, NULL, '2019-10-27 20:31:36', NULL);
INSERT INTO "sys_dict_detail" VALUES (2, 1, '禁用', 'false', 2, NULL, NULL, NULL, NULL);
INSERT INTO "sys_dict_detail" VALUES (3, 4, '启用', 'true', 1, NULL, NULL, NULL, NULL);
INSERT INTO "sys_dict_detail" VALUES (4, 4, '停用', 'false', 2, NULL, NULL, '2019-10-27 20:31:36', NULL);
INSERT INTO "sys_dict_detail" VALUES (5, 5, '启用', 'true', 1, NULL, NULL, NULL, NULL);
INSERT INTO "sys_dict_detail" VALUES (6, 5, '停用', 'false', 2, NULL, NULL, '2019-10-27 20:31:36', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_job";
DROP SEQUENCE IF EXISTS "public"."sys_job_seq";
-- 序列
CREATE SEQUENCE "public"."sys_job_seq" INCREMENT 1 START 1  MINVALUE 1 MAXVALUE 99999999  CACHE 1;
ALTER SEQUENCE "public"."sys_job_seq"  OWNER TO root;


CREATE TABLE "public"."sys_job" (
  "job_id" bigint NOT NULL  DEFAULT nextval('sys_job_seq'::regclass) ,
  "name" varchar NOT NULL ,
  "enabled" int4 NOT NULL ,
  "job_sort" int4 DEFAULT NULL ,
  "create_by" varchar(255) DEFAULT NULL ,
  "update_by" varchar(255) DEFAULT NULL ,
  "create_time" date DEFAULT NULL ,
  "update_time" date DEFAULT NULL ,
  CONSTRAINT "sys_job_pkey" PRIMARY KEY ("job_id"),
  CONSTRAINT "uniq_name" UNIQUE ("name")
) ;



-- 修改表名称
COMMENT ON COLUMN "public"."sys_job"."job_id" IS 'ID';
COMMENT ON COLUMN "public"."sys_job"."name" IS '岗位名称';
COMMENT ON COLUMN "public"."sys_job"."enabled" IS '岗位状态';
COMMENT ON COLUMN "public"."sys_job"."job_sort" IS '排序';
COMMENT ON COLUMN "public"."sys_job"."create_by" IS '创建者';
COMMENT ON COLUMN "public"."sys_job"."update_by" IS '更新者';
COMMENT ON COLUMN "public"."sys_job"."create_time" IS '创建日期';
COMMENT ON COLUMN "public"."sys_job"."update_time" IS '更新时间';

-- 修改表备注
comment on table "public"."sys_job" is '岗位';
-- 设置表的所有人
ALTER TABLE "public"."sys_job" OWNER TO "root";


-- ----------------------------
-- Records of sys_job
-- ----------------------------
BEGIN;
INSERT INTO "sys_job" VALUES (8, '人事专员', '1', 3, NULL, NULL, '2019-03-29 14:52:28', NULL);
INSERT INTO "sys_job" VALUES (10, '产品经理', '1', 4, NULL, NULL, '2019-03-29 14:55:51', NULL);
INSERT INTO "sys_job" VALUES (11, '全栈开发', '1', 2, NULL, 'admin', '2019-03-31 13:39:30', '2020-05-05 11:33:43');
INSERT INTO "sys_job" VALUES (12, '软件测试', '1', 5, NULL, 'admin', '2019-03-31 13:39:43', '2020-05-10 19:56:26');
COMMIT;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_log";
DROP SEQUENCE IF EXISTS "public"."sys_log_seq";
-- 序列
CREATE SEQUENCE "public"."sys_log_seq" INCREMENT 1 START 1  MINVALUE 1 MAXVALUE 99999999  CACHE 1;
ALTER SEQUENCE "public"."sys_log_seq"  OWNER TO root;


CREATE TABLE "public"."sys_log" (
  "log_id" bigint NOT NULL DEFAULT nextval('sys_log_seq'::regclass),
  "description" varchar(255) DEFAULT NULL,
  "log_type" varchar(255) DEFAULT NULL,
  "method" varchar(255) DEFAULT NULL,
  "params" text DEFAULT NULL,
  "request_ip" varchar(255) DEFAULT NULL,
  "time" bigint DEFAULT NULL,
  "username" varchar(255) DEFAULT NULL,
  "address" varchar(255) DEFAULT NULL,
  "browser" varchar(255) DEFAULT NULL,
  "exception_detail" text DEFAULT NULL,
  "create_time" date DEFAULT NULL,
  CONSTRAINT "sys_log_pkey" PRIMARY KEY ("log_id")
) ;


-- 修改表名称
COMMENT ON COLUMN "public"."sys_log"."log_id" IS 'ID';

-- 修改表备注
comment on table "public"."sys_log" is '系统日志';
-- 设置表的所有人
ALTER TABLE "public"."sys_log" OWNER TO "root";



-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS "sys_menu";
DROP SEQUENCE IF EXISTS "public"."sys_menu_seq";
-- 序列
CREATE SEQUENCE "public"."sys_menu_seq" INCREMENT 1 START 1  MINVALUE 1 MAXVALUE 99999999  CACHE 1;
ALTER SEQUENCE "public"."sys_menu_seq"  OWNER TO root;

CREATE TABLE "sys_menu" (
  "menu_id" bigint NOT NULL DEFAULT nextval('sys_menu_seq'::regclass)  ,
  "pid" bigint DEFAULT NULL ,
  "sub_count" int4 DEFAULT 0 ,
  "type" int4 DEFAULT NULL ,
  "title" varchar(255) DEFAULT NULL ,
  "name" varchar(255) DEFAULT NULL ,
  "component" varchar(255) DEFAULT NULL ,
  "menu_sort" int4 DEFAULT NULL ,
  "icon" varchar(255) DEFAULT NULL ,
  "path" varchar(255) DEFAULT NULL ,
  "i_frame" bool DEFAULT NULL ,
  "cache" bool DEFAULT 'f' ,
  "hidden" bool DEFAULT 'f' ,
  "permission" varchar(255) DEFAULT NULL ,
  "create_by" varchar(255) DEFAULT NULL ,
  "update_by" varchar(255) DEFAULT NULL ,
  "create_time" date DEFAULT NULL ,
  "update_time" date DEFAULT NULL ,
  CONSTRAINT "sys_menu_pkey" PRIMARY KEY ("menu_id"),
  CONSTRAINT "uniq_sys_menu_title" UNIQUE ("title"),
  CONSTRAINT "uniq_sys_menu_name" UNIQUE ("name")
) ;

-- 修改表名称
COMMENT ON COLUMN "public"."sys_menu"."menu_id" IS 'ID';
COMMENT ON COLUMN "public"."sys_menu"."pid" IS '上级菜单ID';
COMMENT ON COLUMN "public"."sys_menu"."sub_count" IS '子菜单数目';
COMMENT ON COLUMN "public"."sys_menu"."type" IS '菜单类型';
COMMENT ON COLUMN "public"."sys_menu"."title" IS '菜单标题';
COMMENT ON COLUMN "public"."sys_menu"."name" IS '组件名称';
COMMENT ON COLUMN "public"."sys_menu"."component" IS '组件';
COMMENT ON COLUMN "public"."sys_menu"."menu_sort" IS '排序';
COMMENT ON COLUMN "public"."sys_menu"."icon" IS '图标';
COMMENT ON COLUMN "public"."sys_menu"."path" IS '链接地址';
COMMENT ON COLUMN "public"."sys_menu"."i_frame" IS '是否外链';
COMMENT ON COLUMN "public"."sys_menu"."cache" IS '缓存';
COMMENT ON COLUMN "public"."sys_menu"."hidden" IS '隐藏';
COMMENT ON COLUMN "public"."sys_menu"."permission" IS '权限';
COMMENT ON COLUMN "public"."sys_menu"."create_by" IS '创建者';
COMMENT ON COLUMN "public"."sys_menu"."update_by" IS '更新者';
COMMENT ON COLUMN "public"."sys_menu"."create_time" IS '创建日期';
COMMENT ON COLUMN "public"."sys_menu"."update_time" IS '更新时间';

-- 修改表备注
comment on table "public"."sys_menu" is '系统菜单';
-- 设置表的所有人
ALTER TABLE "public"."sys_menu" OWNER TO "root";


-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO "sys_menu" VALUES (1, NULL, 7, 0, '系统管理', NULL, NULL, 1, 'system', 'system', 'f', 'f', 'f', NULL, NULL, NULL, '2018-12-18 15:11:29', NULL);
INSERT INTO "sys_menu" VALUES (2, 1, 3, 1, '用户管理', 'User', 'system/user/index', 2, 'peoples', 'user', 'f', 'f', 'f', 'user:list', NULL, NULL, '2018-12-18 15:14:44', NULL);
INSERT INTO "sys_menu" VALUES (3, 1, 3, 1, '角色管理', 'Role', 'system/role/index', 3, 'role', 'role', 'f', 'f', 'f', 'roles:list', NULL, NULL, '2018-12-18 15:16:07', NULL);
INSERT INTO "sys_menu" VALUES (5, 1, 3, 1, '菜单管理', 'Menu', 'system/menu/index', 5, 'menu', 'menu', 'f', 'f', 'f', 'menu:list', NULL, NULL, '2018-12-18 15:17:28', NULL);
INSERT INTO "sys_menu" VALUES (6, NULL, 5, 0, '系统监控', NULL, NULL, 10, 'monitor', 'monitor', 'f', 'f', 'f', NULL, NULL, NULL, '2018-12-18 15:17:48', NULL);
INSERT INTO "sys_menu" VALUES (7, 6, 0, 1, '操作日志', 'Log', 'monitor/log/index', 11, 'log', 'logs', 'f', 't', 'f', NULL, NULL, 'admin', '2018-12-18 15:18:26', '2020-06-06 13:11:57');
INSERT INTO "sys_menu" VALUES (9, 6, 0, 1, 'SQL监控', 'Sql', 'monitor/sql/index', 18, 'sqlMonitor', 'druid', 'f', 'f', 'f', NULL, NULL, NULL, '2018-12-18 15:19:34', NULL);
INSERT INTO "sys_menu" VALUES (10, NULL, 5, 0, '组件管理', NULL, NULL, 50, 'zujian', 'components', 'f', 'f', 'f', NULL, NULL, NULL, '2018-12-19 13:38:16', NULL);
INSERT INTO "sys_menu" VALUES (11, 10, 0, 1, '图标库', 'Icons', 'components/icons/index', 51, 'icon', 'icon', 'f', 'f', 'f', NULL, NULL, NULL, '2018-12-19 13:38:49', NULL);
INSERT INTO "sys_menu" VALUES (14, 36, 0, 1, '邮件工具', 'Email', 'tools/email/index', 35, 'email', 'email', 'f', 'f', 'f', NULL, NULL, NULL, '2018-12-27 10:13:09', NULL);
INSERT INTO "sys_menu" VALUES (15, 10, 0, 1, '富文本', 'Editor', 'components/Editor', 52, 'fwb', 'tinymce', 'f', 'f', 'f', NULL, NULL, NULL, '2018-12-27 11:58:25', NULL);
INSERT INTO "sys_menu" VALUES (18, 36, 3, 1, '存储管理', 'Storage', 'tools/storage/index', 34, 'qiniu', 'storage', 'f', 'f', 'f', 'storage:list', NULL, NULL, '2018-12-31 11:12:15', NULL);
INSERT INTO "sys_menu" VALUES (19, 36, 0, 1, '支付宝工具', 'AliPay', 'tools/aliPay/index', 37, 'alipay', 'aliPay', 'f', 'f', 'f', NULL, NULL, NULL, '2018-12-31 14:52:38', NULL);
INSERT INTO "sys_menu" VALUES (21, NULL, 2, 0, '多级菜单', NULL, '', 900, 'menu', 'nested', 'f', 'f', 'f', NULL, NULL, 'admin', '2019-01-04 16:22:03', '2020-06-21 17:27:35');
INSERT INTO "sys_menu" VALUES (22, 21, 2, 1, '二级菜单1', NULL, 'nested/menu1/index', 999, 'menu', 'menu1', 'f', 'f', 'f', NULL, NULL, 'admin', '2019-01-04 16:23:29', '2020-06-21 17:27:20');
INSERT INTO "sys_menu" VALUES (23, 21, 0, 1, '二级菜单2', NULL, 'nested/menu2/index', 999, 'menu', 'menu2', 'f', 'f', 'f', NULL, NULL, NULL, '2019-01-04 16:23:57', NULL);
INSERT INTO "sys_menu" VALUES (24, 22, 0, 1, '三级菜单1', NULL, 'nested/menu1/menu1-1', 999, 'menu', 'menu1-1', 'f', 'f', 'f', NULL, NULL, NULL, '2019-01-04 16:24:48', NULL);
INSERT INTO "sys_menu" VALUES (27, 22, 0, 1, '三级菜单2', NULL, 'nested/menu1/menu1-2', 999, 'menu', 'menu1-2', 'f', 'f', 'f', NULL, NULL, NULL, '2019-01-07 17:27:32', NULL);
INSERT INTO "sys_menu" VALUES (28, 1, 3, 1, '任务调度', 'Timing', 'system/timing/index', 999, 'timing', 'timing', 'f', 'f', 'f', 'timing:list', NULL, NULL, '2019-01-07 20:34:40', NULL);
INSERT INTO "sys_menu" VALUES (30, 36, 0, 1, '代码生成', 'GeneratorIndex', 'generator/index', 32, 'dev', 'generator', 'f', 't', 'f', NULL, NULL, NULL, '2019-01-11 15:45:55', NULL);
INSERT INTO "sys_menu" VALUES (32, 6, 0, 1, '异常日志', 'ErrorLog', 'monitor/log/errorLog', 12, 'error', 'errorLog', 'f', 'f', 'f', NULL, NULL, NULL, '2019-01-13 13:49:03', NULL);
INSERT INTO "sys_menu" VALUES (33, 10, 0, 1, 'Markdown', 'Markdown', 'components/MarkDown', 53, 'markdown', 'markdown', 'f', 'f', 'f', NULL, NULL, NULL, '2019-03-08 13:46:44', NULL);
INSERT INTO "sys_menu" VALUES (34, 10, 0, 1, 'Yaml编辑器', 'YamlEdit', 'components/YamlEdit', 54, 'dev', 'yaml', 'f', 'f', 'f', NULL, NULL, NULL, '2019-03-08 15:49:40', NULL);
INSERT INTO "sys_menu" VALUES (35, 1, 3, 1, '部门管理', 'Dept', 'system/dept/index', 6, 'dept', 'dept', 'f', 'f', 'f', 'dept:list', NULL, NULL, '2019-03-25 09:46:00', NULL);
INSERT INTO "sys_menu" VALUES (36, NULL, 7, 0, '系统工具', NULL, '', 30, 'sys-tools', 'sys-tools', 'f', 'f', 'f', NULL, NULL, NULL, '2019-03-29 10:57:35', NULL);
INSERT INTO "sys_menu" VALUES (37, 1, 3, 1, '岗位管理', 'Job', 'system/job/index', 7, 'Steve-Jobs', 'job', 'f', 'f', 'f', 'job:list', NULL, NULL, '2019-03-29 13:51:18', NULL);
INSERT INTO "sys_menu" VALUES (38, 36, 0, 1, '接口文档', 'Swagger', 'tools/swagger/index', 36, 'swagger', 'swagger2', 'f', 'f', 'f', NULL, NULL, NULL, '2019-03-29 19:57:53', NULL);
INSERT INTO "sys_menu" VALUES (39, 1, 3, 1, '字典管理', 'Dict', 'system/dict/index', 8, 'dictionary', 'dict', 'f', 'f', 'f', 'dict:list', NULL, NULL, '2019-04-10 11:49:04', NULL);
INSERT INTO "sys_menu" VALUES (41, 6, 0, 1, '在线用户', 'OnlineUser', 'monitor/online/index', 10, 'Steve-Jobs', 'online', 'f', 'f', 'f', NULL, NULL, NULL, '2019-10-26 22:08:43', NULL);
INSERT INTO "sys_menu" VALUES (44, 2, 0, 2, '用户新增', NULL, '', 2, '', '', 'f', 'f', 'f', 'user:add', NULL, NULL, '2019-10-29 10:59:46', NULL);
INSERT INTO "sys_menu" VALUES (45, 2, 0, 2, '用户编辑', NULL, '', 3, '', '', 'f', 'f', 'f', 'user:edit', NULL, NULL, '2019-10-29 11:00:08', NULL);
INSERT INTO "sys_menu" VALUES (46, 2, 0, 2, '用户删除', NULL, '', 4, '', '', 'f', 'f', 'f', 'user:del', NULL, NULL, '2019-10-29 11:00:23', NULL);
INSERT INTO "sys_menu" VALUES (48, 3, 0, 2, '角色创建', NULL, '', 2, '', '', 'f', 'f', 'f', 'roles:add', NULL, NULL, '2019-10-29 12:45:34', NULL);
INSERT INTO "sys_menu" VALUES (49, 3, 0, 2, '角色修改', NULL, '', 3, '', '', 'f', 'f', 'f', 'roles:edit', NULL, NULL, '2019-10-29 12:46:16', NULL);
INSERT INTO "sys_menu" VALUES (50, 3, 0, 2, '角色删除', NULL, '', 4, '', '', 'f', 'f', 'f', 'roles:del', NULL, NULL, '2019-10-29 12:46:51', NULL);
INSERT INTO "sys_menu" VALUES (52, 5, 0, 2, '菜单新增', NULL, '', 2, '', '', 'f', 'f', 'f', 'menu:add', NULL, NULL, '2019-10-29 12:55:07', NULL);
INSERT INTO "sys_menu" VALUES (53, 5, 0, 2, '菜单编辑', NULL, '', 3, '', '', 'f', 'f', 'f', 'menu:edit', NULL, NULL, '2019-10-29 12:55:40', NULL);
INSERT INTO "sys_menu" VALUES (54, 5, 0, 2, '菜单删除', NULL, '', 4, '', '', 'f', 'f', 'f', 'menu:del', NULL, NULL, '2019-10-29 12:56:00', NULL);
INSERT INTO "sys_menu" VALUES (56, 35, 0, 2, '部门新增', NULL, '', 2, '', '', 'f', 'f', 'f', 'dept:add', NULL, NULL, '2019-10-29 12:57:09', NULL);
INSERT INTO "sys_menu" VALUES (57, 35, 0, 2, '部门编辑', NULL, '', 3, '', '', 'f', 'f', 'f', 'dept:edit', NULL, NULL, '2019-10-29 12:57:27', NULL);
INSERT INTO "sys_menu" VALUES (58, 35, 0, 2, '部门删除', NULL, '', 4, '', '', 'f', 'f', 'f', 'dept:del', NULL, NULL, '2019-10-29 12:57:41', NULL);
INSERT INTO "sys_menu" VALUES (60, 37, 0, 2, '岗位新增', NULL, '', 2, '', '', 'f', 'f', 'f', 'job:add', NULL, NULL, '2019-10-29 12:58:27', NULL);
INSERT INTO "sys_menu" VALUES (61, 37, 0, 2, '岗位编辑', NULL, '', 3, '', '', 'f', 'f', 'f', 'job:edit', NULL, NULL, '2019-10-29 12:58:45', NULL);
INSERT INTO "sys_menu" VALUES (62, 37, 0, 2, '岗位删除', NULL, '', 4, '', '', 'f', 'f', 'f', 'job:del', NULL, NULL, '2019-10-29 12:59:04', NULL);
INSERT INTO "sys_menu" VALUES (64, 39, 0, 2, '字典新增', NULL, '', 2, '', '', 'f', 'f', 'f', 'dict:add', NULL, NULL, '2019-10-29 13:00:17', NULL);
INSERT INTO "sys_menu" VALUES (65, 39, 0, 2, '字典编辑', NULL, '', 3, '', '', 'f', 'f', 'f', 'dict:edit', NULL, NULL, '2019-10-29 13:00:42', NULL);
INSERT INTO "sys_menu" VALUES (66, 39, 0, 2, '字典删除', NULL, '', 4, '', '', 'f', 'f', 'f', 'dict:del', NULL, NULL, '2019-10-29 13:00:59', NULL);
INSERT INTO "sys_menu" VALUES (73, 28, 0, 2, '任务新增', NULL, '', 2, '', '', 'f', 'f', 'f', 'timing:add', NULL, NULL, '2019-10-29 13:07:28', NULL);
INSERT INTO "sys_menu" VALUES (74, 28, 0, 2, '任务编辑', NULL, '', 3, '', '', 'f', 'f', 'f', 'timing:edit', NULL, NULL, '2019-10-29 13:07:41', NULL);
INSERT INTO "sys_menu" VALUES (75, 28, 0, 2, '任务删除', NULL, '', 4, '', '', 'f', 'f', 'f', 'timing:del', NULL, NULL, '2019-10-29 13:07:54', NULL);
INSERT INTO "sys_menu" VALUES (77, 18, 0, 2, '上传文件', NULL, '', 2, '', '', 'f', 'f', 'f', 'storage:add', NULL, NULL, '2019-10-29 13:09:09', NULL);
INSERT INTO "sys_menu" VALUES (78, 18, 0, 2, '文件编辑', NULL, '', 3, '', '', 'f', 'f', 'f', 'storage:edit', NULL, NULL, '2019-10-29 13:09:22', NULL);
INSERT INTO "sys_menu" VALUES (79, 18, 0, 2, '文件删除', NULL, '', 4, '', '', 'f', 'f', 'f', 'storage:del', NULL, NULL, '2019-10-29 13:09:34', NULL);
INSERT INTO "sys_menu" VALUES (80, 6, 0, 1, '服务监控', 'ServerMonitor', 'monitor/server/index', 14, 'codeConsole', 'server', 'f', 'f', 'f', 'monitor:list', NULL, 'admin', '2019-11-07 13:06:39', '2020-05-04 18:20:50');
INSERT INTO "sys_menu" VALUES (82, 36, 0, 1, '生成配置', 'GeneratorConfig', 'generator/config', 33, 'dev', 'generator/config/:tableName', 'f', 't', 't', '', NULL, NULL, '2019-11-17 20:08:56', NULL);
INSERT INTO "sys_menu" VALUES (83, 10, 0, 1, '图表库', 'Echarts', 'components/Echarts', 50, 'chart', 'echarts', 'f', 't', 'f', '', NULL, NULL, '2019-11-21 09:04:32', NULL);
INSERT INTO "sys_menu" VALUES (90, NULL, 5, 1, '运维管理', 'Mnt', '', 20, 'mnt', 'mnt', 'f', 'f', 'f', NULL, NULL, NULL, '2019-11-09 10:31:08', NULL);
INSERT INTO "sys_menu" VALUES (92, 90, 3, 1, '服务器', 'ServerDeploy', 'mnt/server/index', 22, 'server', 'mnt/serverDeploy', 'f', 'f', 'f', 'serverDeploy:list', NULL, NULL, '2019-11-10 10:29:25', NULL);
INSERT INTO "sys_menu" VALUES (93, 90, 3, 1, '应用管理', 'App', 'mnt/app/index', 23, 'app', 'mnt/app', 'f', 'f', 'f', 'app:list', NULL, NULL, '2019-11-10 11:05:16', NULL);
INSERT INTO "sys_menu" VALUES (94, 90, 3, 1, '部署管理', 'Deploy', 'mnt/deploy/index', 24, 'deploy', 'mnt/deploy', 'f', 'f', 'f', 'deploy:list', NULL, NULL, '2019-11-10 15:56:55', NULL);
INSERT INTO "sys_menu" VALUES (97, 90, 1, 1, '部署备份', 'DeployHistory', 'mnt/deployHistory/index', 25, 'backup', 'mnt/deployHistory', 'f', 'f', 'f', 'deployHistory:list', NULL, NULL, '2019-11-10 16:49:44', NULL);
INSERT INTO "sys_menu" VALUES (98, 90, 3, 1, '数据库管理', 'Database', 'mnt/database/index', 26, 'database', 'mnt/database', 'f', 'f', 'f', 'database:list', NULL, NULL, '2019-11-10 20:40:04', NULL);
INSERT INTO "sys_menu" VALUES (102, 97, 0, 2, '删除', NULL, '', 999, '', '', 'f', 'f', 'f', 'deployHistory:del', NULL, NULL, '2019-11-17 09:32:48', NULL);
INSERT INTO "sys_menu" VALUES (103, 92, 0, 2, '服务器新增', NULL, '', 999, '', '', 'f', 'f', 'f', 'serverDeploy:add', NULL, NULL, '2019-11-17 11:08:33', NULL);
INSERT INTO "sys_menu" VALUES (104, 92, 0, 2, '服务器编辑', NULL, '', 999, '', '', 'f', 'f', 'f', 'serverDeploy:edit', NULL, NULL, '2019-11-17 11:08:57', NULL);
INSERT INTO "sys_menu" VALUES (105, 92, 0, 2, '服务器删除', NULL, '', 999, '', '', 'f', 'f', 'f', 'serverDeploy:del', NULL, NULL, '2019-11-17 11:09:15', NULL);
INSERT INTO "sys_menu" VALUES (106, 93, 0, 2, '应用新增', NULL, '', 999, '', '', 'f', 'f', 'f', 'app:add', NULL, NULL, '2019-11-17 11:10:03', NULL);
INSERT INTO "sys_menu" VALUES (107, 93, 0, 2, '应用编辑', NULL, '', 999, '', '', 'f', 'f', 'f', 'app:edit', NULL, NULL, '2019-11-17 11:10:28', NULL);
INSERT INTO "sys_menu" VALUES (108, 93, 0, 2, '应用删除', NULL, '', 999, '', '', 'f', 'f', 'f', 'app:del', NULL, NULL, '2019-11-17 11:10:55', NULL);
INSERT INTO "sys_menu" VALUES (109, 94, 0, 2, '部署新增', NULL, '', 999, '', '', 'f', 'f', 'f', 'deploy:add', NULL, NULL, '2019-11-17 11:11:22', NULL);
INSERT INTO "sys_menu" VALUES (110, 94, 0, 2, '部署编辑', NULL, '', 999, '', '', 'f', 'f', 'f', 'deploy:edit', NULL, NULL, '2019-11-17 11:11:41', NULL);
INSERT INTO "sys_menu" VALUES (111, 94, 0, 2, '部署删除', NULL, '', 999, '', '', 'f', 'f', 'f', 'deploy:del', NULL, NULL, '2019-11-17 11:12:01', NULL);
INSERT INTO "sys_menu" VALUES (112, 98, 0, 2, '数据库新增', NULL, '', 999, '', '', 'f', 'f', 'f', 'database:add', NULL, NULL, '2019-11-17 11:12:43', NULL);
INSERT INTO "sys_menu" VALUES (113, 98, 0, 2, '数据库编辑', NULL, '', 999, '', '', 'f', 'f', 'f', 'database:edit', NULL, NULL, '2019-11-17 11:12:58', NULL);
INSERT INTO "sys_menu" VALUES (114, 98, 0, 2, '数据库删除', NULL, '', 999, '', '', 'f', 'f', 'f', 'database:del', NULL, NULL, '2019-11-17 11:13:14', NULL);
INSERT INTO "sys_menu" VALUES (116, 36, 0, 1, '生成预览', 'Preview', 'generator/preview', 999, 'java', 'generator/preview/:tableName', 'f', 't', 't', NULL, NULL, NULL, '2019-11-26 14:54:36', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_quartz_job
-- ----------------------------
DROP TABLE IF EXISTS "sys_quartz_job";
DROP SEQUENCE IF EXISTS "public"."sys_quartz_job_seq";
-- 序列
CREATE SEQUENCE "public"."sys_quartz_job_seq" INCREMENT 1 START 1  MINVALUE 1 MAXVALUE 99999999  CACHE 1;
ALTER SEQUENCE "public"."sys_quartz_job_seq"  OWNER TO root;

CREATE TABLE "public"."sys_quartz_job" (
  "job_id" bigint NOT NULL  DEFAULT nextval('sys_quartz_job_seq'::regclass) ,
  "bean_name" varchar(255) DEFAULT NULL ,
  "cron_expression" varchar(255) DEFAULT NULL ,
  "is_pause" bool DEFAULT NULL ,
  "job_name" varchar(255) DEFAULT NULL ,
  "method_name" varchar(255) DEFAULT NULL ,
  "params" varchar(255) DEFAULT NULL ,
  "description" varchar(255) DEFAULT NULL ,
  "person_in_charge" varchar(100) DEFAULT NULL,
  "email" varchar(100) DEFAULT NULL ,
  "sub_task" varchar(100) DEFAULT NULL ,
  "pause_after_failure" bool DEFAULT NULL ,
  "create_by" varchar(255) DEFAULT NULL ,
  "update_by" varchar(255) DEFAULT NULL ,
  "create_time" date DEFAULT NULL ,
  "update_time" date DEFAULT NULL ,
  CONSTRAINT "sys_quartz_job_pkey" PRIMARY KEY ("job_id")
) ;

-- 修改表名称
COMMENT ON COLUMN "public"."sys_quartz_job"."job_id" IS 'ID';
COMMENT ON COLUMN "public"."sys_quartz_job"."bean_name" IS 'Spring Bean名称';
COMMENT ON COLUMN "public"."sys_quartz_job"."cron_expression" IS 'cron 表达式';
COMMENT ON COLUMN "public"."sys_quartz_job"."is_pause" IS '状态：1暂停、0启用';
COMMENT ON COLUMN "public"."sys_quartz_job"."job_name" IS '任务名称';
COMMENT ON COLUMN "public"."sys_quartz_job"."method_name" IS '方法名称';
COMMENT ON COLUMN "public"."sys_quartz_job"."params" IS '参数';
COMMENT ON COLUMN "public"."sys_quartz_job"."description" IS '备注';
COMMENT ON COLUMN "public"."sys_quartz_job"."person_in_charge" IS '负责人';
COMMENT ON COLUMN "public"."sys_quartz_job"."email" IS '报警邮箱';
COMMENT ON COLUMN "public"."sys_quartz_job"."sub_task" IS '子任务ID';
COMMENT ON COLUMN "public"."sys_quartz_job"."pause_after_failure" IS '任务失败后是否暂停';
COMMENT ON COLUMN "public"."sys_quartz_job"."create_by" IS '创建者';
COMMENT ON COLUMN "public"."sys_quartz_job"."update_by" IS '更新者';
COMMENT ON COLUMN "public"."sys_quartz_job"."create_time" IS '创建日期';
COMMENT ON COLUMN "public"."sys_quartz_job"."update_time" IS '更新时间';

-- 修改表备注
comment on table "public"."sys_quartz_job" is '定时任务';
-- 设置表的所有人
ALTER TABLE "public"."sys_quartz_job" OWNER TO "root";



-- ----------------------------
-- Records of sys_quartz_job
-- ----------------------------
BEGIN;
INSERT INTO "sys_quartz_job" VALUES (2, 'testTask', '0/5 * * * * ?', 't', '测试1', 'run1', 'test', '带参测试，多参使用json', '测试', NULL, NULL, NULL, NULL, 'admin', '2019-08-22 14:08:29', '2020-05-24 13:58:33');
INSERT INTO "sys_quartz_job" VALUES (3, 'testTask', '0/5 * * * * ?', 't', '测试', 'run', '', '不带参测试', 'Zheng Jie', '', '5,6', 't', NULL, 'admin', '2019-09-26 16:44:39', '2020-05-24 14:48:12');
INSERT INTO "sys_quartz_job" VALUES (5, 'Test', '0/5 * * * * ?', 't', '任务告警测试', 'run', NULL, '测试', 'test', '', NULL, 't', 'admin', 'admin', '2020-05-05 20:32:41', '2020-05-05 20:36:13');
INSERT INTO "sys_quartz_job" VALUES (6, 'testTask', '0/5 * * * * ?', 't', '测试3', 'run2', NULL, '测试3', 'Zheng Jie', '', NULL, 't', 'admin', 'admin', '2020-05-05 20:35:41', '2020-05-05 20:36:07');
COMMIT;

-- ----------------------------
-- Table structure for sys_quartz_log
-- ----------------------------
DROP TABLE IF EXISTS "sys_quartz_log";
DROP SEQUENCE IF EXISTS "public"."sys_quartz_log_seq";
-- 序列
CREATE SEQUENCE "public"."sys_quartz_log_seq" INCREMENT 1 START 1  MINVALUE 1 MAXVALUE 99999999  CACHE 1;
ALTER SEQUENCE "public"."sys_quartz_log_seq"  OWNER TO root;


CREATE TABLE "sys_quartz_log" (
  "log_id" bigint NOT NULL  DEFAULT nextval('sys_quartz_log_seq'::regclass),
  "bean_name" varchar(255) DEFAULT NULL,
  "create_time" date DEFAULT NULL,
  "cron_expression" varchar(255) DEFAULT NULL,
  "exception_detail" text DEFAULT NULL,
  "is_success" bool DEFAULT NULL,
  "job_name" varchar(255) DEFAULT NULL,
  "method_name" varchar(255) DEFAULT NULL,
  "params" varchar(255) DEFAULT NULL,
  "time" bigint DEFAULT NULL,
  CONSTRAINT "sys_quartz_log_pkey" PRIMARY KEY ("log_id")
) ;

-- 修改表备注
comment on table "public"."sys_quartz_log" is '定时任务日志';
-- 设置表的所有人
ALTER TABLE "public"."sys_quartz_log" OWNER TO "root";


-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS "sys_role";
DROP SEQUENCE IF EXISTS "public"."sys_role_seq";
-- 序列
CREATE SEQUENCE "public"."sys_role_seq" INCREMENT 1 START 1  MINVALUE 1 MAXVALUE 99999999  CACHE 1;
ALTER SEQUENCE "public"."sys_role_seq"  OWNER TO root;


CREATE TABLE "sys_role" (
  "role_id" bigint NOT NULL DEFAULT nextval('sys_role_seq'::regclass) ,
  "name" varchar(255) NOT NULL ,
  "level" int4 DEFAULT NULL ,
  "description" varchar(255) DEFAULT NULL,
  "data_scope" varchar(255) DEFAULT NULL ,
  "create_by" varchar(255) DEFAULT NULL ,
  "update_by" varchar(255) DEFAULT NULL ,
  "create_time" date DEFAULT NULL ,
  "update_time" date DEFAULT NULL ,
  CONSTRAINT "sys_role_pkey" PRIMARY KEY ("role_id"),
  CONSTRAINT "uniq_sys_role_name" UNIQUE ("name")
) ;


-- 修改表名称
COMMENT ON COLUMN "public"."sys_role"."role_id" IS 'ID';
COMMENT ON COLUMN "public"."sys_role"."name" IS '名称';
COMMENT ON COLUMN "public"."sys_role"."level" IS '角色级别';
COMMENT ON COLUMN "public"."sys_role"."description" IS '描述';
COMMENT ON COLUMN "public"."sys_role"."data_scope" IS '数据权限';
COMMENT ON COLUMN "public"."sys_role"."create_by" IS '创建者';
COMMENT ON COLUMN "public"."sys_role"."update_by" IS '更新者';
COMMENT ON COLUMN "public"."sys_role"."create_time" IS '创建日期';
COMMENT ON COLUMN "public"."sys_role"."update_time" IS '更新时间';

-- 修改表备注
comment on table "public"."sys_role" is '角色表';
-- 设置表的所有人
ALTER TABLE "public"."sys_role" OWNER TO "root";



-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO "sys_role" VALUES (1, '超级管理员', 1, '-', '自定义', NULL, 'admin', '2018-11-23 11:04:37', '2020-08-06 16:10:24');
INSERT INTO "sys_role" VALUES (2, '普通用户', 2, '-', '自定义', NULL, 'admin', '2018-11-23 13:09:06', '2020-09-05 10:45:12');
COMMIT;

-- ----------------------------
-- Table structure for sys_roles_depts
-- ----------------------------
DROP TABLE IF EXISTS "sys_roles_depts";
CREATE TABLE "sys_roles_depts" (
  "role_id" bigint NOT NULL,
  "dept_id" bigint NOT NULL,
  CONSTRAINT "sys_roles_depts_pkey" PRIMARY KEY ("role_id","dept_id")
);


-- 修改表备注
comment on table "public"."sys_roles_depts" is '角色部门关联';
-- 设置表的所有人
ALTER TABLE "public"."sys_roles_depts" OWNER TO "root";




-- ----------------------------
-- Records of sys_roles_depts
-- ----------------------------
BEGIN;
INSERT INTO "sys_roles_depts" VALUES (1, 7);
INSERT INTO "sys_roles_depts" VALUES (1, 8);
INSERT INTO "sys_roles_depts" VALUES (2, 6);
COMMIT;

-- ----------------------------
-- Table structure for sys_roles_menus
-- ----------------------------
DROP TABLE IF EXISTS "sys_roles_menus";
CREATE TABLE "sys_roles_menus" (
  "menu_id" bigint NOT NULL ,
  "role_id" bigint NOT NULL ,
  CONSTRAINT "sys_roles_menus_pkey" PRIMARY KEY ("menu_id","role_id")
) ;


-- 修改表名称
COMMENT ON COLUMN "public"."sys_roles_menus"."menu_id" IS '菜单ID';
COMMENT ON COLUMN "public"."sys_roles_menus"."role_id" IS '角色ID';

-- 修改表备注
comment on table "public"."sys_roles_menus" is '角色菜单关联';
-- 设置表的所有人
ALTER TABLE "public"."sys_roles_menus" OWNER TO "root";

-- ----------------------------
-- Records of sys_roles_menus
-- ----------------------------
BEGIN;
INSERT INTO "sys_roles_menus" VALUES (1, 1);
INSERT INTO "sys_roles_menus" VALUES (1, 2);
INSERT INTO "sys_roles_menus" VALUES (2, 1);
INSERT INTO "sys_roles_menus" VALUES (2, 2);
INSERT INTO "sys_roles_menus" VALUES (3, 1);
INSERT INTO "sys_roles_menus" VALUES (3, 2);
INSERT INTO "sys_roles_menus" VALUES (5, 1);
INSERT INTO "sys_roles_menus" VALUES (5, 2);
INSERT INTO "sys_roles_menus" VALUES (6, 1);
INSERT INTO "sys_roles_menus" VALUES (6, 2);
INSERT INTO "sys_roles_menus" VALUES (7, 1);
INSERT INTO "sys_roles_menus" VALUES (7, 2);
INSERT INTO "sys_roles_menus" VALUES (9, 1);
INSERT INTO "sys_roles_menus" VALUES (9, 2);
INSERT INTO "sys_roles_menus" VALUES (10, 1);
INSERT INTO "sys_roles_menus" VALUES (10, 2);
INSERT INTO "sys_roles_menus" VALUES (11, 1);
INSERT INTO "sys_roles_menus" VALUES (11, 2);
INSERT INTO "sys_roles_menus" VALUES (14, 1);
INSERT INTO "sys_roles_menus" VALUES (14, 2);
INSERT INTO "sys_roles_menus" VALUES (15, 1);
INSERT INTO "sys_roles_menus" VALUES (15, 2);
INSERT INTO "sys_roles_menus" VALUES (18, 1);
INSERT INTO "sys_roles_menus" VALUES (18, 2);
INSERT INTO "sys_roles_menus" VALUES (19, 1);
INSERT INTO "sys_roles_menus" VALUES (19, 2);
INSERT INTO "sys_roles_menus" VALUES (21, 1);
INSERT INTO "sys_roles_menus" VALUES (21, 2);
INSERT INTO "sys_roles_menus" VALUES (22, 1);
INSERT INTO "sys_roles_menus" VALUES (22, 2);
INSERT INTO "sys_roles_menus" VALUES (23, 1);
INSERT INTO "sys_roles_menus" VALUES (23, 2);
INSERT INTO "sys_roles_menus" VALUES (24, 1);
INSERT INTO "sys_roles_menus" VALUES (24, 2);
INSERT INTO "sys_roles_menus" VALUES (27, 1);
INSERT INTO "sys_roles_menus" VALUES (27, 2);
INSERT INTO "sys_roles_menus" VALUES (28, 1);
INSERT INTO "sys_roles_menus" VALUES (28, 2);
INSERT INTO "sys_roles_menus" VALUES (30, 1);
INSERT INTO "sys_roles_menus" VALUES (32, 1);
INSERT INTO "sys_roles_menus" VALUES (33, 1);
INSERT INTO "sys_roles_menus" VALUES (33, 2);
INSERT INTO "sys_roles_menus" VALUES (34, 1);
INSERT INTO "sys_roles_menus" VALUES (34, 2);
INSERT INTO "sys_roles_menus" VALUES (35, 1);
INSERT INTO "sys_roles_menus" VALUES (35, 2);
INSERT INTO "sys_roles_menus" VALUES (36, 1);
INSERT INTO "sys_roles_menus" VALUES (36, 2);
INSERT INTO "sys_roles_menus" VALUES (37, 1);
INSERT INTO "sys_roles_menus" VALUES (37, 2);
INSERT INTO "sys_roles_menus" VALUES (38, 1);
INSERT INTO "sys_roles_menus" VALUES (38, 2);
INSERT INTO "sys_roles_menus" VALUES (39, 1);
INSERT INTO "sys_roles_menus" VALUES (39, 2);
INSERT INTO "sys_roles_menus" VALUES (41, 1);
INSERT INTO "sys_roles_menus" VALUES (80, 1);
INSERT INTO "sys_roles_menus" VALUES (80, 2);
INSERT INTO "sys_roles_menus" VALUES (82, 1);
INSERT INTO "sys_roles_menus" VALUES (83, 1);
INSERT INTO "sys_roles_menus" VALUES (83, 2);
INSERT INTO "sys_roles_menus" VALUES (90, 1);
INSERT INTO "sys_roles_menus" VALUES (90, 2);
INSERT INTO "sys_roles_menus" VALUES (92, 1);
INSERT INTO "sys_roles_menus" VALUES (92, 2);
INSERT INTO "sys_roles_menus" VALUES (93, 1);
INSERT INTO "sys_roles_menus" VALUES (94, 1);
INSERT INTO "sys_roles_menus" VALUES (97, 1);
INSERT INTO "sys_roles_menus" VALUES (98, 1);
INSERT INTO "sys_roles_menus" VALUES (116, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS "sys_user";
DROP SEQUENCE IF EXISTS "public"."sys_user_seq";
-- 序列
CREATE SEQUENCE "public"."sys_user_seq" INCREMENT 1 START 1  MINVALUE 1 MAXVALUE 99999999  CACHE 1;
ALTER SEQUENCE "public"."sys_user_seq"  OWNER TO root;

CREATE TABLE "sys_user" (
  "user_id" bigint NOT NULL  DEFAULT nextval('sys_user_seq'::regclass),
  "dept_id" bigint DEFAULT NULL ,
  "username" varchar(255) DEFAULT NULL ,
  "nick_name" varchar(255) DEFAULT NULL ,
  "gender" varchar(2) DEFAULT NULL ,
  "phone" varchar(255) DEFAULT NULL ,
  "email" varchar(255) DEFAULT NULL ,
  "avatar_name" varchar(255) DEFAULT NULL ,
  "avatar_path" varchar(255) DEFAULT NULL ,
  "password" varchar(255) DEFAULT NULL ,
  "is_admin" bool DEFAULT 'f' ,
  "enabled" bigint DEFAULT NULL ,
  "create_by" varchar(255) DEFAULT NULL ,
  "update_by" varchar(255) DEFAULT NULL ,
  "pwd_reset_time" date DEFAULT NULL ,
  "create_time" date DEFAULT NULL ,
  "update_time" date DEFAULT NULL ,
  CONSTRAINT "sys_user_pkey" PRIMARY KEY ("user_id"),
  CONSTRAINT "uniq_sys_user_username" UNIQUE ("username"),
  CONSTRAINT "uniq_sys_user_email" UNIQUE ("email")
) ;


-- 修改表名称
COMMENT ON COLUMN "public"."sys_user"."user_id" IS 'ID';
COMMENT ON COLUMN "public"."sys_user"."dept_id" IS '部门名称';
COMMENT ON COLUMN "public"."sys_user"."username" IS '用户名';
COMMENT ON COLUMN "public"."sys_user"."nick_name" IS '昵称';
COMMENT ON COLUMN "public"."sys_user"."gender" IS '性别';
COMMENT ON COLUMN "public"."sys_user"."phone" IS '手机号码';
COMMENT ON COLUMN "public"."sys_user"."email" IS '邮箱';
COMMENT ON COLUMN "public"."sys_user"."avatar_name" IS '头像地址';
COMMENT ON COLUMN "public"."sys_user"."avatar_path" IS '头像真实路径';
COMMENT ON COLUMN "public"."sys_user"."password" IS '密码';
COMMENT ON COLUMN "public"."sys_user"."is_admin" IS '是否为admin账号';
COMMENT ON COLUMN "public"."sys_user"."enabled" IS '状态：1启用、0禁用';
COMMENT ON COLUMN "public"."sys_user"."create_by" IS '创建者';
COMMENT ON COLUMN "public"."sys_user"."update_by" IS '更新着';
COMMENT ON COLUMN "public"."sys_user"."pwd_reset_time" IS '修改密码的时间';
COMMENT ON COLUMN "public"."sys_user"."create_time" IS '创建日期';
COMMENT ON COLUMN "public"."sys_user"."update_time" IS '更新时间';

-- 修改表备注
comment on table "public"."sys_user" is '系统用户';
-- 设置表的所有人
ALTER TABLE "public"."sys_user" OWNER TO "root";


-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO "sys_user" VALUES (1, 2, 'admin', '管理员', '男', '18888888888', '201507802@qq.com', 'avatar-20200806032259161.png', '/Users/jie/Documents/work/me/admin/eladmin/~/avatar/avatar-20200806032259161.png', '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', 't', 1, NULL, 'admin', '2020-05-03 16:38:31', '2018-08-23 09:11:56', '2020-09-05 10:43:31');
INSERT INTO "sys_user" VALUES (2, 2, 'test', '测试', '男', '18888888888', '231@qq.com', NULL, NULL, '$2a$10$4XcyudOYTSz6fue6KFNMHeUQnCX5jbBQypLEnGk1PmekXt5c95JcK', 'f', 1, 'admin', 'admin', NULL, '2020-05-05 11:15:49', '2020-09-05 10:43:38');
COMMIT;

-- ----------------------------
-- Table structure for sys_users_jobs
-- ----------------------------
DROP TABLE IF EXISTS "sys_users_jobs";
CREATE TABLE "sys_users_jobs" (
  "user_id" bigint NOT NULL ,
  "job_id" bigint NOT NULL ,
  CONSTRAINT "sys_users_jobs_pkey" PRIMARY KEY ("user_id","job_id")
) ;


-- 修改表名称
COMMENT ON COLUMN "public"."sys_users_jobs"."user_id" IS '用户ID';
COMMENT ON COLUMN "public"."sys_users_jobs"."job_id" IS '岗位ID';


-- 设置表的所有人
ALTER TABLE "public"."sys_users_jobs" OWNER TO "root";



-- ----------------------------
-- Records of sys_users_jobs
-- ----------------------------
BEGIN;
INSERT INTO "sys_users_jobs" VALUES (1, 11);
INSERT INTO "sys_users_jobs" VALUES (2, 12);
COMMIT;

-- ----------------------------
-- Table structure for sys_users_roles
-- ----------------------------
DROP TABLE IF EXISTS "sys_users_roles";
CREATE TABLE "sys_users_roles" (
  "user_id" bigint NOT NULL,
  "role_id" bigint NOT NULL,
  CONSTRAINT "sys_users_roles_pkey" PRIMARY KEY ("user_id","role_id")
) ;


-- 修改表名称
COMMENT ON COLUMN "public"."sys_users_roles"."user_id" IS '用户ID';
COMMENT ON COLUMN "public"."sys_users_roles"."role_id" IS '岗位ID';

-- 修改表备注
comment on table "public"."sys_users_roles" is '用户角色关联';

-- 设置表的所有人
ALTER TABLE "public"."sys_users_jobs" OWNER TO "root";



-- ----------------------------
-- Records of sys_users_roles
-- ----------------------------
BEGIN;
INSERT INTO "sys_users_roles" VALUES (1, 1);
INSERT INTO "sys_users_roles" VALUES (2, 2);
COMMIT;

-- ----------------------------
-- Table structure for tool_alipay_config
-- ----------------------------
DROP TABLE IF EXISTS "tool_alipay_config";
CREATE TABLE "tool_alipay_config" (
  "config_id" bigint NOT NULL,
  "app_id" varchar(255) DEFAULT NULL ,
  "charset" varchar(255) DEFAULT NULL,
  "format" varchar(255) DEFAULT NULL,
  "gateway_url" varchar(255) DEFAULT NULL,
  "notify_url" varchar(255) DEFAULT NULL ,
  "private_key" text DEFAULT NULL,
  "public_key" text DEFAULT NULL ,
  "return_url" varchar(255) DEFAULT NULL ,
  "sign_type" varchar(255) DEFAULT NULL,
  "sys_service_provider_id" varchar(255) DEFAULT NULL ,
  CONSTRAINT "tool_alipay_config_pkey" PRIMARY KEY ("config_id")
) ;


-- 修改表名称
COMMENT ON COLUMN "public"."tool_alipay_config"."config_id" IS 'ID';
COMMENT ON COLUMN "public"."tool_alipay_config"."app_id" IS '应用ID';
COMMENT ON COLUMN "public"."tool_alipay_config"."charset" IS '编码';
COMMENT ON COLUMN "public"."tool_alipay_config"."format" IS '类型 固定格式json';
COMMENT ON COLUMN "public"."tool_alipay_config"."gateway_url" IS '网关地址';
COMMENT ON COLUMN "public"."tool_alipay_config"."notify_url" IS '异步回调';
COMMENT ON COLUMN "public"."tool_alipay_config"."private_key" IS '私钥';
COMMENT ON COLUMN "public"."tool_alipay_config"."public_key" IS '公钥';
COMMENT ON COLUMN "public"."tool_alipay_config"."return_url" IS '回调地址';
COMMENT ON COLUMN "public"."tool_alipay_config"."sign_type" IS '签名方式';
COMMENT ON COLUMN "public"."tool_alipay_config"."sys_service_provider_id" IS '商户号';

-- 修改表备注
comment on table "public"."tool_alipay_config" is '支付宝配置类';

-- 设置表的所有人
ALTER TABLE "public"."tool_alipay_config" OWNER TO "root";



-- ----------------------------
-- Records of tool_alipay_config
-- ----------------------------
BEGIN;
INSERT INTO "tool_alipay_config" VALUES (1, '2016091700532697', 'utf-8', 'JSON', 'https://openapi.alipaydev.com/gateway.do', 'http://api.auauz.net/api/aliPay/notify', 'MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQC5js8sInU10AJ0cAQ8UMMyXrQ+oHZEkVt5lBwsStmTJ7YikVYgbskx1YYEXTojRsWCb+SH/kDmDU4pK/u91SJ4KFCRMF2411piYuXU/jF96zKrADznYh/zAraqT6hvAIVtQAlMHN53nx16rLzZ/8jDEkaSwT7+HvHiS+7sxSojnu/3oV7BtgISoUNstmSe8WpWHOaWv19xyS+Mce9MY4BfseFhzTICUymUQdd/8hXA28/H6osUfAgsnxAKv7Wil3aJSgaJczWuflYOve0dJ3InZkhw5Cvr0atwpk8YKBQjy5CdkoHqvkOcIB+cYHXJKzOE5tqU7inSwVbHzOLQ3XbnAgMBAAECggEAVJp5eT0Ixg1eYSqFs9568WdetUNCSUchNxDBu6wxAbhUgfRUGZuJnnAll63OCTGGck+EGkFh48JjRcBpGoeoHLL88QXlZZbC/iLrea6gcDIhuvfzzOffe1RcZtDFEj9hlotg8dQj1tS0gy9pN9g4+EBH7zeu+fyv+qb2e/v1l6FkISXUjpkD7RLQr3ykjiiEw9BpeKb7j5s7Kdx1NNIzhkcQKNqlk8JrTGDNInbDM6inZfwwIO2R1DHinwdfKWkvOTODTYa2MoAvVMFT9Bec9FbLpoWp7ogv1JMV9svgrcF9XLzANZ/OQvkbe9TV9GWYvIbxN6qwQioKCWO4GPnCAQKBgQDgW5MgfhX8yjXqoaUy/d1VjI8dHeIyw8d+OBAYwaxRSlCfyQ+tieWcR2HdTzPca0T0GkWcKZm0ei5xRURgxt4DUDLXNh26HG0qObbtLJdu/AuBUuCqgOiLqJ2f1uIbrz6OZUHns+bT/jGW2Ws8+C13zTCZkZt9CaQsrp3QOGDx5wKBgQDTul39hp3ZPwGNFeZdkGoUoViOSd5Lhowd5wYMGAEXWRLlU8z+smT5v0POz9JnIbCRchIY2FAPKRdVTICzmPk2EPJFxYTcwaNbVqL6lN7J2IlXXMiit5QbiLauo55w7plwV6LQmKm9KV7JsZs5XwqF7CEovI7GevFzyD3w+uizAQKBgC3LY1eRhOlpWOIAhpjG6qOoohmeXOphvdmMlfSHq6WYFqbWwmV4rS5d/6LNpNdL6fItXqIGd8I34jzql49taCmi+A2nlR/E559j0mvM20gjGDIYeZUz5MOE8k+K6/IcrhcgofgqZ2ZED1ksHdB/E8DNWCswZl16V1FrfvjeWSNnAoGAMrBplCrIW5xz+J0Hm9rZKrs+AkK5D4fUv8vxbK/KgxZ2KaUYbNm0xv39c+PZUYuFRCz1HDGdaSPDTE6WeWjkMQd5mS6ikl9hhpqFRkyh0d0fdGToO9yLftQKOGE/q3XUEktI1XvXF0xyPwNgUCnq0QkpHyGVZPtGFxwXiDvpvgECgYA5PoB+nY8iDiRaJNko9w0hL4AeKogwf+4TbCw+KWVEn6jhuJa4LFTdSqp89PktQaoVpwv92el/AhYjWOl/jVCm122f9b7GyoelbjMNolToDwe5pF5RnSpEuDdLy9MfE8LnE3PlbE7E5BipQ3UjSebkgNboLHH/lNZA5qvEtvbfvQ==', 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAut9evKRuHJ/2QNfDlLwvN/S8l9hRAgPbb0u61bm4AtzaTGsLeMtScetxTWJnVvAVpMS9luhEJjt+Sbk5TNLArsgzzwARgaTKOLMT1TvWAK5EbHyI+eSrc3s7Awe1VYGwcubRFWDm16eQLv0k7iqiw+4mweHSz/wWyvBJVgwLoQ02btVtAQErCfSJCOmt0Q/oJQjj08YNRV4EKzB19+f5A+HQVAKy72dSybTzAK+3FPtTtNen/+b5wGeat7c32dhYHnGorPkPeXLtsqqUTp1su5fMfd4lElNdZaoCI7osZxWWUo17vBCZnyeXc9fk0qwD9mK6yRAxNbrY72Xx5VqIqwIDAQAB', 'http://api.auauz.net/api/aliPay/return', 'RSA2', '2088102176044281');
COMMIT;

-- ----------------------------
-- Table structure for tool_email_config
-- ----------------------------
DROP TABLE IF EXISTS "tool_email_config";
CREATE TABLE "tool_email_config" (
  "config_id" bigint(20) NOT NULL COMMENT 'ID',
  "from_user" varchar(255) DEFAULT NULL COMMENT '收件人',
  "host" varchar(255) DEFAULT NULL COMMENT '邮件服务器SMTP地址',
  "pass" varchar(255) DEFAULT NULL COMMENT '密码',
  "port" varchar(255) DEFAULT NULL COMMENT '端口',
  "user" varchar(255) DEFAULT NULL COMMENT '发件者用户名',
  PRIMARY KEY ("config_id") USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='邮箱配置';



-- 修改表名称
COMMENT ON COLUMN "public"."tool_alipay_config"."config_id" IS 'ID';
COMMENT ON COLUMN "public"."tool_alipay_config"."app_id" IS '应用ID';
COMMENT ON COLUMN "public"."tool_alipay_config"."charset" IS '编码';
COMMENT ON COLUMN "public"."tool_alipay_config"."format" IS '类型 固定格式json';
COMMENT ON COLUMN "public"."tool_alipay_config"."gateway_url" IS '网关地址';
COMMENT ON COLUMN "public"."tool_alipay_config"."notify_url" IS '异步回调';
COMMENT ON COLUMN "public"."tool_alipay_config"."private_key" IS '私钥';
COMMENT ON COLUMN "public"."tool_alipay_config"."public_key" IS '公钥';
COMMENT ON COLUMN "public"."tool_alipay_config"."return_url" IS '回调地址';
COMMENT ON COLUMN "public"."tool_alipay_config"."sign_type" IS '签名方式';
COMMENT ON COLUMN "public"."tool_alipay_config"."sys_service_provider_id" IS '商户号';

-- 修改表备注
comment on table "public"."tool_alipay_config" is '支付宝配置类';

-- 设置表的所有人
ALTER TABLE "public"."tool_alipay_config" OWNER TO "root";



-- ----------------------------
-- Table structure for tool_local_storage
-- ----------------------------
DROP TABLE IF EXISTS "tool_local_storage";
DROP SEQUENCE IF EXISTS "public"."tool_local_storage_seq";
-- 序列
CREATE SEQUENCE "public"."tool_local_storage_seq" INCREMENT 1 START 1  MINVALUE 1 MAXVALUE 99999999  CACHE 1;
ALTER SEQUENCE "public"."tool_local_storage_seq"  OWNER TO root;

CREATE TABLE "tool_local_storage" (
  "storage_id" bigint NOT NULL DEFAULT nextval('tool_local_storage_seq'::regclass),
  "real_name" varchar(255) DEFAULT NULL ,
  "name" varchar(255) DEFAULT NULL ,
  "suffix" varchar(255) DEFAULT NULL ,
  "path" varchar(255) DEFAULT NULL ,
  "type" varchar(255) DEFAULT NULL ,
  "size" varchar(100) DEFAULT NULL ,
  "create_by" varchar(255) DEFAULT NULL ,
  "update_by" varchar(255) DEFAULT NULL ,
  "create_time" date DEFAULT NULL ,
  "update_time" date DEFAULT NULL ,
  CONSTRAINT "tool_local_storage_pkey" PRIMARY KEY ("storage_id")
) ;




-- 修改表名称
COMMENT ON COLUMN "public"."tool_local_storage"."storage_id" IS 'ID';
COMMENT ON COLUMN "public"."tool_local_storage"."real_name" IS '文件真实的名称';
COMMENT ON COLUMN "public"."tool_local_storage"."name" IS '文件名';
COMMENT ON COLUMN "public"."tool_local_storage"."suffix" IS '后缀';
COMMENT ON COLUMN "public"."tool_local_storage"."path" IS '路径';
COMMENT ON COLUMN "public"."tool_local_storage"."type" IS '类型';
COMMENT ON COLUMN "public"."tool_local_storage"."size" IS '大小';
COMMENT ON COLUMN "public"."tool_local_storage"."create_by" IS '创建者';
COMMENT ON COLUMN "public"."tool_local_storage"."update_by" IS '更新者';
COMMENT ON COLUMN "public"."tool_local_storage"."create_time" IS '创建日期';
COMMENT ON COLUMN "public"."tool_local_storage"."update_time" IS '更新时间';

-- 修改表备注
comment on table "public"."tool_local_storage" is '本地存储';

-- 设置表的所有人
ALTER TABLE "public"."tool_local_storage" OWNER TO "root";
-- ----------------------------
-- Records of tool_local_storage
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tool_qiniu_config
-- ----------------------------
DROP TABLE IF EXISTS "tool_qiniu_config";
DROP SEQUENCE IF EXISTS "public"."tool_qiniu_config_seq";
-- 序列
CREATE SEQUENCE "public"."tool_qiniu_config_seq" INCREMENT 1 START 1  MINVALUE 1 MAXVALUE 99999999  CACHE 1;
ALTER SEQUENCE "public"."tool_qiniu_config_seq"  OWNER TO root;

CREATE TABLE "tool_qiniu_config" (
  "config_id" bigint NOT NULL ,
  "access_key" text DEFAULT NULL ,
  "bucket" varchar(255) DEFAULT NULL ,
  "host" varchar(255) NOT NULL ,
  "secret_key" text DEFAULT NULL ,
  "type" varchar(255) DEFAULT NULL ,
  "zone" varchar(255) DEFAULT NULL,
  CONSTRAINT "tool_qiniu_config_pkey" PRIMARY KEY ("config_id")
) ;


-- 修改表名称
COMMENT ON COLUMN "public"."tool_qiniu_config"."config_id" IS 'ID';
COMMENT ON COLUMN "public"."tool_qiniu_config"."access_key" IS 'accessKey';
COMMENT ON COLUMN "public"."tool_qiniu_config"."bucket" IS 'Bucket 识别符';
COMMENT ON COLUMN "public"."tool_qiniu_config"."host" IS '外链域名';
COMMENT ON COLUMN "public"."tool_qiniu_config"."secret_key" IS 'secretKey';
COMMENT ON COLUMN "public"."tool_qiniu_config"."type" IS '空间类型';
COMMENT ON COLUMN "public"."tool_qiniu_config"."zone" IS '机房';

-- 修改表备注
comment on table "public"."tool_qiniu_config" is '七牛云配置';

-- 设置表的所有人
ALTER TABLE "public"."tool_qiniu_config" OWNER TO "root";





-- ----------------------------
-- Table structure for tool_qiniu_content
-- ----------------------------
DROP TABLE IF EXISTS "tool_qiniu_content";
DROP SEQUENCE IF EXISTS "public"."tool_qiniu_content_seq";
-- 序列
CREATE SEQUENCE "public"."tool_qiniu_content_seq" INCREMENT 1 START 1  MINVALUE 1 MAXVALUE 99999999  CACHE 1;
ALTER SEQUENCE "public"."tool_qiniu_content_seq"  OWNER TO root;

CREATE TABLE "tool_qiniu_content" (
  "content_id" bigint NOT NULL ,
  "bucket" varchar(255) DEFAULT NULL ,
  "name" varchar(255) DEFAULT NULL ,
  "size" varchar(255) DEFAULT NULL ,
  "type" varchar(255) DEFAULT NULL ,
  "url" varchar(255) DEFAULT NULL,
  "suffix" varchar(255) DEFAULT NULL ,
  "update_time" date DEFAULT NULL ,
  CONSTRAINT "tool_qiniu_content_pkey" PRIMARY KEY ("content_id"),
  CONSTRAINT "uniq_tool_qiniu_content_name" UNIQUE ("name")
) ;

-- 修改表名称
COMMENT ON COLUMN "public"."tool_qiniu_content"."content_id" IS 'ID';
COMMENT ON COLUMN "public"."tool_qiniu_content"."bucket" IS 'Bucket 识别符';
COMMENT ON COLUMN "public"."tool_qiniu_content"."name" IS '文件名称';
COMMENT ON COLUMN "public"."tool_qiniu_content"."size" IS '文件大小';
COMMENT ON COLUMN "public"."tool_qiniu_content"."type" IS '文件类型：私有或公开';
COMMENT ON COLUMN "public"."tool_qiniu_content"."url" IS '文件url';
COMMENT ON COLUMN "public"."tool_qiniu_content"."suffix" IS '文件后缀';
COMMENT ON COLUMN "public"."tool_qiniu_content"."update_time" IS '上传或同步的时间';

-- 修改表备注
comment on table "public"."tool_qiniu_content" is '七牛云文件存储';

-- 设置表的所有人
ALTER TABLE "public"."tool_qiniu_content" OWNER TO "root";




-- ----------------------------
-- Records of tool_qiniu_content
-- ----------------------------
BEGIN;
COMMIT;

