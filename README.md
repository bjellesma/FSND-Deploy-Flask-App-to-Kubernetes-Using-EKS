# Deploying a Flask API

This is the project starter repo for the fourth course in the [Udacity Full Stack Nanodegree](https://www.udacity.com/course/full-stack-web-developer-nanodegree--nd004): Server Deployment, Containerization, and Testing.

In this project you will containerize and deploy a Flask API to a Kubernetes cluster using Docker, AWS EKS, CodePipeline, and CodeBuild.

The Flask app that will be used for this project consists of a simple API with three endpoints:

- `GET '/'`: This is a simple health check, which returns the response 'Healthy'. 
- `POST '/auth'`: This takes a email and password as json arguments and returns a JWT based on a custom secret.
- `GET '/contents'`: This requires a valid JWT, and returns the un-encrpyted contents of that token. 

The app relies on a secret set as the environment variable `JWT_SECRET` to produce a JWT. The built-in Flask server is adequate for local development, but not production, so you will be using the production-ready [Gunicorn](https://gunicorn.org/) server when deploying the app.

## Initial setup
1. Fork this project to your Github account.
2. Locally clone your forked version to begin working on the project.

## Dependencies

- Docker Engine
    - Installation instructions for all OSes can be found [here](https://docs.docker.com/install/).
    - For Mac users, if you have no previous Docker Toolbox installation, you can install Docker Desktop for Mac. If you already have a Docker Toolbox installation, please read [this](https://docs.docker.com/docker-for-mac/docker-toolbox/) before installing.
 - AWS Account
     - You can create an AWS account by signing up [here](https://aws.amazon.com/#).
     
## Project Steps

Completing the project involves several steps:

1. Write a Dockerfile for a simple Flask API
2. Build and test the container locally
3. Create an EKS cluster
4. Store a secret using AWS Parameter Store
5. Create a CodePipeline pipeline triggered by GitHub checkins
6. Create a CodeBuild stage which will build, test, and deploy your code

For more detail about each of these steps, see the project lesson [here](https://classroom.udacity.com/nanodegrees/nd004/parts/1d842ebf-5b10-4749-9e5e-ef28fe98f173/modules/ac13842f-c841-4c1a-b284-b47899f4613d/lessons/becb2dac-c108-4143-8f6c-11b30413e28d/concepts/092cdb35-28f7-4145-b6e6-6278b8dd7527).

## Custom Readme

1. Install [NodeJS](https://nodejs.org/en/) in order to run npm packages
2. Install [pipenv](https://pipenv-fork.readthedocs.io/en/latest/) to run the necessary python packages
3. Run `npm run install` to a virtual environment and all of its packages
4. Edit `.env-sample` using the following environmental variables and rename the file to `.env`

```
JWT_SECRET=<A string to be the JWT Secret>
LOG_LEVEL=<Level of logging reported by the server. E.G. DEBUG, INFO, etc.>
```

5. Use `npm run server` to start the app on [http://127.0.0.1:8080](http://127.0.0.1:8080)

### Docker

1. Run `npm run docker-build` to build a docker image
2. Using `npm run docker-run` will run the docker image assuming the following:
    * Binding port 80 of your machine to port 8080 of the container. Port 8080 is the port where the API server runs by default.
    * Assuming that you've used the same tag, `jwt-api`, as specified in the `docker-build` command above.
    * Assuming that your environmental variables are contained in the same directory in a file called `.env`