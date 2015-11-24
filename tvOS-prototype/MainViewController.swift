//
//  MainViewController.swift
//  tvOS-prototype
//
//  Created by Adriano Goncalves on 19/11/2015.
//  Copyright © 2015 Adriano Goncalves. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
   
   static let cellIdentifier = "ImageCell"
   
   @IBOutlet weak var imageView: UIImageView!
   
}

class MainViewController: UIViewController {

   @IBOutlet weak private var topCollection: InfiniteCarousel!
   @IBOutlet weak private var mainCollection: iCarousel!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      mainCollection.dataSource = self
      mainCollection.delegate = self
      mainCollection.type = .CoverFlow
      mainCollection.pagingEnabled = true
   }
}

extension iCarousel {
   public override func canBecomeFocused() -> Bool {
      return true
   }
}

