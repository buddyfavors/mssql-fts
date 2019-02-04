docker stop $(docker ps -a -q);
docker container prune -f;
docker rmi $(docker images -f "dangling=true" -q);
#docker rmi $(docker images -q);