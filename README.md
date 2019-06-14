# Uber Cold_Fusion

The instructions provided below specify the steps build following:

* Dockerfile
* Pushing an image to dockerhub
* Using the docker imager.
* Steps to run Docker compose
* Deployment on kubernetes

## Step 1: Fetch the Source

#### 1.1) Clone this repo
  ```sh
    export CURDIR=$PWD
    git clone https://github.com/prankkelkar/uber-cold-fusion.git
    cd uber-cold-fusion
  ```

#### 1.2) Dockerfile 
  * Building dockerfile
  ```sh
    #docker built -t <image-name> .
    docker build -t uber-image .
  ```
#### 1.3) Docker image
* Creating a container using above image
  ```sh
    #docker run -it -p <hostport to expose>:7000 -v <path-till-config-directory> image-name
    #Use -d flag instead of -it to start in daemon mode
    docker run -it -p 7001:7000 -v $CURDIR/config:/uber uber-image
  ```

#### 1.4) Dockerhub
* Pushing images to dockerhub
  ```sh
    #log in to your dokcerhub account
     docker login
     docker tag <local_img_name> <docker_id/imagename:tag>
     docker push <docker_id/imagename:tag>
   ```
  _**Note:**_ Substitute  `<local_img_name>` and `<docker_id/imagename:tag>` acoordingly
   
* Verify if push was successfull
  ```sh
  dokcer pull <docker_id/imagename:tag>
  ```


#### 1.5) Docker-Compose

*  Staring docker compose

    ```sh
     cd $CURDIR
     docker-compose up
    ```
    _**Note:**_ Incase UI is not visible exec into running container and run `curl http://127.0.0.1:7000/`
   ```
* Stop docker-compose  

    ```sh
     docker-compose down
    ```
 #### 1.6) Kubernetes
    ```sh
      cd $CURDIR/kubernetes
      kubectl apply -f secrets.yaml
      kubectl apply -f deployment.yaml
     ```
     
_**Note:** After ensuring pods have started, direct your Web browser to the Uber-app at `http://<HOST_IP>:<PORT>`._

## References
https://github.com/uber/Python-Sample-Application
