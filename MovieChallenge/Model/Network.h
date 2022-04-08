//
//  Network.h
//  MovieChallenge
//
//  Created by carl on 4/7/22.
//

#import <Foundation/Foundation.h>

typedef void (^NetworkRequestCompletion)(NSDictionary * _Nullable info, NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface Network : NSObject

+ (void)dataFromURLString:(NSString *)urlString completion:(NetworkRequestCompletion)completion;
+ (NSURL *)libraryDirectoryURL;
+ (NSURL *)cacheURL;

@end

NS_ASSUME_NONNULL_END
