##Install RedHat OpenShift Origin 3.9

## Installation
1. Prerequisites as explained in https://docs.openshift.org/3.9/install_config/install/prerequisites.html by openshift.org

2. Setting PATH

```
# The PATH for the root user on each host must contain the following directories:
	- /bin
	- /sbin
	- /usr/bin
	- /usr/sbin
```

3. Install Docker as explained in https://docs.openshift.org/3.9/install_config/install/host_preparation.html#installing-docker by openshift.org

4. Configuring Docker Storage as explained in https://docs.openshift.org/3.9/install_config/install/host_preparation.html#configuring-docker-storage by openshift.org

5. Ensuring Host Access as explained in https://docs.openshift.org/3.9/install_config/install/host_preparation.html#ensuring-host-access by openshift.org

6. Configuring Ansible Inventory Files more detail in https://docs.openshift.org/3.9/install_config/install/advanced_install.html#configuring-ansible
```
  - config in file -> inventory.ini
```
