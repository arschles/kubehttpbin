package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"strconv"

	httpbin "github.com/ahmetb/go-httpbin"
)

const (
	defaultPort = 8080
)

func main() {
	port, err := strconv.Atoi(os.Getenv("PORT"))
	if err != nil {
		port = defaultPort
	}

	router := httpbin.GetMux()

	hostStr := fmt.Sprintf(":%d", port)
	log.Printf("kubehttpbin listening on %s", hostStr)
	if err := http.ListenAndServe(hostStr, router); err != nil {
		log.Fatalf("server failed (%s)", err)
	}
}
