NAME = INCEPTION

all: ${NAME}

${NAME}:
	@printf "Creating directories for MariaDB and Wordpress ! !\n"
	mkdir -p /home/vpolojie/data/wordpress && mkdir -p /home/vpolojie/data/mariadb
	chmod -f 777 /home/vpolojie/data/
	@printf "\n"
	@printf "Building up your containers network INCEPTION !\n"
	docker-compose -f ./srcs/docker-compose.yml up --build

start:
	docker-compose -f ./srcs/docker-compose.yml start

clean:
	docker-compose -f ./srcs/docker-compose.yml stop

fclean: clean
	docker-compose -f ./srcs/docker-compose.yml down
	docker system prune -a -f
	sudo rm -rf /home/vpolojie/data

re:	fclean all

.PHOMY: all clean re
