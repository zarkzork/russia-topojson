FROM base
MAINTAINER Vladimir Terekhov <zarkzork@gmail.com>

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y gdal-bin nodejs npm wget unzip
RUN npm install -g topojson@1.1.6
RUN ln -s /usr/bin/nodejs /usr/bin/node

# /usr/local/lib/node_modules/topojson/bin/topojson

ADD . /rus
RUN /rus/create_json
WORKDIR /rus

EXPOSE 8080
CMD python -m SimpleHTTPServer 8080