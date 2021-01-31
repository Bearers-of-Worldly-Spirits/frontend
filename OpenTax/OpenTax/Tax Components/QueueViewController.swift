//
//  QueueViewController.swift
//  OpenTax
//
//  Created by Josh Arnold on 1/30/21.
//

import UIKit
import Closures


class QueueViewController : UINavigationController {

    
    var queue:[UIViewController] = []
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .systemRed        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }    
    
    func setQueue(_ queue: [BaseComponentViewController], animated:Bool = false) {
        self.queue = queue
        self.setViewControllers([self.queue.remove(at: 0)], animated: animated)        
    }
    
    override func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        super.setViewControllers(viewControllers, animated: animated)
        updateCurrentViewController()
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        updateCurrentViewController()
    }
    
    func updateCurrentViewController() {
        
        
        
        if self.viewControllers.count > 1 {
            let button = BarButtonItemFactory.basic()
            (button.customView as! UIButton).setTitle("Prev", for: .normal)
            self.viewControllers.last?.navigationItem.leftBarButtonItem = button
            
            (button.customView as! UIButton).onTap {
                self.queue.insert((self.viewControllers.last!), at: 0)
                self.popViewController(animated: true)
            }
        }
        
        
        if queue.count == 0 {
            
            let button = BarButtonItemFactory.basic()
            (button.customView as! UIButton).setTitle("Finish", for: .normal)
            self.viewControllers.last?.navigationItem.rightBarButtonItem = button
            
            (button.customView as! UIButton).onTap {
                self.dismiss(animated: true, completion: nil) // data stuff
            }
            
        }else{
            let button = BarButtonItemFactory.basic()
            self.viewControllers.last?.navigationItem.rightBarButtonItem = button
            (button.customView as! UIButton).onTap {
                if (self.viewControllers.last as? BaseComponentViewController)?.canProceed == false { // eventually will swap this with true
                    self.pushViewController(self.queue.remove(at: 0), animated: true)
                }
            }
        }
    }
}
