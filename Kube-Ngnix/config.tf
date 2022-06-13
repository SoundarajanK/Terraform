provider "kubernetes" {
  host=var.kube_ip
  version="~> 1.13"
  client_certificate = file("ca.crt")
  client_key = file("server.key")
  cluster_ca_certificate = file("server.crt")
  load_config_file = false
}
