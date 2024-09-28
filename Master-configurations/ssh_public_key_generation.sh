ssh_public_key_generartion.sh

#!/bin/bash

# Generate SSH key pair (if not already generated)
if [ ! -f ~/.ssh/id_rsa ]; then
    echo "Generating a new SSH key pair..."
    ssh-keygen -t rsa -b 4096 -C "jenkins-agent" -f ~/.ssh/id_rsa -N ""
    echo "SSH key pair generated."
else
    echo "SSH key pair already exists."
fi

# Display the public key for copying to the agent
echo "Public key to add to the Jenkins agent machine:"
cat ~/.ssh/id_rsa.pub
