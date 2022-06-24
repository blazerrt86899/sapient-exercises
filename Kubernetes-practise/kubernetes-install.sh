# KUBERNETES Installation using kubeadm (Kubernetes Admin)

sudo apt-get update

# Step 1: Install Containerd -> Which is a container runtime engine on which kubernetes cluster runs.

apt update

apt-get install ca-certificates curl gnupg lsb-release

sudo mkdir -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install containerd.io

systemctl status containerd

# Step 2: Deleting Containerd config.toml file
rm /etc/containerd/config.toml

# Step 3: Kubernetes Installation process

cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf 
overlay 
br_netfilter 
EOF

sudo modprobe overlay

sudo modprobe br_netfilter

cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF

sudo sysctl --system

sudo apt-get update

sudo apt-get install -y apt-transport-https ca-certificates curl

sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

sudo apt-get update

sudo apt-get install -y kubelet kubeadm kubectl

# 1. After Kubernetes installation is completed on all the host machines we need to make
#   master - slave architecture for the cluster to be setup

# 2. Next step will be to initialize the kubernetes admin on the machine whom you wish to make master node

# 3. Command to do that: kubeadm init --pod-network-cidr=192.168.0.0/16

# 4. If it fails, mainly becoz of containerd not running restart the container using systemctl command
#    systemctl restart containerd and again run command mentioned in Point 3.

# 5. Paste the commands in master node as it is from the results of Point 3 command. Example is shown below
#  mkdir -p $HOME/.kube
#  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
#  sudo chown $(id -u):$(id -g) $HOME/.kube/config

# 6. After that try to see the nodes using : kubectl get nodes - atleast master should appear

# 7. Now run kubectl apply command to deploy a pod to the cluster:
# Command: kubectl apply -f https://github.com/coreos/flannel/raw/master/Documentation/kube-flannel.yml

# 8. Now you have to open port 6443 from master machine because worker node will get the joining configuration for the 
# cluster through this port and enter the join command in the worker node from the results of Point 3.
# It will have a token. We should be careful while pasting this command. Should not miss anything
# Example will be: kubeadm join 10.4.0.4:6443 --token u7xmim.mknr6gzt50owjf2f --discovery-token-ca-cert-hash sha256:f7485c174584c1cc548810e45f97ceeb74a7695479a9e39722b342e361d471b3

# 9. After this you can run kubectl get nodes command  to see the nodes getting up.

# 10. Might take a while in getting all the nodes up and running.

# 11. Also to see the cluster info we can run: kubectl cluster-info