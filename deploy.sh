docker build -t thexyman/multi-client -f ./client/Dockerfile ./client
docker build -t thexyman/multi-server -f ./server/Dockerfile ./server
docker build -t thexyman/multi-worker -f ./worker/Dockerfile ./worker
docker push thexyman/multi-client
docker push thexyman/multi-server
docker push thexyman/multi-worker
kubectl apply -f k8s
kubectl rollout restart deployment/client-deployment
kubectl rollout restart deployment/server-deployment
kubectl rollout restart deployment/worker-deployment