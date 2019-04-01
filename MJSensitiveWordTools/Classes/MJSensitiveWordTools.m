//
//  MJSensitiveWordTools.m
//  MJSensitiveWordTools
//
//  Created by Yang Yu on 2019/4/1.
//

#import "MJSensitiveWordTools.h"
#if __has_include(<FileSource/FileSource.h>)
#define FILESOURCE_ENABLE
#import <FileSource/FileSource.h>
#endif



#define EXIST @"isExists"

static NSMutableDictionary *_dictSensitive;

@implementation MJSensitiveWordTools

/// 加载数据源 使用完成后必须调用clearData
+ (void)loadData {
    
    if (_dictSensitive != nil &&
        _dictSensitive.allKeys.count > 0) {
        return;
    }
    
    // 加载文件
    NSArray *arrSensitiveWord = nil;
#ifdef FILESOURCE_ENABLE
    arrSensitiveWord = [FileSource dataWithFileName:@"SensitiveWord"];
#else
    // 没有导入模块, 读取mainBundle目录下的SensitiveWord.plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"SensitiveWord" ofType:@"plist"];
    arrSensitiveWord = [NSArray arrayWithContentsOfFile:path];
#endif
    
    if (arrSensitiveWord == nil ||
        arrSensitiveWord.count == 0) {
        return;
    }
    
    // 初始化dict
    _dictSensitive = [[NSMutableDictionary alloc] init];
    
    // 插入字符，构造节点
    for (NSString *word in arrSensitiveWord) {
        [self insertWords:word];
    }
    
}

/// 清空数据源 下一次使用时 重新调用loadData
+ (void)clearData {
    [_dictSensitive removeAllObjects];
    _dictSensitive = nil;
}

/// 匹配敏感词 若没有返回空
+ (NSString *)filterWord:(NSString *)str {
    if (_dictSensitive == nil) {
        return @"";
    }
    
    for (int i = 0; i < str.length; i ++) {
        NSString *subString = [str substringFromIndex:i];
        NSMutableDictionary *node = [_dictSensitive mutableCopy];
        int num = 0;
        
        for (int j = 0; j < subString.length; j ++) {
            NSString *word = [subString substringWithRange:NSMakeRange(j, 1)];
            if (node[word] == nil) {
                break;
            }else{
                num ++;
                node = node[word];
            }
            //敏感词匹配成功
            if ([node[EXIST] integerValue] == 1) {
                return [str substringWithRange:NSMakeRange(i, num)];
            }
        }
    }
    return @"";
}


#pragma mark- Private

+ (void)insertWords:(NSString *)words {
    
    NSMutableDictionary *node = _dictSensitive;
    for (int i = 0; i < words.length; i ++) {
        NSString *word = [words substringWithRange:NSMakeRange(i, 1)];
        if (node[word] == nil) {
            node[word] = [NSMutableDictionary dictionary];
        }
        node = node[word];
    }
    //敏感词最后一个字符标识
    node[EXIST] = [NSNumber numberWithInt:1];
}


@end
