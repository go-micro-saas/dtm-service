CREATE SCHEMA IF NOT EXISTS dtm_barrier;

DROP TABLE IF EXISTS dtm_barrier.barrier;
CREATE SEQUENCE IF NOT EXISTS dtm_barrier.barrier_seq;
CREATE TABLE IF NOT EXISTS dtm_barrier.barrier
(
    id          bigint NOT NULL             DEFAULT NEXTVAL('dtm_barrier.barrier_seq'),
    trans_type  varchar(45)                 DEFAULT '',
    gid         varchar(128)                DEFAULT '',
    branch_id   varchar(128)                DEFAULT '',
    op          varchar(45)                 DEFAULT '',
    barrier_id  varchar(45)                 DEFAULT '',
    reason      varchar(45)                 DEFAULT '',
    create_time timestamp(0) WITH TIME ZONE DEFAULT NULL,
    update_time timestamp(0) WITH TIME ZONE DEFAULT NULL,
    PRIMARY KEY (id),
    CONSTRAINT uniq_barrier UNIQUE (gid, branch_id, op, barrier_id)
);