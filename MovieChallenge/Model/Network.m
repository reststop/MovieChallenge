//
//  Network.m
//  MovieChallenge
//
//  Created by carl on 4/7/22.
//

#import "Network.h"


@interface Network ()

@end


@implementation Network


/**
 *  getURL data from request
 */
+ (void)dataFromURLString:(NSString *)urlString completion:(NetworkRequestCompletion)completion {

    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:5*60];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    configuration.requestCachePolicy = NSURLRequestReturnCacheDataElseLoad;

    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            NSError *jsonError = nil;
            NSDictionary *responseDictionary =
            [NSJSONSerialization JSONObjectWithData:data
                                            options:kNilOptions
                                              error:&jsonError];
            completion(responseDictionary, jsonError);
        } else {
            NSLog(@"An error occurred: %@", error.description);
            completion(nil, error);
        }

    }];
    [task resume];

}


/**
 *  get URL of library directory
 */
+ (NSURL *)libraryDirectoryURL {
    static NSURL *library = nil;
    if (!library) {
        library = [[NSFileManager.defaultManager
                    URLsForDirectory:NSLibraryDirectory
                    inDomains:NSUserDomainMask]
                   firstObject];
    }
    return library;
}


/**
 *  get URL of library directory
 */
+ (NSURL *)cacheURL {
    return [Network.libraryDirectoryURL URLByAppendingPathComponent:@"persistentCache"];
}



@end
