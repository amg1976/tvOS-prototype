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

   @IBOutlet weak private var topCarousel: InfiniteCarousel!
   @IBOutlet weak private var mainCollection: UICollectionView!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      topCarousel.dataSource = self
   }
}

