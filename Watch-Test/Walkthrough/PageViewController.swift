//
//  PageViewController.swift
//  Watch-Test
//
//  Created by Kaleb Wijaya on 21/07/19.
//  Copyright © 2019 Kaleb Wijaya. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    lazy var viewControllerList:[UIViewController] = {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let pageOne = sb.instantiateViewController(withIdentifier: "PageOne")
        let pageTwo = sb.instantiateViewController(withIdentifier: "PageTwo")
        let pageThree = sb.instantiateViewController(withIdentifier: "PageThree")
        
        return [pageOne, pageTwo, pageThree]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        
        if let firstViewController = viewControllerList.first{
            self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    
        guard let vcIndex = viewControllerList.firstIndex(of: viewController) else {return nil}
        
        let prevIndex = vcIndex - 1
        
        guard prevIndex >= 0 else {return nil}
        
        guard viewControllerList.count > prevIndex else {return nil}
        
        return viewControllerList[prevIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = viewControllerList.firstIndex(of: viewController) else {return nil}
        
        let nextIndex = vcIndex + 1
        
        guard viewControllerList.count != nextIndex else {return nil}
        
        guard viewControllerList.count > nextIndex else {return nil}
        
        return viewControllerList[nextIndex]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
