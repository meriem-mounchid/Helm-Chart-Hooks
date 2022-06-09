# Helm-Chart-Hooks
### What is Helm?
Helm is the package manager for Kubernetes. It is an open-source project started with the goal of providing a more efficient way to manage Kubernetes YAML files created when deploying an application.
### Helm is composed of three main concepts
```
Chart: Contains Information required to create an application instance in Kubernetes
Config: Contains the configuration information that can be merged with a chart to create a releasable object.
Release: A running instance of a chart, combined with a specific config.
```
### How to Install Helm on MacOS
`brew install helm`

Try: `helm version`

Result:
<img width="937" alt="Screen Shot 2022-06-09 at 11 47 15 AM" src="https://user-images.githubusercontent.com/43518207/172829703-6e0e1e3b-755c-46fd-8e6f-0f80643ea606.png">

Command: `helm repo add stable https://charts.helm.sh/stable`

<img width="428" alt="Screen Shot 2022-06-09 at 11 49 48 AM" src="https://user-images.githubusercontent.com/43518207/172830140-cbe7bc60-9724-4c75-a647-d8f5ddcbccd2.png">

Command: `helm create hello-world`

<img width="403" alt="Screen Shot 2022-06-09 at 11 50 51 AM" src="https://user-images.githubusercontent.com/43518207/172830510-33deec63-3381-447d-8882-79161b8ca483.png">

Command: `helm install -f hello-world/values.yaml -n dev hello-world ./hello-world`

<img width="1252" alt="Screen Shot 2022-06-09 at 11 58 08 AM" src="https://user-images.githubusercontent.com/43518207/172831810-70c2f628-9713-4514-b78d-60e21090cd0c.png">

```
export POD_NAME=$(kubectl get pods --namespace dev -l "app.kubernetes.io/name=hello-world,app.kubernetes.io/instance=hello-world" -o jsonpath="{.items[0].metadata.name}")
export CONTAINER_PORT=$(kubectl get pod --namespace dev $POD_NAME -o jsonpath="{.spec.containers[0].ports[0].containerPort}")
```
Command: `kubectl --namespace dev port-forward $POD_NAME 8080:$CONTAINER_PORT`

<img width="602" alt="Screen Shot 2022-06-09 at 12 04 05 PM" src="https://user-images.githubusercontent.com/43518207/172832553-756c84bf-3009-4ce6-be3e-a2bf0a940090.png">

Try: localhost:8080
Result:
<img width="648" alt="Screen Shot 2022-06-09 at 12 06 23 PM" src="https://user-images.githubusercontent.com/43518207/172832995-e283d53b-4024-475c-ab30-285b74ed76cc.png">
