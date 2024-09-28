FROM amazonlinux:latest
RUN yum -y update
RUN yum install httpd -y
RUN yum install zip  -y
RUN yum install unzip -y
ADD ./avalon.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip avalon.zip
RUN cp -rvf avalon/* .
RUN rm -rf avalon avalon.zip
ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["-D", "FOREGROUND"]
EXPOSE 80

