# jumpbox

![Lint Status](https://github.com/mfinelli/jumpbox/workflows/Lint/badge.svg)
![Image Size](https://img.shields.io/docker/image-size/mfinelli/jumpbox)

A docker container containing debugging tools that I need that I can run as
a "jump host" in a kubernetes cluster to kubectl exec to.

The keepalive script is based on this post:
https://andrewlock.net/deploying-asp-net-core-applications-to-kubernetes-part-10-creating-an-exec-host-deployment-for-running-one-off-commands/

## install

You can easily install the jumpbox into your cluster using `helm`:

```shell
helm repo add mfinelli https://charts.finelli.dev
helm install --namespace jumpbox mfinelli/jumpbox
```

## usage

After installing the chart into your cluster you can connect to it using the
normal `kubectl`:

```shell
export POD_NAME=$(kubectl get pods --namespace jumpbox \
  -l "app.kubernetes.io/name=jumpbox,app.kubernetes.io/instance=jumpbox" \
  -o jsonpath="{.items[0].metadata.name}")
kubectl --namespace jumpbox exec -it $POD_NAME -- /bin/bash
```

## license

```
Copyright 2021 Mario Finelli

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
