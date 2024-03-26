NAME = INCEPTION

all: ${NAME}

${NAME}:
	@printf "\n"
	@printf "Building up your containers network INCEPTION !\n"
	docker-compose up --build

clean:
	docker-compose stop

fclean: clean
	docker-compose down
	docker system prune -a -f

re:	fclean all

.PHOMY: all clean re