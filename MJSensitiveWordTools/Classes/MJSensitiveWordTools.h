//
//  MJSensitiveWordTools.h
//  MJSensitiveWordTools
//
//  Created by Yang Yu on 2019/4/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MJSensitiveWordTools : NSObject

/// 加载数据源 使用完成后必须调用clearData
+ (void)loadData;

/// 清空数据源 下一次使用时 重新调用loadData
+ (void)clearData;

/// 匹配敏感词 若没有返回空
+ (NSString *)filterWord:(NSString *)str;

@end

NS_ASSUME_NONNULL_END
