#import <Foundation/Foundation.h>
#import "SystranObject.h"

/**
 * NOTE: This class is auto generated by the swagger code generator program.
 * https://github.com/swagger-api/swagger-codegen
 * Do not edit the class manually.
 */

#import "SystranErrorResponse.h"


@protocol SystranTranslationFileResponse
@end

@interface SystranTranslationFileResponse : SystranObject

/* Warning at request level [optional]
 */
@property(nonatomic) NSString* warning;
/* Error at request level [optional]
 */
@property(nonatomic) SystranErrorResponse* error;
/* Request identifier to use to get the status, the result of the request and to cancel it in asynchronous mode [optional]
 */
@property(nonatomic) NSString* requestId;

@end
