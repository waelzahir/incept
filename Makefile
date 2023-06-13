
home = $$HOME
home := $(addprefix $(home), /data)
Volumes =  $(home)/wordpress

all:
	echo $(home)
# all: build run

build:
	mkdir -p $(Volumes)
	docker-compose  -f srcs/docker-compose.yml build

run:
	docker-compose  -f srcs/docker-compose.yml up

stop:
	docker-compose -f srcs/docker-compose.yml down
clean: stop
	rm -rf $(Volumes)
	docker volume prune -f
	docker container prune -f
	docker rmi -f srcs-nginx

re:  clean build run
