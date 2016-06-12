//
//  TabBarViewController.swift
//  TumblrAssignment
//
//  Created by Scott Horsfall on 6/11/16.
//  Copyright © 2016 Scott Horsfall. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {
    
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var overlayView: UIView!
    
    // setup view controllers
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    // setup array
    var viewControllers: [UIViewController]!
    // setup view selection tracking
    var selectedIndex: Int = 0
    
    // setup explore tooltip
    @IBOutlet weak var exploreTooltip: UIImageView!
    var exploreTooltipOriginalCenter: CGPoint!
    
    var fadeTransition: FadeTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController")
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController")
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController")
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController")
        
        viewControllers = [homeViewController, searchViewController,accountViewController, trendingViewController]
        
        // setup the initial view (index 0)
        buttons[selectedIndex].selected = true
        didPressTab(buttons[selectedIndex])
        
        exploreTooltipOriginalCenter = exploreTooltip.center
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(animated: Bool) {
        
        UIView.animateWithDuration(1, delay: 0.0, options: [.Repeat, .Autoreverse], animations: {
         self.exploreTooltip.center.y = self.exploreTooltipOriginalCenter.y - 8.0
         }) { (Bool) in
         ///
         
         }
        
    }
    
    @IBAction func didPressTab(sender: UIButton) {
        
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        
        buttons[previousIndex].selected = false
        let previousVC = viewControllers[previousIndex]
        previousVC.willMoveToParentViewController(nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        sender.selected = true
        let vc = viewControllers[selectedIndex]
        addChildViewController(vc)
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        vc.didMoveToParentViewController(self)
        
        
        // hide the explore tooltip
        if selectedIndex == 1 {
            hideExploreTooltip()
        }
        
    }
    
    func hideExploreTooltip() {
        exploreTooltip.alpha = 0
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Access the ViewController that you will be transitioning too, a.k.a, the destinationViewController.
        let destinationViewController = segue.destinationViewController
        
        // Set the modal presentation style of your destinationViewController to be custom.
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        // Create a new instance of your fadeTransition.
        fadeTransition = FadeTransition()
        
        // Tell the destinationViewController's  transitioning delegate to look in fadeTransition for transition instructions.
        destinationViewController.transitioningDelegate = fadeTransition
        
        // Adjust the transition duration. (seconds)
        fadeTransition.duration = 1.0
    }

}
