#!/bin/bash

echo ">> Create kind cluster"
kind create cluster

echo ">> Get cluster info"
kubectl cluster-info --context kind-kind
