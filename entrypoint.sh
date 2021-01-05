#!/bin/sh

set -e

# Extract the base64 encoded config data and write this to the KUBECONFIG
# If base64 decoding fails, assume the KUBECONFIG was plain text
mkdir -p ~/.kube
echo "${INPUT_KUBECONFIG}" | base64 -d > ~/.kube/config 2>/dev/null || \
    echo "${INPUT_KUBECONFIG}" > ~/.kube/config

# Execute kubectl command
sh -c "kubectl $*"
