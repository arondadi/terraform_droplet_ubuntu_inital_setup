#!/bin/sh
terraform apply \
-var "do_token=$DO_TOKEN" \
-var "pub_key=$HOME/.ssh/id_rsa.pub" \
-var "pvt_key=$HOME/.ssh/id_rsa" \
-var "ssh_fingerprint=$SSH_FINGERPRINT" \
-var "server_name=main-server"



