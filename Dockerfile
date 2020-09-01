# Using latest Ubuntu image
FROM ubuntu

# Image description
LABEL maintainer="febryandana.fd@gmail.com"
LABEL release-date="2020-09-01"

# Adding Environment Variabels
ENV TZ=Asia/Jakarta
ENV HOME=/home/user/

# Default work location
WORKDIR ${HOME}

# Running command to set Timezone, update, upgrade, and install service & dependencies
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get upgrade -qqy
RUN apt-get install -qqy python3 python3-pip nginx supervisor

# Copy the needed files from dockerfile directory to docker image
COPY ./app /home/user/app/
COPY nginx_app.conf /etc/nginx/sites-available/default
COPY supervisor_app.conf /etc/supervisor/conf.d/

# Running command to install uwsgi & flask modules
RUN pip3 install uwsgi flask

# Configure Nginx
RUN chmod 777 -R /home/user/
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN rm /etc/nginx/sites-enabled/default
RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

# Exposing port 80 for Nginx
EXPOSE 80

# Default command to run
CMD ["supervisord"]
