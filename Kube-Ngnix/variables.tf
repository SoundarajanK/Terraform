variable "kube_ip" {
  description = "IP for Kubernetes"
  default = "172.20.10.180:6443"
  }
  
variable "nginx_node_port" {
  description = "NGINX Node Port"
  default = "30202"
  }
