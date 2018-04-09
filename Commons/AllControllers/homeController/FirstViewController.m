//
//  FirstViewController.m
//  JMTabBarKitTest
//
//  Created by james on 15/4/28.
//  Copyright (c) 2015年 james. All rights reserved.
//

#import "FirstViewController.h"
#import "AppDelegate.h"

@interface FirstViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic, strong) UIButton * headerImg;//用户头像
@property (nonatomic, strong) UIImage * headerImage;

@end

@implementation FirstViewController

- (void)viewWillDisappear:(BOOL)animated
{
    [self hiddenLoops];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.view.backgroundColor = [UIColor whiteColor];

    self.navigationView.title = @"精选";
    self.navigationView.returnBtn.hidden = YES;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame     = CGRectMake(50, 100, 100, 90);
    [btn setTitle:@"切换" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = 1000;
    [self.view addSubview:btn];
    
    
    UIButton *btnde = [UIButton buttonWithType:UIButtonTypeSystem];
    btnde.frame     = CGRectMake(50, 220, 100, 90);
    [btnde setTitle:@"详情" forState:UIControlStateNormal];
    [btnde addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    btnde.tag = 1001;
    [self.view addSubview:btnde];
    
    //用户头像
    _headerImg = [[UIButton alloc]initWithFrame:CGRectMake(10, 40, 80, 80)];
    _headerImg.center = CGPointMake(WIDTH/2,180);
    [_headerImg setImage:[UIImage imageNamed:@"t01_t"] forState:UIControlStateNormal];
    _headerImg.layer.borderWidth = 2;
    _headerImg.layer.cornerRadius = 40;
    _headerImg.layer.masksToBounds = YES;
    [_headerImg addTarget:self action:@selector(setHeader:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:self.headerImg];
    /**
     多线程的使用
     */
//    [self userGCD];
}

- (void)userGCD
{
    
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"asyncConcurrent--- begin -----开始");
   
    dispatch_queue_t  queue = dispatch_queue_create("com.hantongkeji.SongXiaoPao", DISPATCH_QUEUE_CONCURRENT);//并发队列
    
    //异步进程
    dispatch_async(queue, ^{
        
        //追加任务一
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:3];              // 模拟耗时操作
            NSLog(@" 异步 --- 任务一 ---%@",[NSThread currentThread]);      // 打印当前线程
        }
    
    });
    
    //同步进程
    dispatch_async(queue, ^{
        
        //追加任务二
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:3];              // 模拟耗时操作
            NSLog(@" 同步 --- 任务二 ---%@",[NSThread currentThread]);      // 打印当前线程
        }
        
    });
    
    //异步进程
    dispatch_async(queue, ^{
        
        //追加任务三
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:3];              // 模拟耗时操作
            NSLog(@" 异步 --- 任务三 ---%@",[NSThread currentThread]);      // 打印当前线程
        }
        
    });
    
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"asyncConcurrent--- end ----- 结束");
    
}

#pragma mark - 上传头像
- (void)requestImageDatas
{
    NSData * imageData = UIImagePNGRepresentation(self.headerImg.imageView.image);
    
    NSString * str = [imageData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
    NSString * userId = [[NSUserDefaults standardUserDefaults]objectForKey:@"id"];
    NSString * urlStr = [NSString stringWithFormat:@"%@User/PostUserHead",HEADIMGE_URL];
    if (userId==nil) {
        userId = @"20180410";
    }
    NSDictionary * UserModel = @{@"Id":userId,@"Image":str};
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    [manager POST:urlStr parameters:UserModel progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
     
        [self hiddenLoops];
        [self.headerImg setImage:self.headerImage forState:UIControlStateNormal];
        [MBProgressHUD showMessag:@"上传成功" toView:self.view];
        //选取完图片之后关闭视图
        [self dismissViewControllerAnimated:YES completion:nil];
    
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        [self hiddenLoops];
        [MBProgressHUD show:@"网络好像跑到火星了!" icon:@"" view:self.view];
        //选取完图片之后关闭视图
        [self dismissViewControllerAnimated:YES completion:nil];
    
    }];
    
}

#pragma mark -- 点击事件方法
- (void)setHeader:(UIButton *)sender {
    UIAlertController *aler=[UIAlertController alertControllerWithTitle:@"更换头像" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    //从相机选取
    UIAlertAction *album=[UIAlertAction actionWithTitle:@"从相册选取" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerController *picker=[[UIImagePickerController alloc]init];
        picker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
        picker.mediaTypes=[UIImagePickerController availableMediaTypesForSourceType:picker.sourceType];
        picker.allowsEditing=YES;
        picker.delegate=self;
        [self presentViewController:picker animated:YES completion:nil];
    }];
    //从相机选取
    UIAlertAction *camera=[UIAlertAction actionWithTitle:@"相机拍摄" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerController *picker=[[UIImagePickerController alloc]init];
        picker.sourceType=UIImagePickerControllerSourceTypeCamera;
        picker.mediaTypes=[UIImagePickerController availableMediaTypesForSourceType:picker.sourceType];
        picker.allowsEditing=YES;
        picker.delegate=self;
        [self presentViewController:picker animated:YES completion:nil];
        
    }];
    
    UIAlertAction *cancl=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [aler addAction:cancl];
    [aler addAction:album];
    [aler addAction:camera];
    [self presentViewController:aler animated:YES completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    _headerImage = [info objectForKey:UIImagePickerControllerEditedImage];
    _headerImage = [_headerImage resizedImageToSize:CGSizeMake(200, 200)];//修改了压缩系数.由 0.0 --> 0.5
    
     [self showLoops];
//        NSLog(@"%@",_headerImage);
    //先上传用户头像图片
    [self requestImageDatas];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)clickBtn:(UIButton *)sender {
    
    if (sender.tag != 1001) {
        [self showLoops];//加载球
    } else{
        [self.navigationController pushViewController:[[HomeDetailViewController alloc] init] animated:YES];
    }
    
    
    
//    HomeDetailViewController * homeDetailVC = [[HomeDetailViewController alloc] init];
//    [self.navigationController pushViewController:homeDetailVC animated:YES];
    
    
//    AppDelegate *_appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
//    [_appDelegate.tabBarVC setTabBarSelectedIndex:1];//切换tabbar视图
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
