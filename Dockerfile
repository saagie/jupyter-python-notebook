FROM jupyter/notebook

MAINTAINER Saagie

# Installing libraries dependencies
RUN apt-get update && apt-get install -y --no-install-recommends python-numpy python3-numpy libpng3 libfreetype6-dev libatlas-base-dev gfortran libgdal1-dev libjpeg-dev sasl2-bin libsasl2-2 libsasl2-dev libsasl2-modules unixodbc-dev && apt-get clean && rm -rf /var/lib/apt/lists/* 

# Install python3 libraries
RUN pip3 --no-cache-dir install ipywidgets \
								pandas \
								matplotlib \
								scipy \
								scikit-learn \
								pyodbc \
								impyla \
								hdfs \
								hdfs[avro,dataframe,kerberos] \
								scikit-image \
								bokeh \
								keras \
								pybrain \
								statsmodels \
								mpld3 \
								networkx \
								fiona \
								folium \
								shapely \
								thrift_sasl \
								sasl \
								SQLAlchemy \
								ibis-framework \
								pymongo \
								&& rm -rf /root/.cache

# Install python2 libraries
RUN pip2 --no-cache-dir install ipywidgets \
								pandas \
								matplotlib \
								scipy \
								scikit-learn \
								pyodbc \
								impyla \
								bokeh \
								scikit-image \
								pybrain \
								networkx \
								&& rm -rf /root/.cachex


# Run the notebook
CMD jupyter notebook \
    --ip=* \
    --MappingKernelManager.time_to_dead=10 \
    --MappingKernelManager.first_beat=3 \
    --notebook-dir=/notebooks-dir/

