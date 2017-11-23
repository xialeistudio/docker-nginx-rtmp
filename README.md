# Nginx直播服务器Docker镜像

## 推流命令
```bash
ffmpeg -re -i a.mp3 -f flv rtmp://localhost:1935/hls/a
```

## 启动命令
```bash
docker run -p 8080:80 -p 1935:1935 -v 宿主机log目录:/usr/local/nginx/logs -d 镜像名称
```