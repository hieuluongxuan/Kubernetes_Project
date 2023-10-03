FROM ubuntu:latest

# Install Apache, zip, and unzip
RUN sudo apt-get update && apt-get install -y apache2 zip unzip

# Download and extract the ZIP file
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip
RUN cp -rvf photogenic/* .
#RUN rm -rf photogenic photogenic.zip

# Start Apache as a foreground process
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

# Expose ports (documenting that the container listens on these ports)
EXPOSE 80 22
