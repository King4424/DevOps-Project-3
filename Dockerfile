FROM ubuntu:latest
RUN apt -y update
RUN apt install -y apache2 curl
RUN apt install zip  -y
RUN apt install unzip -y
ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["-D", "FOREGROUND"]
EXPOSE 80

