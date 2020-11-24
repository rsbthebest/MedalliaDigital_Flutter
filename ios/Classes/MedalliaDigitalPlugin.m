#import "MedalliaDigitalPlugin.h"
#if __has_include(<medallia_digital/medallia_digital-Swift.h>)
#import <medallia_digital/medallia_digital-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "medallia_digital-Swift.h"
#endif

@implementation MedalliaDigitalPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMedalliaDigitalPlugin registerWithRegistrar:registrar];
}
@end
