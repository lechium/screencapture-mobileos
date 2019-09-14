
#import <UIKit/UIKit.h>

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
    NSString *outputFile = [NSString stringWithFormat:@"/private/var/mobile/Documents/%@2.png", name];
    [pngData writeToFile:outputFile atomically:YES];
    printf("screenshot was saved to: %s\n", [outputFile UTF8String]);
    return 0;
}
