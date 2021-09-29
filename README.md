# Subspace Product API Bash client

## Overview

This is a Bash client script for accessing Subspace Product API service.

The script uses cURL underneath for making all REST calls.

The Subspace API is based on REST, has resource-oriented URLs, returns JSON-encoded responses, and returns standardHTTP response codes.

The base URL for the API is `https://api.subspace.com/`

# Naming Convention

* Version name currently in use is: *v1*
  * Example: `https://api.subspace.com/v1`

# Authentication

## API Tokens

Subspace authenticates your API requests using JWT Bearer tokens.  The provided client library requires this JWT to be set before it can be used, by setting the local access token in the local configuration.  This is done by updating the configuration line marked \"YOUR ACCESS TOKEN\" by replacing the text \"YOUR ACCESS TOKEN\" with your JWT Bearer token.

Bearer tokens are granted by requesting one (as noted below) and presenting your publishable (client_id) and secret (client_secret) tokens.

Subspace provides two types of API tokens: publishable (client_id) and secret (client_secret).  These are available in the Subspace console.
  * **Publishable** API tokens (client_id) are meant solely to identify your account with Subspace, they aren’t secret. They can be published in places like your website JavaScript code, or in an iPhone or Android app.
  * **Secret** API tokens (client_secret) should be kept confidential and only stored on your own servers. Your account’s secret API token will allow you to acquire a valid JWT token authorized to perform any API request to Subspace.

## Getting a JWT Bearer Token

Subspace uses auth0 for JWT token management.  You can acquire a JWT token by utilizing `https://id.subspace.com` and following the instructions in the curl example below.

## Protecting Your API Tokens

  * **JWT tokens have a expiration time of 24 hours.**  Once expired, you will have to use your Subspace private API and public token to request a new one.
  * The Subspace private token can be rotated from within the Subspace console.  Rotation may take up to 10 minutes for all systems to update state to invalidate the older token and enable the new one.
* **Keep your secret token safe.** Your secret token can make any API call on behalf of your account, including changes that may impact billing such as enabling pay-as-you-go charges. Do not store your secret token in your version control system. Do not use your secret token outside your web server, such as a browser, mobile app, or distributed file.
  * **You may use the Subspace console to acquire an API token.**
  * **You may use the Subspace console to disable pay-as-you-go.** This may prevent unexpected charges due to unauthorized or abnormal usage.

**Acquiring a valid JWT**

Command line example:
```
curl --request POST
         --url 'https://id.subspace.com/oauth/token'
         --header 'content-type: application/json'
         --data '{ \"client_id\": YOURCLIENTID, \"client_secret\": YOURCLIENTSECRET, \"audience\": \"https://api.subspace.com/\", \"grant_type\": \"client_credentials\" }'
```

## Usage

NOTE: The JWT token needs to be passed in with every call as a header value appended to the ./subspace-client.sh call in the form,
```
Authorization:"Bearer MY_BEARER_TOKEN"
```
Example:
```
$ subspace-client.sh --host https://api.subspace.com:443 acceleratorServiceList Authorization:"Bearer MY_BEARER_TOKEN"
```

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
*GlobalTurnServiceApi* | [**globalTurnServiceGetGlobalTurn**](docs/GlobalTurnServiceApi.md#globalturnservicegetglobalturn) | **POST** /v1/globalturn | 
*ProjectServiceApi* | [**projectServiceCreate**](docs/ProjectServiceApi.md#projectservicecreate) | **POST** /v1/project | 
*ProjectServiceApi* | [**projectServiceGet**](docs/ProjectServiceApi.md#projectserviceget) | **GET** /v1/project/{id} | 
*ProjectServiceApi* | [**projectServiceList**](docs/ProjectServiceApi.md#projectservicelist) | **GET** /v1/project | 
*ProjectServiceApi* | [**projectServiceUpdate**](docs/ProjectServiceApi.md#projectserviceupdate) | **PUT** /v1/project/{id} | 
*SessionServiceApi* | [**sessionServiceList**](docs/SessionServiceApi.md#sessionservicelist) | **GET** /v1/accelerator/{accelerator_id}/session | 
*SipTeleportServiceApi* | [**sipTeleportServiceCreate**](docs/SipTeleportServiceApi.md#sipteleportservicecreate) | **POST** /v1/sipteleport | 
*SipTeleportServiceApi* | [**sipTeleportServiceDelete**](docs/SipTeleportServiceApi.md#sipteleportservicedelete) | **DELETE** /v1/sipteleport/{id} | 
*SipTeleportServiceApi* | [**sipTeleportServiceGet**](docs/SipTeleportServiceApi.md#sipteleportserviceget) | **GET** /v1/sipteleport/{id} | 
*SipTeleportServiceApi* | [**sipTeleportServiceList**](docs/SipTeleportServiceApi.md#sipteleportservicelist) | **GET** /v1/sipteleport | 
*SipTeleportServiceApi* | [**sipTeleportServiceUpdate**](docs/SipTeleportServiceApi.md#sipteleportserviceupdate) | **PUT** /v1/sipteleport/{id} | 


## Documentation For Models

 - [Body](docs/Body.md)
 - [Body1](docs/Body1.md)
 - [ProtobufAny](docs/ProtobufAny.md)
 - [V1Accelerator](docs/V1Accelerator.md)
 - [V1CreateSipTeleport](docs/V1CreateSipTeleport.md)
 - [V1GlobalTurnResponse](docs/V1GlobalTurnResponse.md)
 - [V1GlobalTurnServer](docs/V1GlobalTurnServer.md)
 - [V1ListAcceleratorResponse](docs/V1ListAcceleratorResponse.md)
 - [V1ListProjectsResponse](docs/V1ListProjectsResponse.md)
 - [V1ListSessionsResponse](docs/V1ListSessionsResponse.md)
 - [V1ListSipTeleportResponse](docs/V1ListSipTeleportResponse.md)
 - [V1NextPage](docs/V1NextPage.md)
 - [V1Project](docs/V1Project.md)
 - [V1Session](docs/V1Session.md)
 - [V1SipTeleportResponse](docs/V1SipTeleportResponse.md)
 - [V1SipTeleportStatus](docs/V1SipTeleportStatus.md)
 - [V1TeleportAddresses](docs/V1TeleportAddresses.md)
 - [V1TransportType](docs/V1TransportType.md)
 - [V1UpdateSipTeleport](docs/V1UpdateSipTeleport.md)


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
  - **sessions:read**: allows reading details about PacketAccelerator sessions
  - **projects:read**: allows reading details about projects
  - **projects:write**: allows administration of projects
  - **globalturn:access**: allows administration of GlobalTurn
  - **rtpspeed:read**: allows reading details about rtpspeed
  - **rtpspeed:write**: allows administration of rtpspeed
