FROM mysql:8.0.32
COPY ./common/mysql/conf.d /etc/mysql/conf.d
RUN chmod 0444 /etc/mysql/conf.d/my.cnf

CMD ["mysqld"]
