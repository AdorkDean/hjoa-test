//
//  CostListCell.h
//  hjoa
//
//  Created by 华剑 on 2017/7/20.
//  Copyright © 2017年 huajian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CostListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextField *costMoneyLabel;
@property (weak, nonatomic) IBOutlet UITextField *costUsedlabel;
@property (weak, nonatomic) IBOutlet UITextView *remakeText;
@property (weak, nonatomic) IBOutlet UIButton *addCostBut;


@end
