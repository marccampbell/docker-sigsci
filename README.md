# SignalSciences Agent Dockerfile

This repo contains the Dockerfile that is used for automated builds.

This Dockerfile was created using instructions at https://docs.signalsciences.net/install-guides/ubuntu/agent/

To run:

```
docker run \
    -e SIGSCI_ACCESSKEYID=<...> \
    -e SIGSCI_SECRETACCESSKEY=<...> \
    -e SIGSCI_HOSTNAME=<...> \
    -e SIGSCI_RPC_ADDRESS=unix:/var/run/sigsci/sigsci.sock \
    -v /var/run/sigsci:/var/run/sigsci \
    marc/sigsci-agent
```

## Module Initialization
When running with the recommended config, a new file `/var/run/sigsci/sigsci.sock` will be present on the host machine. Use this path when initializing any of the SignalSciences modules, or mount it into your other containers. Note that you should mount the directory, not the file to ensure the socket file continues to be preesent after restarts.

### Other Configuration Items
All configuration items on https://docs.signalsciences.net/install-guides/agent-config/ should be supported. Remember to capitalize them, replace `-` with `_` and add a `SIGSCI` prefix.

### Using agent.conf
Alternatively, if you'd prefer to use an agent.conf file to manage config, can you create that and mount it into the container:

```
docker run -v `path-to-agent.conf`/etc/sigsci/agent.conf marc/sigsci-agent
```

