# docker-tinyproxy

containerized [tinyproxy](https://tinyproxy.github.io/)

## example usage

If you need to provide HTTP/HTTPS traffic for a remote firewalled machine, passing through your notebook:
```
docker run --rm --name tinyproxy --detach --publish 3128:3128 codewaysa/tinyproxy
ssh -R 3128:127.0.0.1:3128 <remote_system>
# on the remote system:
export http_proxy=http://127.0.0.1:3128 https_proxy=http://127.0.0.1:3128
```
