## jenkins

This repo installs a distributed jenkins (agent-controller) setup on Kubernetes.
The controller agent is deployed on one kubernetes and the agent is configured as another kubernetes cluster. 

After this setup, when we run jenkins jobs, the jobs spin up a new pod in the kubernetes cluster and then once the job is finished, the pod is terminated