{%- from "jupyter/map.jinja" import server with context %}
{%- if server.enabled %}

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
    {% if app.source is defined and app.source.engine == 'git' %}
    - git: jupyter_source_{{ app_name }}
    {% endif %}


{%- endif %}