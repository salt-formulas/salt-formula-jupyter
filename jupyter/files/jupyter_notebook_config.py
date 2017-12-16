{%- from "jupyter/map.jinja" import server with context %}

c.NotebookApp.ip = '{{ server.bind.address }}'
c.NotebookApp.port = {{ server.bind.port }}
c.NotebookApp.notebook_dir = u'/srv/jupyter/notebook'
{%- if server.auth is defined %}
c.NotebookApp.password = '{{ server.auth.password }}'
{%- endif %}
{%- if server.ssl is defined %}
c.NotebookApp.certfile = u'/srv/jupyter/cert.pem'
c.NotebookApp.keyfile = u'/srv/jupyter/cert.key'
{%- endif %}
