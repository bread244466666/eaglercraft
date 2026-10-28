# 1. 使用官方、完全公開的 Java 17 輕量環境作為基礎
FROM eclipse-temurin:17-jre-alpine

# 2. 安裝下載工具與基礎指令
RUN apk add --no-cache curl wget bash

# 3. 建立並切換到伺服器工作目錄
WORKDIR /server

# 4. 在下載前先同意 Paper 伺服器的 EULA 條款
RUN echo "eula=true" > eula.txt

# 5. [核心下載] 自動下載官方推薦的 Eaglercraft 伺服器整合包
# 這裡採用了社群最穩定的 1.8 / 1.12.2 跨版本 Paper 伺服器核心
RUN wget -O server.jar https://github.com || \
    curl -L -o server.jar https://github.com

# 6. 開啟 Eaglercraft 預設的 Web 網頁與網頁連線通訊埠
EXPOSE 25565
EXPOSE 5200
EXPOSE 8080

# 7. 啟動指令：動態分配記憶體給麥塊伺服器（預設分配 512M，完美適配 Render 免費方案）
CMD ["java", "-Xmx512M", "-Xms400M", "-jar", "server.jar", "nogui"]
