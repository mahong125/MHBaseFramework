//
//  NSDictionary+Custom.h
//  MHBaseFramework
//
//  Created by mahong on 15/11/29.
//  Copyright © 2015年 mahong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Custom)

/**
 *  按照升序排序字典中所有Key
 *
 *  @return key数组
 */
- (NSArray *)allKeysSorted;

/**
 *  排序后的key对应Value
 *
 *  @return value数组
 */
- (NSArray *)allValuesSortedByKeys;

/**
 *  字典中是否包含key
 *
 *  @param key key
 *
 *  @return bool
 */
- (BOOL)containsObjectForKey:(id)key;

/**
 *  将字典转化为json字符串
 *
 *  @return json字符串
 */
- (NSString *)dictionaryToJson;

@end
