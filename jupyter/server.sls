{%- from "jupyter/map.jinja" import server with context %}
{%- if server.enabled %}

jupyter_packages:
  pkg.installed:
  - names: {{ server.pkgs }}

jupyter:
  user.present:
  - name: jupyter
  - shell: /bin/bash
  - home: /srv/jupyter

/srv/jupyter:
  virtualenv.manage:
  - requirements: salt://jupyter/files/requirements.txt
  - require:
    - pkg: jupyter_packages
    - user: jupyter

jupyter_conf_dir:
  file.directory:
  - names:
    - /srv/jupyter/.jupyter
    - /var/log/jupyter
  - mode: 700
  - makedirs: true
  - user: jupyter
  - require:
    - virtualenv: /srv/jupyter

jupyter_config:
  file.managed:
  - name: /srv/jupyter/.jupyter/jupyter_notebook_config.py
  - source: salt://jupyter/files/jupyter_notebook_config.py
  - template: jinja
  - user: jupyter
  - mode: 600
  - require:
    - file: jupyter_conf_dir

jupyter_notebook_source:
  git.latest:
  - name: {{ server.notebook_source.address }}
  - target: /srv/jupyter/notebook
  - rev: {{ server.notebook_source.get('rev', server.notebook_source.get('revision', 'master')) }}
  - require:
    - virtualenv: /srv/jupyter

{%- endif %}