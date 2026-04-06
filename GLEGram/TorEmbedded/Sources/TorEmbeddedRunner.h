// MARK: Swiftgram — Built-in Tor runner (SOCKS 9050, control 9051). Only browser traffic uses Tor; Telegram API is unchanged.
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TorEmbeddedRunner : NSObject

/// Start Tor in-process. Bridges string: one bridge per line (e.g. "obfs4 1.2.3.4:443 fingerprint" or meek URL). Pass nil or empty for no bridges.
+ (void)startWithBridges:(nullable NSString *)bridges;

/// Stop Tor.
+ (void)stop;

/// Whether Tor is running and circuit is established (SOCKS on 9050, control on 9051).
+ (BOOL)isReady;

/// Optional. When set, startup log messages are reported (e.g. "Starting Tor...", "Circuit established."). Call from main or background; handler may be invoked on any queue.
+ (void)setLogCallback:(void (^ _Nullable)(NSString * _Nonnull message))callback;

@end

NS_ASSUME_NONNULL_END
