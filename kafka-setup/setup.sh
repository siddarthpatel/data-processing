echo "Enter an option (1 or 2) for the number of kafka brokers and zookeeper servers configuration"
echo "1. ONE kafka broker and ONE zookeeper server config"
echo "2. THREE kafka brokers and THREE zookeeper servers config"

read varname

if [[ "${varname}" == "1" ]];then
    echo "ONE kafka broker architecture"
    echo "Running docker-compose"
    docker-compose -f ./docker-compose.yml up -d
    echo "Listing running containers"
    docker ps
elif [[ "${varname}" == "2" ]];then
    echo "THREE kafka broker architecture"
    echo "Running docker-compose"
    docker-compose -f ./docker-compose-2.yml up -d
    echo "Listing running containers"
    docker ps
else
    echo "invalid input"
fi
