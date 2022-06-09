helm repo add stable https://charts.helm.sh/stable
helm create hello-world
kubectl create namespace dev 
helm install -f hello-world/values.yaml -n dev hello-world ./hello-world

export POD_NAME=$(kubectl get pods --namespace dev -l "app.kubernetes.io/name=hello-world,app.kubernetes.io/instance=hello-world" -o jsonpath="{.items[0].metadata.name}")
export CONTAINER_PORT=$(kubectl get pod --namespace dev $POD_NAME -o jsonpath="{.spec.containers[0].ports[0].containerPort}")

kubectl --namespace dev port-forward $POD_NAME 8080:$CONTAINER_PORT
