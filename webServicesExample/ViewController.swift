//
//  ViewController.swift
//  webServicesExample
//
//  Created by Eric M. Seitz on 11/30/15.
//  Copyright © 2015 Eric M. Seitz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let manager = AFHTTPRequestOperationManager()
        
        manager.GET("http://api.openweathermap.org/data/2.5/forecast/daily?q=London&mode=json&units=metric&cnt=1&appid=e425e752a1903323e671ef577cd15f28",
            parameters: nil,
            success: { (operation:AFHTTPRequestOperation, responseObject:AnyObject) -> Void in
                print("Response: " + responseObject.description)
            }) { (operation:AFHTTPRequestOperation?, error:NSError) -> Void in
                print("Error: " + error.localizedDescription)
        }

    func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        }
    }
}