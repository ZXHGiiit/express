CREATE TABLE `user` (
    `id`                  BIGINT(20)      PRIMARY KEY NOT NULL AUTO_INCREMENT
    COMMENT 'user id',
    `account`          VARCHAR(20)      NOT NULL unique
    COMMENT '账号',
    `name`              VARCHAR(20)
    COMMENT '姓名',
    `email`             VARCHAR(20)     NOT NULL unique
    COMMENT '邮箱',
    `phone`             BIGINT(20)
    COMMENT  '电话',
   `password`          VARCHAR(20)
    COMMENT  '密码',

   `isVip`             TINYINT(1)      NOT NULL DEFAULT '0'
    COMMENT '是否是认证用户，可以寄送快递的权限',
    `age`               INT(3)
    COMMENT '年龄'

)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin;