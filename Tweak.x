#import "../YouTubeHeader/YTIElementRenderer.h"

BOOL didLateHook = NO;

%group LateHook

%hook YTIElementRenderer

- (NSData *)elementData {
    NSString *description = [self description];
    if ([description containsString:@"shorts_shelf.eml"] || [description containsString:@"#shorts"])
        return nil;
    return %orig;
}

%end

%end

%hook YTSectionListViewController

- (void)loadWithModel:(id)model {
    if (!didLateHook) {
        %init(LateHook);
        didLateHook = YES;
    }
    %orig;
}

%end

%ctor {
    %init;
}