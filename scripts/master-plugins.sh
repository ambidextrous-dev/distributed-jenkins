#!/bin/bash

JENKINS_URL="http://jenkinsserver:30080"
PLUGINS=("kubernetes-plugin" "docker" "git" "node-label-parameter")

# Wait for Jenkins to become available
while true; do
  if curl -sSLf "${JENKINS_URL}" &>/dev/null; then
    echo "Jenkins is up and running!"
    break
  else
    echo "Waiting for Jenkins to start..."
    sleep 10
  fi
done

# Download Jenkins CLI
wget "${JENKINS_URL}/jnlpJars/jenkins-cli.jar" -O jenkins-cli.jar

# Iterate over the plugins array and install each plugin
for PLUGIN_NAME in "${PLUGINS[@]}"; do
#   wget "${JENKINS_URL}/pluginManager/api/latest/plugin/${PLUGIN_NAME}" -O "${PLUGIN_NAME}.hpi"
  java -jar jenkins-cli.jar -s "${JENKINS_URL}" install-plugin "${PLUGIN_NAME}.hpi"
done

# Restart Jenkins
java -jar jenkins-cli.jar -s "${JENKINS_URL}" safe-restart
