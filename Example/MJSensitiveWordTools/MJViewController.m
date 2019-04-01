//
//  MJViewController.m
//  MJSensitiveWordTools
//
//  Created by yangyu2010@aliyun.com on 04/01/2019.
//  Copyright (c) 2019 yangyu2010@aliyun.com. All rights reserved.
//

#import "MJViewController.h"
#import <MJSensitiveWordTools.h>


@interface MJViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;


@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [MJSensitiveWordTools loadData];
}

- (void)dealloc {
    [MJSensitiveWordTools clearData];
}

- (IBAction)action:(id)sender {
    NSString *word = [MJSensitiveWordTools filterWord:self.textField.text];
    NSLog(@"(%@)是敏感词", word);
}


@end
