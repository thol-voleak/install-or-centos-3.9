0- Prerequisites
	- link -> https://docs.openshift.org/3.9/install_config/install/prerequisites.html
1- Setting PATH
	+ The PATH for the root user on each host must contain the following directories:
		- /bin
		- /sbin
		- /usr/bin
		- /usr/sbin
2- Install Docker 
	- link -> https://docs.openshift.org/3.9/install_config/install/host_preparation.html#installing-docker

3- Configuring Docker Storage
	- link -> https://docs.openshift.org/3.9/install_config/install/host_preparation.html#configuring-docker-storage

4. Ensuring Host Access 
	- link -> https://docs.openshift.org/3.9/install_config/install/host_preparation.html#ensuring-host-access

5- Installing Ansible version 2.4 or later

6- Configuring Ansible Inventory Files
	- file -> inventory.ini
	- link -> https://docs.openshift.org/3.9/install_config/install/advanced_install.html#configuring-ansible
7- To run the RPM-based installer
	1- ansible-playbook -i inventory.ini openshift-ansible/playbooks/prerequisites.yml
	2- ansible-playbook -i inventory.ini openshift-ansible/playbooks/deploy_cluster.yml