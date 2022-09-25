echo "Starting zookeeper and kafka conatiners"
echo "Running docker-compose"
docker-compose -f ./docker-compose.yml up -d
echo "Listing running containers"
docker ps