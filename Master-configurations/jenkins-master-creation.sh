#!/bin/bash

# Step 1: Update system packages
echo "Updating system packages..."
sudo yum update -y

# Step 2: Install Java (Jenkins requires Java to run)
echo "Installing Java..."
sudo yum install -y java-11

# Step 3: Remove any existing Jenkins repo file
echo "Removing old Jenkins repository if it exists..."
sudo rm -f /etc/yum.repos.d/jenkins.repo

# Step 4: Creating jenkins repo and importing the GPG key
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo dnf upgrade -y

# Step 6: Clean YUM cache
echo "Cleaning YUM cache..."
sudo yum clean all

# Step 7: Install Jenkins
echo "Installing Jenkins..."
sudo yum install -y jenkins
sudo systemctl daemon-reload

# Step 8: Enable Jenkins to start at boot
echo "Enabling Jenkins to start at boot..."
sudo systemctl enable jenkins


# Step 9: Start Jenkins service
echo "Starting Jenkins service..."
sudo systemctl start jenkins

# Check Jenkins service status
echo "Checking Jenkins service status..."
if systemctl is-active --quiet jenkins; then
    echo "Jenkins is up and running on the default port 8080."
else
    echo "failed to start Jenkins. Please check the service logs for details."
fi

# Step 10: Display Jenkins initial admin password
echo "Waiting for Jenkins to initialize and generate the admin password..."
sleep 30  # Wait for Jenkins to generate the password file

JENKINS_PASSWORD_FILE="/var/lib/jenkins/secrets/initialAdminPassword"

# Check if the Jenkins initialAdminPassword file exists
if [ -f "$JENKINS_PASSWORD_FILE" ]; then
    echo "Jenkins initial admin password (needed to unlock Jenkins):"
    sudo cat "$JENKINS_PASSWORD_FILE"
else
    echo "Jenkins initial admin password file not found."
    echo "Jenkins might still be initializing or the service could have an issue."
    echo "You can manually check later with: sudo cat /var/lib/jenkins/secrets/initialAdminPassword"
fi

# Step 11: Provide Jenkins access URL
echo "Jenkins installation is complete. You can access it at http://<your_server_ip>:8080"

# End of script
