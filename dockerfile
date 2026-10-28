# 使用社群維護的 Eaglercraft 伺服器映像檔（基於 Paper 核心與內建 Web 轉譯層）
FROM ghcr.io/yangchuansheng/eaglercraft-server:latest

# 告知 Render 開啟內建的 5200 與 5201 連接埠
EXPOSE 5200
EXPOSE 5201
