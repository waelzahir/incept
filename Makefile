home = $$HOME
home := $(addprefix $(home), /data)
Volumes =  $(home)/wordpress $(home)/mariadb 

all:
	echo "to build: make build\nto run: make run\nto stop: make stop\nto clean: make clean"

build:
	@mkdir -p $(Volumes)
	-@docker-compose  -f srcs/docker-compose.yml build
run:
	-@docker-compose  -f srcs/docker-compose.yml up  

stop:
	docker-compose -f srcs/docker-compose.yml down
clean: stop
	-rm -rf $(Volumes)
	-docker rmi -f srcs-nginx srcs-mariadb  srcs-wordpress
	-docker volume rm srcs_wordpress  srcs_mariadb
	-docker container prune -f

re:  clean build run
