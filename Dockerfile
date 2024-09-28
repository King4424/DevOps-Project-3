FROM amazonlinux:latest
RUN yum -y update
RUN yum install httpd -y
RUN yum install zip  -y
RUN yum install unzip -y
ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["-D", "FOREGROUND"]
EXPOSE 80

