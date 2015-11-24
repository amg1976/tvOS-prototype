//
//  MainCollectionDatasource.swift
//  tvOS-prototype
//
//  Created by Adriano Goncalves on 24/11/2015.
//  Copyright © 2015 Adriano Goncalves. All rights reserved.
//

import UIKit

extension MainViewController: iCarouselDataSource {

   func numberOfItemsInCarousel(carousel: iCarousel) -> Int {
      return 3
   }
   
   func carousel(carousel: iCarousel, viewForItemAtIndex index: Int, reusingView view: UIView?) -> UIView {
      let image = UIImage(named: "Baby \(index+1)")
      let imageView = UIImageView(image: image)
      let view = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: image!.size))
      view.addSubview(imageView)
      return view
   }
   
}

extension MainViewController: iCarouselDelegate {
   func carousel(carousel: iCarousel, valueForOption option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
      switch option {
      case .Wrap: return 1.0
      default: return value
      }
   }
}