# micro-api demo application

This is the back-end of a simple 2-tier app to demonstrate using Google Container Registry
with Shippable. To see the full functionality
of the app, use the same steps to deploy the front-end of the app which is also
on Aye0Aye called [micro-www](https://github.com/aye0aye/micro-www).

Prerequisites for running this sample:
1. Create a project called 'shippable-gke' within Google Cloud Platform
2. [Install the gcloud cli tool](https://cloud.google.com/sdk/downloads) and
configure it for your GCP account:
  * `gcloud auth login`
  * `gcloud configure set project shippable-gke`
3. Clone the [aye0aye/micro-image repository](https://github.com/aye0aye/micro-image)
 to your local machine
4. Run Docker Build for this repository to create the aye0aye base image:
  * `docker build -t gcr.io/shippable-gke/micro-image:latest .`
5. Push the base image to your Google Container Registry:
  * `gcloud docker push gcr.io/shippable-gke/micro-image:latest .`
6. Fork the aye0aye/micro-api repository, e.g. to your GitHub account
6. Log into Shippable and [enable a project for your fork](http://docs.shippable.com/ci_subscriptions/#enabling-a-project)
7. [Create an Account Integration for GCR](http://docs.shippable.com/int_docker_registries/#google-container-registry-gcr)
 called 'GCR-shippable-gke' and [assign it to your project](http://docs.shippable.com/ci_projects/#enabling-integrations)

Once you have enabled this sample repo in Shippable, the CI process performs the following:
* Uses Docker to build the CI environment from a Dockerfile, pulling the base
image from a public repository "aye0aye/micro-image"
* Executes some basic CI tests
* Stores the test results and code coverage report
* Upon successful CI build, pushes the newly built Docker image to Google Container Registry

# Optional environment variables for the application (set in Dockerfile):
- API_PORT: Port used for app (default:80)
- LOG_LEVEL: Specifies log level for Winston console (silly, debug, verbose, info, warn, error).
This microservice uses info and error messages only.
- SHUD_LOG_TO_FILE: true or false, specifies whether to save logs to logs.log

# Environment variables required for pulling and pushing from GCR:
In the shippable.yml, you won't need to change any of the environment variables:
- SERVICE=micro-api-beta
- PROJECT_ID=shippable-gke
- REGISTRY_ACCOUNT=gcr.io/$PROJECT_ID
