//
//  ViewController.swift
//  MXXmlReader
//
//  Created by 牟潇 on 16/1/15.
//  Copyright © 2016年 muxiao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        MXXmlReader(add: NSBundle.mainBundle().pathForResource("xml", ofType: nil)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

