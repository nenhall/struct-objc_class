//
//  main.m
//  窥探struct objc_class结构体
//
//  Created by nenhall on 2018/8/1.
//  Copyright © 2018年 neghao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Classinfo.h"
#include <objc/message.h>

// NHPerson
@interface NHPerson : NSObject <NSCopying>
{
@public
    int _age;
}
@property (nonatomic, assign) int no;
- (void)personInstanceMethod;
+ (void)personClassMethod;
@end

@implementation NHPerson

- (void)test
{
}

- (void)personInstanceMethod
{
}
+ (void)personClassMethod
{
}
- (id)copyWithZone:(NSZone *)zone
{
    return nil;
}
@end

// NHStudent
@interface NHStudent : NHPerson <NSCoding>
{
@public
    int _weight;
}
@property (nonatomic, assign) int height;
- (void)studentInstanceMethod;
+ (void)studentClassMethod;
@end

@implementation NHStudent
- (void)test {}
- (void)studentInstanceMethod {}
+ (void)studentClassMethod
{}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    return nil;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
}
@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
        NHStudent *student = [[NHStudent alloc] init];
        student->_age = 10;
        
        nh_objc_class *studentClass = (__bridge nh_objc_class*)[NHStudent class];
        nh_objc_class *personClass = (__bridge nh_objc_class *)([NHStudent class]);

        class_rw_t *studentClassData = studentClass->data();
        class_rw_t *personClassData = personClass->data();

        class_rw_t *studentMetaClassData = studentClass->metaClass()->data();
        class_rw_t *personMetaClassData = personClass->metaClass()->data();

        
    }
    return 0;
}


