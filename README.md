
# App Store Connect CLI Tools Docker Image

This Docker image is designed to simplify interactions with App Store Connect via [Codemagic CLI Tools](https://github.com/codemagic-ci-cd/cli-tools), facilitating the automation of app management tasks.

## Prerequisites

Ensure you have Docker installed on your system to use this image. Download Docker from [Docker's official site](https://www.docker.com/get-started).

## Getting the Docker Image

The Docker image is hosted on Docker Hub and can be pulled using the following command:

```bash
docker pull bednar/app-store-connect-cli
```

## Building the Docker Image Locally

If you prefer to build the image locally, clone this repository and navigate to the directory containing the Dockerfile. Run the following command:

```bash
docker build -t bednar/app-store-connect-cli .
```

## Usage

With the Docker image, you can execute various commands to interact with App Store Connect. Here are some example commands:

### Listing All Applications

List all applications in your App Store Connect account:

```bash
docker run -it --rm bednar/app-store-connect-cli fetch-apps
```

### Getting App Information

Retrieve detailed information about a specific app using its App Store Connect ID:

```bash
docker run -it --rm bednar/app-store-connect-cli get-app-info 123456789
```

### Submitting an App for Review

Submit an app for review with its version number:

```bash
docker run -it --rm bednar/app-store-connect-cli publish-application --app-id 123456789 --version "1.0.1"
```

## Configuring Codemagic CLI

Set up authentication credentials for App Store Connect to use [Codemagic CLI Tools](https://github.com/codemagic-ci-cd/cli-tools). These credentials can be passed as environment variables:

```bash
docker run -e APP_STORE_CONNECT_PRIVATE_KEY="-----BEGIN PRIVATE KEY-----...-----END PRIVATE KEY-----"            -e APP_STORE_CONNECT_KEY_ID="ABC1234567"            -e APP_STORE_CONNECT_ISSUER_ID="12345678-1234-1234-1234-123456789abc"            -it --rm bednar/app-store-connect-cli <command>
```

Replace `<command>` with any available Codemagic CLI command.

## Contributing

We welcome contributions from the community. Whether it's improving the Dockerfile, adding more examples, or reporting issues, your input is appreciated.

## License

This project is released under the MIT License. See the [`LICENSE`](https://github.com/bednar/app-store-connect-cli?tab=MIT-1-ov-file#readme) file in the repository for more details.

## Contact

If you have any questions or need help, please open an issue in this GitHub repository for support and inquiries. Follow this link to create a new issue: [Open an Issue](https://github.com/bednar/app-store-connect-cli/issues/new)
