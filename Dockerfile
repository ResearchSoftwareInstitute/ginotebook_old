FROM ubuntu

RUN apt-get update
RUN apt-get install -y python2.7-mapnik python2.7-scipy python2.7-numpy python2.7-psycopg2 cython python2.7-pysqlite2
RUN apt-get install -y nodejs npm python-virtualenv
RUN apt-get install -y postgresql-9.3 postgresql-client-common postgresql-common postgresql-client-9.3 redis-tools
RUN apt-get install -y sqlite3 sqlite3-pcre libspatialite-dev libspatialite5 spatialite-bin
RUN apt-get install -y ssh git libfreetype6 libfreetype6-dev libxml2-dev libxslt-dev libprotobuf-dev
RUN apt-get install -y python2.7-gdal gdal-bin libgdal-dev gdal-contrib python-pillow protobuf-compiler libtokyocabinet-dev tokyocabinet-bin libreadline-dev ncurses-dev
RUN apt-get install -y grass grass-doc grass-dev grass-dev-doc libgdal1-1.10.1-grass

ADD . /home/docker/hydroshare

WORKDIR /home/docker/hydroshare

RUN pip install -r requirements.txt
RUN rm -rf /tmp/pip-build-root

WORKDIR /home/docker

RUN npm install carto

EXPOSE 22 80 8000 443

WORKDIR /home/docker/hydroshare

CMD /bin/bash
