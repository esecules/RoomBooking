FROM lucee/lucee4-nginx:4.5.1.024

EXPOSE 8888

RUN echo "mysql-server mysql-server/root_password password roombooking" | debconf-set-selections && \
echo "mysql-server mysql-server/root_password_again password roombooking" | debconf-set-selections 
RUN apt-get update && apt-get install -y mysql-server

ADD src/ /var/www/