
# App Store Connect CLI Tools Docker Image

[![Docker Image Version](https://img.shields.io/docker/v/bednar/app-store-connect-cli)
](https://hub.docker.com/r/bednar/app-store-connect-cli)

This Docker image is designed to simplify interactions with App Store Connect via [Codemagic CLI Tools](https://github.com/codemagic-ci-cd/cli-tools/blob/master/docs/app-store-connect/README.md), facilitating the automation of app management tasks.

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
docker run -it --rm bednar/app-store-connect-cli apps list
```

### Getting App Information

Retrieve detailed information about a specific app using its App Store Connect ID:

```bash
docker run -it --rm bednar/app-store-connect-cli apps get 123456789
```

### Submitting an App for Review

Submit an app for review with its version number:

```bash
docker run -it --rm bednar/app-store-connect-cli publish-application --app-id 123456789 --version "1.0.1"
```

## Configuring Codemagic CLI

To successfully interact with App Store Connect, you need to set up authentication credentials 
for [Codemagic CLI Tools](https://github.com/codemagic-ci-cd/cli-tools/blob/master/docs/app-store-connect/README.md). The following steps guide you through the process:

1. Create a new key in the App Store Connect account. Go to the [App Store Connect](https://appstoreconnect.apple.com/)
   website and navigate to the `Users and Access` section. Click on the `Integrations` tab and create a new key. 
   Download the key and save it securely. On the page, you can also view the Key identifier and Issuer ID.
2. These credentials can be passed to [Codemagic CLI Tools](https://github.com/codemagic-ci-cd/cli-tools/blob/master/docs/app-store-connect/README.md) as environment variables:
   - `APP_STORE_CONNECT_ISSUER_ID`: The Issuer ID from the Integrations page - `12345678-1234-1234-1234-123456789012`
   - `APP_STORE_CONNECT_KEY_IDENTIFIER`: The Key identifier from the Integrations page - `12345678`
   - `APP_STORE_CONNECT_PRIVATE_KEY`: The downloaded private key from the App Store Connect key - `AuthKey_123456789.p8`
3. You can pass these environment variables to the Docker container using the `-e` flag. Here is an example:
   
```bash
docker run -it --rm \
  -e APP_STORE_CONNECT_ISSUER_ID="12345678-1234-1234-1234-123456789012" \
  -e APP_STORE_CONNECT_KEY_IDENTIFIER="12345678" \
  -e APP_STORE_CONNECT_PRIVATE_KEY="`cat ./AuthKey_123456789.p8`" \
  -it --rm bednar/app-store-connect-cli <command>
```

Replace `<command>` with any available Codemagic CLI command.

## Contributing

We welcome contributions from the community. Whether it's improving the Dockerfile, adding more examples, or reporting issues, your input is appreciated.

## License

This project is released under the MIT License. See the [`LICENSE`](https://github.com/bednar/app-store-connect-cli?tab=MIT-1-ov-file#readme) file in the repository for more details.

## Contact

If you have any questions or need help, please open an issue in this GitHub repository for support and inquiries. Follow this link to create a new issue: [Open an Issue](https://github.com/bednar/app-store-connect-cli/issues/new)
