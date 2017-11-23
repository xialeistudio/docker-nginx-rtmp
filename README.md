# Nginx直播服务器Docker镜像
基于ubuntu基础镜像做的nginx+rtmp直播服务器
## ffmpeg推流
```bash
ffmpeg -re -i a.mp3 -acodec aac  -f flv rtmp://localhost:1935/hls/a
```

## 启动rtmp直播服务器
```bash
docker run -p 8080:80 -p 1935:1935 -v 宿主机log目录:/usr/local/nginx/logs -d 镜像名称
```
