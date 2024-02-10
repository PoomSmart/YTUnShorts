#import <YouTubeHeader/YTIElementRenderer.h>


%hook YTIElementRenderer

- (NSData *)elementData {
    NSString *description = [self description];
    if ([description containsString:@"shorts_shelf.eml"] || [description containsString:@"#shorts"] || [description containsString:@"shorts_video_cell.eml"] || [description containsString:@"6Shorts"]) {
        if (![description containsString:@"history*"]) {
            return nil;
        }
    }
    
    return %orig;
}

%end