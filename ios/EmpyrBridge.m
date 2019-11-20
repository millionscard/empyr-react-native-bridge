#import "React/RCTBridgeModule.h"
@interface RCT_EXTERN_MODULE(EmpyrBridge, NSObject)
RCT_EXTERN_METHOD(initialize:(NSString)clientId)
RCT_EXTERN_METHOD(track: (nonnull NSNumber)offerId withTracker:(NSString)tracker)
@end
