${user_data_base}

runcmd:
  - echo "Initializing Kubernetes master..."
  - kubeadm init --pod-network-cidr=10.244.0.0/16
  - mkdir -p /root/.kube
  - cp -i /etc/kubernetes/admin.conf /root/.kube/config
  - chown root:root /root/.kube/config
  - echo "Master setup complete."
