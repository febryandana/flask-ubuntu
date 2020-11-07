# flask-ubuntu
Deploy Flask Web App using uWSGI and Nginx on Docker

## How to Use
- Install [Docker](https://www.docker.com/)
- Clone this repo
  ``` $ git clone https://github.com/febryandana/flask-ubuntu.git ```
  
- Build dockerfile
  ```$ docker build --tag IMAGE_NAME .```
  
- You can also pulling the image from [Docker Hub](https://hub.docker.com/r/m1nerva/flask-ubuntu)
  ```$ docker pull m1nerva/flask-ubuntu:latest```
  
- Run/create container from that image, e.g.
  ``` $ docker run -d -p 80:80 container_name m1nerva/flask-ubuntu ```


Nginx run on port 80/tcp

This is a very basic flask web app that just displaying text to browser

![Image screenshot](/img1.png)


#### Author
Moch. Febryandana Nurfahri (febryandana.fd@gmail.com)
