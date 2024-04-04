# nutrition-irrigation-model-1.2.0
#doirfjo4fj
FROM python:3.7-slim

ARG REQUIREMENT_FILE
ARG PROJECT_NAME
ARG MODULE_NAME

RUN mkdir /src
# Copy REQUIREMENT_FILE in src folder
COPY ${REQUIREMENT_FILE}  /src/

RUN apt-get update \
&& apt-get install gcc -y \
&& apt-get clean

RUN pip install --upgrade pip
RUN pip install -r /src/${REQUIREMENT_FILE}

# Set PYTHONPATH
ENV PYTHONPATH="/src/${PROJECT_NAME}/${MODULE_NAME}/:/src/${PROJECT_NAME}/:$PATH"
ENV TZ="Europe/Rome"
#apt-get install wget && \
#apt-get install unzip && \
#apt install g++
#apt-get install -y 

# GDAL
# RUN sudo apt-get install -y gdal-bin # Nope -- gets us 2.1
#RUN apt-get install -y libproj-dev proj-data proj-bin
#RUN apt-get install libgeos-dev -y
#RUN wget http://download.osgeo.org/gdal/2.4.1/gdal241.zip
#RUN unzip gdal241.zip
#RUN chmod o+x gdal-2.4.1
#RUN cd gdal-2.4.1 && ./configure --with-pg --with-geos --with-spatialite --with-libkml --with-proj && make -j4 && make install

#apt install -y software-properties-common
#RUN apt-get install libeccodes-tools


#RUN add-apt-repository ppa:debiangis/ppa && \
#apt-get update && \
#apt-get install -y gdal-bin && \
#apt-get install -y python-gdal

# Set PYTHONPATH
#ENV PYTHONPATH="/src/${PROJECT_NAME}/${MODULE_NAME}/:/src/${PROJECT_NAME}/:$PATH"
#ENV TZ="Europe/Rome"
