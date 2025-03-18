#!/bin/bash
# Khởi động TightVNC server
tightvncserver :1 -geometry 1280x720 -depth 24

# Giữ container chạy bằng cách tail log hoặc sleep vô hạn
tail -f /root/.vnc/2bcb9bc4e0ce:1.log
# Hoặc dùng: 
# while true; do sleep 1000; done
