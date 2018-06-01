/* general */
variable "hosts" {
  default = 3
}

variable "domain" {
  default = "romaniuk.us"
}

variable "hostname_format" {
  default = "kube%d"
}

/* digitalocean */
variable "digitalocean_token" {
  default = ""
}

/* curl -X GET -H "Content-Type: application/json" 
-H "Authorization: Bearer token" 
"https://api.digitalocean.com/v2/account/keys"
*/
variable "digitalocean_ssh_keys" {
  default = [21272568]
}

variable "digitalocean_region" {
  default = "nyc3"
}

/* google dns */
variable "google_project" {
  default = "hobby-kube"
}

variable "google_region" {
  default = "us-east1"
}

variable "google_managed_zone" {
  default = "hobby-kube"
}

variable "google_credentials_file" {
  default = "hobby-kube-535539cd0871.json"
}
