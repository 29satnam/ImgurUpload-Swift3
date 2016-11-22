//
//  ImgurUpload.swift
//  Test
//
//  Created by Satnam Sync on 11/22/16.
//  Copyright © 2016 Silver Seahog. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

func uploadToImgur(image: UIImage, completionHandler:@escaping (Bool, URL) -> ()){
    let imageData = UIImageJPEGRepresentation(image, 1.0)!
    let base64Image = imageData.base64EncodedString(options: [])
    
    let headers = [
        "Content-Type": "multipart/form-data",
        "Authorization": "Client-ID Client_ID_HERE"
    ]
    
    let urlRequest = try! URLRequest(url: "https://api.imgur.com/3/image", method: .post, headers: headers)
    
    Alamofire.upload( multipartFormData: { multipartFormData in
        multipartFormData.append(base64Image.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName: "image")
        }, with: urlRequest, encodingCompletion: { encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    let json = JSON(data: response.data!)
                    print(json)
                    if let link = json["data"]["link"].string {
                        let url = URL(string: link)!
                        completionHandler(true, url)
                    }
                }
            case .failure(let encodingError):
                print(encodingError)
                completionHandler(false, URL(string: "www.wilsonding.com")!)
            }
    })
}
