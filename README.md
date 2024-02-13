# Video Streaming Application

This is an simple application that stream video clips with microservices architectual.

You need Docker and Docker-Compose installed to run this.
## Features:
* ***Video Streaming*** - on the *Home* Page, a user can stream a video from his collection.
* ***Upload videos*** - on the *Upload* page,  a user can add a new video to the collection of the application.
* ***Viewed History*** - on the *History* page, a user can see statistics of his historical viewed.

# Architectual Diagram
![Alt text](images/Diagram.png "Diagram")

## Services description:
* ***Gateway*** - The entry point to the application. Serves the front end and provides a REST API.
* ***Video streaming*** - Streams videos from storage to be watched by the user.
* ***Video upload*** - Orchestrates upload of videos to storage.
* ***History*** - Records the user’s viewing history.
* ***Metadata*** - Records details and metadata about each video.
* ***Video storage*** - Responsible for storing and retrieving videos from external cloud storage.

## Booting a microservice (might need install MongoDB and/or RabbitMQ)
    npm install
    npm start

or in development mode

    npm install
    npm run start:dev

## Booting the application
### with Docker-compose (for non production deployment)

    docker-compose up --build

Open your browser at http://localhost:4000
### with Kubernetese (Azure) with Terraform
Get details from your Azure account:

    az account show
Create a service principal, account id as subscription-id and copy appId, password:

    az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<subscription-id>"

Create a Azure storage account and then create a storage container.

Initialize and invoke Terraform, from previous stage, use appId as client_id, password as client_secret.

    cd infra
    terraform init
    terraform apply -var="app_version=<app_version>" \
                    -var="client_id=<client_id>" \
                    -var="client_secret=<client_secret>" \
                    -var="storage_account_name=<storage_account_name>" \
                    -var="storage_access_key=<storage_access_key>"


Kubernetes authenticatio (kubeconfig):

    az aks get-credentials --resource-group <your-app-name> --name <your-app-name>

Get the external IP of the gateway service

    kubectl get service


Open your browser at http://gateway-external-ip

## Tests
### Unit tests and integration tests ([with Jest](https://jestjs.io/)) for metadata service

    cd metadata
    npm install
    npm test
or with live reload mode

    cd metadata
    npm install
    npm test

### End2End tests (with [Cypress](https://www.cypress.io/))

    npm test

or with Cypress UI

    npm run test:watch