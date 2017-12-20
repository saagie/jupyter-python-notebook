# Jupyter Datascience Notebook for python

## Run with :
	docker run -p 8888:8888 -v /path/to/data/notebooks/dir:/home/jovyan saagie/jupyter-notebook:latest

## Libraries :
	* Data Processing
		* numpy
    	* scipy
		* pandas

	* Machine Learning
    	* sklearn
		* keras
    	* pybrain (python 2 only)
    	* statsmodel
		* networkx

	* Data Visualisation
		* skimage
		* matplotlib
    	* bokeh
    	* mpld3
    	* folium

	* Database connection
		* pyodbc
    	* hdfs **
		* impyla
		* ibis-framework
		* SQLAlchemy
		* pymongo

	* Utils
    	* ipywidgets
		* fiona
 		* shapely

## Install libraries with :
### For python 3
	!pip install libraryName

### For python 2
	!pip2 install libraryName
