{%- if pillar.jupyter is defined %}
include:
{%- if pillar.jupyter.server is defined %}
- jupyter.server
{%- endif %}
{%- endif %}
