variable "environment" {
  description = "Nom de l'environnement logique de la plateforme."
  type        = string
  default     = "lab"

  validation {
    condition     = contains(["lab", "dev", "test"], var.environment)
    error_message = "L'environnement doit être lab, dev ou test."
  }
}

variable "platform_name" {
  description = "Nom stable utilisé pour identifier la plateforme."
  type        = string
  default     = "devsecops-platform"

  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.platform_name))
    error_message = "Le nom doit contenir uniquement des minuscules, chiffres et tirets."
  }
}
