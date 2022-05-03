#!/bin/sh
export DATABASE_URL=postgres://$POSTGRESQL_USER:$POSTGRESQL_PASSWORD@$POSTGRESQL_HOST:5432/$POSTGRESQL_DATABASE?sslmode=disable
#init db
doccano init
#create super user
doccano createuser --username $ADMIN_USER --password $ADMIN_PASS
(trap 'kill 0' SIGINT;
#start web server
doccano webserver --port 8000 &
#connect to db
./celery.sh
)