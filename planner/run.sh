docker network create eval1
docker run --network=eval1 -e PORT=8080 -e PLANNER=http://planner:3000/ --name worker   -d worker 
docker run --network=eval1 -e PORT=8090 -e PLANNER=http://planner:3000/ --name worker1 -d worker
docker run --network=eval1 -e PORT=8095 -e PLANNER=http://planner:3000/ --name worker2 -d worker
docker run --network=eval1 -e PORT=3000 -e TASK=4  --name cplanner -d planner