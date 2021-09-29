# SessionServiceApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**sessionServiceList**](SessionServiceApi.md#sessionServiceList) | **GET** /v1/accelerator/{accelerator_id}/session | 



## sessionServiceList



### Example

```bash
subspace-client.sh sessionServiceList accelerator_id=value  before=value  limit=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **acceleratorId** | **string** |  | [default to null]
 **before** | **string** |  | [optional] [default to null]
 **limit** | **integer** |  | [optional] [default to null]

### Return type

[**V1ListSessionsResponse**](V1ListSessionsResponse.md)

### Authorization

[accessCode](../README.md#accessCode)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

