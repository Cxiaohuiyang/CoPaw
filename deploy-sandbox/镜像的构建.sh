cd deploy-sandbox

# 停止并删除旧容器
docker-compose -f docker-compose.single.yml down

# 使用 docker-compose（推荐） 构建镜像
docker-compose -f docker-compose.single.yml up -d

# 或使用 docker run（单独运行）
docker run -d \
  --name copaw \
  -p 8088:8088 \
  -v copaw-data:/app/working \
  -v copaw-secrets:/app/working.secret \
  -e COPAW_PORT=8080 \
  -e COPAW_WORKING_DIR=/app/working \
  -e COPAW_SECRET_DIR=/app/working.secret \
  deploy-sandbox-copaw