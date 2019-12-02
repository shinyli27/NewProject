

#import <Foundation/Foundation.h>

@interface PersonnerModel : NSObject

+ (PersonnerModel *)shareInstance;
+ (BOOL)isLogin;
+ (NSString *)headUrl;
+ (NSString *)realName;
+ (NSString *)mobilePhone;
+ (NSString *)token;


- (void)saveIsLogin:(BOOL)isLogin;
- (void)saveRealName:(NSString *)realName;
- (void)saveMobilePhone:(NSString *)mobilePhone;
- (void)saveHeadUrl:(NSString *)headUrl;
- (void)saveToken:(NSString *)token;
+ (void)logout;
@end
