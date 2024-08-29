CREATE SCHEMA IF NOT EXISTS dtm_busi
/* SQLINES DEMO *** RACTER SET utf8mb4 */
;

DROP TABLE IF EXISTS dtm_busi.user_account;
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE IF NOT EXISTS dtm_busi.user_account_seq;
CREATE TABLE IF NOT EXISTS dtm_busi.user_account
(
    id              int PRIMARY KEY             DEFAULT NEXTVAL('dtm_busi.user_account_seq'),
    user_id         int UNIQUE,
    balance         DECIMAL(10, 2) NOT NULL     DEFAULT '0',
    trading_balance DECIMAL(10, 2) NOT NULL     DEFAULT '0',
    create_time     timestamp(0) WITH TIME ZONE DEFAULT NOW(),
    update_time     timestamp(0) WITH TIME ZONE DEFAULT NOW()
);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE INDEX IF NOT EXISTS create_idx ON dtm_busi.user_account (create_time);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE INDEX IF NOT EXISTS update_idx ON dtm_busi.user_account (update_time);
TRUNCATE dtm_busi.user_account;
INSERT INTO dtm_busi.user_account (user_id, balance)
VALUES (1, 10000),
       (2, 10000);