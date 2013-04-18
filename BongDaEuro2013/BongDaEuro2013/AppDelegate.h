//
//  AppDelegate.h
//  BongDaEuro2013
//
//  Created by MAC on 4/14/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DanhSachThamGiaViewController.h"
#import "LichThiDauViewController.h"
#import "KetQuaViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) DanhSachThamGiaViewController *_danhSachThamGia;
@property (strong, nonatomic) LichThiDauViewController  *_lichThiDau;
@property (strong, nonatomic) KetQuaViewController *_ketQua;

@end
