//
//  ViewController.swift
//  scrollview
//
//  Created by Javier Cabezas Leyton on 4/30/17.
//  Copyright © 2017 Javier Cabezas Leyton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var images = [ UIImageView]()
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var contentWidth: CGFloat = 0.0
        
        for x in 0...2 {
            let image = UIImage(named: "icon\(x).png")
            let imageView = UIImageView(image: image)
            self.images.append(imageView)
            
            var newX: CGFloat = 0.0
            
            //First loop X = mid, second loop X = 3/2 mid, etc..
            newX = view.frame.midX + view.frame.size.width * CGFloat(x)
            contentWidth += newX
            
            scrollView.addSubview(imageView)
            imageView.frame = CGRect(x: newX - 75, y: view.frame.size.height / 2 - 75, width: 150, height: 150)
        }
        
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
    }
}

