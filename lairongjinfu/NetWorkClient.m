//
//  NetWorkClient.m
//  Shove
//
//  Created by 李小斌 on 14-9-22.
//  Copyright (c) 2014年 EIMS. All rights reserved.
//

#import "NetWorkClient.h"
#import "NetWorkConfig.h"
#import <SystemConfiguration/SystemConfiguration.h>

@interface NetWorkClient ()

@property (nonatomic, strong) NSURLSessionDataTask *dataTask;

@end

@implementation NetWorkClient

+(instancetype)defaultClient{
    static NetWorkClient *defaultClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultClient = [[self alloc] init];
    });
    return defaultClient;
}

- (instancetype)init
{
    self = [super initWithBaseURL:[NSURL URLWithString:Baseurl]];
    if (self) {
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        self.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    }
    return self;
}

- (NSURLSessionDataTask *) requestGet:(NSString *)URLString withParameters:(NSDictionary *)parameters
{
    NSString *restUrl = [ShoveGeneralRestGateway buildUrl:URLString key:MD5key parameters:parameters];
    
    if (![self isNetworkEnabled]) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(networkError)]) {
            [self.delegate networkError];
        }
    }else
    {
        if (self.delegate && [self.delegate respondsToSelector:@selector(startRequest)]) {
            [self.delegate startRequest];
        }
        _dataTask = [self GET:restUrl parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (self.delegate && [self.delegate respondsToSelector:@selector(httpResponseSuccess:dataTask:didSuccessWithObject:)]) {
                [self.delegate httpResponseSuccess:self dataTask:task didSuccessWithObject:responseObject];
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (self.delegate && [self.delegate respondsToSelector:@selector(httpResponseSuccess:dataTask:didSuccessWithObject:)]) {
                [self.delegate httpResponseFailure:self dataTask:task didFailWithError:error];
            }
        }];
    }
    return _dataTask;
}

//-判断当前网络是否可用
-(BOOL) isNetworkEnabled
{
    BOOL bEnabled = FALSE;
    NSString *url = @"www.baidu.com";
    SCNetworkReachabilityRef ref = SCNetworkReachabilityCreateWithName(NULL, [url UTF8String]);
    SCNetworkReachabilityFlags flags;
    
    bEnabled = SCNetworkReachabilityGetFlags(ref, &flags);
    
    CFRelease(ref);
    if (bEnabled) {
        BOOL flagsReachable = ((flags & kSCNetworkFlagsReachable) != 0);
        BOOL connectionRequired = ((flags & kSCNetworkFlagsConnectionRequired) != 0);
        BOOL nonWiFi = flags & kSCNetworkReachabilityFlagsTransientConnection;
        bEnabled = ((flagsReachable && !connectionRequired) || nonWiFi) ? YES : NO;
    }
    
    return bEnabled;
}

-(void)cancel
{
    if (_dataTask != nil) {
        [_dataTask cancel];
    }
}

@end