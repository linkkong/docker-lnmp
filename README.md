# docker-lnmp
进入该文件夹，启动命令为docker-compose up
结束命令为docker-compose stop


2017-12-04 提交
- 更新内容：添加nginx和php之间的关联  links，与mysql和redis连接可参考php与nginx

注：安装php mongodb模块
- 1. docker ps -a 查看php容器的id
- 2. docker exec -it 容器id bash   进入 命令行
- 3. 执行apt-update && apt install libssh-dev  安装必要的命令
- 4. 进入/usr/local/bin, 执行pecl install mongodb && docker-php-ext-enable mongodb

#docker_php官方文档 https://hub.docker.com/_/php/
