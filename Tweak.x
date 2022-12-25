#import "../YouTubeHeader/YTIElementRenderer.h"

%hook YTIElementRenderer

- (NSData *)elementData {
    NSString *description = [self description];
    if ([description containsString:@"shorts_shelf.eml"] || [description containsString:@"#shorts"])
        return nil;
    return %orig;
}

%end
