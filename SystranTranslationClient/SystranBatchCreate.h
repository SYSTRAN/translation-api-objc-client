#import <Foundation/Foundation.h>
#import "SystranObject.h"

/**
 * NOTE: This class is auto generated by the swagger code generator program.
 * https://github.com/swagger-api/swagger-codegen
 * Do not edit the class manually.
 */

#import "SystranErrorResponse.h"


@protocol SystranBatchCreate
@end

@interface SystranBatchCreate : SystranObject

/* Identifier of the created batch [optional]
 */
@property(nonatomic) NSString* batchId;
/* Error of the request [optional]
 */
@property(nonatomic) SystranErrorResponse* error;

@end
