# RC vs RS in Kubernetes
Both **RC** and **RS** are used to ensure that a specified number of pod replicas are running at all times in a Kubernetes cluster.

---

## 🧾 Key Differences

| Feature                  | ReplicationController (RC)        | ReplicaSet (RS)                  |
|--------------------------|-----------------------------------|----------------------------------|
| Purpose                  | Manages pod replicas              | Manages pod replicas             |
| Selector Type            | **Equality-based only**           | **Equality + Set-based**         |
| Label Matching           | Exact match (`app = nginx`)       | Set-based match (`app in (...)`) |
| Rolling Updates Support  | ❌ Not supported                   | ❌ Not directly (via Deployment)  |
| Usage Frequency          | Rare, legacy systems              | Common (via Deployments)         |
| YAML Complexity          | Simple                            | Slightly more flexible           |

---

## 🧠 What are Selectors?

- **Equality-based Selector:** Matches exact key-value pairs.  
  Example: `app = nginx`
  
- **Set-based Selector:** Matches using set operations.  
  Example: `app in (nginx, apache)`

> ⚠️ RC supports only equality-based selectors, while RS supports both.

---


# Replication Controller

```yaml
apiVersion: v1
kind: ReplicationController
metadata:
  name: rc-green

spec:
 replicas: 2
 selector:
  app: green
  
 template:
  metadata:
   name: temp-1
   labels:
    app: green
  spec:
   containers:
    - name: green-container
      image: abhipraydh96/green:latest
      ports:
        - containerPort: 80
```
## apply manifest file to create rc
````
kubectl apply -f rc.yaml
````
## to check rc created or not
````
kubectl get rc
````
## to list pods
````
kubectl get pods
````

## ReplicaSet

```yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: rs-green

spec:
 replicas: 4
 selector:
  matchLabels:
   app: green
 template:
  metadata:
   name: temp-1
   labels:
    app: green
  spec:
   containers:
    - name: green-container
      image: abhipraydh96/green:latest
      ports:
        - containerPort: 80
```

## apply manifest file to create rs
````
kubectl apply -f rs.yaml
````
## to check rs created or not
````
kubectl get rs
````
## to list pods
````
kubectl get pods
````

# Deployment
- A Deployment in Kubernetes is a controller that provides declarative updates for Pods and ReplicaSets. 
- It ensures that the desired number of pod replicas are running and manages updates to the application through rolling updates, 
- allowing changes without downtime. 
- It also supports rollback to previous stable versions in case of failure.
  
- **Rolling Updates:** Gradually replaces old Pods with new ones to ensure zero downtime.
- **Rollbacks:** Reverts to a previous version if the new deployment causes issues.

- **Version History:** Tracks changes across deployments for easy management.

- **Self-healing:** Replaces failed or terminated pods automatically.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mydeployment

spec:
 replicas: 4
 selector:
  matchLabels:
   app: green
 template:
  metadata:
   name: temp-1
   labels:
    app: green
  spec:
   containers:
    - name: mycont
      image: nginx
      ports:
        - containerPort: 80
```


## apply manifest file to create deployment
````
kubectl apply -f deploy.yaml
````
## to check deployment created or not
````
kubectl get deploy -o wide
````
## to list pods
````
kubectl get pods
````

## rolling update
````
kubectl set image deployment/mydeployment  mycont=nginx:1.14.1 --record
````

## check history
````
kubectl rollout history deployment/mydeployment
````
## roll bacck

````
kubectl rollout undo deployment/mydeployment
````
