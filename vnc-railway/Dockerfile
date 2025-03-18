FROM ubuntu:22.04

# Cài đặt các gói cần thiết
RUN apt-get update && apt-get install -y \
    lxde-core \
    tightvncserver \
    xfce4-terminal \
    && apt-get clean

# Thiết lập mật khẩu VNC (đổi "yourpassword" thành mật khẩu bạn muốn)
RUN mkdir -p /root/.vnc && echo "yourpassword" | vncpasswd -f > /root/.vnc/passwd
RUN chmod 600 /root/.vnc/passwd

# Tạo script khởi động VNC
COPY start-vnc.sh /start-vnc.sh
RUN chmod +x /start-vnc.sh

# Expose port cho VNC (5901 là mặc định)
EXPOSE 5901

# Chạy VNC server
CMD ["/start-vnc.sh"]
