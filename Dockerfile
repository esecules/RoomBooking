FROM lucee/lucee5-nginx:5.0.0.98

EXPOSE 8888

RUN echo "mysql-server mysql-server/root_password password roombooking" | debconf-set-selections && \
echo "mysql-server mysql-server/root_password_again password roombooking" | debconf-set-selections && \
apt-get update && apt-get install -y mysql-server python-dev python-pip && \
pip install Flask && \
echo "\n\n[program:mysql]\ncommand=/etc/init.d/mysql start\n" >> /etc/supervisor/conf.d/supervisord.conf && \
echo "\n\n[program:reset-listener]\ncommand=/tmp/resetdb.py\n" >> /etc/supervisor/conf.d/supervisord.conf && \
apt-get remove -y python-pip python-dev && \
apt-get autoremove -y && \
rm -rf /var/lib/apt/lists/*

ADD src/install/new-installation.sql cfg/* /tmp/

RUN /tmp/initdb.sh

ADD src/ /var/www/