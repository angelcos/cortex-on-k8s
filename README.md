# cortex-on-k8s example

Example to deploy Cortex and Elasticsearch as backend on K8s local environment (minikube).

## Components
 * Front: [Cortex](https://docs.strangebee.com/cortex/)
   * *Version used:* `v1.32.0`
 * Backend: [Elasticsearch](https://www.elastic.co/elasticsearch)
   * *Version used:* `v8.5.1`

## Prerequisites

* Install required software:
Versions used:
  * *docker:* `v24.0.5` (minikube driver)
  * *minikube:* `v1.32.0 ` (minikube itself)
  * *kuberntes:* `v1.28.3` (default kubernetes version for this minikube release)
  * *kubectl:* `v1.29.1` (most resent kubectl version, but any 1.28+ works)
  * *k9s:* `v0.31.7` (to inspect k8s resources in an easy way)

* Tested in linux (debian).
  
## Easy start

Just run:
```
./cortex.sh deploy
```
This will do some automated task for you:
  * Check that all required software is installed
  * Check if minikube profile defined in `scripts/.cortex.conf` exist, if not, it will be created
  * Enable required minikube addons for elasticsearch
  * Check if the namespace exist for cortex, if not, it will be created
  * Deploy Cortex helm chart in minikube

for more info use `./cortex.sh help` this will show you the additional commands available.
