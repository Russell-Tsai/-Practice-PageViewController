//
//  ContentViewController.swift
//  PageView
//
//  Created by 蔡松樺 on 19/12/2017.
//  Copyright © 2017 蔡松樺. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var forwardButton: UIButton!
    
    var index = 0
    var content = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.currentPage = index
        contentLabel.text = content
        
        //若有三頁 Page
        switch index {
        case 0...1:
            forwardButton.setTitle("NEXT", for: .normal)
        case 2:
            forwardButton.setTitle("DONE", for: .normal)
        default:
            break
        }
    }
    
    @IBAction func nextBtnPressed(_ sender: Any) {
        switch index {
        case 0...1:
            let pageViewController = parent as! PageViewController
            pageViewController.forward(index: index)
        case 2:
            dismiss(animated: true, completion: nil)
        default:
            break
        }
    }
    

}
