# EDWIP

## Deploy Instructions
The EDWIP website runs inside a docker container
These are instructions for using the included make script to build, start, and stop the container service

1. Ensure docker daemon is running
2. From the project directory run `make install` This will build the container
3. Once the container is built, publish the service to port 7778 with `make deploy`
3. Stop the service at any time with `make stop`
4. Start it again with `make start`
