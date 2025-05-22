variable "primary_region" {
  description = "Primary AWS region for the infrastructure"
  type        = string
}

variable "secondary_region" {
  description = "Secondary AWS region for high availability / DR"
  type        = string
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources"
  default     = {}
}
