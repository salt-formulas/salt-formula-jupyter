{%- from "jupyter/map.jinja" import server with context %}

c.NotebookApp.ip = '{{ server.bind.address }}'
c.NotebookApp.port = {{ server.bind.port }}
c.NotebookApp.notebook_dir = u'/srv/jupyter/notebook'
