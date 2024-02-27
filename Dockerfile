# Use the official Golang base image with version 1.21.3
FROM golang:1.21.3

# Set the working directory inside the container to /app
WORKDIR /app

# Copy all files from the current directory to /app in the container
COPY . .

# Ensure that the Go module's dependencies are correctly defined and up to date
RUN go mod tidy

# Download and install any dependencies required by the application
RUN go get

# Copy all Go source files from the current directory to /app in the container
COPY *.go ./

# Compile the Go application into an executable named sample-web-app in the root directory of the container
RUN go build -o /sample-web-app

# Change the permissions of the sample-web-app executable to make it executable
RUN chmod +x /sample-web-app

# Inform Docker that the container will listen on port 3000 at runtime
EXPOSE 3000

# Specify the command to run when the container starts, which is to execute the sample-web-app executable
CMD [ "/sample-web-app" ]
