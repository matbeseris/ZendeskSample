//
//  ViewController.m
//  ObjCIntegration
//

#import "ViewController.h"
#import <SupportSDK/SupportSDK.h>
#import <ZendeskCoreSDK/ZendeskCoreSDK.h>
#import <SupportProvidersSDK/SupportProvidersSDK.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *helpCenterButton;
@property (weak, nonatomic) IBOutlet UIButton *tickets;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openHelpCenter:(id)sender {
    ZDKHelpCenterUiConfiguration *hcConfig = [ZDKHelpCenterUiConfiguration new];
    UIViewController *helpCenter = [ZDKHelpCenterUi buildHelpCenterOverviewUiWithConfigs:@[hcConfig]];
    
    [self.navigationController pushViewController:helpCenter animated:YES];

}

- (IBAction)openTickets:(id)sender {
    UIViewController *tickets = [ZDKRequestUi buildRequestList];
    [self.navigationController pushViewController:tickets animated:YES];
}

@end
