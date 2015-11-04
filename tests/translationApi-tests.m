
#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "SystranApiClient.h"
#import "SystranConfiguration.h"
#import "SystranTranslationApi.h"
@interface translationApi_tests : XCTestCase {
    NSString *key;
    SystranConfiguration *configuration;
    SystranTranslationApi *translationApi;
    
    NSString* sample;
    NSData* data;
    NSURL *file;
}

@end

@implementation translationApi_tests


- (void)setUp {
    NSString *path = @"<API_KEY_FILE_PATH_HERE>";
    key = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    [[SystranConfiguration sharedConfig] setApiKey:key forApiKeyIdentifier:@"key"];
    [[SystranConfiguration sharedConfig] setHost:@"https://platform.systran.net:8904"];
    
   translationApi = [[SystranTranslationApi alloc]init];
    
    sample = @"The quick brown fox jumps over the lazy dog";
    data = [sample dataUsingEncoding:NSUTF8StringEncoding];
    path = @"SAMPLE_TEXT_FILE_PATH_HERE";
    file = [[NSURL alloc] initFileURLWithPath:path];
    
}

- (void)testKey {
    XCTAssertNotNil(key, @"Pass");
}

- (void)testSupportedLanguages {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"translationSupportedLanguages"];
    [translationApi translationSupportedLanguagesGetWithCompletionBlock:nil target:nil callback:nil completionHandler:^(SystranSupportedLanguageResponse *output, NSError *error) {
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to fetch supported languages");
        }
        else {
            NSLog(@"%@",output);
            XCTAssertNotNil(output, @"Pass");
            [expectation fulfill];
        }
    }];
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}


- (void)testProfileGet {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"GetProfiles"];
    [translationApi translationProfileGetWithCompletionBlock:nil target:nil _id:nil callback:nil completionHandler:^(SystranProfilesResponse *output, NSError *error) {
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to fetch profiles");
        }
        else {
            XCTAssertNotNil(output, @"Pass");
            [expectation fulfill];
        }
    }];
    [self waitForExpectationsWithTimeout:20.0 handler:nil];
}





- (void)testTranslateFileGet {
    
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"translateFile"];
    [translationApi translationFileTranslatePostWithCompletionBlock:file target:@"fr" source:@"en" format:nil profile:nil withSource:false withAnnotations:false withDictionary:false withCorpus:false options:nil encoding:nil async:[NSNumber numberWithInteger:1] batchId:nil callback:nil completionHandler:^(SystranTranslationFileResponse *output, NSError *error) {
        
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to translate file");
        }
        else {
            XCTAssertNotNil(output, @"Pass");
            [expectation fulfill];
        }
    }];
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}

- (void)testTranslateGet {
    
    NSArray *tmp = @[@"this is a test"];
    //format:nil profile:nil withSource:nil withAnnotations:nil withDictionary:nil backTranslation:nil options:nil encoding:nil async:false callback:nil
    XCTestExpectation *expectation = [self expectationWithDescription:@"Translate"];
    
    [translationApi translationTextTranslatePostWithCompletionBlock:@"this is a test" target:@"en" source:@"fr" format:nil profile:nil withSource:false withAnnotations:false withDictionary:false withCorpus:false backTranslation:false options:nil encoding:nil callback:nil completionHandler:^(SystranTranslationResponse *output, NSError *error) {
        
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to translate");
        }
        else {
            XCTAssertNotNil(output, @"Pass");
            [expectation fulfill];
        }
    }];
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}

- (void)testTranslationStatusGet {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"Translate"];
    [translationApi translationFileTranslatePostWithCompletionBlock:file target:@"fr" source:@"en" format:nil profile:nil withSource:false withAnnotations:false withDictionary:false withCorpus:false options:nil encoding:nil async:[NSNumber numberWithInteger:1] batchId:nil callback:nil completionHandler:^(SystranTranslationFileResponse *output, NSError *error) {
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to get translation id");
        }
        else {
            [translationApi translationFileStatusGetWithCompletionBlock:[output requestId] callback:nil completionHandler:^(SystranTranslationStatus *output, NSError *error) {
                if(error) {
                    XCTFail(@"got error %@", error);
                }
                if(output == nil){
                    XCTFail(@"failed to get translation status");
                }
                else {
                    XCTAssertNotNil(output, @"Pass");
                    [expectation fulfill];
                }
            }];
            
        }
    }];
    
    [self waitForExpectationsWithTimeout:30.0 handler:nil];
}


- (void)testTranslationCancel {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"CancelTranslation"];
    
    [translationApi translationFileTranslatePostWithCompletionBlock:file target:@"fr" source:@"en" format:nil profile:nil withSource:false withAnnotations:false withDictionary:false withCorpus:false options:nil encoding:nil async:[NSNumber numberWithInteger:1] batchId:nil callback:nil completionHandler:^(SystranTranslationFileResponse *output, NSError *error) {
        
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to translate file");
        }
        else {
            NSLog(@"%@",[output requestId]);
            
            [translationApi translationFileCancelPostWithCompletionBlock:[output requestId] callback:nil completionHandler:^(SystranTranslationCancel *output, NSError *error) {
                if(error) {
                    XCTFail(@"got error %@", error);
                }
                if(output == nil){
                    XCTFail(@"failed to cancel translation");
                }
                else {
                    XCTAssertNotNil(output, @"Pass");
                    [expectation fulfill];
                }
            }];
        }
    }];
    
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}

- (void)testTranslationResult {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"TranslationResult"];
    [translationApi translationFileTranslatePostWithCompletionBlock:file target:@"fr" source:@"en" format:nil profile:nil withSource:false withAnnotations:false withDictionary:false withCorpus:false options:nil encoding:nil async:[NSNumber numberWithInteger:1] batchId:nil callback:nil completionHandler:^(SystranTranslationFileResponse *output, NSError *error) {
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to translate file");
        }
        else{
            
            [translationApi translationFileResultGetWithCompletionBlock:[output requestId] callback:nil completionHandler:^(NSString *output, NSError *error){
                if(error) {
                    XCTFail(@"got error %@", error);
                }
                if(output == nil){
                    XCTFail(@"failed to fetch results");
                }
                else {
                    NSLog(@"%@",output);
                    XCTAssertNotNil(output, @"Pass");
                    [expectation fulfill];
                }
            }];
        }
    }];
    
    [self waitForExpectationsWithTimeout:30.0 handler:nil];
}


@end
