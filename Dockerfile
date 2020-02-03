# Update with your base image of choice
FROM jupyter/datascience-notebook:latest

LABEL maintainer="Matthias K. Scharrer (@zupzup)"

USER $NB_USER

RUN pip install jupyter_contrib_nbextensions nptdms ipympl tqdm && \
    jupyter contrib nbextension install --user && \
    # can modify or enable additional extensions here
    jupyter labextension install @jupyter-widgets/jupyterlab-manager && \
    jupyter labextension install jupyter-matplotlib && \
    jupyter labextension install @lckr/jupyterlab_variableinspector && \
    jupyter nbextension enable spellchecker/main --user

EXPOSE 8888 4040 8080 8081 7077
