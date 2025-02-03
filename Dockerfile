FROM ubuntu
LABEL name="tomdev"
LABEL email="tomdev@gmail"
RUN apt-get update -y && apt-get -y install apache2 unzip tree
WORKDIR /var/www/html
RUN rm -rf index.html
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/little-fashion.zip . 
RUN unzip little-fashion.zip
RUN cp -rvf 2127_little_fashion/* . 
RUN rm -rf 2127_little_fashion 
EXPOSE 80 
CMD apache2ctl -D FOREGROUND


