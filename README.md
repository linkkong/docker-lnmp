# docker-lnmp

进入该文件夹，启动命令为docker-compose up  后台运行加 -d
结束命令为docker-compose stop

2018-09-29 更新

- 增加xdebug功能，需要重新生成镜像，默认端口为9100
- 暴露php7.2的配置文件方便修改
- 去掉php映射外部接口

2018-08-17 更新

- 优化mac下docker访问挂载目录慢的问题
- 资料如下https://docs.docker.com/docker-for-mac/osxfs-caching/#delegated

2018-08-14 更新

- 增加容器时区同步设置,和容器错误重启功能
- 时区设置的两种方式

```docker

environment:
      - TZ=Asia/Shanghai

or

volumes:
  - /etc/localtime:/etc/localtime:ro
  - /etc/timezone:/etc/timezone:ro

```

2018-08-07 更新

- 增加Ubuntu18.04安装docker清华源脚本，和docker-compose使用

2018-02-26 更新

- 添加php镜像cron功能，供laravel使用

2017-12-04 提交

- 更新内容：添加nginx和php之间的关联  links，与mysql和redis连接可参考php与nginx

注：安装php mongodb redis(其他)模块

- docker ps -a 查看php容器的id
- docker exec -it 容器id bash   进入 命令行
- 执行apt -y update && apt install -y libssh-dev  安装必要的包
- 进入/usr/local/bin, 执行pecl install mongodb && docker-php-ext-enable mongodb
- pecl install redis-3.1.0 && docker-php-ext-enable redis

## 安装mysql扩展

- docker-php-ext-install pdo_mysql

## 查看rabbitmq队列

- ```http://localhost:15672```
- 账号密码默认guest,guest

## docker_php官方文档 https://hub.docker.com/_/php/
