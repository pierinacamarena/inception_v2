ERASELINE=\r\033[K
UPFIVE=\033[5A
UP=\033[1A
DOWNFOUR=\033[4B

BLUE=\033[34m
RED=\033[31m
NOCOLOR=\033[0m

all: rambo ramboprune
	echo "$(UPFIVE)$(ERASELINE)$(BLUE) Launching$(NOCOLOR)$(DOWNFOUR)"
	sudo docker-compose -f srcs/docker-compose.yml up --build -d > /dev/null 2> /dev/null
	echo "$(UPFIVE)$(ERASELINE)$(BLUE) Launched$(NOCOLOR)$(DOWNFOUR)"

reload: ramboprune
	echo "$(UPFIVE)$(ERASELINE)$(BLUE) Launching$(NOCOLOR)$(DOWNFOUR)"
	sudo docker-compose -f srcs/docker-compose.yml up --build -d > /dev/null 2> /dev/null
	echo "$(UPFIVE)$(ERASELINE)$(BLUE) Launched$(NOCOLOR)$(DOWNFOUR)"

stop:
	echo "$(ERASELINE)$(RED)[Compose] $(NOCOLOR)Stopping"
	sudo docker-compose -f srcs/docker-compose.yml down > /dev/null 2> /dev/null
	echo "$(UP)$(ERASELINE)$(RED)[Compose] $(NOCOLOR)Stopped"

clean: stop
	echo "$(ERASELINE)$(RED)[Volume] $(NOCOLOR)Removing"
	sudo docker-compose -f srcs/docker-compose.yml down --volumes --rmi all > /dev/null 2> /dev/null
	echo "$(UP)$(ERASELINE)$(RED)[Volume] $(NOCOLOR)Removed"

prune: clean
	echo "$(ERASELINE)$(RED)[Compose] $(NOCOLOR)Pruning"
	sudo docker system prune -f > /dev/null 2> /dev/null
	echo "$(UP)$(ERASELINE)$(RED)[Compose] $(NOCOLOR)Pruned"

re: prune reload

rambo:
	echo '                      /^--^\     /^--^\     /^--^\'
	echo '                      \____/     \____/     \____/'
	echo '                     /      \   /      \   /      \'
	echo '                    |        | |        | |        |'
	echo '                     \__  __/   \__  __/   \__  __/'
	echo '|^|^|^|^|^|^|^|^|^|^|^|^\ \^|^|^|^/ /^|^|^|^|^\ \^|^|^|^|^|^|^|^|^|^|^|^|'
	echo '| | | | | | | | | | | | |\ \| | |/ /| | | | | | \ \ | | | | | | | | | | |'
	echo '| | | | | | | | | | | | / / | | |\ \| | | | | |/ /| | | | | | | | | | | |'
	echo '| | | | | | | | | | | | \/| | | | \/| | | | | |\/ | | | | | | | | | | | |'
	echo '                             INCEPTION                                   '
	echo '| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |'
	echo '| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |'

ramboprune:
	echo '   ∧＿∧  '
	echo '  ( ･ω･) '
	echo '――∪――――∪―――'
	echo "\033[34m  [Inception]\033[0m"
	echo '___________'
	echo '  |    | '
	echo '  |    | '
	echo '   U  U  '

.PHONY: all stop clean prune re rambo ramboprune reload
.SILENT: all stop clean prune re rambo ramboprune reload