```objc title="Tweak.x"
#import <UIKit/UIKit.h>

%ctor {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC),
                   dispatch_get_main_queue(), ^{
        UIWindow *w = nil;
        for (UIScene *s in UIApplication.sharedApplication.connectedScenes) {
            if ([s isKindOfClass:UIWindowScene.class]) {
                w = ((UIWindowScene *)s).windows.firstObject;
                break;
            }
        }
        UIAlertController *a = [UIAlertController
            alertControllerWithTitle:@"MonTweak"
            message:@"Dylib injecté ✅"
            preferredStyle:UIAlertControllerStyleAlert];
        [a addAction:[UIAlertAction actionWithTitle:@"OK"
            style:UIAlertActionStyleDefault handler:nil]];
        [w.rootViewController presentViewController:a animated:YES completion:nil];
    });
}
```
