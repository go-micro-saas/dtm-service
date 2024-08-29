CREATE DATABASE IF NOT EXISTS dtm_busi
    /*!40100 DEFAULT CHARACTER SET utf8mb4 */
;
DROP TABLE IF EXISTS dtm_busi.user_account;
CREATE TABLE IF NOT EXISTS dtm_busi.user_account
(
    id              int(11) PRIMARY KEY AUTO_INCREMENT,
    user_id         int(11) UNIQUE,
    balance         DECIMAL(10, 2) NOT NULL DEFAULT '0',
    trading_balance DECIMAL(10, 2) NOT NULL DEFAULT '0',
    create_time     datetime                DEFAULT NOW(),
    update_time     datetime                DEFAULT NOW(),
    KEY (create_time),
    KEY (update_time)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
INSERT INTO dtm_busi.user_account (user_id, balance)
VALUES (1, 10000),
       (2, 10000)
ON DUPLICATE KEY
    UPDATE balance =
               VALUES(balance);