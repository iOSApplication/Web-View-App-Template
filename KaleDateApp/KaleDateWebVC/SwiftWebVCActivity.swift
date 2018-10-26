//
//  SwiftWebVCActivity.swift
//
//  Created by Abhay Korat on 19/04/17.
//  Copyright © 2017 Abhay Korat. All rights reserved.

//

import UIKit


class SwiftWebVCActivity: UIActivity {

    var URLToOpen: URL?
    var schemePrefix: String?
    
    override var activityType : UIActivityType? {
        let typeArray = "\(type(of: self))".components(separatedBy: ".")
        let type: String = typeArray[typeArray.count-1]
        return UIActivityType(rawValue: type)
    }
        
    override var activityImage : UIImage {
        if let type = activityType?.rawValue {
            return SwiftWebVC.bundledImage(named: "\(type)")!
        }
        else{
            assert(false, "Unknow type")
            return UIImage()
        }
    }
            
    override func prepare(withActivityItems activityItems: [Any]) {
        for activityItem in activityItems {
            if activityItem is URL {
                URLToOpen = activityItem as? URL
            }
        }
    }

}
