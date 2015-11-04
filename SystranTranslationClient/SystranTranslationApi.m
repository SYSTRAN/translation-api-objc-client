#import "SystranTranslationApi.h"
#import "SystranQueryParamCollection.h"
#import "SystranBatchCancel.h"
#import "SystranBatchClose.h"
#import "SystranBatchCreate.h"
#import "SystranBatchStatus.h"
#import "SystranTranslationCancel.h"
#import "SystranTranslationFileResponse.h"
#import "SystranTranslationStatus.h"
#import "SystranProfilesResponse.h"
#import "SystranSupportedLanguageResponse.h"
#import "SystranTranslationResponse.h"


@interface SystranTranslationApi ()
    @property (readwrite, nonatomic, strong) NSMutableDictionary *defaultHeaders;
@end

@implementation SystranTranslationApi

static SystranTranslationApi* singletonAPI = nil;

#pragma mark - Initialize methods

- (id) init {
    self = [super init];
    if (self) {
        SystranConfiguration *config = [SystranConfiguration sharedConfig];
        if (config.apiClient == nil) {
            config.apiClient = [[SystranApiClient alloc] init];
        }
        self.apiClient = config.apiClient;
        self.defaultHeaders = [NSMutableDictionary dictionary];
    }
    return self;
}

- (id) initWithApiClient:(SystranApiClient *)apiClient {
    self = [super init];
    if (self) {
        self.apiClient = apiClient;
        self.defaultHeaders = [NSMutableDictionary dictionary];
    }
    return self;
}

#pragma mark -

+(SystranTranslationApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key {

    if (singletonAPI == nil) {
        singletonAPI = [[SystranTranslationApi alloc] init];
        [singletonAPI addHeader:headerValue forKey:key];
    }
    return singletonAPI;
}

+(SystranTranslationApi*) sharedAPI {

    if (singletonAPI == nil) {
        singletonAPI = [[SystranTranslationApi alloc] init];
    }
    return singletonAPI;
}

-(void) addHeader:(NSString*)value forKey:(NSString*)key {
    [self.defaultHeaders setValue:value forKey:key];
}

-(void) setHeaderValue:(NSString*) value
           forKey:(NSString*)key {
    [self.defaultHeaders setValue:value forKey:key];
}

-(unsigned long) requestQueueSize {
    return [SystranApiClient requestQueueSize];
}

#pragma mark - Api Methods

///
/// Batch Cancel
/// Cancel a translation batch
///  @param batchId Batch Identifier
///
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranBatchCancel*
///
-(NSNumber*) translationFileBatchCancelPostWithCompletionBlock: (NSString*) batchId
         callback: (NSString*) callback
        
        completionHandler: (void (^)(SystranBatchCancel* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'batchId' is set
    if (batchId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `batchId` when calling `translationFileBatchCancelPost`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/translation/file/batch/cancel"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(batchId != nil) {
        
        queryParams[@"batchId"] = batchId;
    }
    if(callback != nil) {
        
        queryParams[@"callback"] = callback;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SystranApiClient selectHeaderAccept:@[@"application/json"]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"application/json";
    }

    // request content type
    NSString *requestContentType = [SystranApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[@"accessToken", @"apiKey"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"POST"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"SystranBatchCancel*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((SystranBatchCancel*)data, error);
              }
          ];
}

///
/// Batch Close
/// Close a translation batch
///  @param batchId Batch Identifier
///
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranBatchClose*
///
-(NSNumber*) translationFileBatchClosePostWithCompletionBlock: (NSString*) batchId
         callback: (NSString*) callback
        
        completionHandler: (void (^)(SystranBatchClose* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'batchId' is set
    if (batchId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `batchId` when calling `translationFileBatchClosePost`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/translation/file/batch/close"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(batchId != nil) {
        
        queryParams[@"batchId"] = batchId;
    }
    if(callback != nil) {
        
        queryParams[@"callback"] = callback;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SystranApiClient selectHeaderAccept:@[@"application/json"]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"application/json";
    }

    // request content type
    NSString *requestContentType = [SystranApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[@"accessToken", @"apiKey"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"POST"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"SystranBatchClose*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((SystranBatchClose*)data, error);
              }
          ];
}

///
/// Batch Create
/// Create a new translation batch
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranBatchCreate*
///
-(NSNumber*) translationFileBatchCreatePostWithCompletionBlock: (NSString*) callback
        
        completionHandler: (void (^)(SystranBatchCreate* output, NSError* error))completionBlock { 
        

    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/translation/file/batch/create"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(callback != nil) {
        
        queryParams[@"callback"] = callback;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SystranApiClient selectHeaderAccept:@[@"application/json"]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SystranApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[@"accessToken", @"apiKey"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"POST"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"SystranBatchCreate*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((SystranBatchCreate*)data, error);
              }
          ];
}

///
/// Batch Status
/// Get the status of a translation batch
///  @param batchId Batch Identifier
///
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranBatchStatus*
///
-(NSNumber*) translationFileBatchStatusGetWithCompletionBlock: (NSString*) batchId
         callback: (NSString*) callback
        
        completionHandler: (void (^)(SystranBatchStatus* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'batchId' is set
    if (batchId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `batchId` when calling `translationFileBatchStatusGet`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/translation/file/batch/status"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(batchId != nil) {
        
        queryParams[@"batchId"] = batchId;
    }
    if(callback != nil) {
        
        queryParams[@"callback"] = callback;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SystranApiClient selectHeaderAccept:@[@"application/json"]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SystranApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[@"accessToken", @"apiKey"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"GET"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"SystranBatchStatus*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((SystranBatchStatus*)data, error);
              }
          ];
}

///
/// Translate Cancel
/// Cancel an asynchronous translation request
///  @param requestId Request Identifier
///
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranTranslationCancel*
///
-(NSNumber*) translationFileCancelPostWithCompletionBlock: (NSString*) requestId
         callback: (NSString*) callback
        
        completionHandler: (void (^)(SystranTranslationCancel* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'requestId' is set
    if (requestId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `requestId` when calling `translationFileCancelPost`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/translation/file/cancel"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(requestId != nil) {
        
        queryParams[@"requestId"] = requestId;
    }
    if(callback != nil) {
        
        queryParams[@"callback"] = callback;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SystranApiClient selectHeaderAccept:@[@"application/json"]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"application/json";
    }

    // request content type
    NSString *requestContentType = [SystranApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[@"accessToken", @"apiKey"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"POST"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"SystranTranslationCancel*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((SystranTranslationCancel*)data, error);
              }
          ];
}

///
/// Translate Result
/// Get the result of an asynchronous translation request\n\nDepending on the initial request, the response can have multiple formats:\n  * The **translated document**, directly, if `source` parameters was not `auto` and `withSource` was not true\n  * A `multipart/mixed` document with the following parts:\n\n    1. **Detected language**, if request was done with `auto` source language\n\n      * Header:\n\n        `part-name: detectedLanguage`\n\n      * Body: JSON document\n        ```\n        {\n          detectedLanguage: \"string\"\n          detectedLanguageConfidence : number\n        }\n        ```\n\n    2. **Source document**, if request was done with `withSource`:\n\n      * Header: `part-name: source`\n      * Body: Source document\n\n    3. **Translated document**\n\n      * Header: `part-name: output`\n\n      * Body: Translated document\n\nAn error can occur in the following cases:\n* Invalid request ID\n* No result available (see request status for more information)\n* Unable to retrieve the result\n* ...
///  @param requestId Request Identifier
///
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranTranslationFileResponse*
///
-(NSNumber*) translationFileResultGetWithCompletionBlock: (NSString*) requestId
         callback: (NSString*) callback
        
        completionHandler: (void (^)(NSString* output, NSError* error))completionBlock {
        

    
    // verify the required parameter 'requestId' is set
    if (requestId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `requestId` when calling `translationFileResultGet`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/translation/file/result"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(requestId != nil) {
        
        queryParams[@"requestId"] = requestId;
    }
    if(callback != nil) {
        
        queryParams[@"callback"] = callback;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SystranApiClient selectHeaderAccept:@[@"application/json", @"multipart/mixed", @"*/*"]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }


    // request content type
    NSString *requestContentType =  @"application/json";

    // Authentication setting
    NSArray *authSettings = @[@"accessToken", @"apiKey"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"GET"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"NSString*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock(data, error);
              }
          ];
}

///
/// Translate Status
/// Get the status of an asynchronous translation request\n\nThe translation result is available when the value of the status field is `finished`.\n\nThe translation request is unsuccessful when the value of the status field is `error`.
///  @param requestId Request Identifier
///
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranTranslationStatus*
///
-(NSNumber*) translationFileStatusGetWithCompletionBlock: (NSString*) requestId
         callback: (NSString*) callback
        
        completionHandler: (void (^)(SystranTranslationStatus* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'requestId' is set
    if (requestId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `requestId` when calling `translationFileStatusGet`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/translation/file/status"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(requestId != nil) {
        
        queryParams[@"requestId"] = requestId;
    }
    if(callback != nil) {
        
        queryParams[@"callback"] = callback;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Content-Type"] = @"application/json";
    headerParams[@"Accept"] = [SystranApiClient selectHeaderAccept:@[@"application/json", @"multipart/mixed", @"*/*"]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"application/json";
    }

    // request content type
    NSString *requestContentType = [SystranApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[@"accessToken", @"apiKey"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"GET"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"SystranTranslationStatus*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((SystranTranslationStatus*)data, error);
              }
          ];
}

///
/// Translate File
/// Translate a file from source language to target language\n\n\n* In asynchronous mode (async=true), the response will be a JSON containing a request identifier. This identifier can then be used to poll the request status and its result when completed.\n\n  ```\n  {\n     \"requestId\": \"54a3d860e62ea467b136eddb\" /* Request identifier to use to get the status,\n                                                the result of the request and to cancel it */\n     \"error\": {\n       \"message\": \"\" /* Error at request level */\n       \"info\": {}\n     }\n  }\n  ```\n\n* In synchronous mode, the response will be either:\n\n  * The **translated document**, directly, if `source` parameters was not `auto` and `withSource` was not true\n  * A `multipart/mixed` document with the following parts:\n\n    1. **Detected language**, if request was done with `auto` source language\n\n      * Header:\n\n        `part-name: detectedLanguage`\n\n      * Body: JSON document\n        ```\n        {\n          detectedLanguage: \"string\"\n          detectedLanguageConfidence : number\n        }\n        ```\n\n    2. **Source document**, if request was done with `withSource`:\n\n      * Header: `part-name: source`\n      * Body: Source document\n\n    3. **Translated document**\n\n      * Header: `part-name: output`\n\n      * Body: Translated document
///  @param input Input file
///
///  @param target Target language code ([details](#description_langage_code_values))
///
///  @param source Source language code ([details](#description_langage_code_values)) or `auto`.\n\nWhen the value is set to `auto`, the language will be automatically detected, used to enhance the translation, and returned in output.
///
///  @param format Format of the source text.\n\nValid values are `text` for plain text, `html` for HTML pages and `auto` for automatic detection.\n\nThe MIME type of file formats supported by SYSTRAN can also be used, the valid types are:\n- application/xhtml+xml\n- application/x-systran-exchange+xml\n- application/x-systran-internal+xml\n- application/x-gettext\n- application/x-tmx+xml\n- application/vnd.android.string-resource+xml\n- application/vnd.jquery.globalize+json\n- application/vnd.microsoft.net.resx+xml\n- application/vnd.openxmlformats\n- application/vnd.oasis.opendocument\n- application/vnd.oasis.opendocument+xml\n- application/vnd.openxmlformats-officedocument.wordprocessingml.document\n- application/vnd.qt.ts+xml\n- application/vnd.systran.document+json\n- application/vnd.systran.i18n+json\n- text/bitext\n- text/html\n- text/plain\n- text/rtf\n- text/x-java-properties\n- xml/xliff\n- xml/xliff2
///
///  @param profile Profile id
///
///  @param withSource If `true`, the source will also be sent back in the response message. It can be useful when used with the withAnnotations option to align the source document with the translated document
///
///  @param withAnnotations If `true`, different annotations will be provided in the translated document. If the option 'withSource' is used, the annotations will also be provided in the source document. It will provide segments, tokens, not found words,...
///
///  @param withDictionary User Dictionary or/and Normalization Dictionary ids to be applied to the translation result. Each dictionary 'id' has to be separated by a comma.
///
///  @param withCorpus Corpus to be applied to the translation result. Each corpus 'id' has to be separated by a comma.
///
///  @param options Additional options.\n\nAn option can be a JSON object containing a set of key/value generic options supported by the translator. It can also be a string with the syntax '<key>:<value>' to pass a key/value generic option to the translator.
///
///  @param encoding Encoding. `base64` can be useful to send binary documents in the JSON body. Please note that another alternative is to use translateFile
///
///  @param async If `true`, the translation is performed asynchronously.\n\nThe \"/translation/file/status\" service must be used to wait for the completion of the request and the \"/translation/file/result\" service must be used to get the final result. The \"/translation/file/cancel\" can be used to cancel the request.
///
///  @param batchId Batch Identifier
///
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranTranslationFileResponse*
///
-(NSNumber*) translationFileTranslatePostWithCompletionBlock: (NSURL*) input
         target: (NSString*) target
         source: (NSString*) source
         format: (NSString*) format
         profile: (NSNumber*) profile
         withSource: (NSNumber*) withSource
         withAnnotations: (NSNumber*) withAnnotations
         withDictionary: (NSString*) withDictionary
         withCorpus: (NSString*) withCorpus
         options: (NSArray* /* NSString */) options
         encoding: (NSString*) encoding
         async: (NSNumber*) async
         batchId: (NSString*) batchId
         callback: (NSString*) callback
        
        completionHandler: (void (^)(SystranTranslationFileResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'input' is set
    if (input == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `input` when calling `translationFileTranslatePost`"];
    }
    
    // verify the required parameter 'target' is set
    if (target == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `target` when calling `translationFileTranslatePost`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/translation/file/translate"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(source != nil) {
        
        queryParams[@"source"] = source;
    }
    if(target != nil) {
        
        queryParams[@"target"] = target;
    }
    if(format != nil) {
        
        queryParams[@"format"] = format;
    }
    if(profile != nil) {
        
        queryParams[@"profile"] = profile;
    }
    if(withSource != nil) {
        
        queryParams[@"withSource"] = withSource;
    }
    if(withAnnotations != nil) {
        
        queryParams[@"withAnnotations"] = withAnnotations;
    }
    if(withDictionary != nil) {
        
        queryParams[@"withDictionary"] = withDictionary;
    }
    if(withCorpus != nil) {
        
        queryParams[@"withCorpus"] = withCorpus;
    }
    if(options != nil) {
        
        queryParams[@"options"] = [[SystranQueryParamCollection alloc] initWithValuesAndFormat: options format: @"multi"];
        
        
    }
    if(encoding != nil) {
        
        queryParams[@"encoding"] = encoding;
    }
    if(async != nil) {
        
        queryParams[@"async"] = async ? @"true" : @"false";
    }
    if(batchId != nil) {
        
        queryParams[@"batchId"] = batchId;
    }
    if(callback != nil) {
        
        queryParams[@"callback"] = callback;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SystranApiClient selectHeaderAccept:@[@"application/json", @"multipart/mixed", @"*/*"]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"application/json";
    }

    // request content type
    NSString *requestContentType = [SystranApiClient selectHeaderContentType:@[@"multipart/form-data", @"application/x-www-form-urlencoded", @"*/*"]];

    // Authentication setting
    NSArray *authSettings = @[@"accessToken", @"apiKey"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    
    files[@"input"] = input;
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"POST"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"SystranTranslationFileResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((SystranTranslationFileResponse*)data, error);
              }
          ];
}

///
/// List of profiles
/// List of profiles available for translation.
///  @param source Source language code of the profile
///
///  @param target Target Language code of the profile
///
///  @param _id Identifier of the profile
///
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranProfilesResponse*
///
-(NSNumber*) translationProfileGetWithCompletionBlock: (NSString*) source
         target: (NSString*) target
         _id: (NSArray* /* NSNumber */) _id
         callback: (NSString*) callback
        
        completionHandler: (void (^)(SystranProfilesResponse* output, NSError* error))completionBlock { 
        

    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/translation/profile"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(source != nil) {
        
        queryParams[@"source"] = source;
    }
    if(target != nil) {
        
        queryParams[@"target"] = target;
    }
    if(_id != nil) {
        
        queryParams[@"id"] = [[SystranQueryParamCollection alloc] initWithValuesAndFormat: _id format: @"multi"];
        
        
    }
    if(callback != nil) {
        
        queryParams[@"callback"] = callback;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SystranApiClient selectHeaderAccept:@[@"application/json"]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"application/json";
    }

    // request content type
    NSString *requestContentType = [SystranApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[@"accessToken", @"apiKey"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"GET"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"SystranProfilesResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((SystranProfilesResponse*)data, error);
              }
          ];
}

///
/// Supported Languages
/// List of language pairs in which translation is supported.\n\nThis list can be limited to a specific source language or target language.
///  @param source Language code of the source text
///
///  @param target Language code into which to translate the source text
///
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranSupportedLanguageResponse*
///
-(NSNumber*) translationSupportedLanguagesGetWithCompletionBlock: (NSArray* /* NSString */) source
         target: (NSArray* /* NSString */) target
         callback: (NSString*) callback
        
        completionHandler: (void (^)(SystranSupportedLanguageResponse* output, NSError* error))completionBlock { 
        

    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/translation/supportedLanguages"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(source != nil) {
        
        queryParams[@"source"] = [[SystranQueryParamCollection alloc] initWithValuesAndFormat: source format: @"multi"];
        
        
    }
    if(target != nil) {
        
        queryParams[@"target"] = [[SystranQueryParamCollection alloc] initWithValuesAndFormat: target format: @"multi"];
        
        
    }
    if(callback != nil) {
        
        queryParams[@"callback"] = callback;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SystranApiClient selectHeaderAccept:@[@"application/json"]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"application/json";
    }

    // request content type
    NSString *requestContentType = [SystranApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[@"accessToken", @"apiKey"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"GET"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"SystranSupportedLanguageResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((SystranSupportedLanguageResponse*)data, error);
              }
          ];
}

///
/// Translate
/// Translate text from source language to target language
///  @param input Input text (this parameter can be repeated)
///
///  @param target Target language code ([details](#description_langage_code_values))
///
///  @param source Source language code ([details](#description_langage_code_values)) or `auto`.\n\nWhen the value is set to `auto`, the language will be automatically detected, used to enhance the translation, and returned in output.
///
///  @param format Format of the source text.\n\nValid values are `text` for plain text, `html` for HTML pages and `auto` for automatic detection.\n\nThe MIME type of file formats supported by SYSTRAN can also be used, the valid types are:\n- application/xhtml+xml\n- application/x-systran-exchange+xml\n- application/x-systran-internal+xml\n- application/x-gettext\n- application/x-tmx+xml\n- application/vnd.android.string-resource+xml\n- application/vnd.jquery.globalize+json\n- application/vnd.microsoft.net.resx+xml\n- application/vnd.openxmlformats\n- application/vnd.oasis.opendocument\n- application/vnd.oasis.opendocument+xml\n- application/vnd.openxmlformats-officedocument.wordprocessingml.document\n- application/vnd.qt.ts+xml\n- application/vnd.systran.document+json\n- application/vnd.systran.i18n+json\n- text/bitext\n- text/html\n- text/plain\n- text/rtf\n- text/x-java-properties\n- xml/xliff\n- xml/xliff2
///
///  @param profile Profile id
///
///  @param withSource If `true`, the source will also be sent back in the response message. It can be useful when used with the withAnnotations option to align the source document with the translated document
///
///  @param withAnnotations If `true`, different annotations will be provided in the translated document. If the option 'withSource' is used, the annotations will also be provided in the source document. It will provide segments, tokens, not found words,...
///
///  @param withDictionary User Dictionary or/and Normalization Dictionary ids to be applied to the translation result. Each dictionary 'id' has to be separated by a comma.
///
///  @param withCorpus Corpus to be applied to the translation result. Each corpus 'id' has to be separated by a comma.
///
///  @param backTranslation If `true`, the translated text will be translated back in source language
///
///  @param options Additional options.\n\nAn option can be a JSON object containing a set of key/value generic options supported by the translator. It can also be a string with the syntax '<key>:<value>' to pass a key/value generic option to the translator.
///
///  @param encoding Encoding. `base64` can be useful to send binary documents in the JSON body. Please note that another alternative is to use translateFile
///
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranTranslationResponse*
///
-(NSNumber*) translationTextTranslatePostWithCompletionBlock: (NSString*) input
         target: (NSString*) target
         source: (NSString*) source
         format: (NSString*) format
         profile: (NSNumber*) profile
         withSource: (NSNumber*) withSource
         withAnnotations: (NSNumber*) withAnnotations
         withDictionary: (NSString*) withDictionary
         withCorpus: (NSString*) withCorpus
         backTranslation: (NSNumber*) backTranslation
         options: (NSArray* /* NSString */) options
         encoding: (NSString*) encoding
         callback: (NSString*) callback
        
        completionHandler: (void (^)(SystranTranslationResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'input' is set
    if (input == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `input` when calling `translationTextTranslatePost`"];
    }
    
    // verify the required parameter 'target' is set
    if (target == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `target` when calling `translationTextTranslatePost`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/translation/text/translate"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(input != nil) {
        
        queryParams[@"input"] = input;
        
        
    }
    if(source != nil) {
        
        queryParams[@"source"] = source;
    }
    if(target != nil) {
        
        queryParams[@"target"] = target;
    }
    if(format != nil) {
        
        queryParams[@"format"] = format;
    }
    if(profile != nil) {
        
        queryParams[@"profile"] = profile;
    }
    if(withSource != nil) {
        
        queryParams[@"withSource"] = withSource;
    }
    if(withAnnotations != nil) {
        
        queryParams[@"withAnnotations"] = withAnnotations;
    }
    if(withDictionary != nil) {
        
        queryParams[@"withDictionary"] = withDictionary;
    }
    if(withCorpus != nil) {
        
        queryParams[@"withCorpus"] = withCorpus;
    }
    if(backTranslation != nil) {
        
        queryParams[@"backTranslation"] = backTranslation;
    }
    if(options != nil) {
        
        queryParams[@"options"] = [[SystranQueryParamCollection alloc] initWithValuesAndFormat: options format: @"multi"];
        
        
    }
    if(encoding != nil) {
        
        queryParams[@"encoding"] = encoding;
    }
    if(callback != nil) {
        
        queryParams[@"callback"] = callback;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SystranApiClient selectHeaderAccept:@[@"application/json"]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"application/json";
    }

    // request content type
    NSString *requestContentType = [SystranApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[@"accessToken", @"apiKey"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"POST"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"SystranTranslationResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((SystranTranslationResponse*)data, error);
              }
          ];
}



@end
