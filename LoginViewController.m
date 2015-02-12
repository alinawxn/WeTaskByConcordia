//
//  LoginViewController.m
//  WeTask
//
//  Created by XN on 11/23/14.
//  Copyright (c) 2014 Concordia InforTech. All rights reserved.
//

#import "LoginViewController.h"
#import "APIUrl.h"

@interface LoginViewController ()

@end

@implementation LoginViewController{
    UIView* loadingView;
    UIActivityIndicatorView *activityView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //textfield边框的颜色
    //self.phoneNumber.layer.borderColor = (__bridge CGColorRef)([UIColor colorWithRed:255.0/255.0 green:64.0/255.5 blue:129.0/255.0 alpha:1.0]);
    //self.phoneNumber.layer.borderWidth = 1;
    //self.password.layer
    
    //保存“记住账号密码”之前的钩钩的状态
    self.remember = [[NSUserDefaults standardUserDefaults]boolForKey:@"Remember"];
    if (self.remember == YES) {
        [self.rememberButton setTitle:@"✅" forState:UIControlStateNormal];
    }else{
        [self.rememberButton setTitle:@"🚫" forState:UIControlStateNormal];
    }
    
    //直接填写保存好的账号密码
    self.phoneNumber.text = [[NSUserDefaults standardUserDefaults]objectForKey:@"phoneNumber"];
    self.password.text = [[NSUserDefaults standardUserDefaults]objectForKey:@"password"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //触摸屏幕其它位置 关闭键盘
    [self.view endEditing:YES];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (IBAction)reg:(id)sender {
    if( self.phoneNumber.text.length == 0 || self.password.text.length < 6 || self.password.text.length > 16){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"错误" message:@"请填写信息或请填写正确信息。" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil];
        [alert show];
    }else{
        
        [self loadActivityIndicator];
        
        APIUrl *apiurl = [[APIUrl alloc]init];
        //注册
        NSString *UserRegisterAPIUrl = @"http://115.29.186.78/registrationAPI.php";
        NSURL *url = [apiurl fetchUrlFromString:UserRegisterAPIUrl];
        NSString *param = [apiurl paramsComponentsForUserRegisterAPIwithPhoneNumber:self.phoneNumber.text password:self.password.text];
        [self sendHttpRequestToUrl:url withParam:param];

    }
}

- (IBAction)login:(id)sender {
    if (self.remember == NO) {
        [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"Remember"];
        [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"phoneNumber"];
        [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"password"];
    }else{
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"Remember"];
        [[NSUserDefaults standardUserDefaults]setObject:self.phoneNumber.text forKey:@"phoneNumber"];
        [[NSUserDefaults standardUserDefaults]setObject:self.password.text forKey:@"password"];
    }
    
    if(!self.phoneNumber.text || self.password.text.length < 6 || self.password.text.length > 16){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"错误" message:@"请填写信息或请填写正确信息。" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil];
        [alert show];
    }else{
        APIUrl *apiurl = [[APIUrl alloc]init];
        //检验能否登陆
        NSString *UserLoginAPIUrl = @"http://115.29.186.78/loginAPI.php";
        NSURL *url = [apiurl fetchUrlFromString:UserLoginAPIUrl];
        NSString *param = [apiurl paramsComponentsForUserLoginAPIwithPhoneNumber: self.phoneNumber.text password:self.password.text];
        [self sendHttpRequestLoginToUrl:url withParam:param];
        
    }
}

- (IBAction)remember:(id)sender {
    self.remember = [[NSUserDefaults standardUserDefaults]boolForKey:@"Remember"];
    if (self.remember == YES) {
        self.remember = NO;
        [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"Remember"];
        [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"phoneNumber"];
        [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"password"];
        [self.rememberButton setTitle:@"🚫" forState:UIControlStateNormal];
    }else{
        self.remember = YES;
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"Remember"];
        [[NSUserDefaults standardUserDefaults]setObject:self.phoneNumber.text forKey:@"phoneNumber"];
        [[NSUserDefaults standardUserDefaults]setObject:self.password.text forKey:@"password"];
        [self.rememberButton setTitle:@"✅" forState:UIControlStateNormal];
    }
    
}

#pragma mark - 发送http请求

-(void)sendHttpRequestLoginToUrl:(NSURL *)url withParam:(NSString *)params{
    //create and config a NSURLSession
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    [self customConfig:config];
    //create a post request with url
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod: @"POST"];
    
    //serialize params as json data
    //NSError *error = nil;
    //NSData  *data = [NSJSONSerialization dataWithJSONObject:params options:kNilOptions error:&error];
    NSData *data = [params dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:data];
    NSError *error;
    NSData *data2 = [NSURLConnection sendSynchronousRequest:request returningResponse: nil error:&error];
    if (!data2)
    {
        NSLog(@"Download Error: %@", error.localizedDescription);
        UIAlertView *alert =
        [[UIAlertView alloc]initWithTitle:@"Error"
                                  message:[NSString stringWithFormat:@"Error : %@",error.localizedDescription]
                                 delegate:self
                        cancelButtonTitle:@"Ok"
                        otherButtonTitles:nil];
        [alert show];
    }else{
        //NSString* newStr = [[NSString alloc] initWithData:data2 encoding:NSUTF8StringEncoding];
    }
    
    // Parse the (binary) JSON data from the web service into an NSDictionary object
    NSDictionary *JSON =[NSJSONSerialization JSONObjectWithData:data2 options:NSJSONReadingMutableContainers error:&error];
    NSLog(@"%@", JSON);
    [self APILogin:JSON];
    
}

-(void)sendHttpRequestToUrl:(NSURL *)url withParam:(NSString *)params{
    //create and config a NSURLSession
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    [self customConfig:config];
    NSURLSession* session = [NSURLSession sessionWithConfiguration:config];
    
    //create a post request with url
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod: @"POST"];
    
    //serialize params as json data
    //NSError *error = nil;
    //NSData  *data = [NSJSONSerialization dataWithJSONObject:params options:kNilOptions error:&error];
    NSData *data = [params dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:data];
    
    NSURLSessionTask* task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        //NSData *data2 = [NSURLConnection sendSynchronousRequest:request returningResponse: nil error:&error];
        if (!data)
        {
            NSLog(@"Download Error: %@", error.localizedDescription);
            UIAlertView *alert =
            [[UIAlertView alloc]initWithTitle:@"Error"
                                      message:[NSString stringWithFormat:@"Error : %@",error.localizedDescription]
                                     delegate:self
                            cancelButtonTitle:@"Ok"
                            otherButtonTitles:nil];
            [alert show];
        }else{
            //NSString* newStr = [[NSString alloc] initWithData:data2 encoding:NSUTF8StringEncoding];
            // Parse the (binary) JSON data from the web service into an NSDictionary object
            NSDictionary *JSON =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
            [self APIRegister:JSON];
        }
    }];
    
    [task resume];

}

//configuration of session
- (void)customConfig: (NSURLSessionConfiguration *)sessionConfig{
    //allow cellular access
    sessionConfig.allowsCellularAccess = YES;
    //set all requests only accept json response
    //[sessionConfig setHTTPAdditionalHeaders:@{@"Content-Type":@"application/json"}];
    [sessionConfig setHTTPAdditionalHeaders:@{@"Accept":@"application/json"}];
    //others
    sessionConfig.HTTPMaximumConnectionsPerHost = 1;
    sessionConfig.timeoutIntervalForRequest = 60.0;
    sessionConfig.timeoutIntervalForResource = 60.0;
}

#pragma mark -
#pragma mark activityIndicator
- (void) loadActivityIndicator{
    CGSize screenSize = [[UIScreen mainScreen]bounds].size;
    
    loadingView = [[UIView alloc]initWithFrame:CGRectMake(screenSize.width/2-40, screenSize.height/2-40, 80, 80)];
    loadingView.backgroundColor = [UIColor colorWithWhite:0. alpha:0.6];
    loadingView.layer.cornerRadius = 5;
    
    activityView =[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityView.center = CGPointMake(loadingView.frame.size.width / 2.0, 35);
    [activityView startAnimating];
    [loadingView addSubview:activityView];
    
    UILabel* lblLoading = [[UILabel alloc]initWithFrame:CGRectMake(0, 48, 80, 30)];
    lblLoading.text = @"Loading...";
    lblLoading.textColor = [UIColor whiteColor];
    lblLoading.font = [UIFont fontWithName:lblLoading.font.fontName size:15];
    lblLoading.textAlignment = NSTextAlignmentCenter;
    [loadingView addSubview:lblLoading];
    
    [self.view addSubview:loadingView];
    [self.view bringSubviewToFront:loadingView];
}

//completionHandlerCalledByAPIRequest
- (void)APIRegister:(NSDictionary *)responseData{
    if([[responseData objectForKey:@"status"] isEqualToString:@"succeed"]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"成功！" message:@"用户注册成功，请登陆。" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil];
        [alert show];
        [self dismissActivityIndicator];
    }else if([[responseData objectForKey:@"status"] isEqualToString:@"exist"]){
        //sample data
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"错误" message:@"该手机号码已被注册" delegate:self cancelButtonTitle:@"重新输入" otherButtonTitles:nil];
        [alert show];
        [self dismissActivityIndicator];
    }else{
        [self dismissActivityIndicator];
    }
}

- (void)APILogin:(NSDictionary *)responseData{
    NSLog(@"%@", responseData);
    //登陆成功
    [[NSUserDefaults standardUserDefaults]setObject:self.phoneNumber.text forKey:@"DefaultUser"];
    if([[responseData objectForKey:@"status"] isEqualToString:@"exist"]){
        [self performSegueWithIdentifier:@"Login" sender:self];
    }else if([[responseData objectForKey:@"status"] isEqualToString:@"no"]){
        //登陆失败
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"错误" message:@"登陆错误" delegate:self cancelButtonTitle:@"重新输入" otherButtonTitles:nil];
        [alert show];
    }else{
    }
}

- (void) dismissActivityIndicator{
    [activityView stopAnimating];
    [loadingView removeFromSuperview];
}


//Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}

@end
