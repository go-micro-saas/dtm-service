# saas dtm manager

> 配置示例： MicroService.EndPoint => MICRO_SERVICE_END_POINT

* 快速部署文档： https://dtm.pub/guide/install.html#mac-homebrew-%E5%AE%89%E8%A3%85
* 上线部署文档： https://dtm.pub/deploy/base.html#%E6%A6%82%E8%A7%88
* 部署文档： https://dtm.pub/deploy/deploy.html
* kratos示例： https://dtm.pub/ref/kratos.html
* dtm配置规则： https://dtm.pub/deploy/base.html#dtm%E9%85%8D%E7%BD%AE
* 子事务屏障： https://dtm.pub/practice/barrier.html
* 使用示例： https://github.com/dtm-labs/dtm-examples/blob/main/doc/README-cn.md
* 使用示例： https://github.com/dtm-labs/dtm-cases/blob/main/README-cn.md
* 订单场景： https://github.com/dtm-labs/dtm-cases/blob/main/order/README-cn.md
* 秒杀场景： https://github.com/dtm-labs/dtm-cases/blob/main/flash/README-cn.md

## 快速开始

```shell

# docker
docker network create my-network
docker pull yedf/dtm:1.18

# example
docker run -itd  --name dtm -p 36789:36789 -p 36790:36790  yedf/dtm:1.18
# mysql
docker run --name dtm -p 36789:36789 -p 36790:36790 \
    -e STORE_DRIVER=mysql -e STORE_HOST=my-mysql -e STORE_PORT=3306 \
    -e STORE_USER=root -e STORE_PASSWORD=Mysql.123456 \
    yedf/dtm:1.18
# postgres
docker run --name dtm -p 36789:36789 -p 36790:36790 \
    -e STORE_DRIVER=postgres -e STORE_HOST=my-postgres -e STORE_PORT=5432 \
    -e STORE_USER=postgres -e STORE_PASSWORD=Postgres.123456 \
    yedf/dtm:1.18
```

## 导入数据库

**postgres**

```shell

PGPASSWORD=Postgres.123456 psql -h my-postgres-hostname -p 5432 -U postgres \
    -f $GOPATH/src/github.com/go-micro-saas/dtm-service/sqls/busi.postgres.sql
PGPASSWORD=Postgres.123456 psql -h my-postgres-hostname -p 5432 -U postgres \
    -f $GOPATH/src/github.com/go-micro-saas/dtm-service/sqls/dtmcli.barrier.postgres.sql
PGPASSWORD=Postgres.123456 psql -h my-postgres-hostname -p 5432 -U postgres \
    -f $GOPATH/src/github.com/go-micro-saas/dtm-service/sqls/dtmsvr.storage.postgres.sql

```

## docker-compose

环境变量配置示例： MicroService.EndPoint => MICRO_SERVICE_END_POINT

> **先导入数据库在启动**

* [docker-compose.yaml](./docker-compose.yaml)

```shell
# run
docker-compose -p my-project up -d my-dtm
docker-compose -p my-project stop my-dtm
docker-compose -p my-project rm my-dtm
docker-compose -p my-project rm -f my-dtm
docker-compose -p my-project down
docker volume rm my-project_my_dtm_data

curl --request PUT http://my-consul-hostname:8500/v1/agent/service/deregister/dtmservice

```