# ProjectServiceApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**projectServiceCreate**](ProjectServiceApi.md#projectServiceCreate) | **POST** /v1/projects | 
[**projectServiceGet**](ProjectServiceApi.md#projectServiceGet) | **GET** /v1/projects/{id} | 
[**projectServiceList**](ProjectServiceApi.md#projectServiceList) | **GET** /v1/projects | 
[**projectServiceUpdate**](ProjectServiceApi.md#projectServiceUpdate) | **PUT** /v1/projects/{id} | 



## projectServiceCreate



### Example

```bash
subspace-client.sh projectServiceCreate
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**V1Project**](V1Project.md)

### Authorization

[accessCode](../README.md#accessCode)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## projectServiceGet



### Example

```bash
subspace-client.sh projectServiceGet id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** |  | [default to null]

### Return type

[**V1Project**](V1Project.md)

### Authorization

[accessCode](../README.md#accessCode)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## projectServiceList



### Example

```bash
subspace-client.sh projectServiceList  before=value  limit=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **before** | **string** |  | [optional] [default to null]
 **limit** | **integer** |  | [optional] [default to null]

### Return type

[**V1ListProjectsResponse**](V1ListProjectsResponse.md)

### Authorization

[accessCode](../README.md#accessCode)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## projectServiceUpdate



### Example

```bash
subspace-client.sh projectServiceUpdate id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | id is the project identity | [default to null]

### Return type

[**V1Project**](V1Project.md)

### Authorization

[accessCode](../README.md#accessCode)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

