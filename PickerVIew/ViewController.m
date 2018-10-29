//
//  ViewController.m
//  PickerVIew
//
//  Created by 栗子 on 2018/2/26.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/. All rights reserved.
//

#import "ViewController.h"
#import "LZPickerView.h"

@interface ViewController ()

@property(nonatomic,strong)LZPickerView *lzPickerVIew;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
  
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"LZPickerView" owner:nil options:nil];
    self.lzPickerVIew  = views[0];
    
}


- (IBAction)sexBtn:(id)sender {
    
    UIButton *btn = (id)sender;
    NSString *text = btn.titleLabel.text;
    [self.lzPickerVIew lzPickerVIewType:LZPickerViewTypeSexAndHeight];
    self.lzPickerVIew.dataSource =@[@"男",@"女"];
    self.lzPickerVIew.titleText = @"性别";
    self.lzPickerVIew.selectDefault = text;
    self.lzPickerVIew.selectValue  = ^(NSString *value){
        [btn setTitle:value forState:UIControlStateNormal];
    };
    [self.lzPickerVIew show];
}

- (IBAction)weightBtn:(id)sender {
    
    UIButton *btn = (id)sender;
    NSString *text = btn.titleLabel.text;
    
    NSMutableArray *weightIntegerArr = [NSMutableArray array];
    NSMutableArray *weightDotArr = [NSMutableArray array];
    //体重整数部分
    for (int i=25; i<226; i++) {
        [weightIntegerArr addObject:[NSString stringWithFormat:@"%d",i]];
    }
    //体重小数部分
    for (int i=0; i<10; i++) {
        [weightDotArr addObject:[NSString stringWithFormat:@"%d",i]];
    }
    [self.lzPickerVIew lzPickerVIewType:LZPickerViewTypeWeigth];
    self.lzPickerVIew.dataSource =@[weightIntegerArr,weightDotArr];
    self.lzPickerVIew.titleText = @"体重(kg)";
    self.lzPickerVIew.selectDefault = text;
    self.lzPickerVIew.selectValue  = ^(NSString *value){
        [btn setTitle:value forState:UIControlStateNormal];
    };
    [self.lzPickerVIew show];
}

- (IBAction)heightBtn:(id)sender {

    UIButton *btn = (id)sender;
    NSString *text = btn.titleLabel.text;
    NSString *content = [text stringByReplacingOccurrencesOfString:@"cm" withString:@""];
    NSMutableArray *heightArr = [NSMutableArray array];
    for (int i=25; i<229; i++) {
        [heightArr addObject:[NSString stringWithFormat:@"%d",i]];
    }
    [self.lzPickerVIew lzPickerVIewType:LZPickerViewTypeSexAndHeight];
    self.lzPickerVIew.dataSource = heightArr;
    self.lzPickerVIew.titleText = @"身高(cm)";
    self.lzPickerVIew.selectDefault = content;
    self.lzPickerVIew.selectValue  = ^(NSString *value){
        [btn setTitle:[NSString stringWithFormat:@"%@cm",value] forState:UIControlStateNormal];
    };
    [self.lzPickerVIew show];
    
}



@end
