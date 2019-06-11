// Configure the Google Cloud provider
provider "google" {
  region      = "us-central1"
  project     = "secondtrial-243410"
  credentials = "${file("credentials.json")}"
}

# Pub/sub
resource "google_pubsub_topic" "tweet-topic" {
  name = "tweets"
}

# Bigquery dataset and table
resource "google_bigquery_dataset" "twitter" {
  dataset_id    = "twitter"
  friendly_name = "twitter"
  description   = "Tweets with their sentiment"
  location      = "US"
}

resource "google_bigquery_table" "default" {
  dataset_id = "${google_bigquery_dataset.twitter.dataset_id}"
  table_id   = "tweets"
  schema     = "${file("schema.json")}"
}

# Bucket for dataflow code/jobs
resource "google_storage_bucket" "twitter-dataflow-310108" {
  name     = "twitter-dataflow-310108"
  location = "US"
}
