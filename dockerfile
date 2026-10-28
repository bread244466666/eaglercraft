# 1. 使用官方公開的 Java 17 輕量環境
FROM eclipse-temurin:17-jre-alpine

# 2. 安裝下載工具
RUN apk add --no-cache curl wget bash

# 3. 建立並切換到伺服器工作目錄
WORKDIR /server

# 4. 同意 Paper 麥塊的 EULA 條款
RUN echo "eula=true" > eula.txt

# 5. [核心下載] 精準下載官方 Eaglercraft 伺服器整合包（不換行版本）
RUN wget -O server.jar https://github.com

# 6. 開啟對外連接埠
EXPOSE 25565
EXPOSE 5200
EXPOSE 8080

# 7. 啟動伺服器：限制免費方案最安全的 512M 記憶體
CMD ["java", "-Xmx512M", "-Xms400M", "-jar", "server.jar", "nogui"]
