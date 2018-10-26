//
//  SwiftWebVCActivitySafari.swift
//
//  Created by Abhay Korat on 19/04/17.
//  Copyright © 2017 Abhay Korat. All rights reserved.

//

import UIKit

class SwiftWebVCActivitySafari : SwiftWebVCActivity {
    
    override var activityTitle : String {
        return NSLocalizedString("Open in Safari", tableName: "SwiftWebVC", comment: "")
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        for activityItem in activityItems {
            if let activityItem = activityItem as? URL, UIApplication.shared.canOpenURL(activityItem) {
                return true
            }
        }
        return false
    }
    
    override func perform() {
        let completed: Bool = UIApplication.shared.openURL(URLToOpen! as URL)
        activityDidFinish(completed)
    }
    
}
