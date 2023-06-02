FROM nginx:latest
MAINTAINER Aman Singh
COPY ./index.html /usr/share/nginx/html/index.html
EXPOSE "80"
RUN "Welcome to the Devops Classes "

