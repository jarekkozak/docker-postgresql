#!/bin/bash
. db-config
docker stop $DB_CONTAINER
docker rm -f $DB_CONTAINER
docker run --name $DB_CONTAINER -itd \
	--restart $RESTART \
   	--env "PG_PASSWORD=$DB_PASSWORD" \
	--env "DB_NAME=$DB_NAME" \
  	--publish $DB_PORT:5432 \
  	--volume $DB_DIR_DATA:/var/lib/postgresql $DB_IMAGE
