#  CI/CD Pipeline with Jenkins, Ansible, and Tomcat Server Deployment

This project involves automating the process of building, testing, analyzing code quality, and deploying a Spring Boot application using Jenkins, Ansible, and a Tomcat server. The process uses Ansible playbooks for deployment, integrates SonarCloud for code quality analysis, and deploys the WAR file directly from Jenkins to a Tomcat server.

## Technologies and Tools:

This project focuses on continuous integration and deployment (CI/CD) using the following tools:
- *Jenkins*: Automates the build, test, and deployment process.
- *Ansible*: Orchestrates deployment tasks.
- *GitHub*: Stores the code repository and configurations.
- *SonarCloud*: Performs code quality analysis.
- *Spring Boot*: Application framework.
- *Java and Maven*: Builds the Spring Boot project.
- *Bash Scripting*: Automates certain tasks including taking a backup of an exixting (running) tomcat application.
- *Tomcat Server*: Hosts the application.

### Key Features:
- Automated build and test using Maven.
- Integrated SonarCloud for code quality analysis.
- Deployment to Tomcat server using Ansible.
- Used bash scripts to automate certain tasks including taking a backup of an exixting tomcat application.
- A seamless pipeline for continuous integration and deployment.

---

## Steps Implemented:

1. Setting up jenkins master and agent in an EC2 instance using bash scripting.
2. Created a SonarCloud account, configured it with jenkins and used it for code quality analysis. 
3. The pipeline which is configured in Jenkins with the following stages: 
   - *Checkout*: Clones the project from the GitHub repository.
   - *Build*: Uses Maven to clean and build the project.
   - *Test*: Runs unit tests using Maven.
   - *SonarCloud Analysis*: Analyzes code quality using SonarCloud.
   - *Deployment*: Deploys the application to a Tomcat server using Ansible.
4. Ansible Deployment:
   - Installed Ansible on the Jenkins agent server.
   - Created an inventory file to define the Tomcat server.
   - Created a deploy.yaml Ansible playbook to:
   - Backup the existing WAR file.
   - Deploy the new WAR file to the Tomcat server.
5. Tomcat Deployment:
   - Installed Tomcat server on the Jenkins agent server.
   - Set up permissions for the jenkins-agent user to access Tomcat directories.
   - The WAR file was deployed directly from Jenkins' target folder after the build.

---

## Conclusion:

The project successfully automated the CI/CD process using Jenkins, Ansible, Tomcat. The Spring Boot application was deployed on the Tomcat server without using a repository manager like Nexus, by directly copying the artifact from Jenkins' build folder.

