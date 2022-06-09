provider "kubernetes" {
  host=var.kube_ip
  version="~> 1.13"
  client_certificate = file("apiserver-kubelet-client.crt")
  client_key = file("apiserver-kubelet-client.key")
  cluster_ca_certificate = file("apiserver.crt")
  load_config_file = false
}
