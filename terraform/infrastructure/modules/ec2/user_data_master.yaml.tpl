${user_data_base}

runcmd:
  - echo "Initializing Kubernetes master..."
  - apt-get update && apt-get install -y git python3-pip
  - git clone https://github.com/kubernetes-sigs/kubespray /opt/kubespray
  - cd /opt/kubespray
  - pip3 install -r requirements.txt
  - cp -rfp inventory/sample inventory/mycluster
  - echo "[kube-master]" >> inventory/mycluster/inventory.ini
  - echo "$(hostname -I | awk '{print $1}') ansible_host=$(hostname -I | awk '{print $1}') ansible_user=ubuntu ansible_become=true" >> inventory/mycluster/inventory.ini
  - ansible-playbook -i inventory/mycluster/inventory.ini cluster.yml -b -v
  - mkdir -p /root/.kube
  - cp -i /etc/kubernetes/admin.conf /root/.kube/config
  - chown root:root /root/.kube/config
  - echo "Master setup complete."
