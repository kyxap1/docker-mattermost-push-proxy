FROM golang:1.11

RUN go get -u -v github.com/mattermost/mattermost-push-proxy && \
  rm -rf /go/src

FROM mattermost/mattermost-push-proxy:5.9.0
COPY --from=0 /go/bin/mattermost-push-proxy /mattermost-push-proxy/bin/mattermost-push-proxy
COPY entrypoint.sh /
