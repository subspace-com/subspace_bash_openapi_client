# Subspace Product API Bash client

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

