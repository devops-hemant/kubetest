FROM nginx

RUN apt update

COPY ./html/ /usr/share/nginx/html/
