package main

import (
	"log"
	"net"

	"github.com/stolostron/helloprow-go/pkg/hello"
)

const address = ":4321"

func main() {
	server, err := net.Listen("tcp", address)
	if err != nil {
		log.Fatalf("Unable to open socket for %s: %s", address, err)
	}
	log.Printf("Opened socket for %s", address)

	hello.Server(server)

	err = server.Close()
	if err != nil {
		log.Fatalf("Unable to close socket for %s: %s", address, err)
	}
	log.Printf("Closed socket for %s", address)
}
