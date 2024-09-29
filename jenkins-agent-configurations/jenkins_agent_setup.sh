# Create this bash script under the root user


#!/bin/bash

# Update the system and install Java (OpenJDK 11)
sudo yum update -y
sudo amazon-linux-extras enable corretto11
sudo yum install -y java-11-amazon-corretto

# Create Jenkins agent user
sudo useradd -m -d /home/jenkins-agent -s /bin/bash jenkins-agent

# Setup SSH keys for Jenkins agent (use the public key from the controller)
# Ensure the .ssh directory exists and is correctly permissioned
sudo mkdir -p /home/jenkins-agent/.ssh
sudo chmod 700 /home/jenkins-agent/.ssh

# Manually add the public key you copied from the controller/local machine
echo "add the public key here" | sudo tee /home/jenkins-agent/.ssh/authorized_keys

# Adjust permissions for the authorized_keys file
sudo chmod 600 /home/jenkins-agent/.ssh/authorized_keys
sudo chown -R jenkins-agent:jenkins-agent /home/jenkins-agent/.ssh

echo "Jenkins agent setup complete. You can now connect via SSH from the Jenkins controller."
