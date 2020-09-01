FROM ubuntu

LABEL maintainer="febryandana.fd@gmail.com"

ENV TZ=Asia/Jakarta
ENV HOME=/home/user/

WORKDIR ${HOME}

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get upgrade -qqy
RUN apt-get install -qqy python3 python3-pip nginx supervisor

COPY ./app /home/user/app/
COPY nginx_app.conf /etc/nginx/sites-available/default
COPY supervisor_app.conf /etc/supervisor/conf.d/

RUN pip3 install uwsgi flask

RUN chmod 777 -R /home/user/
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN rm /etc/nginx/sites-enabled/default
RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

EXPOSE 80

CMD ["supervisord"]
