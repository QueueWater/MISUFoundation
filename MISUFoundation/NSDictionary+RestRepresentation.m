//
//  NSDictionary+RestRepresentation.m
//  MISUFoundation
//
//  Created by 0day on 12-8-29.
//  Copyright (c) 2012年 0day. All rights reserved.
//

#import "NSDictionary+RestRepresentation.h"
#import "MISUMemory.h"

@implementation NSDictionary (RestRepresentation)

- (NSString *)restRepresentation {
    NSMutableArray *subStringArray = [[NSMutableArray alloc] init];
    
    void (^block)(id key, id obj, BOOL *stop) = ^(id key, id obj, BOOL *stop) {
        NSString *subString = [NSString stringWithFormat:@"%@=%@", key, obj];
        [subStringArray addObject:subString];
    };
    [self enumerateKeysAndObjectsUsingBlock:block];
    
    NSString *rest = [subStringArray componentsJoinedByString:@"&"];
    [subStringArray MISURelease];
    
    rest = [rest stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    return rest;
}

@end
