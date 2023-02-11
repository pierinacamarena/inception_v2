NAME = inception

all: prune reload

reload:
	@docker-compose -f srcs/docker-compose.yml up --build -d

stop:
	@docker-compose -f srcs/docker-compose.yml down

clean:
	@docker-compose -f srcs/docker-compose.yml down --volumes --rmi all

prune: clean
	@docker system prune -f

re: clean all

.PHONY: all reload stop clean prune re