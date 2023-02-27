# docker-tinyproxy

containerized [tinyproxy](https://tinyproxy.github.io/)

## example usage

### internet access through reverse SSH port forward

If you need to provide HTTP/HTTPS traffic for a remote firewalled machine, passing through your notebook:

```shell
docker run --rm --name tinyproxy --detach \
  --publish 127.0.0.1:3128:3128 \
  codewaysa/tinyproxy
ssh -R 3128:127.0.0.1:3128 <remote_system>
# on the remote system:
export http_proxy=http://127.0.0.1:3128 https_proxy=http://127.0.0.1:3128
```

### manually running a dockerized proxy server

If you want to run a proxy on a server on your networking:

```shell
docker run --restart always --detach --name tinyproxy \
  --publish <YOUR_LAN_IPADDRESS>:3128:3128 \
  codewaysa/tinyproxy
```

### running a dockerized proxy server, using Puppet and the [`puppetlabs/docker` module](https://forge.puppetlabs.com/modules/puppetlabs/docker)

```puppet
docker::run { 'tinyproxy':
  image            => 'codewaysa/tinyproxy',
  expose           => [$facts['ipaddress'], '3128', '3128'],
  restart          => 'always',
  restart_service  => true
}
```
