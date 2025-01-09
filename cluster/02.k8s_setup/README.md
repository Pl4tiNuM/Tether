# Kubernetes cluster setup

## Prerequisites
Perform the following steps as superuser (sudo).

1. Configure required kernel modules (Control Plane + Workers):

```bash
$ cat <<EOF | tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF
$ modprobe overlay modprobe br_netfilter
```

2. Configure network parameters (Control Plane + Workers):

```bash
$ cat <<EOF | tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOF
$ sysctl --system
```

3. Configure containerd (Control Plane + Workers):

```bash
$ mkdir -p /etc/containerd
$ containerd config default | tee /etc/containerd/config.toml
```

> [!IMPORTANT] 
> On the generated file, you should verify whether the following settings are present: 
>```
> [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc]
>  runtime_type = "io.containerd.runc.v2"  # <- note this, this line might have been missed
>  [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options]
>    SystemdCgroup = true
> ```

Save the config file, close it and restart the containerd service

```bash
$ systemctl restart containerd
$ systemctl enable containerd
```

Last, add the following configuration for `crictl`:

```bash
$ cat <<EOF | tee /etc/crictl.yaml
runtime-endpoint: unix:///run/containerd/containerd.sock
image-endpoint: unix:///run/containerd/containerd.sock
timeout: 2
debug: false
pull-image-on-create: false
EOF
```

## Install K8S

1. Update the apt package index and install packages needed to use the Kubernetes apt repository:

```bash
$ apt-get install -y apt-transport-https ca-certificates curl gpg
```

2. Download the public signing key for the Kubernetes package repositories. The same signing key is used for all repositories so you can disregard the version in the URL:

```bash
$ curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.32/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
```

3. Add the appropriate Kubernetes apt repository (Kubernetes v1.32)

```bash
$ echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.32/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
```

4. Update the apt package index, install kubelet, kubeadm and kubectl, and pin their version:

```bash
$ apt-get update
$ apt-get install -y kubelet kubeadm kubectl
$ apt-mark hold kubelet kubeadm kubectl
```


## Install Helm
Helm is required to deploy/run Kubernetes packages. To install helm run the following commands as superuser:

```bash
$ curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
$ apt-get install apt-transport-https --yes
$ echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | tee /etc/apt/sources.list.d/helm-stable-debian.list
$ apt-get update
$ apt-get install helm
```