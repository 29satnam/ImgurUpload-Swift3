//
//  ViewController.swift
//  Test
//
//  Created by Satnam Sync on 10/20/16.
//  Copyright © 2016 Silver Seahog. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    

    @IBOutlet weak var imagee: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        uploadToImgur(image: imagee.image!) { (success, url) in
            if success {
                let stringUrl = "\(url)"
                let index = stringUrl.index(stringUrl.startIndex, offsetBy: 19)
                print(stringUrl.substring(from: index))
                
            }
        }
    }
    
    
    

}

