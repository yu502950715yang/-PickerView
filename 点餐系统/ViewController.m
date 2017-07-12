//
//  ViewController.m
//  点餐系统
//
//  Created by 余洋 on 2017/7/11.
//  Copyright © 2017年 余洋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic, strong) NSArray *foods;

@property (nonatomic, weak) IBOutlet UILabel *fruitLabel;

@property (nonatomic, weak) IBOutlet UILabel *stapleFoodLabel;

@property (nonatomic, weak) IBOutlet UILabel *wineLabel;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

- (IBAction)randomBtnClick:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //默认选中数据
    for (int i = 0; i < self.foods.count; i++) {
        [self pickerView:_pickerView didSelectRow:0 inComponent:i];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//点击随机点餐按钮
- (void)randomBtnClick:(id)sender {
    //遍历集合中的所有组
    for (int i = 0; i < self.foods.count; i++) {
        NSUInteger maxNum = [self.foods[i] count];
        u_int32_t randomNum = arc4random_uniform((int)maxNum);
        //获取当前选中的行号
        NSInteger selfRowNum = [self.pickerView selectedRowInComponent:i];
        while (randomNum == selfRowNum) {
            randomNum = arc4random_uniform((int) maxNum);
        }
        //让pickerView 选中数据
        [self.pickerView selectRow:randomNum inComponent:i animated:YES];
        [self pickerView:self.pickerView didSelectRow:randomNum inComponent:i];
    }
}

#pragma mark 代理方法
- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.foods[component][row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSString *selFood = self.foods[component][row];
    switch (component) {
        case 0:
            self.fruitLabel.text = selFood;
            break;
        case 1:
            self.stapleFoodLabel.text = selFood;
            break;
        case 2:
            self.wineLabel.text = selFood;
            break;
            
        default:
            break;
    }
}

#pragma mark 数据源方法
- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return self.foods.count;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.foods[component] count];
}

#pragma mark -赖加载
- (NSArray *) foods {
    if (_foods == nil) {
        NSArray *fruit = [[NSArray alloc] initWithObjects:@"西瓜",@"苹果",@"香蕉",@"山竹",@"梨",@"芒果",@"油桃",@"榴莲", nil];
        NSArray *stapleFood = [[NSArray alloc] initWithObjects:@"红烧肉",@"麻辣烫",@"兰州拉面",@"红烧狮子头",@"肉夹馍",@"冷面",@"西红柿炖牛腩",@"重庆小面",@"四川担担面",@"麻辣小面",@"酸辣粉",@"酥鲫鱼",@"饭包",@"小笼包",@"牛肉面", nil];
        NSArray *wine = [[NSArray alloc] initWithObjects:@"啤酒",@"美年达",@"百事可乐",@"七喜",@"雪碧",@"茶π",@"冰红茶",@"茉莉蜜茶",@"咖啡", nil];
        _foods = [[NSArray alloc] initWithObjects:fruit,stapleFood,wine, nil];
    }
    return _foods;
}

@end
