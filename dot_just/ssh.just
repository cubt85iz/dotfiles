# Binds a local port to remote port using host as a proxy
fwd-to-ssh local-port remote-addr remote-port host:
  @ssh -L {{ local-port }}:{{ remote-addr }}:{{ remote-port }} {{ host }}

