{%- from "jupyter/map.jinja" import server with context %}
{%- if server.enabled %}

jupyter_packages:
  pkg.installed:
  - names: {{ server.pkgs }}

jupyter_user:
  user.present:
  - name: jupyter
  - home: /srv/jupyter

/srv/jupyter:
  virtualenv.manage:
  - require:
    - pkg: jupyter_packages

jupyter_conf_dir:
  file.directory:
  - names:
    - /srv/jupyter/.jupyter
    - /var/log/jupyter
  - mode: 700
  - user: jupyter
  - makedirs: true
  - user: jupyter
  - require:
    - virtualenv: /srv/jupyter
    - user: jupyter_user

jupyter_config:
  file.managed:
  - name: /srv/jupyter/.jupyter/jupyter_notebook_config.py
  - source: salt://jupyter/files/jupyter_notebook_config.py
  - template: jinja
  - user: jupyter
  - mode: 600
  - require:
    - file: jupyter_conf_dir

jupyter_service_config:
  file.managed:
  - name: /usr/lib/systemd/system/jupyter.service
  - source: salt://jupyter/files/jupyter.service
  - template: jinja
  - makedirs: true
  - require:
    - file: jupyter_conf_dir

jupyter_notebook_source:
  git.latest:
  - name: {{ server.notebook_source.address }}
  - target: /srv/jupyter/notebook
  - branch: {{ server.notebook_source.get('branch', server.notebook_source.get('revision', 'master')) }}
  - require:
    - virtualenv: /srv/jupyter

{%- if server.notebook_source.get('requirements', False) %}

jupyter_install_requirements:
  pip.installed:
  - requirements: /srv/jupyter/notebook/.requirements.txt
  - bin_env: /srv/jupyter
  - require:
    - git: jupyter_notebook_source
    - virtualenv: /srv/jupyter

{%- endif %}

{%- if not grains.get('noservices', False) %}

jupyter_service:
  service.running:
  - enable: true
  - name: {{ server.service }}
  - watch:
    - file: jupyter_config
    - git: jupyter_notebook_source

{%- endif %}

{%- endif %}
