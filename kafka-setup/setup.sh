echo "Starting zookeeper and kafka conatiners"
pwd
docker-compose -f ./docker-compose.yml up -d
docker ps