#!/bin/bash
# Khởi động VNC server trên display :1
tightvncserver :1 -geometry 1280x720 -depth 24
# Giữ container chạy
tail -f /dev/null
