FROM mysql:5.7
ENV MYSQL_DATABASE smsservice
ENV MYSQL_ROOT_PASSWORD T2n44k2145k_m253195
ENV MYSQL_USER mrfksiv
ENV MYSQL_PASSWORD T2n44k2145k_

ENV DEV_LOCAL_DB_HOST localhost
ENV DEV_LOCAL_DB_USER mrfksiv
ENV DEV_LOCAL_DB_PASSWORD T2n44k2145k_
ENV DEV_LOCAL_DB_NAME smsservice
ENV DATABASE_HOST db

EXPOSE 3306