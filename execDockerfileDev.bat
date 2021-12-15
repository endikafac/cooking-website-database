docker rmi $(docker images -qa)
docker rm -f $(docker ps -qa)
docker volume prune
docker system prune -a
docker build --rm -f "Dockerfile.dev" -t cookingwebsitedatabasemysql:latest "."
docker scan cookingwebsitedatabasemysql:latest
docker run --rm -it -p 33060:33060/tcp -p 3306:3306/tcp --security-opt seccomp=unconfined cookingwebsitedatabasemysql:latest