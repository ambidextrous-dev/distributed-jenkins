pipeline {
    agent any

    environment {
        CONTROLLER_ENVIRONMENT = "${params.CONTROLLER_ENVIRONMENT}"
        AGENT_ENVIRONMENT = "${params.AGENT_ENVIRONMENT}"
        NAMESPACE = "jenkins"
    }

    stages {
        stage('Deploy Jenkins Controller') {
            steps {
                script {
                    def kubectl_str = "export KUBECONFIG=/opt/kubecfg/${CONTROLLER_ENVIRONMENT}-kubecfg && " +
                        "kubectl config use-context ${CONTROLLER_ENVIRONMENT} && " +
                        "kubectl create namespace ${NAMESPACE} --dry-run -o yaml | kubectl apply -f - && " +
                        "kubectl apply -n ${NAMESPACE} -f k8s-manifests/controller-deployment.yml && " +
                        "kubectl apply -n ${NAMESPACE} -f k8s-manifests/controller-service.yml && " +
                        "kubectl apply -n ${NAMESPACE} -f k8s-manifests/controller-ingress.yml"

                    sh "${kubectl_str}"
                }
            }
        }

        // stage('Deploy Jenkins Agent Config') {
        //     steps {
        //         script {
        //             def kubectl_str = "export KUBECONFIG=/opt/kubecfg/${AGENT_ENVIRONMENT}-kubecfg && " +
        //                 "kubectl config use-context ${AGENT_ENVIRONMENT} && " +
        //                 "kubectl create namespace ${NAMESPACE} --dry-run -o yaml | kubectl apply -f - && " +
        //                 "kubectl apply -n ${NAMESPACE} -f k8s-manifests/agent-config.yml"

        //             sh "${kubectl_str}"
        //         }
        //     }
        // }
    }
}
