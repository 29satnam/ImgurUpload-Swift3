# Imgur Upload Using Swift 3

##Usage:

1) Import Alamofire and SwiftJSON
2) Drag ImgurUpload.swift to your project.
3) This is how you can simply upload an Image to Imagur 

        uploadToImgur(image: imagee.image!) { (success, url) in
            if success {
                let stringUrl = "\(url)"
                let index = stringUrl.index(stringUrl.startIndex, offsetBy: 19)
                print(stringUrl.substring(from: index))
                
            }
        }
