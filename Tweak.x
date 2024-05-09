#import <YouTubeHeader/YTIElementRenderer.h>


// %hook YTIElementRenderer

// - (NSData *)elementData {
//     NSString *description = [self description];
//     if ([description containsString:@"shorts_shelf.eml"] || [description containsString:@"#shorts"] || [description containsString:@"shorts_video_cell.eml"] || [description containsString:@"6Shorts"]) {
//         if (![description containsString:@"history*"]) {
//             return nil;
//         }
//     }
    
//     return %orig;
// }

// %end


NSData *cellDividerData;

%hook YTIElementRenderer

- (NSData *)elementData {
    NSString *description = [self description];

    if ([description containsString:@"cell_divider"]) {
        if (!cellDividerData) cellDividerData = %orig;
        return cellDividerData;
    }

    BOOL hasShorts = [description containsString:@"shorts_shelf.eml"] || [description containsString:@"shorts_video_cell.eml"] || [description containsString:@"6Shorts"];
    BOOL hasShortsInHistory = [description containsString:@"compact_video.eml"] && [description containsString:@"youtube_shorts_"];

    if (hasShorts || hasShortsInHistory) return cellDividerData;

    return %orig;
}

%end
