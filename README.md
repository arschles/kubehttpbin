# kubehttpbin

[![Build Status](https://travis-ci.org/arschles/kubehttpbin.svg?branch=master)](https://travis-ci.org/arschles/kubehttpbin)
[![Go Report Card](http://goreportcard.com/badge/arschles/kubehttpbin)](http://goreportcard.com/report/arschles/kubehttpbin) [![Docker Repository on Quay](https://quay.io/repository/arschles/kubehttpbin/status "Docker Repository on Quay")](https://quay.io/repository/arschles/kubehttpbin)

An [httpbin.org](http://httpbin.org) clone that you can host on your own Kubernetes cluster. This is a clone of [gohttpbin](https://github.com/arschles/gohttpbin), but designed to run on a Kubernetes cluster instead of Google App Engine.

This project is based heavily upon [@ahmetb](https://github.com/ahmetb)'s 
[https://github.com/ahmetb/go-httpbin](go-httpbin project). It simply adds a running server,
helm chart, and CI hooks to deploy to [kubehttpbin.org](http://kubehttpbin.org).
