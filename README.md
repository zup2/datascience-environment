## My Data Science Environment

Built from base image provided by [Jupyter Docker Stacks](http://jupyter-docker-stacks.readthedocs.io)

This image contains the following kernels accessible from Jupyter :
  1. Base Python Jupyter Notebook Environment
  2. Python 3.6
  3. R
  4. Julia

AND jupyterlab extensions!
  1. matplotlib
  2. variable inspector

Please visit the following documentation sites for help using and contributing to this image and others created by contributors to Jupyter Docker Stacks.

* [Jupyter Docker Stacks on ReadTheDocs](http://jupyter-docker-stacks.readthedocs.io/en/latest/index.html)
* [Selecting an Image :: Core Stacks :: jupyter/all-spark-notebook](http://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#jupyter-all-spark-notebook)
* [Image Specifics :: Apache Spark](http://jupyter-docker-stacks.readthedocs.io/en/latest/using/specifics.html#apache-spark)

Note to self: Build with `docker build --pull -t zupzup/datascience:latest .`