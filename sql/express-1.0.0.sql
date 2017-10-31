use express

 CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'user id',
  `account` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '账号',
  `password` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `id_number` bigint(20) DEFAULT NULL,
  `email` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `is_vip` tinyint(1) NOT NULL DEFAULT '0',
  `age` int(3) DEFAULT NULL COMMENT '年龄',
  `phone` bigint(20) DEFAULT NULL,
  `post_code` bigint(6) DEFAULT NULL,
  `bank_account` bigint(20) DEFAULT NULL,
  `address` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `nick_name` varchar(20) COLLATE utf8_bin DEFAULT '不知道取什么名字好',
  `motto` varchar(100)  COLLATE utf8_bin DEFAULT '这家伙很懒，什么也没留下',
  `create_time`    timestamp       not null default CURRENT_TIMESTAMP,
  `update_time`      timestamp       not null,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`,`account`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
    DROP TRIGGER IF EXISTS `update_user_trigger`;
    DELIMITER //
    CREATE TRIGGER `update_user_trigger` BEFORE UPDATE ON `user`
     FOR EACH ROW SET NEW.`update_time` = NOW()
    //
    DELIMITER ;

    DROP TRIGGER IF EXISTS `insert_user_trigger`;
    DELIMITER //
    CREATE TRIGGER `insert_user_trigger` BEFORE INSERT ON `user`
     FOR EACH ROW SET NEW.`update_time` = NOW()
    //
    DELIMITER ;


create table route(
    `id`       BIGINT(20)      not null    AUTO_INCREMENT,
    `user_id`       BIGINT(20)      not null,
    `start_address` varchar(20)     not null,
    `end_address`   varchar(20)     not null,
    `price`         bigint(10)      not null,
    `status`        varchar(20)     not null default 'ready',
    `start_time`    bigint(20)      not null default '0',
    `end_time`      bigint(20)      not null default '0',
    `create_time`    timestamp       not null default CURRENT_TIMESTAMP,
    `update_time`      timestamp       not null,
    primary key (`id`),
    key `user_id` (`user_id`)
)
    engine = InnoDB
    default charset = utf8
    collate = utf8_bin;
    DROP TRIGGER IF EXISTS `update_route_trigger`;
    DELIMITER //
    CREATE TRIGGER `update_route_trigger` BEFORE UPDATE ON `route`
     FOR EACH ROW SET NEW.`update_time` = NOW()
    //
    DELIMITER ;

    DROP TRIGGER IF EXISTS `insert_route_trigger`;
    DELIMITER //
    CREATE TRIGGER `insert_route_trigger` BEFORE INSERT ON `route`
     FOR EACH ROW SET NEW.`update_time` = NOW()
    //
    DELIMITER ;


create table orders(
    `auto_id`       bigint(20)      not null    AUTO_INCREMENT,
    `id`            bigint(20)      not null
     COMMENT '快递单号，当前时间戳+4位随机数',
    `user_id`       bigint(20)      not null,
    `route_id`      bigint(20)      not null,
    `send_address` varchar(20)     not null,
    `take_address`   varchar(20)     not null,
    `send_name`     varchar(20)     not null,
    `take_name`     varchar(20)     not null,
    `send_phone`    bigint(20)      not null,
    `take_phone`    bigint(20)      not null,
    `goods_name`    varchar(20)     not null,
    `goods_weight`  bigint(10)      not null,
    `is_finish`     TINYINT(1)      not null default '0',
    `is_com`        tinyint(1)      not null default '0',
    `score`         tinyint(1),
    `comment`       varchar(100),
    `start_time`    bigint(20)      not null default '0',
    `end_time`      bigint(20)      not null default '0',
    `create_time`    timestamp       not null default CURRENT_TIMESTAMP,
    `update_time`      timestamp       not null,
    primary key (`auto_id`),
    key `user_id` (`user_id`),
    key `route_id` (`route_id`),
    key `orders_id` (`id`)
)
    engine = InnoDB
    default charset = utf8
    collate = utf8_bin;

    DROP TRIGGER IF EXISTS `update_orders_trigger`;
    DELIMITER //
    CREATE TRIGGER `update_orders_trigger` BEFORE UPDATE ON `orders`
     FOR EACH ROW SET NEW.`update_time` = NOW()
    //
    DELIMITER ;

    DROP TRIGGER IF EXISTS `insert_orders_trigger`;
    DELIMITER //
    CREATE TRIGGER `insert_orders_trigger` BEFORE INSERT ON `orders`
     FOR EACH ROW SET NEW.`update_time` = NOW()
    //
    DELIMITER ;


create table address (
    `id`        bigint(20)      not null AUTO_INCREMENT ,
    `user_id`   bigint(20)      not null,
    `address`   varchar(20)     not null,
    `is_use`    tinyint(1)      not null,
    `create_time`    timestamp       not null default CURRENT_TIMESTAMP,
    `update_time`      timestamp       not null,
    primary key(`id`),
    key `user_id`(`user_id`)
)
    engine = InnoDB
    default charset = utf8
    collate = utf8_bin;

    DROP TRIGGER IF EXISTS `update_address_trigger`;
    DELIMITER //
    CREATE TRIGGER `update_address_trigger` BEFORE UPDATE ON `address`
     FOR EACH ROW SET NEW.`update_time` = NOW()
    //
    DELIMITER ;

    DROP TRIGGER IF EXISTS `insert_address_trigger`;
    DELIMITER //
    CREATE TRIGGER `insert_address_trigger` BEFORE INSERT ON `address`
    FOR EACH ROW SET NEW.`update_time` = NOW()
    //
    DELIMITER ;


create table task (
    `id`        bigint(20)      not null AUTO_INCREMENT ,
    `user_id`   bigint(20)      not null,
    `route_id`  bigint(20)      not null,
    `order_id`  bigint(20)      not null,
    `is_finish` tinyint(1)      not null default '0',
    `route`     varchar(20)     not null,
    `create_time`    timestamp       not null default CURRENT_TIMESTAMP,
    `update_time`      timestamp       not null,
     primary key(`id`),
     key `user_id`(`user_id`),
     key `route_id`(`route_id`),
     key `order_id`(`order_id`)
)
    engine = InnoDB
    default charset = utf8
    collate = utf8_bin;

    DROP TRIGGER IF EXISTS `update_task_trigger`;
    DELIMITER //
    CREATE TRIGGER `update_task_trigger` BEFORE UPDATE ON `task`
     FOR EACH ROW SET NEW.`update_time` = NOW()
    //
    DELIMITER ;

    DROP TRIGGER IF EXISTS `insert_task_trigger`;
    DELIMITER //
    CREATE TRIGGER `insert_task_trigger` BEFORE INSERT ON `task`
     FOR EACH ROW SET NEW.`update_time` = NOW()
    //
    DELIMITER ;



create table message (
    `id`        bigint           not null    AUTO_INCREMENT,
    `user_id`   bigint           not null,
    `msg`       varchar(100)    not null,
    `create_time`    timestamp       not null default CURRENT_TIMESTAMP,
    `update_time`    timestamp       not null,
    primary key(`id`),
    key `user_id`(`user_id`)
)
    engine = InnoDB
    default charset = utf8
    collate = utf8_bin;

    DROP TRIGGER IF EXISTS `update_message_trigger`;
    DELIMITER //
    CREATE TRIGGER `update_message_trigger` BEFORE UPDATE ON `message`
     FOR EACH ROW SET NEW.`update_time` = NOW()
    //
    DELIMITER ;

    DROP TRIGGER IF EXISTS `insert_message_trigger`;
    DELIMITER //
    CREATE TRIGGER `insert_message_trigger` BEFORE INSERT ON `message`
     FOR EACH ROW SET NEW.`update_time` = NOW()
    //
    DELIMITER ;