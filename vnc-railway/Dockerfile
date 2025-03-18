FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN echo "Asia/Ho_Chi_Minh" > /etc/timezone \
    && ln -fs /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime \
    && apt-get update \
    && apt-get install -y tzdata \
    && dpkg-reconfigure -f noninteractive tzdata
RUN apt-get install -y \
    lxde-core \
    tightvncserver \
    xfce4-terminal \
    && apt-get clean
RUN mkdir -p /root/.vnc && echo "yourpassword" | vncpasswd -f > /root/.vnc/passwd
RUN chmod 600 /root/.vnc/passwd
COPY start-vnc.sh /start-vnc.sh
RUN chmod +x /start-vnc.sh
EXPOSE 5901
CMD ["/start-vnc.sh"]
