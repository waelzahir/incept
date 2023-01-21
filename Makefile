
all: run

build:
	bash -c "mkdir -p /home/$$USER/data/www"
	bash -c "mkdir -p /home/$$USER/data/db"

run: build
	docker-compose   -f srcs/docker-compose.yml up -d

down:
	docker-compose   -f srcs/docker-compose.yml down

clean: down
	-bash -c "docker rm -f $$(docker container ls -aq); \
		docker rmi $$(docker images -aq); \
		bash -c "docker volume rm $$(docker volume ls -q); \
		sudo rm -rf /home/$$USER/data/www; \
		sudo rm -rf /home/$$USER/data/db;"
