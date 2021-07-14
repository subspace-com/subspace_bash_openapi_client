# SipTeleportServiceApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**sipTeleportServiceCreate**](SipTeleportServiceApi.md#sipTeleportServiceCreate) | **POST** /v1/sip-teleports | CreateSipTeleport
[**sipTeleportServiceDelete**](SipTeleportServiceApi.md#sipTeleportServiceDelete) | **DELETE** /v1/sip-teleports/{id} | DeleteSipTeleport
[**sipTeleportServiceGet**](SipTeleportServiceApi.md#sipTeleportServiceGet) | **GET** /v1/sip-teleports/{id} | GetSipTeleport
[**sipTeleportServiceList**](SipTeleportServiceApi.md#sipTeleportServiceList) | **GET** /v1/sip-teleports | ListSipTeleports
[**sipTeleportServiceUpdate**](SipTeleportServiceApi.md#sipTeleportServiceUpdate) | **PUT** /v1/sip-teleports/{id} | UpdateSipTeleport



## sipTeleportServiceCreate

CreateSipTeleport

CreateSipTeleport creates a new SIP Teleport

### Example

```bash
subspace-client.sh sipTeleportServiceCreate
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**V1SipTeleportResponse**](V1SipTeleportResponse.md)

### Authorization

[accessCode](../README.md#accessCode)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## sipTeleportServiceDelete

DeleteSipTeleport

DeleteSipTeleport deletes an existing SIP Teleport, specified by its id

### Example

```bash
subspace-client.sh sipTeleportServiceDelete id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** |  | [default to null]

### Return type

[**V1SipTeleportResponse**](V1SipTeleportResponse.md)

### Authorization

[accessCode](../README.md#accessCode)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## sipTeleportServiceGet

GetSipTeleport

GetSipTeleport fetches the details of a specific SIP Teleport, specified by its id

### Example

```bash
subspace-client.sh sipTeleportServiceGet id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** |  | [default to null]

### Return type

[**V1SipTeleportResponse**](V1SipTeleportResponse.md)

### Authorization

[accessCode](../README.md#accessCode)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## sipTeleportServiceList

ListSipTeleports

ListSipTeleports lists all SIP Teleports

### Example

```bash
subspace-client.sh sipTeleportServiceList  before=value  limit=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **before** | **string** |  | [optional] [default to null]
 **limit** | **integer** |  | [optional] [default to null]

### Return type

[**V1ListSipTeleportResponse**](V1ListSipTeleportResponse.md)

### Authorization

[accessCode](../README.md#accessCode)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## sipTeleportServiceUpdate

UpdateSipTeleport

UpdateSipTeleport updates an existing SIP Teleport, specified by its id

### Example

```bash
subspace-client.sh sipTeleportServiceUpdate id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** |  | [default to null]

### Return type

[**V1SipTeleportResponse**](V1SipTeleportResponse.md)

### Authorization

[accessCode](../README.md#accessCode)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

