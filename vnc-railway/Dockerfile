FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Cài đặt múi giờ Asia/Ho_Chi_Minh
RUN echo "Asia/Ho_Chi_Minh" > /etc/timezone \
    && ln -fs /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime \
    && apt-get update \
    && apt-get install -y tzdata \
    && dpkg-reconfigure -f noninteractive tzdata

# Cài đặt các gói cần thiết, bao gồm Firefox
RUN apt-get update && apt-get install -y \
    lxde-core \
    tightvncserver \
    xfce4-terminal \
    firefox \
    && apt-get clean

# Thiết lập cấu hình VNC
RUN mkdir -p /root/.vnc \
    && echo "yourpassword" | vncpasswd -f > /root/.vnc/passwd \
    && chmod 600 /root/.vnc/passwd

# Thiết lập biến môi trường USER
ENV USER=root

# Cấu hình xstartup để chạy LXDE
RUN echo "#!/bin/bash\n\
xrdb \$HOME/.Xresources\n\
startlxde &" > /root/.vnc/xstartup \
    && chmod +x /root/.vnc/xstartup

# Sao chép và phân quyền cho script khởi động
COPY start-vnc.sh /start-vnc.sh
RUN chmod +x /start-vnc.sh

# Mở cổng VNC
EXPOSE 5901

# Chạy script khởi động
CMD ["/start-vnc.sh"]
