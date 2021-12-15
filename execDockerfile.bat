docker rmi $(docker images -qa)
docker rm -f $(docker ps -qa)
docker volume prune
docker system prune -a
rem #docker-compose -f docker-compose.yml up cookingwebsite_mysql
rem docker-compose -f docker-compose.yml up cookingwebsite_flyway_migrate
rem docker build --rm -f "Dockerfile" -t cookingwebsitedatabasemysql:latest "."

docker build -t cookingwebsite-mysql .
rem #docker run --rm -it -p 33006:33006/tcp -p 33060:33060/tcp -e TIME_ZONE="Europe/Madrid" --security-opt seccomp=unconfined cookingwebsitedatabasemysql:latest
rem docker run --rm -it -p 33006:33006/tcp -p 33061:33061/tcp --security-opt seccomp=unconfined cookingwebsitedatabasemysql:latest 

docker run -d -p 3306:3306 --name cookingwebsite-mysql -e MYSQL_ROOT_PASSWORD=root cookingwebsite-mysql MYSQL_DATABASE=cookingwebsite
rem docker run -d -p 3306:3306 --name cookingwebsite-mysql -v ~/sql/docker-entrypoint-initdb.d/ -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=cookingwebsite mysql
rem docker exec -it cookingwebsite-mysql bash root@c86ff80d7524:/# mysql -uroot -p