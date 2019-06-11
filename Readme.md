# Build Infrastructure on Google Cloud

This project helps in standing up the required infrastructure on Google cloud for Twitter Sentiment Analysis project

Please note this uses terraform to push the infrastructure config to GCP. So you need terraform on your laptop.

It creates following services on Google Cloud:

* PubSub
* BigQuery
* Storage bucket to stage code for Dataflow

## Steps to run:

First copy credentials.json to this directory and then run below command:

terraform apply
