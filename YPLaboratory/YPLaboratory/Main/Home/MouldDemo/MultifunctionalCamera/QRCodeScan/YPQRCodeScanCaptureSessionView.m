//
//  YPQRCodeScanCaptureSessionView.m
//  YPLaboratory
//
//  Created by Hansen on 2023/7/1.
//

#import "YPQRCodeScanCaptureSessionView.h"

@interface YPQRCodeScanCaptureSessionView () <AVCaptureMetadataOutputObjectsDelegate>

@property (nonatomic, strong) AVCaptureMetadataOutput *metadataOutput;

@end

@implementation YPQRCodeScanCaptureSessionView

- (AVCaptureOutput *)output {
    return self.metadataOutput;
}

- (AVCaptureMetadataOutput *)metadataOutput {
    if (!_metadataOutput) {
        _metadataOutput = [[AVCaptureMetadataOutput alloc] init];
        [_metadataOutput setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
        NSArray *availableMetadataObjectTypes = [_metadataOutput availableMetadataObjectTypes];
        [_metadataOutput setMetadataObjectTypes:[availableMetadataObjectTypes copy]];
    }
    return _metadataOutput;
}

#pragma mark - AVCaptureMetadataOutputObjectsDelegate

- (void)captureOutput:(AVCaptureOutput *)output didOutputMetadataObjects:(NSArray<__kindof AVMetadataObject *> *)metadataObjects fromConnection:(AVCaptureConnection *)connection {
    NSLog(@"🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀");
}


@end
