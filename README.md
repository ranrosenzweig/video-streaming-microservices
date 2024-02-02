# Video Streaming Application

This is an simple application that stream video clips with microservices architectual.

You need Docker and Docker-Compose installed to run this.

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
### with Kubernetese (Azure)
Kubernetes authenticatio (kubeconfig):

    az aks get-credentials --resource-group <your-app-name> --name <your-app-name

## Application home page:
Open your browser at http://localhost:4000

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