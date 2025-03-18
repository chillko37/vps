FROM ubuntu:22.04

# Thiết lập múi giờ tự động (non-interactive)
ENV DEBIAN_FRONTEND=noninteractive
RUN echo "Asia/Ho_Chi_Minh" > /etc/timezone \
    && ln -fs /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime \
    && apt-get update \
    && apt-get install -y tzdata \
    && dpkg-reconfigure -f noninteractive tzdata

# Cài đặt các gói cần thiết
RUN apt-get install -y \
    lxde-core \
    tightvncserver \
    xfce4-terminal \
    && apt-get clean

# Thiết lập mật khẩu VNC
RUN mkdir -p /root/.vnc && echo "yourpassword" | vncpasswd -f > /root/.vnc/passwd
RUN chmod 600 /root/.vnc/passwd

# Tạo script khởi động VNC
COPY start-vnc.sh /start-vnc.sh
RUN chmod +x /start-vnc.sh

# Expose port cho VNC
EXPOSE 5901

# Chạy VNC server
CMD ["/start-vnc.sh"]
