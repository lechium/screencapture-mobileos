
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface LSApplicationWorkspace: NSObject
- (BOOL)openURL:(id)string;
+ (id)defaultWorkspace;
@end

extern  UIImage* _UICreateScreenUIImage();

int main(int argc, char* argv[]) {
    printf("screencapture for tvOS\n");
    NSString *name = @"screenshot";
    if (argc > 1)
    {
        name = [NSString stringWithUTF8String:argv[1]];
    }
    UIImage *screenImage = _UICreateScreenUIImage();
    NSData *pngData = UIImagePNGRepresentation(screenImage);
    NSString *outputFile = [NSString stringWithFormat:@"/private/var/mobile/Documents/%@.png", name];
    [pngData writeToFile:outputFile atomically:YES];
    printf("screenshot was saved to: %s\n", [outputFile UTF8String]);
    NSString *airDropURL = [NSString stringWithFormat:@"airdropper://%@", outputFile];
    NSURL *url = [NSURL URLWithString:airDropURL];
    
    [[NSBundle bundleWithPath:@"/System/Library/Frameworks/MobileCoreServices.framework"] load];
    [[objc_getClass("LSApplicationWorkspace") defaultWorkspace] openURL:url];
    return 0;
}
