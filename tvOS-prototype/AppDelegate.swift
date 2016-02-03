//
//  AppDelegate.swift
//  tvOS-prototype
//
//  Created by Adriano Goncalves on 19/11/2015.
//  Copyright © 2015 Adriano Goncalves. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
   
   private var mainFlowController: MainFlowController?
   
   func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
      
      let flowController = MainFlowController()
      let window = flowController.installRootController()
      flowController.presentInitialScreen(window)
      
      mainFlowController = flowController
      
      return true
   }
   
}

protocol FlowController: class {
   
}

class MainFlowController: FlowController {
   
   private var currentWindow: UIWindow?
   
   private var mainStoryboard: UIStoryboard {
      return UIStoryboard(name: "Main", bundle: nil)
   }

   func installRootController() -> UIWindow {
      let window = UIWindow(frame: UIScreen.mainScreen().bounds)
      window.rootViewController = UINavigationController()
      window.makeKeyAndVisible()
      return window
   }
   
   func presentInitialScreen(window: UIWindow?) {
      currentWindow = window
      if let navigationController = window?.rootViewController as? UINavigationController,
         vc = mainStoryboard.instantiateInitialViewController() as? InitialViewController {
            vc.flowController = self
            navigationController.pushViewController(vc, animated: false)
      }
   }
   
   func presentMainScreen() {
      if let vc = mainStoryboard.instantiateViewControllerWithIdentifier("MainViewController") as? MainViewController,
         currentNavigationController = currentWindow?.rootViewController as? UINavigationController {
         vc.flowController = self
         currentNavigationController.pushViewController(vc, animated: false)
      }
   }
   
}