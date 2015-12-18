//
//  MainCollectionDatasource.swift
//  tvOS-prototype
//
//  Created by Adriano Goncalves on 24/11/2015.
//  Copyright © 2015 Adriano Goncalves. All rights reserved.
//

import UIKit

extension MainViewController: UICollectionViewDataSource {
   
   func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return 3
   }
   
   func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCellWithReuseIdentifier(ImageCell.cellIdentifier, forIndexPath: indexPath) as! ImageCell
      cell.imageView.image = UIImage(named: "Baby \(indexPath.item%3 + 1)")
      return cell
   }
   
}