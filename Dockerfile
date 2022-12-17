FROM golang:alpine3.17

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"

RUN cd /go && go install filippo.io/mkcert@latest
RUN ls -lha
# RUN cd filippo.io/mkcert && \
#     go build -o /bin/mkcert

WORKDIR /root/.local/share/mkcert



CMD mkcert -install && for i in $(echo $domain | sed "s/,/ /g"); do mkcert $i; done