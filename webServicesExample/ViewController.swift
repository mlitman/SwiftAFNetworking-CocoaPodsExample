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
                //Displays the entire JSON object that was returned
                //JSONObjects are stored as NSDictionary
                //JSONArrays are stored as NSArray
                let theJSON = responseObject as! NSDictionary
                //print("Entire JSON: \(theJSON.description)")
                
                let theCity = theJSON["city"] as! NSDictionary
                //print("The City: \(theCity.description)")
                
                let theCoords = theCity["coord"] as! NSDictionary
                //print("The Coordinates: \(theCoords.description)")
                //print("Lat: \(theCoords["lat"]!) Lon: \(theCoords["lon"]!)")
                
                let theList = theJSON["list"] as! NSArray
                let theListElement = theList[0] as! NSDictionary
                let theTemp = theListElement["temp"] as! NSDictionary
                //print("Max Temp: \(theTemp["max"]!)")
                let theWeather = theListElement["weather"] as! NSArray
                let theWeatherElement = theWeather[0] as! NSDictionary
                print("Today's weather: \(theWeatherElement["description"])")
                
                
            })
            { (operation:AFHTTPRequestOperation?, error:NSError) -> Void in
                print("Error: " + error.localizedDescription)
        }

    func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        }
    }
}