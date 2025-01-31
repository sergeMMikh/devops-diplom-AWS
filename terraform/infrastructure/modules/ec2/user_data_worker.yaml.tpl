${user_data_base}

runcmd:
  - echo "Waiting for Kubernetes master..."
  - apt-get update && apt-get install -y git python3-pip
  - git clone https://github.com/kubernetes-sigs/kubespray /opt/kubespray
  - cd /opt/kubespray
  - pip3 install -r requirements.txt
  - echo "[kube-node]" >> /opt/kubespray/inventory/mycluster/inventory.ini
  - echo "$(hostname -I | awk '{print $1}') ansible_host=$(hostname -I | awk '{print $1}') ansible_user=ubuntu ansible_become=true" >> /opt/kubespray/inventory/mycluster/inventory.ini
  - echo "Worker node ready to join the cluster."
