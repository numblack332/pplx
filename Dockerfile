FROM node:21

# 设置工作目录
WORKDIR /app

# 复制 package.json 和 package-lock.json（如果存在）
COPY package*.json ./

# 安装依赖
RUN npm install \
    && npm install pm2 -g

# 复制应用程序代码
COPY . .

# 暴露端口
EXPOSE 3000

# 使用 PM2 启动应用程序
CMD ["pm2-runtime", "index.js"]
