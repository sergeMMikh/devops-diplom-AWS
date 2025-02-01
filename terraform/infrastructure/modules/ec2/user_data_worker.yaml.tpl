${user_data_base}

runcmd:
  - echo "Waiting for Kubernetes master..."
  - apt-get update && apt-get install -y git python3-pip
  - git clone https://github.com/kubernetes-sigs/kubespray /opt/kubespray