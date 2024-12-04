#import <YouTubeHeader/YTIElementRenderer.h>

%hook YTIElementRenderer

- (NSData *)elementData {
    NSString *description = [self description];

    BOOL hasShorts = ([description containsString:@"shorts_shelf"] || [description containsString:@"shorts_video_cell"] || [description containsString:@"6Shorts"]) && ![description containsString:@"history*"];
    BOOL hasShortsInHistory = [description containsString:@"compact_video.eml"] && [description containsString:@"youtube_shorts_"];

    if ((hasShorts || hasShortsInHistory)) return [NSData data];

    return %orig;
}

%end
