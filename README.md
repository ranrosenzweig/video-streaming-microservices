# Video Streaming Application

This is an simple application that stream video clips with microservices architectual.

You need Docker and Docker-Compose installed to run this.

![Alt text](images/Diagram.png "Diagram")

Boot it up from the terminal using:

    docker-compose up --build

You must now load the videos collection with ./scripts/mongodb.json into video-streaming database. You can do this using Robo 3T or mongoimport.

Then point your browser at http://localhost:4002/video?id=5d9e690ad76fe06a3d7ae416

## Deployment
### with Docker-compose (for non production deployments)

    docker-compose up --build
### with Kubernetese (Azure)
Kubernetes authenticatio (kubeconfig):

    az aks get-credentials --resource-group <your-app-name> --name <your-app-name

## Tests
### Unit tests and integration tests ([with Jest](https://jestjs.io/)) for metadata service

    cd metadata
    npm test
### End2End tests (with [Cypress](https://www.cypress.io/))

    npm test

or with Cypress UI

    npm run test:watch