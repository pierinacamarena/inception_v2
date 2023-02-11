

all: rambo ramboprune
	echo "\033[5A\033[K\033[34m Launching\033[0m\033[4B"
	sudo docker-compose -f srcs/docker-compose.yml up --build -d > /dev/null 2> /dev/null
	echo "\033[5A\033[K\033[34m Launched\033[0m\033[4B"

reload: ramboprune
	echo "\033[5A\033[K\033[34m Launching\033[0m\033[4B"
	sudo docker-compose -f srcs/docker-compose.yml up --build -d > /dev/null 2> /dev/null
	echo "\033[5A\033[K\033[34m Launched\033[0m\033[4B"

stop:
	echo "\r\033[K\033[31m[Compose] \033[0mStopping"
	sudo docker-compose -f srcs/docker-compose.yml down > /dev/null 2> /dev/null
	echo "\033[1A\r\033[K\r\033[K\033[31m[Compose] \033[0mStopped"

clean: stop
	echo "\r\033[K\033[31m[Volume] \033[0mRemoving"
	sudo docker-compose -f srcs/docker-compose.yml down --volumes --rmi all > /dev/null 2> /dev/null
	echo "\033[1A\r\033[K\r\033[K\033[31m[Volume] \033[0mRemoved"

prune: clean
	echo "\r\033[K\033[31m[Compose] \033[0mPruning"
	sudo docker system prune -f > /dev/null 2> /dev/null
	echo "\033[1A\r\033[K\r\033[K\033[31m[Compose] \033[0mPruned"

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