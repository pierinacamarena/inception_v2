all: rambo
	echo "\r\033[K\033[32m[Compose] \033[0mLaunching"
	sudo docker-compose -f srcs/docker-compose.yml up --build -d > /dev/null 2> /dev/null
	echo "\033[1A\r\033[K\r\033[K\033[32m[Compose] \033[0mLaunched"

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

re: prune all

rambo:
	echo '   ∧＿∧  '
	echo '  ( ･ω･) '
	echo '――∪――――∪―――'
	echo ' Inception '
	echo '___________'
	echo '  |    | '
	echo '  |    | '
	echo '   U  U  '

.PHONY: all stop clean prune re rambo
.SILENT: all stop clean prune re rambo