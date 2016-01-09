
==================================
Jupyter notebook server
==================================

Open source, interactive data science and scientific computing across over 40 programming languages.

Sample pillars
==============

Single jupyter server

.. code-block:: yaml

    jupyter:
      server:
        enabled: true
        bind:
          address: 0.0.0.0
          port: 8888
        notebook_source:
          engine: git
          address: gitrepo
          revision: master

Read more
=========

* http://jupyter.org/
* http://jupyter-notebook.readthedocs.org/en/latest/config.html
