FROM nginx:latest
MAINTAINER Aman Singh
WORKDIR /root/aman
COPY . /usr/share/nginx/html/index.html
EXPOSE "80"
RUN "Welcome to the Devops Classes "

