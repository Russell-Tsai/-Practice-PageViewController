//
//  ViewController.swift
//  PageView
//
//  Created by 蔡松樺 on 19/12/2017.
//  Copyright © 2017 蔡松樺. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Load")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let pageViewController = storyboard?.instantiateViewController(withIdentifier: "WalkthroughController") as? PageViewController{
            
            present(pageViewController, animated: true, completion: nil)
        }
    }

}

