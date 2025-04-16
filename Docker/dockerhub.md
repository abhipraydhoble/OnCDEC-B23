
## 🐳 Login to DockerHub

```bash
docker login
# Username: 
# Password:
```

---

## 2️⃣ Pull Ubuntu Image

```bash
docker pull ubuntu
```

---

## 3️⃣ Tag the Image

```bash
docker tag ubuntu abhipraydh96/ubuntu:v1
```

---

## 4️⃣ Push Image to DockerHub

```bash
docker push abhipraydh96/ubuntu:v1
```

---

## 5️⃣ Create and Run a Container

```bash
docker run -it --name myubuntu abhipraydh96/ubuntu:v1
# Inside the container, type exit to come out
```

---

## 6️⃣ Save the Image to a File

```bash
docker save -o ubuntu_v1.tar abhipraydh96/ubuntu:v1
```

---

## 7️⃣ Load the Image from File

```bash
docker load -i ubuntu_v1.tar
```

---

## 8️⃣ Stop the Container

```bash
docker stop myubuntu
```

---

## 9️⃣ Remove the Container

```bash
docker rm myubuntu
```

---

## 🔟 Remove the Image

```bash
docker rmi abhipraydh96/ubuntu:v1
```

---

## 🔄 Clean Up Unused Images

```bash
docker image prune -a
```

---

