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