bowdata.test.flask
===================




Introduction
--------------------------


Setting up for development
--------------------------

Create a virtual environment using ``tox -e develop`` (requires `tox <https://tox.readthedocs.io/en/latest/>`_ to be
installed). This will install the package using the ``develop`` option into a virtual
environment at ``.venv`` in the repository directory.





DevOps Pipeline
---------------

There is a devops pipeline (``azure-pipelines.yml``) which provides CD/CI via Azure DevOps based on the `Github Flow`
protocol. The pipeline includes a test stage: tests are discovered in the ``tests`` folder by ``pytest``.







------------

Repo created from bowdata.toolkits.repos (version 0.0.1a9)

