# jumpbox

A docker container containing debugging tools that I need that I can run as
a "jump host" in a kubernetes cluster to kubectl exec to.

The keepalive script is based on this post:
https://andrewlock.net/deploying-asp-net-core-applications-to-kubernetes-part-10-creating-an-exec-host-deployment-for-running-one-off-commands/
