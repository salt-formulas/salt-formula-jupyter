
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
          requirements: true

Read more
=========

* http://jupyter.org/
* http://jupyter-notebook.readthedocs.org/en/latest/config.html

Documentation and Bugs
======================

To learn how to install and update salt-formulas, consult the documentation
available online at:

    http://salt-formulas.readthedocs.io/

In the unfortunate event that bugs are discovered, they should be reported to
the appropriate issue tracker. Use Github issue tracker for specific salt
formula:

    https://github.com/salt-formulas/salt-formula-jupyter/issues

For feature requests, bug reports or blueprints affecting entire ecosystem,
use Launchpad salt-formulas project:

    https://launchpad.net/salt-formulas

You can also join salt-formulas-users team and subscribe to mailing list:

    https://launchpad.net/~salt-formulas-users

Developers wishing to work on the salt-formulas projects should always base
their work on master branch and submit pull request against specific formula.

    https://github.com/salt-formulas/salt-formula-jupyter

Any questions or feedback is always welcome so feel free to join our IRC
channel:

    #salt-formulas @ irc.freenode.net
