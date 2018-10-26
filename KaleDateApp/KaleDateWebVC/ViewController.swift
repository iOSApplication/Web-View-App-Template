//
//  ViewController.swift
//  SwiftWebVCExample
//
//  Created by Abhay Korat on 19/04/17.
//  Copyright © 2017 Abhay Korat. All rights reserved.

import UIKit

class ViewController: UIViewController,UIWebViewDelegate {

    @IBOutlet weak var viewObjFadetype: UIImageView!
   // @IBOutlet weak var viewObjFadetype: UIView!
   // @IBOutlet weak var WebObjLoadingView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.viewObjFadetype.alpha = 0.0
        
//        UIView.animate(withDuration: 2.0, animations: {
//            self.viewObjFadetype.alpha = 1.0
//            
//        })
        
        UIView.animate(withDuration: 2.5, delay: 0.0,
                       options: [],
                       animations: {
                        self.viewObjFadetype.alpha = 1.0
        }, completion: {_ in
            let webVC = SwiftWebVC(urlString: "https://kaledate.com")
            webVC.delegate = self
            self.navigationController?.pushViewController(webVC, animated: true)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide the navigation bar for current view controller
        self.navigationController?.isNavigationBarHidden = true;
    }

}

/* 
 <style>.loading{position:fixed;z-index:999;height:2em;width:2em;overflow:show;margin:auto;top:0;left:0;bottom:0;right:0}.loading:before{content:'';display:block;position:fixed;top:0;left:0;width:100%;height:100%;background-color:#fff}.loading:not(:required){font:0/0 a;color:transparent;text-shadow:none;background-color:transparent;border:0}.loading:not(:required):after{content:'';display:block;font-size:10px;width:1em;height:1em;margin-top:-0.5em;-webkit-animation:spinner 2000ms infinite linear;-moz-animation:spinner 2000ms infinite linear;-ms-animation:spinner 2000ms infinite linear;-o-animation:spinner 2000ms infinite linear;animation:spinner 2000ms infinite linear;border-radius:.5em;-webkit-box-shadow:rgba(0,0,0,0.75) 1.5em 0 0 0,rgba(0,0,0,0.75) 1.1em 1.1em 0 0,rgba(0,0,0,0.75) 0 1.5em 0 0,rgba(0,0,0,0.75) -1.1em 1.1em 0 0,rgba(0,0,0,0.5) -1.5em 0 0 0,rgba(0,0,0,0.5) -1.1em -1.1em 0 0,rgba(0,0,0,0.75) 0 -1.5em 0 0,rgba(0,0,0,0.75) 1.1em -1.1em 0 0;box-shadow:rgba(85,205,0,100) 1.5em 0 0 0,rgba(85,205,0,90) 1.1em 1.1em 0 0,rgba(85,205,0,80) 0 1.5em 0 0,rgba(85,205,0,70) -1.1em 1.1em 0 0,rgba(85,205,0,60) -1.5em 0 0 0,rgba(85,205,0,50) -1.1em -1.1em 0 0,rgba(85,205,0,40) 0 -1.5em 0 0,rgba(85,205,0,30) 1.1em -1.1em 0 0}@-webkit-keyframes spinner{0%{-webkit-transform:rotate(0deg);-moz-transform:rotate(0deg);-ms-transform:rotate(0deg);-o-transform:rotate(0deg);transform:rotate(0deg)}100%{-webkit-transform:rotate(360deg);-moz-transform:rotate(360deg);-ms-transform:rotate(360deg);-o-transform:rotate(360deg);transform:rotate(360deg)}}@-moz-keyframes spinner{0%{-webkit-transform:rotate(0deg);-moz-transform:rotate(0deg);-ms-transform:rotate(0deg);-o-transform:rotate(0deg);transform:rotate(0deg)}100%{-webkit-transform:rotate(360deg);-moz-transform:rotate(360deg);-ms-transform:rotate(360deg);-o-transform:rotate(360deg);transform:rotate(360deg)}}@-o-keyframes spinner{0%{-webkit-transform:rotate(0deg);-moz-transform:rotate(0deg);-ms-transform:rotate(0deg);-o-transform:rotate(0deg);transform:rotate(0deg)}100%{-webkit-transform:rotate(360deg);-moz-transform:rotate(360deg);-ms-transform:rotate(360deg);-o-transform:rotate(360deg);transform:rotate(360deg)}}@keyframes spinner{0%{-webkit-transform:rotate(0deg);-moz-transform:rotate(0deg);-ms-transform:rotate(0deg);-o-transform:rotate(0deg);transform:rotate(0deg)}100%{-webkit-transform:rotate(360deg);-moz-transform:rotate(360deg);-ms-transform:rotate(360deg);-o-transform:rotate(360deg);transform:rotate(360deg)}}</style>
 <div class="loading">Loading;</div>
 */

extension ViewController: SwiftWebVCDelegate {
    
    func didStartLoading() {
        print("Started loading.")
    }
    
    func didFinishLoading(success: Bool) {
        print("Finished loading. Success: \(success).")
    }
}
