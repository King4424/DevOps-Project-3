FROM ubuntu:latest

# Update the package repository
RUN apt-get -y update

# Install Apache, curl, zip, and unzip
RUN apt-get install -y apache2 curl
RUN apt-get install -y zip
RUN apt-get install -y unzip

# Download a different free CSS template and add it to the Apache web directory
ADD https://www.free-css.com/assets/files/free-css-templates/download/page283/silver.zip /var/www/html/

# Set the working directory to the Apache web directory
WORKDIR /var/www/html

# Unzip the downloaded template
RUN unzip silver.zip

# Move the contents from the unzipped folder to the Apache root directory
RUN cp -rvf silver/* .

# Clean up by removing the downloaded zip file and extracted folder
RUN rm -rf silver silver.zip

# Define the entry point to start Apache in the foreground
ENTRYPOINT ["/usr/sbin/apache2ctl"]
CMD ["-D", "FOREGROUND"]

# Expose port 80 for web traffic
EXPOSE 80


