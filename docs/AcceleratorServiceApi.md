# AcceleratorServiceApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**acceleratorServiceCreate**](AcceleratorServiceApi.md#acceleratorServiceCreate) | **POST** /v1/accelerator | 
[**acceleratorServiceDelete**](AcceleratorServiceApi.md#acceleratorServiceDelete) | **DELETE** /v1/accelerator/{id} | 
[**acceleratorServiceGet**](AcceleratorServiceApi.md#acceleratorServiceGet) | **GET** /v1/accelerator/{id} | 
[**acceleratorServiceList**](AcceleratorServiceApi.md#acceleratorServiceList) | **GET** /v1/accelerator | 
[**acceleratorServiceUpdate**](AcceleratorServiceApi.md#acceleratorServiceUpdate) | **PUT** /v1/accelerator/{id} | 



## acceleratorServiceCreate



### Example

```bash
subspace-client.sh acceleratorServiceCreate Idempotency-Key:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Body**](Body.md) | Required parameters to create a new PacketAccelerator. |
 **idempotencyKey** | **string** | Value is the returned etag of a get request.  If a retry sends an Idempotency-Key that has been seen before, the existing accelerator is returned with the status code of 200 | [optional] [default to null]

### Return type

[**V1Accelerator**](V1Accelerator.md)

### Authorization

[accessCode](../README.md#accessCode)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## acceleratorServiceDelete



### Example

```bash
subspace-client.sh acceleratorServiceDelete id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** |  | [default to null]

### Return type

**map**

### Authorization

[accessCode](../README.md#accessCode)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## acceleratorServiceGet



### Example

```bash
subspace-client.sh acceleratorServiceGet id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** |  | [default to null]

### Return type

[**V1Accelerator**](V1Accelerator.md)

### Authorization

[accessCode](../README.md#accessCode)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## acceleratorServiceList



### Example

```bash
subspace-client.sh acceleratorServiceList  before=value  limit=value  name=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **before** | **string** |  | [optional] [default to null]
 **limit** | **integer** |  | [optional] [default to null]
 **name** | **string** |  | [optional] [default to null]

### Return type

[**V1ListAcceleratorResponse**](V1ListAcceleratorResponse.md)

### Authorization

[accessCode](../README.md#accessCode)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## acceleratorServiceUpdate



### Example

```bash
subspace-client.sh acceleratorServiceUpdate id=value If-Match:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** |  | [default to null]
 **body1** | [**Body1**](Body1.md) | Parameters to update an existing PacketAccelerator |
 **ifMatch** | **integer** |  | [optional] [default to null]

### Return type

[**V1Accelerator**](V1Accelerator.md)

### Authorization

[accessCode](../README.md#accessCode)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

