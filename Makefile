all:
	sudo docker-compose  -f srcs/docker-compose.yml up 
clean:
	sudo docker-compose  -f srcs/docker-compose.yml down

