/**
 * Copyright 2024 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "add_suffix" {
  description = "Add suffix to resources"
  type        = string
  default     = ""
}

variable "project_create" {
  description = "Create project instead of using an existing one."
  type        = bool
  default     = false
}

variable "project_id" {
  description = "Google Cloud project ID."
  type        = string
}

variable "region" {
  description = "Region to use."
  type        = string
  default     = "europe-west4"
}

variable "vpc_config" {
  description = "Network and subnetwork to use."
  type = object({
    create               = bool
    network              = string
    network_project      = optional(string)
    subnetwork           = optional(string)
    subnetwork_self_link = optional(string)
  })
  default = {
    create     = true
    network    = "autoneg-test"
    subnetwork = "autoneg-test"
  }
}

variable "vpc_subnets" {
  description = "Subnets for configure for GKE"
  type = object({
    main_cidr_range        = string
    proxy_only_cidr_range  = string
    master_ipv4_cidr_block = string
    pods_ip_cidr_range     = string
    pods_name              = string
    services_ip_cidr_range = string
    services_name          = string
  })
  default = {
    main_cidr_range        = "10.142.68.0/23"
    proxy_only_cidr_range  = "10.142.70.0/24"
    master_ipv4_cidr_block = "10.142.71.0/28"
    pods_ip_cidr_range     = "10.142.0.0/18"
    pods_name              = "autoneg-test-pods-1"
    services_ip_cidr_range = "10.142.64.0/22"
    services_name          = "autoneg-test-svcs-1"
  }
}

variable "autoneg_image" {
  type        = string
  description = "Autoneg image to use"
  default     = "ghcr.io/googlecloudplatform/gke-autoneg-controller/gke-autoneg-controller:latest"
}
