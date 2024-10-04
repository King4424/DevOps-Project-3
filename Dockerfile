FROM ubuntu:latest

# Update the package repository
RUN apt-get -y update

# Install Apache, curl, zip, and unzip
RUN apt-get install -y apache2 curl zip unzip

# Set the working directory for temporary operations
WORKDIR /tmp

# Download a different free CSS template
RUN curl -O https://www.free-css.com/assets/files/free-css-templates/download/page296/oxer.zip

# Unzip the downloaded template
RUN unzip oxer.zip -d /tmp/oxer || (echo "Failed to unzip oxer.zip" && exit 1)

# Set the working directory to the Apache web directory
WORKDIR /var/www/html

# Copy the contents from the unzipped folder to the Apache root directory
RUN cp -rvf /tmp/oxer/* . || (echo "Failed to copy files from /tmp/oxer" && exit 1)

# Clean up by removing the downloaded zip file and extracted folder
RUN rm -rf /tmp/oxer /tmp/oxer.zip

# Define the entry point to start Apache in the foreground
ENTRYPOINT ["/usr/sbin/apache2ctl"]
CMD ["-D", "FOREGROUND"]

# Expose port 80 for web traffic
EXPOSE 80
