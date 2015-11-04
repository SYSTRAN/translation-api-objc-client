#import <Foundation/Foundation.h>
#import "SystranObject.h"

/**
 * NOTE: This class is auto generated by the swagger code generator program.
 * https://github.com/swagger-api/swagger-codegen
 * Do not edit the class manually.
 */

#import "SystranErrorResponse.h"


@protocol SystranBatchCancel
@end

@interface SystranBatchCancel : SystranObject

/* Result of the request [optional]
 */
@property(nonatomic) NSString* status;
/* Error of the request [optional]
 */
@property(nonatomic) SystranErrorResponse* error;

@end
