#creer un network
#creer et démarrer les contenaires 
docker network create eval1
docker run --network=eval1 -e PORT=8080 -e PLANNER=http://planner:3000/ --name worker   -d worker 
docker run --network=eval1 -e PORT=8090 -e PLANNER=http://planner:3000/ --name worker1 -d worker
docker run --network=eval1 -e PORT=8095 -e PLANNER=http://planner:3000/ --name worker2 -d worker
docker run --network=eval1 -e PORT=3000 -e TASK=4  --name cplanner -d planner

#Suppression des container
docker rm worker -f
docker rm worker1 -f
docker rm worker2 -f

#ajout des variables d'environement pour ex3 

docker network create dockerwork  
docker run --network=dockerwork -e PORT=8080 -e PLANNER=http://planner:3000/ -e ADDRESS=http://worker/ --name worker  -e MULT=true -e ADD=false -d worker  
docker run --network=dockerwork -e PORT=8080 -e PLANNER=http://planner:3000/ -e ADDRESS=http://worker1/ --name worker2  -e MULT=true -e ADD=false -d worker 
docker run --network=dockerwork -e PORT=8080 -e PLANNER=http://planner:3000/ -e ADDRESS=http://worker2/ --name worker1  -e MULT=false -e ADD=true -d worker

docker run --network=dockerwork -e PORT=3000 -e TASK=4  --name planner -d planner
