# Tailscale ACLs Module - Variables
# ==================================
# Configuration for Tailscale ACLs for InferaDB multi-region networking

# Tag definitions
variable "tags" {
  description = "Tag definitions for InferaDB services"
  type = object({
    engine_tag  = optional(string, "tag:inferadb-engine")
    control_tag = optional(string, "tag:inferadb-control")
  })
  default = {}
}

# Tag owners - who can apply these tags
variable "tag_owners" {
  description = "Tag owners configuration"
  type = object({
    engine_owners  = optional(list(string), [])
    control_owners = optional(list(string), [])
  })
  default = {}
}

# Service ports
variable "ports" {
  description = "Port configuration for InferaDB services"
  type = object({
    engine_http_port  = optional(number, 8080)
    engine_grpc_port  = optional(number, 8081)
    engine_mesh_port  = optional(number, 8082)
    control_http_port = optional(number, 9091)
    control_mesh_port = optional(number, 9092)
  })
  default = {}
}

# Regions configuration
variable "regions" {
  description = "List of regions in the deployment"
  type = list(object({
    id   = string
    name = string
  }))
  default = []
}

# Additional ACL rules
variable "additional_acls" {
  description = "Additional ACL rules to include"
  type = list(object({
    action      = string
    src         = list(string)
    dst         = list(string)
    description = optional(string, "")
  }))
  default = []
}

# SSH configuration
variable "enable_ssh" {
  description = "Enable SSH access to InferaDB nodes"
  type        = bool
  default     = false
}

variable "ssh_allowed_users" {
  description = "Users allowed SSH access (e.g., 'autogroup:admin')"
  type        = list(string)
  default     = []
}

# Autogroups
variable "autogroups" {
  description = "Autogroup configuration"
  type = object({
    admin_group    = optional(string, "autogroup:admin")
    member_group   = optional(string, "autogroup:member")
    tagged_devices = optional(string, "autogroup:tagged-devices")
  })
  default = {}
}

# DNS configuration
variable "dns" {
  description = "DNS configuration for Tailscale"
  type = object({
    enable_magic_dns   = optional(bool, true)
    nameservers        = optional(list(string), [])
    search_paths       = optional(list(string), [])
    override_local_dns = optional(bool, false)
  })
  default = {}
}
