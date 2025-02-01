#cloud-config
package_update: true
package_upgrade: true

packages:
  - apt-transport-https
  - ca-certificates
  - net-tools
  - mc
  - curl
  - gnupg
  - docker.io
  - kubelet
  - kubeadm
  - kubectl

write_files:
  - path: /etc/modules-load.d/k8s.conf
    content: |
      overlay
      br_netfilter
  - path: /etc/sysctl.d/k8s.conf
    content: |
      net.bridge.bridge-nf-call-iptables = 1
      net.ipv4.ip_forward = 1
      net.bridge.bridge-nf-call-ip6tables = 1

runcmd:
  - modprobe overlay
  - modprobe br_netfilter
  - sysctl --system
  - systemctl enable --now docker
  - systemctl enable --now kubelet
  - kubeadm config images pull
  - swapoff -a
  - sed -i '/ swap / s/^/#/' /etc/fstab
