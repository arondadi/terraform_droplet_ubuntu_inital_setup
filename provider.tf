variable "do_token" {}
variable "pub_key" {}
variable "pvt_key" {}
variable "ssh_fingerprint" {}
variable "new_user" {}
variable "server_name" {}

provider "digitalocean" {
    token = var.do_token
}