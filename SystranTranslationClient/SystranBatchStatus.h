#import <Foundation/Foundation.h>
#import "SystranObject.h"

/**
 * NOTE: This class is auto generated by the swagger code generator program.
 * https://github.com/swagger-api/swagger-codegen
 * Do not edit the class manually.
 */

#import "SystranBatchRequest.h"
#import "SystranErrorResponse.h"


@protocol SystranBatchStatus
@end

@interface SystranBatchStatus : SystranObject

/* Is the batch cancelled 
 */
@property(nonatomic) NSNumber* cancelled;
/* Is the batch closed 
 */
@property(nonatomic) NSNumber* closed;
/* Creation time of the batch (ms since the Epoch) 
 */
@property(nonatomic) NSNumber* createdAt;
/* Expiration time of the batch (ms since the Epoch). Is null while there are pending requests 
 */
@property(nonatomic) NSNumber* expireAt;
/* Completion time of the batch (ms since the Epoch) 
 */
@property(nonatomic) NSNumber* finishedAt;
/* Array of requests 
 */
@property(nonatomic) NSArray<SystranBatchRequest>* requests;
/* Error of the request [optional]
 */
@property(nonatomic) SystranErrorResponse* error;

@end
