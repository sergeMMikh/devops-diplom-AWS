${user_data_base}

runcmd:
  - cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf \
  overlay /
  br_netfilter /
  EOF

  - sudo modprobe overlay
  - sudo modprobe br_netfilter

  - cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf /
  net.ipv4.ip_forward=1 /
  net.bridge.bridge-nf-call-iptables=1 /
  net.bridge.bridge-nf-call-arptables=1 /
  EOF

  - sudo sysctl --system

  - sudo apt-get update
  - sudo apt install -y apt-transport-https ca-certificates curl gpg

  - curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.32/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

  - echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.32/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

  - sudo apt-get update
  - sudo apt-get install -y kubelet kubeadm kubectl containerd
  - sudo apt-mark hold kubelet kubeadm kubectl