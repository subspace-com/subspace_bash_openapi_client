# Subspace Product API Bash client

# Introduction

The Subspace API is based on REST, has resource-oriented URLs, returns JSON-encoded responses, and returns standard HTTP response codes.

The base URL for the API is:  `https://api.subspace.com/`

# Naming Convention

* Version name currently in use is: *v1*
  * Example: `https://api.subspace.com/v1`

# Authentication

## API Tokens

Subspace authenticates your API requests using JWT Bearer tokens. To use any Subspace API, you must pass a Bearer token with each request. If you do not include your Bearer token when making an API request, or use one that is incorrect or disabled, Subspace returns an error.

Bearer tokens are granted by requesting one (as noted below) and presenting your publishable (client_id) and secret (client_secret) tokens.   

Subspace provides two types of API tokens: publishable (client_id) and secret (client_secret).  These are available in the Subspace console.
  * **Publishable** API tokens (client_id) are meant solely to identify your account with Subspace, they aren’t secret. They can be published in places like your website JavaScript code, or in an iPhone or Android app.
  * **Secret** API tokens (client_secret) should be kept confidential and only stored on your own servers. Your account’s secret API token will allow you to acquire a valid JWT token authorized to perform any API request to Subspace.

## Getting a JWT Bearer Token

Subspace uses auth0 for JWT token management.  You can acquire a JWT token by utilizing `https://id.subspace.com` and following the instructions in the curl example below.

## Protecting Your API Tokens

  * **JWT tokens have a expiration time of 24 hours.**  Once expired, you will have to use your Subspace private API and public token to request a new one.
  * The Subspace private token can be rotated from within the Subspace console.
  * **Keep your secret token safe.** Your secret token can make any API call on behalf of your account, including changes that may impact billing such as enabling pay-as-you-go charges. Do not store your secret token in your version control system. Do not use your secret token outside your web server, such as a browser, mobile app, or distributed file.
  * **You may use the Subspace console to acquire an API token.**
  * **You may use the Subspace console to disable pay-as-you-go.** This may prevent unexpected charges due to unauthorized or abnormal usage.
  * **Do not embed API keys directly in code.** Instead of directly embedding API keys in your application’s code, put them in environment variables, or within include files that are stored separately from the bulk of your code—outside the source repository of your application. Then, if you share your code, the API keys will not be included in the shared files.
  * **Do not store API tokens inside your application’s source control.** If you store API tokens in files, keep the files outside your application’s source control system. This is particularly important if you use a public source code management system such as GitHub.
  * **Limit access with restricted tokens.** The Subspace console will allow you to specify the IP addresses or referrer URLs associated with each token, reducing the impact of a compromised API token.
  * **Use independent API tokens for different apps.** This limits the scope of each token. If an API token is compromised, you can rotate the impacted token without impacting other API tokens.

# Error Codes

Subspace uses HTTP response codes to indicate the success or failure of an API request. 

General HTML status codes:
  * 2xx Success. 
  * 4xx Errors based on information provided in the request.
  * 5xx Errors on Subspace servers.
  
# Security

We provide a valid, signed certificate for our API methods. Be sure your connection library supports HTTPS with the SNI extension.

# REST How-To

Making your first REST API call is easy and can be done from your browser.  You will need:
  * Your **secret** token and public client token, both found in the Console.
  * The URL for the type of data you would like to request.

First, acquire a JWT Bearer Token.  Command line example:
    
    curl --request POST \\
         --url \"https://id.subspace.com/oauth/token\" \\
         --header 'content-type: application/json' \\
         --data '{ \"client_id\": \"YOURCLIENTID\", \"client_secret\": \"YOURCLIENTSECRET\", \"audience\": \"https://api.subspace.com/\", \"grant_type\": \"client_credentials\" }'

REST calls are made up of:
  * Base url: Example: `https://api.subspace.com`
  * Version: Example: `v1`
  * The API Endpoint and any parameters: `accelerator/acc_NDA3MUI5QzUtOTY4MC00Nz` where `acc_NDA3MUI5QzUtOTY4MC00Nz` is a valid accelerator ID
  * Accelerator ids are always of the format `acc_NDA3MUI5QzUtOTY4MC00Nz`, with a \"acc_\" prefix followed by 22 characters.
  * Token header: All REST requests require a valid JWT Bearer token which should be added as an “Authorization” header to the request:
      
      `Authorization: Bearer YOUR_TOKEN_HERE`
  
## Authorization header example

If your API token was “my_api_token”, you would add...

    Authorization: Bearer my_api_token
    
...to the header.

## Command line examples

To list your current open packet_accelerators using the token “my_api_token”:

    curl -H “Authorization: Bearer my_api_token” https://api.subspace.com/v1/accelerator
    
Alternately, to get the details of a specific accelerator whose id is 'abcd-ef01-2345':

    curl -H “Authorization: Bearer my_api_token” https://api.subspace.com/v1/accelerator/abcd-ef01-2345

# API Versioning

Subspace will release new versions when we make backwards-incompatible changes to the API. We will give advance notice before releasing a new version or retiring an old version.

Backwards compatible changes:
  * Adding new response attributes
  * Adding new endpoints
  * Adding new methods to an existing endpoint
  * Adding new query string parameters
  * Adding new path parameters
  * Adding new webhook events
  * Adding new streaming endpoints
  * Changing the order of existing response attributes
  
Versions are added to the base url, for example:
  * `https://api.subspace.com/v1`

Current Version is **v1:** `https://api.subspace.com/v1`

## Overview

This is a Bash client script for accessing Subspace Product API service.

The script uses cURL underneath for making all REST calls.

## Usage

```shell
# Make sure the script has executable rights
$ chmod u+x subspace-client.sh

# Print the list of operations available on the service
$ ./subspace-client.sh -h

# Print the service description
$ ./subspace-client.sh --about

# Print detailed information about specific operation
$ ./subspace-client.sh <operationId> -h

# Make GET request
./subspace-client.sh --host http://<hostname>:<port> --accept xml <operationId> <queryParam1>=<value1> <header_key1>:<header_value2>

# Make GET request using arbitrary curl options (must be passed before <operationId>) to an SSL service using username:password
subspace-client.sh -k -sS --tlsv1.2 --host https://<hostname> -u <user>:<password> --accept xml <operationId> <queryParam1>=<value1> <header_key1>:<header_value2>

# Make POST request
$ echo '<body_content>' | subspace-client.sh --host <hostname> --content-type json <operationId> -

# Make POST request with simple JSON content, e.g.:
# {
#   "key1": "value1",
#   "key2": "value2",
#   "key3": 23
# }
$ echo '<body_content>' | subspace-client.sh --host <hostname> --content-type json <operationId> key1==value1 key2=value2 key3:=23 -

# Make POST request with form data
$ subspace-client.sh --host <hostname> <operationId> key1:=value1 key2:=value2 key3:=23

# Preview the cURL command without actually executing it
$ subspace-client.sh --host http://<hostname>:<port> --dry-run <operationid>

```

## Docker image

You can easily create a Docker image containing a preconfigured environment
for using the REST Bash client including working autocompletion and short
welcome message with basic instructions, using the generated Dockerfile:

```shell
docker build -t my-rest-client .
docker run -it my-rest-client
```

By default you will be logged into a Zsh environment which has much more
advanced auto completion, but you can switch to Bash, where basic autocompletion
is also available.

## Shell completion

### Bash

The generated bash-completion script can be either directly loaded to the current Bash session using:

```shell
source subspace-client.sh.bash-completion
```

Alternatively, the script can be copied to the `/etc/bash-completion.d` (or on OSX with Homebrew to `/usr/local/etc/bash-completion.d`):

```shell
sudo cp subspace-client.sh.bash-completion /etc/bash-completion.d/subspace-client.sh
```

#### OS X

On OSX you might need to install bash-completion using Homebrew:

```shell
brew install bash-completion
```

and add the following to the `~/.bashrc`:

```shell
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
```

### Zsh

In Zsh, the generated `_subspace-client.sh` Zsh completion file must be copied to one of the folders under `$FPATH` variable.

## Documentation for API Endpoints

All URIs are relative to **

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*AcceleratorServiceApi* | [**acceleratorServiceCreate**](docs/AcceleratorServiceApi.md#acceleratorservicecreate) | **POST** /v1/accelerator | 
*AcceleratorServiceApi* | [**acceleratorServiceDelete**](docs/AcceleratorServiceApi.md#acceleratorservicedelete) | **DELETE** /v1/accelerator/{id} | 
*AcceleratorServiceApi* | [**acceleratorServiceGet**](docs/AcceleratorServiceApi.md#acceleratorserviceget) | **GET** /v1/accelerator/{id} | 
*AcceleratorServiceApi* | [**acceleratorServiceList**](docs/AcceleratorServiceApi.md#acceleratorservicelist) | **GET** /v1/accelerator | 
*AcceleratorServiceApi* | [**acceleratorServiceUpdate**](docs/AcceleratorServiceApi.md#acceleratorserviceupdate) | **PUT** /v1/accelerator/{id} | 
*SipTeleportServiceApi* | [**sipTeleportServiceCreate**](docs/SipTeleportServiceApi.md#sipteleportservicecreate) | **POST** /v1/sipteleport | 
*SipTeleportServiceApi* | [**sipTeleportServiceDelete**](docs/SipTeleportServiceApi.md#sipteleportservicedelete) | **DELETE** /v1/sipteleport/{id} | 
*SipTeleportServiceApi* | [**sipTeleportServiceGet**](docs/SipTeleportServiceApi.md#sipteleportserviceget) | **GET** /v1/sipteleport/{id} | 
*SipTeleportServiceApi* | [**sipTeleportServiceList**](docs/SipTeleportServiceApi.md#sipteleportservicelist) | **GET** /v1/sipteleport | 
*SipTeleportServiceApi* | [**sipTeleportServiceUpdate**](docs/SipTeleportServiceApi.md#sipteleportserviceupdate) | **PUT** /v1/sipteleport/{id} | 
*WebRtcCdnServiceApi* | [**webRtcCdnServiceGetWebRtcCdn**](docs/WebRtcCdnServiceApi.md#webrtccdnservicegetwebrtccdn) | **POST** /v1/webrtc-cdn | 


## Documentation For Models

 - [Body](docs/Body.md)
 - [Body1](docs/Body1.md)
 - [ProtobufAny](docs/ProtobufAny.md)
 - [V1Accelerator](docs/V1Accelerator.md)
 - [V1CreateSipTeleport](docs/V1CreateSipTeleport.md)
 - [V1ListAcceleratorResponse](docs/V1ListAcceleratorResponse.md)
 - [V1ListSipTeleportResponse](docs/V1ListSipTeleportResponse.md)
 - [V1NextPage](docs/V1NextPage.md)
 - [V1SipTeleportResponse](docs/V1SipTeleportResponse.md)
 - [V1SipTeleportStatus](docs/V1SipTeleportStatus.md)
 - [V1TeleportAddresses](docs/V1TeleportAddresses.md)
 - [V1TransportType](docs/V1TransportType.md)
 - [V1UpdateSipTeleport](docs/V1UpdateSipTeleport.md)
 - [V1WebRtcCdnResponse](docs/V1WebRtcCdnResponse.md)
 - [V1WebRtcCdnServer](docs/V1WebRtcCdnServer.md)


## Documentation For Authorization


## accessCode


- **Type**: OAuth
- **Flow**: application
- **Token URL**: https://id.subspace.com/oauth/token
- **Scopes**:
  - **accelerators:read**: allows reading details about provisioned PacketAccelerators
  - **accelerators:write**: allows administration of PacketAccelerators
  - **console:access**: allows access to the console
  - **sipteleport:read**: allows reading details about provisioned SIPTeleport
  - **sipteleport:write**: allows administration of SIPTeleport
  - **projects:read**: allows reading details about projects
  - **webrtccdn:access**: allows administration of WebRTC-CDN
  - **rtpspeed:read**: allows reading details about rtpspeed
  - **rtpspeed:write**: allows administration of rtpspeed

