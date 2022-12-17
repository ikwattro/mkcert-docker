# mkcert-docker

Create local self-signed certificates without having to install anything locally.

## Usage

Create a directory for hosting the certificates

```bash
mkdir certificates && cd certificates
```

Assuming you want to create a certificate for `develop.localhost.com`

Run the container

```bash
docker run --rm -d -e domain=develop.localhost.com --name mkcert -v $PWD:/root/.local/share/mkcert ikwattro/mkcert-docker
```

Install the certificate to your OS trustore ( OS X )

```bash
sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain $PWD/rootCA.pem
```
