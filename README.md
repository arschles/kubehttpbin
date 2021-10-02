# kubehttpbin

[![Go Report Card](https://goreportcard.com/badge/github.com/arschles/kubehttpbin)](https://goreportcard.com/report/github.com/arschles/kubehttpbin)

An [httpbin.org](http://httpbin.org) clone that you can host on your own Kubernetes cluster. This is a clone of [gohttpbin](https://github.com/arschles/gohttpbin), but designed to run on a Kubernetes cluster instead of Google App Engine.

This project is based heavily upon [@ahmetb](https://github.com/ahmetb)'s 
[go-httpbin project](https://github.com/ahmetb/go-httpbin). It simply adds a running server,
helm chart, and CI hooks to deploy to [kubehttpbin.org](http://kubehttpbin.org).
