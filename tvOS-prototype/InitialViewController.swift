//
//  InitialViewController.swift
//  tvOS-prototype
//
//  Created by Adriano Goncalves on 22/11/2015.
//  Copyright © 2015 Adriano Goncalves. All rights reserved.
//

import UIKit
import AVKit

class InitialViewController: UIViewController {

   @IBOutlet weak private var launchImage: UIImageView!
   
   private let playerStatusObserverContext = UnsafeMutablePointer<Void>()
   private var player: AVPlayer!
   private var playerLayer: AVPlayerLayer!
   private var playerReady: Bool {
      return player != nil && playerLayer != nil && playerLayer.superlayer != nil
   }
   
   //MARK: UIViewController
   
   override func viewDidLoad() {
      super.viewDidLoad()
      setupUI()
      loadPlayer()
   }
   
   override func viewDidAppear(animated: Bool) {
      super.viewDidAppear(animated)
      self.playVideo()
   }
   
   //MARK: InitialViewController
   
   func playerItemDidEnd(notification: NSNotification) {
      showBackground()
   }
   
   private func setupUI() {
      launchImage.image = UIImage(named: "launch")
   }
   
   private func loadPlayer() {

      guard let path = NSBundle.mainBundle().pathForResource("test-landscape", ofType: "mp4") else {
         return
      }
      
      if player == nil || player.status != AVPlayerStatus.ReadyToPlay {
         player = AVPlayer(URL: NSURL(fileURLWithPath: path))
         addObserver(player, forKeyPath: "status", options: .New, context: playerStatusObserverContext)
         if let playerCurrentItem = player.currentItem {
            NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("playerItemDidEnd:"), name: AVPlayerItemDidPlayToEndTimeNotification, object: playerCurrentItem)
         }
         playerLayer = AVPlayerLayer(player: player)
      }

      guard let playerLayer = playerLayer else {
         return
      }
      
      if playerLayer.superlayer == nil {
         playerLayer.frame = view.frame
         view.layer.insertSublayer(playerLayer, below: launchImage.layer)
      }

   }
   
   private func playVideo() {
      if playerReady {
         player.play()
         hideBackground()
      } else {
         showError()
      }
   }
   
   private func hideBackground() {
      UIView.animateWithDuration(0.25) { () -> Void in
         self.launchImage.alpha = 0.0
      }
   }
   
   private func showBackground() {
      UIView.animateWithDuration(0.25) { () -> Void in
         self.launchImage.alpha = 1.0
      }
   }
   
   private func showError() {
      let alert = UIAlertController(title: "Unexpected error", message: "Found an error on the app, sorry!", preferredStyle: .Alert)
      alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
      self.presentViewController(alert, animated: true, completion: nil)
   }

}
