# Kubernetes cluster setup automation (for DigitalOcean)

> This is my modifcation of the Hobby Kube project. Functionality of the modules is described in the [guide](https://github.com/hobby-kube/guide).

Deploy a secure Kubernetes cluster on [DigitalOcean](https://www.digitalocean.com/) using [Terraform](https://www.terraform.io/) (and [Google Cloud DNS](https://cloud.google.com/dns/)).

## Setup

### Requirements

The following packages (plus terraform and kubectl) are required to be installed locally:

macOS:
```
brew install jq wireguard-tools
```

Ubuntu:
```
sudo apt-get install jq
sudo add-apt-repository ppa:wireguard/wireguard
sudo apt-get update
sudo apt-get install wireguard
```

Modules are using ssh-agent for remote operations. Add your SSH key with `ssh-add -K` if Terraform repeatedly fails to connect to remote hosts.

### Configuration

Export the following environment variables depending on the modules you're using.

#### Using DigitalOcean as provider

```sh
export TF_VAR_digitalocean_token=<token>
export TF_VAR_digitalocean_ssh_keys=<keys> # e.g. '["121671", "1714133"]'
```

#### Install additional APT packages

Each provider takes an optional variable to install further packages during provisioning:

```
module "provider" {
  # ...
  apt_packages = ["ceph-common", "nfs-common"]
}
```

### Usage

```sh
# fetch the required modules
$ terraform init

# see what `terraform apply` will do
$ terraform plan

# execute it
$ terraform apply
```

## Using modules independently

Modules in this repository can be used independently:

```
module "kubernetes" {
  source  = "github.com/hobby-kube/provisioning/service/kubernetes"
}
```

After adding this to your plan, run `terraform get` to fetch the module.
