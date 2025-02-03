FROM ubuntu
LABEL name="tomdev"
LABEL email="tomdev@gmail"
RUN apt-get update -y && apt-get -y install apache2 unzip tree
WORKDIR /var/www/html
RUN rm -rf index.html
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/spering.zip . 
RUN unzip spering.zip
RUN cp -rvf spering-html/* . 
RUN rm -rf spering-html 
EXPOSE 80 
CMD apache2ctl -D FOREGROUND


