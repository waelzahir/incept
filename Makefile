
VOLUMES= 
all: run

build:
	mkdir -p /Users/ozahir/data/www
	mkdir -p /Users/ozahir/data/db

run: build
	docker-compose   -f srcs/docker-compose.yml up -d

down:
	docker-compose   -f srcs/docker-compose.yml down

clean: down
	-bash -c "docker rm -f $$(docker container ls -aq)"
	-bash -c "docker rmi -f $$(docker images -aq)"
	-bash -c "docker volume rm   $$(docker volume ls -q)"
	rm -rf /Users/ozahir/data/www
	rm -rf /Users/ozahir/data/db
