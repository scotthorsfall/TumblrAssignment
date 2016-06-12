//
//  SearchViewController.swift
//  TumblrAssignment
//
//  Created by Scott Horsfall on 6/11/16.
//  Copyright © 2016 Scott Horsfall. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var loadingIndicator: UIImageView!
    var loading_1: UIImage!
    var loading_2: UIImage!
    var loading_3: UIImage!
    var images: [UIImage]!
    var animatedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = imageView.frame.size
        
        loading_1 = UIImage(named: "loading-1")
        loading_2 = UIImage(named: "loading-2")
        loading_3 = UIImage(named: "loading-3")
        
        images = [loading_1, loading_2, loading_3]
        animatedImage = UIImage.animatedImageWithImages(images, duration: 0.85)
        
        loadingIndicator.image = animatedImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        // hide the background image feed and show the custom loading indicator
        imageView.alpha = 0
        loadingIndicator.alpha = 1
    }
    
    override func viewDidAppear(animated: Bool) {
        // add a delay method
        delay(1.5)  {
            // In the completion block of the delay, hide the custom loading indicator and show the background image feed
            UIView.animateWithDuration(0.4, animations: { 
                // animate this
                
                self.imageView.alpha = 1
                self.loadingIndicator.alpha = 0
                
                }, completion: { (Bool) in
                    // complete
            })
        }
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }

}
