home = $$HOME
home := $(addprefix $(home), /data)
Volumes =  $(home)/wordpress $(home)/mariadb

all: build run

build:
	@mkdir -p $(Volumes)
	@docker-compose  -f srcs/docker-compose.yml build
run:
	@docker-compose  -f srcs/docker-compose.yml up  -d

stop:
	docker-compose -f srcs/docker-compose.yml down
clean: stop
	-rm -rf $(Volumes)
	-docker rmi -f srcs-nginx srcs-mariadb
	-docker volume rm srcs_wordpress  srcs_mariadb
	-docker container prune -f

re:  clean build run
