FROM nginx:alpine
LABEL maintainer="Marvin Korir <devopsmarv@gmail.com>"

COPY website /website
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
