

#import "PersonnerModel.h"

static PersonnerModel *model = nil;

@implementation PersonnerModel

+ (PersonnerModel *)shareInstance{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        model = [[self alloc] init];
    });
    return model;
}

+ (BOOL)isLogin{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL isLogin = [defaults boolForKey:@"isLogin"];
    return isLogin;
}
+ (NSString *)headUrl{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *headUrl = [defaults objectForKey:@"headUrl"];
    return headUrl;
}
+ (NSString *)realName{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *realName = [defaults objectForKey:@"realName"];
    return realName;
}
+ (NSString *)mobilePhone{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *mobilePhone = [defaults objectForKey:@"mobilePhone"];
    return mobilePhone;
}
+ (NSString *)token{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *token =[defaults objectForKey:@"token"];
    return token;
}

- (void)saveIsLogin:(BOOL)isLogin{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:isLogin forKey:@"isLogin"];
    [defaults synchronize];
}
- (void)saveRealName:(NSString *)realName{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:realName forKey:@"realName"];
    [defaults synchronize];
}
- (void)saveMobilePhone:(NSString *)mobilePhone{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:mobilePhone forKey:@"mobilePhone"];
    [defaults synchronize];
}
- (void)saveHeadUrl:(NSString *)headUrl{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    [defaults setObject:[NSString stringWithFormat:@"http://%@",headUrl] forKey:@"headUrl"];
    [defaults setObject:headUrl forKey:@"headUrl"];
    [defaults synchronize];
}
- (void)saveToken:(NSString *)token{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:token forKey:@"token"];
    [defaults synchronize];
}
+ (void)logout{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:NO forKey:@"isLogin"];
    [defaults synchronize];
    [defaults removeObjectForKey:@"realName"];
    [defaults removeObjectForKey:@"mobilePhone"];
    [defaults removeObjectForKey:@"headUrl"];
    [defaults removeObjectForKey:@"token"];
}
@end
