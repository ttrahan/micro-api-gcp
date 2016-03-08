# micro-api demo application

This is the back-end of a simple 2-tier app to demonstrate using Google Container Registry
with Shippable. To see the full functionality
of the app, use the same steps to deploy the front-end of the app which is also
on Aye0Aye called [micro-www](https://github.com/aye0aye/micro-www).

#### Prerequisites for running this sample:
1. Create a project called 'shippable-gke' within Google Cloud Platform
2. Fork the [aye0aye/micro-api](https://github.com/aye0aye/micro-api/tree/google-gcr-gke) repository, e.g. to your GitHub account
3. Log into Shippable and [enable a project for your fork](http://docs.shippable.com/ci_subscriptions/#enabling-a-project)
4. [Create an Account Integration for GCR](http://docs.shippable.com/int_docker_registries/#google-container-registry-gcr)
 called 'GCR-shippable-gke' and [assign it to your project](http://docs.shippable.com/ci_projects/#enabling-integrations)

 Note: In this sample, you will be working with branch "google-gcr-gke"

#### When run, the CI process performs the following:
* Uses Docker to build the CI environment from a Dockerfile, pulling the base
image from a public repository "aye0aye/micro-image"
* Executes some basic CI tests
* Stores the test results and code coverage report
* Upon successful CI build, pushes the newly built Docker image to Google Container Registry

#### Environment variables required for pulling and pushing from GCR in shippable.yml:
In the shippable.yml, you should't need to change any of the environment variables:
- SERVICE=micro-api
- PROJECT_ID=shippable-gke
- REGISTRY_ACCOUNT=gcr.io/$PROJECT_ID
