FROM ubuntu
MAINTAINER xialeistudio "xialeistudio@gmail.com"
ADD sources.list /etc/apt/
RUN apt-get update
RUN apt-get install git gcc make wget libpcre3 libpcre3-dev openssl libssl-dev -y -q
# 安装服务器
WORKDIR /usr/local/src
# 下载nginx
RUN wget http://nginx.org/download/nginx-1.12.2.tar.gz
# 解压nginx
RUN tar xf nginx-1.12.2.tar.gz
# 下载rtmp模块
RUN git clone https://github.com/arut/nginx-rtmp-module.git
# 编译nginx
WORKDIR /usr/local/src/nginx-1.12.2
RUN ./configure --add-module=../nginx-rtmp-module --with-http_flv_module --with-http_mp4_module
RUN make
RUN make install
# 复制配置文件
ADD nginx.conf /usr/local/nginx/conf/
# 启动
EXPOSE 80
EXPOSE 1935
CMD [ "/usr/local/nginx/sbin/nginx", "-c", "/usr/local/nginx/conf/nginx.conf" ]