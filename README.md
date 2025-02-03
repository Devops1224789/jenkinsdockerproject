# jenkinsdockerproject
This is a docker project
step1 : copy Docker file into the ansible server
  > rsync -ivh  /var/lib/jenkins/workspace/jenkinsdockerproject/Dockerfile    root@172.31.15.214:/opt/

step 2: push the images 

cd /opt/

docker build -t $JOB_NAME:v1.$BUILD_ID  .

docker image tag  $JOB_NAME:v1.$BUILD_ID  mydevopsuser46/$JOB_NAME:v1.$BUILD_ID

docker image push mydevopsuser46/$JOB_NAME:v1.$BUILD_ID

docker image tag $JOB_NAME:v1.$BUILD_ID  mydevopsuser46/$JOB_NAME:latest

docker image push mydevopsuser46/$JOB_NAME:latest

docker image rmi $JOB_NAME:v1.$BUILD_ID mydevopsuser46/$JOB_NAME:v1.$BUILD_ID mydevopsuser46/$JOB_NAME:latest


step 3 : run the play book playbook.ynml

---
- name: This will create container in docker-webserver node
  hosts: all
  become: true
  tasks:
    - name: stop old container
      shell: docker container stop mydevopsuser46-jenkinsdockerproject
    - name: delete old container
      shell: docker container rm mydevopsuser46-jenkinsdockerproject
    - name: delete local image first
      shell: docker image rm mydevopsuser46/jenkinsdockerproject:latest
    - name: run docker conatiner run docker run
      shell: docker container run -itd --name mydevopsuser46-jenkinsdockerproject -p 9000:80 mydevopsuser46/jenkinsdockerproject:latest


![image](https://github.com/user-attachments/assets/c005fbf4-8fcf-4c33-89a6-b523fee796c1)


