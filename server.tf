resource "digitalocean_droplet" "staging_grounds" {
    image = "ubuntu-18-04-x64"
    name = var.server_name
    region = "FRA1"
    size = "s-1vcpu-1gb"
    private_networking = true
    ssh_keys = [var.ssh_fingerprint]
    

    # Connect to the provisioned droplet with ssh as root 
    connection  {
        user = "root"
        type = "ssh"
        host = self.ipv4_address
        private_key = file(var.pvt_key)
        timeout = "2m"
    }

    # Inital server setup. Setup a new user with sudo privileges
    provisioner "remote-exec" {
        inline = [
            "adduser ${var.new_user}",
            "\n", #Empty unix password
            "\n",
            # Grant admin privileges
            "usermod -aG sudo ${var.new_user}",
            # Set up a basic firewall
            "ufw allow OpenSSH",
            "ufw enable",
            "rsync --archive --chown=${var.new_user}:${var.new_user} ~/.ssh /home/${var.new_user}"
        ]
    }
}