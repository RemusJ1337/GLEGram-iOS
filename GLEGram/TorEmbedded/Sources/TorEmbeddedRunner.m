// Tor removed to reduce IPA size. No-op stub; no Tor.framework linked.
#import "TorEmbeddedRunner.h"

@implementation TorEmbeddedRunner

+ (void)setLogCallback:(void (^)(NSString * _Nonnull))callback {
    (void)callback;
}

+ (void)startWithBridges:(NSString *)bridges {
    (void)bridges;
}

+ (void)stop {
}

+ (BOOL)isReady {
    return NO;
}

@end
