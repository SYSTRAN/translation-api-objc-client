#import <Foundation/Foundation.h>
#import "SystranObject.h"

/**
 * NOTE: This class is auto generated by the swagger code generator program.
 * https://github.com/swagger-api/swagger-codegen
 * Do not edit the class manually.
 */



@protocol SystranTranslationOutput
@end

@interface SystranTranslationOutput : SystranObject

/* Warning at output level [optional]
 */
@property(nonatomic) NSString* warning;
/* Error at output level [optional]
 */
@property(nonatomic) NSString* error;
/* Result of the automatic language detection if `auto` was specified as source language [optional]
 */
@property(nonatomic) NSString* detectedLanguage;
/* Automatic language detection confidence [optional]
 */
@property(nonatomic) NSNumber* detectedLanguageConfidence;
/* Translated text [optional]
 */
@property(nonatomic) NSString* output;
/* Retranslation of output in source language, if backTranslation was specified [optional]
 */
@property(nonatomic) NSString* backTranslation;
/* Source text, if withSource was specified [optional]
 */
@property(nonatomic) NSString* source;

@end
