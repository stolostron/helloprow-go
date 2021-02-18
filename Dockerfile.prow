FROM registry.ci.openshift.org/open-cluster-management/builder:go1.15-linux-amd64 AS builder

WORKDIR /go/src/github.com/open-cluster-management/helloprow-go
COPY . .
RUN CGO_ENABLED=0 go build -trimpath -o main cmd/hello/main.go


FROM scratch

WORKDIR /opt/app/
COPY --from=builder /go/src/github.com/open-cluster-management/helloprow-go/main ./main

EXPOSE 4321
ENTRYPOINT ["/opt/app/main"]
CMD ""
