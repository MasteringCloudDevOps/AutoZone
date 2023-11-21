variable "topic_name" {
  description = "The name of the Pub/Sub topic"
}

variable "labels" {
  description = "Labels for the Pub/Sub topic"
  type        = map(string)
  default     = {}
}

variable "message_storage_policy" {
  description = "Message storage policy for the Pub/Sub topic"
  type        = object({
    allowed_persistence_regions = list(string)
  })
  default     = null
}

resource "google_pubsub_topic" "pubsub_topic" {
  name   = var.topic_name
  labels = var.labels

  message_storage_policy {
    allowed_persistence_regions = var.message_storage_policy.allowed_persistence_regions
  }
}

output "topic_name" {
  description = "The name of the created Pub/Sub topic"
  value       = google_pubsub_topic.pubsub_topic.name
}

