//
//  AppDelegate.swift
//  CocoaPodSample
//
//  Created by Killian Smith on 22/05/2018.
//  Copyright © 2018 Killian Smith. All rights reserved.
//

import UIKit
import SupportSDK
import ZendeskCoreSDK

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        CoreLogger.enabled = true
        CoreLogger.logLevel = .debug
        
        // Initialize the SDK with your Zendesk instance
        // Get these details from your Zendesk dashboard: Admin -> Channels -> MobileSDK.
        Zendesk.initialize(appId: "57d3f1cba0e62d3db0f9ea723042eca89834925fb3bfaecc", clientId: "mobile_sdk_client_bc9a04469e227ab735d3", zendeskUrl: "https://expert-support.experticity.com")
        
        Support.initialize(withZendesk: Zendesk.instance)
        // Support is needed to hand off tickets from AB

        // Set an identity for authentication.
        let identity = Identity.createAnonymous()
        // let identity = Identity.createJwt(token: "JWT_User_Identifier")
        Zendesk.instance?.setIdentity(identity)
        return true
    }
}

