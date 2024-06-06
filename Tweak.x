#import <YouTubeHeader/YTIElementRenderer.h>

NSData *cellDividerData;

%hook YTIElementRenderer

- (NSData *)elementData {
    NSString *description = [self description];

    if ([description containsString:@"cell_divider"]) {
        if (!cellDividerData) cellDividerData = %orig;
        return cellDividerData;
    }

    BOOL hasShorts = ([description containsString:@"shorts_shelf.eml"] || [description containsString:@"shorts_video_cell.eml"] || [description containsString:@"6Shorts"]) && ![description containsString:@"history*"];
    BOOL hasShortsInHistory = [description containsString:@"compact_video.eml"] && [description containsString:@"youtube_shorts_"];

    if ((hasShorts || hasShortsInHistory) && cellDividerData) return cellDividerData;

    return %orig;
}

%end
