FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
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
