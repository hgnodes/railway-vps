FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
curl \
wget \
sudo \
openssh-server \
docker.io

RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd

RUN sed -i 's/#Port 22/Port 2244/g' /etc/ssh/sshd_config
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

RUN curl -L https://github.com/pterodactyl/wings/releases/latest/download/wings_linux_amd64 \
-o /usr/local/bin/wings

RUN chmod +x /usr/local/bin/wings

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 2244

CMD ["/start.sh"]
