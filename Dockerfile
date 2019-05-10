FROM jupyter/all-spark-notebook

LABEL maintainer="Matthias K. Scharrer (@zupzup)"

USER root

# pre-requisites

RUN apt-get -qq update && \
    apt-get -qq install -y --no-install-recommends \
    apt-utils \
    software-properties-common \
    fonts-dejavu \
    tzdata \
    gfortran \
    gcc && \
    apt-get clean && \
    add-apt-repository universe && \
    rm -rf /var/lib/apt/lists/*

USER $NB_UID

# Anaconda Python Environments

RUN conda create -n python27 python=2.7 anaconda pip && \
    conda create -n python36 python=3.6 anaconda pip

##################################
#### Add Packages to Base ########
##################################
RUN /bin/bash -c "source activate base && \
    conda install --quiet --yes -c anaconda numpy scipy scikit-learn scikit-image cython pandas tqdm ipykernel ; \
    conda install --quiet --yes -c conda-forge openpyxl hdf5 h5py matplotlib ; \
    conda remove --quiet --yes --force qt pyqt ; \
    conda upgrade --all -y ;\
    pip install ipympl; \
    conda clean --all -y ; \
    python -m ipykernel install --user --name base --display-name 'Python 3(Base)' && \
    jupyter labextension install @jupyter-widgets/jupyterlab-manager@^0.38.1 jupyter-matplotlib@ ; \
    jupyter labextension install jupyterlab_bokeh@0.6.3 ; \
    npm cache clean --force && \
    rm -rf $CONDA_DIR/share/jupyter/lab/staging && \
    rm -rf /home/$NB_USER/.cache/yarn && \
    rm -rf /home/$NB_USER/.node-gyp && \
    fix-permissions $CONDA_DIR /home/$NB_USER && \
    source deactivate && \
##################################
#### Add Packages to Python27#####
##################################
    source activate python27 && \
    conda install --quiet --yes -c anaconda numpy scipy scikit-learn scikit-image cython pandas tqdm ipykernel && \
    conda install --quiet --yes -c conda-forge openpyxl hdf5 h5py matplotlib xlrd; \
    conda remove --quiet --yes --force qt pyqt ; \
    conda upgrade --all -y ;\
    pip install ipympl; \
    conda clean --all -y ; \
    python -m ipykernel install --user --name python27 --display-name 'Python 2.7' && \
    jupyter labextension install @jupyter-widgets/jupyterlab-manager@^0.38.1 jupyter-matplotlib@ && \
    jupyter labextension install jupyterlab_bokeh@0.6.3 && \
    npm cache clean --force && \
    rm -rf $CONDA_DIR/share/jupyter/lab/staging && \
    rm -rf /home/$NB_USER/.cache/yarn && \
    rm -rf /home/$NB_USER/.node-gyp && \
    fix-permissions $CONDA_DIR /home/$NB_USER && \
    source deactivate && \
##################################
####     F I N A L I Z E     #####
##################################
    mv $HOME/.local/share/jupyter/kernels/* $CONDA_DIR/share/jupyter/kernels/ && \
    chmod -R go+rx $CONDA_DIR/share/jupyter && \
    rm -rf $HOME/.local && \
    fix-permissions $CONDA_DIR /home/$NB_USER $CONDA_DIR/share/jupyter"


EXPOSE 8888 4040 8080 8081 7077
