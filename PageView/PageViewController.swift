//
//  PageViewController.swift
//  PageView
//
//  Created by 蔡松樺 on 19/12/2017.
//  Copyright © 2017 蔡松樺. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    var pageContents : [String] = ["First: We are the World", "Second: I love you", "Third: In the end"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //將資料來源設定自己
        dataSource = self
        //建立第一個導覽畫面
        if let startViewController = contentViewController(at: 0 ){
            setViewControllers([startViewController], direction: .forward, animated: true, completion: nil)
        }

    }
    
    func contentViewController(at index: Int) -> ContentViewController? {
        //確認頁面邊界
        if index < 0 || index >= pageContents.count {
            return nil
        }
        //具現頁面並提供資料顯示
        if let theContentViewController = storyboard?.instantiateViewController(withIdentifier: "WalkthroughContentViewController") as? ContentViewController{
            theContentViewController.index = index
            theContentViewController.content = pageContents[index]
            return theContentViewController
        }
        return nil
    }
    
    //UIPageViewControllerDataSource Methods
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! ContentViewController).index
        index -= 1
        
        return contentViewController(at: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! ContentViewController).index
        index += 1
        
        return contentViewController(at: index)
    }
    
//    func presentationCount(for pageViewController: UIPageViewController) -> Int {
//        return pageContents.count
//    }
//    
//    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
//        if let pageContentViewController = storyboard?.instantiateViewController(withIdentifier: "WalkthroughContentViewController") as? ContentViewController {
//            return pageContentViewController.index
//        }
//        return 0
//    }
    
    func forward(index: Int) {
        if let nextViewController = contentViewController(at: index + 1) {
            setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
}
