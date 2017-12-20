FROM jupyter/scipy-notebook:c7fb6660d096

MAINTAINER Saagie

# Add python 2 kernel
RUN conda create -n ipykernel_py2 python=2 ipykernel --yes
RUN /bin/bash -c "source activate ipykernel_py2"
RUN python -m ipykernel install --user

USER root

# Install pip2
RUN cd /tmp && wget https://bootstrap.pypa.io/get-pip.py && \
    python2 get-pip.py

# Install libraries dependencies
RUN apt-get update && apt-get install -y --no-install-recommends python-numpy \
    python3-numpy libpng3 libfreetype6-dev libatlas-base-dev gfortran \
    libgdal1-dev libjpeg-dev sasl2-bin libsasl2-2 libsasl2-dev \
    libsasl2-modules unixodbc-dev python3-tk && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install python2 libraries
RUN pip2 --no-cache-dir install ipywidgets==7.0.5 \
    pandas==0.21.1 \
    matplotlib==2.1.1 \
    scipy==1.0.0 \
    scikit-learn==0.19.1 \
    scikit-image==0.13.1 \
    pyodbc==4.0.21 \
    impyla==0.14.0 \
    bokeh==0.12.13 \
    pybrain==0.3 \
    networkx==2.0 \
    seaborn \
    statsmodels && \
    rm -rf /root/.cachex

USER $NB_USER

# Add libraries and upgrade libraries installed in base image for python 3
RUN conda install --quiet --yes \
    'pandas=0.21.1' \
    'matplotlib=2.1.1' \
    'impyla=0.14.0' \
    'networkx=2.0' \
    'pyodbc=4.0.21' \
    'scipy=1.0.0' \
    'scikit-learn=0.19.1' \
    'scikit-image=0.13.1' && \
    conda remove --quiet --yes --force qt pyqt && \
    conda clean -tipsy && \
    npm cache clean && \
    rm -rf $CONDA_DIR/share/jupyter/lab/staging && \
    fix-permissions $CONDA_DIR

# Default: run without authentication
CMD ["start-notebook.sh", "--NotebookApp.token=''"]
