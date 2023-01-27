docker network create eval1
docker run --network=eval -e PORT=8080 -e PLANNER=http://planner:3000/ --name worker   -d eval1/worker 
docker run --network=eval -e PORT=8090 -e PLANNER=http://planner:3000/ --name worker1 -d eval1/worker1 
docker run --network=eval -e PORT=8095 -e PLANNER=http://planner:3000/ --name worker2 -d eval1/worker2
docker run --network=eval -e PORT=3000 -e TASK=4  --name planner -d eval1/planner