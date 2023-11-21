provider "google" {
  credentials = file("/home/user/credentials.json")
  project     = "project-id"
  region      = "us-central1" 
}

module "pubsub_topic" {
  source           = "./modules/pubsub-topic"
  topic_name       = "my-topic"
  labels           = { environment = "dev" }
  message_storage_policy = {
    allowed_persistence_regions = ["us-central1", "us-east1"]
  }
}

