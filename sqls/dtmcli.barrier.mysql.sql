CREATE DATABASE IF NOT EXISTS dtm_barrier
    /*!40100 DEFAULT CHARACTER SET utf8mb4 */
;
DROP TABLE IF EXISTS dtm_barrier.barrier;
CREATE TABLE IF NOT EXISTS dtm_barrier.barrier
(
    id          bigint(22) PRIMARY KEY AUTO_INCREMENT,
    trans_type  varchar(45)  DEFAULT '',
    gid         varchar(128) DEFAULT '',
    branch_id   varchar(128) DEFAULT '',
    op          varchar(45)  DEFAULT '',
    barrier_id  varchar(45)  DEFAULT '',
    reason      varchar(45)  DEFAULT '' COMMENT 'the branch type who insert this record',
    create_time datetime     DEFAULT NOW(),
    update_time datetime     DEFAULT NOW(),
    KEY (create_time),
    KEY (update_time),
    UNIQUE KEY (gid, branch_id, op, barrier_id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;