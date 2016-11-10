FROM lucee/lucee5-nginx:5.0.0.98

EXPOSE 8888

RUN echo "mysql-server mysql-server/root_password password roombooking" | debconf-set-selections && \
echo "mysql-server mysql-server/root_password_again password roombooking" | debconf-set-selections && \
apt-get update && apt-get install -y mysql-server && \
echo "\n\n[program:mysql]\ncommand=/etc/init.d/mysql start\n" >> /etc/supervisor/conf.d/supervisord.conf

ADD src/install/new-installation.sql cfg/initdb.sh /tmp/

RUN /tmp/initdb.sh

ADD src/ /var/www/