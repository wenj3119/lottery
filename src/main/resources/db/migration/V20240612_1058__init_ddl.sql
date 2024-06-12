
CREATE TABLE IF NOT EXISTS qr_code
(
    `id`          int(11)     NOT NULL AUTO_INCREMENT COMMENT '二维码ID',
    `name`        varchar(64) NOT NULL COMMENT '名称',
    `rank`        tinyint(4)  NOT NULL DEFAULT 0 COMMENT '中奖等级：0-未中奖，1-一等奖，2-二等奖，3-三等奖，4-四等奖，5-五等奖',
    `prize_id`    int(11)     DEFAULT NULL  COMMENT '奖品ID',
    `code`        varchar(64)  DEFAULT NULL COMMENT '产品编码',
    `description` varchar(255)         DEFAULT NULL COMMENT '产品描述',
    `delete_flag` tinyint(1)  NOT NULL DEFAULT '0' COMMENT '是否删除：0-否，1-是',
    `created_by`  varchar(128)         DEFAULT NULL,
    `created_at`  datetime(3)          DEFAULT NULL,
    `updated_by`  varchar(128)         DEFAULT NULL,
    `updated_at`  datetime(3)          DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3),
    PRIMARY KEY (`id`) USING BTREE
    ) ENGINE = InnoDB
DEFAULT CHARSET = utf8mb4 COMMENT ='二维码生成表';

CREATE TABLE IF NOT EXISTS prize
(
    `id`          int(11)     NOT NULL AUTO_INCREMENT COMMENT '奖品ID',
    `name`        varchar(64) NOT NULL COMMENT '奖品名称',
    `description` varchar(255)         DEFAULT NULL COMMENT '奖品描述',
    `delete_flag` tinyint(1)  NOT NULL DEFAULT '0' COMMENT '是否删除：0-否，1-是',
    `created_by`  varchar(128)         DEFAULT NULL,
    `created_at`  datetime(3)          DEFAULT NULL,
    `updated_by`  varchar(128)         DEFAULT NULL,
    `updated_at`  datetime(3)          DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3),
    PRIMARY KEY (`id`) USING BTREE
    ) ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4 COMMENT ='奖品表';

CREATE TABLE IF NOT EXISTS activity
(
    `id`          int(11)     NOT NULL AUTO_INCREMENT COMMENT '活动ID',
    `name`        varchar(64) NOT NULL COMMENT '活动名称',
    `description` varchar(255)         DEFAULT NULL COMMENT '活动描述',
    `delete_flag` tinyint(1)  NOT NULL DEFAULT '0' COMMENT '是否删除：0-否，1-是',
    `created_by`  varchar(128)         DEFAULT NULL,
    `created_at`  datetime(3)          DEFAULT NULL,
    `updated_by`  varchar(128)         DEFAULT NULL,
    `updated_at`  datetime(3)          DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3),
    PRIMARY KEY (`id`) USING BTREE
    ) ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4 COMMENT ='抽奖活动表';

CREATE TABLE IF NOT EXISTS activity_prize_ref
(
    `id`          int(11)     NOT NULL AUTO_INCREMENT COMMENT '关系表ID',
    `activity_id` int(11)     NOT NULL COMMENT '活动ID',
    `prize_id`    int(11)     NOT NULL  COMMENT '奖品ID',
    `rank`        tinyint(4)  NOT NULL DEFAULT 0 COMMENT '中奖等级：0-未中奖，1-一等奖，2-二等奖，3-三等奖，4-四等奖，5-五等奖',
    `description` varchar(255)         DEFAULT NULL COMMENT '描述',
    `created_by`  varchar(128)         DEFAULT NULL,
    `created_at`  datetime(3)          DEFAULT NULL,
    `updated_by`  varchar(128)         DEFAULT NULL,
    `updated_at`  datetime(3)          DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3),
    PRIMARY KEY (`id`) USING BTREE
    ) ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4 COMMENT ='抽奖活动和奖品关系表';
