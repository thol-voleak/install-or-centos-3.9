#!/bin/bash
export DOMAIN=master-ocp.tmn.local
export USERNAME=admin
export PASSWORD=admin@pwdproduction
export VERSION=${VERSION:="v3.9.1"}

export SCRIPT_REPO=${SCRIPT_REPO:="https://raw.githubusercontent.com/thol-voleak/install-or-centos-3.9/master/"}

export IP="$(ip route get 8.8.8.8 | awk '{print $NF; exit}')"

echo "******"
echo "* Your domain is $DOMAIN "
echo "* Your username is $USERNAME "
echo "* Your password is $PASSWORD "
echo "* OpenShift version: $VERSION "
echo "******"

systemctl | grep "NetworkManager.*running" 
if [ $? -eq 1 ]; then
	systemctl start NetworkManager
	systemctl enable NetworkManager
fi

which ansible || pip install -Iv ansible
[ ! -d openshift-ansible ] && git clone https://github.com/openshift/openshift-ansible.git
cd openshift-ansible && git fetch && git checkout release-3.9 && cd ..

cat <<EOD > /etc/hosts
	127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4 
	::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
	${IP}		$(hostname) console console.${DOMAIN} 
EOD
 
curl -o inventory.ini $SCRIPT_REPO/inventory.ini
ansible-playbook -i inventory.ini openshift-ansible/playbooks/deploy_cluster.yml

htpasswd -b /etc/origin/master/htpasswd ${USERNAME} ${PASSWORD}
oc adm policy add-cluster-role-to-user cluster-admin ${USERNAME}

systemctl restart origin-master

echo "******"
echo "* Your conosle is https://console.$DOMAIN:8443"
echo "* Your username is $USERNAME "
echo "* Your password is $PASSWORD "
echo "*"
echo "* Login using:"
echo "*"
echo "$ oc login -u ${USERNAME} -p ${PASSWORD} https://console.$DOMAIN:8443/"
echo "******"
oc login -u ${USERNAME} -p ${PASSWORD} https://console.$DOMAIN:8443/
