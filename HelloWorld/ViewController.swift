//
//  ViewController.swift
//  HelloWorld
//
//  Created by Nimit Dineshbhai Kalaria on 8/22/17.
//  Copyright © 2017 Nimit Dineshbhai Kalaria. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let myNetworkCall = NetworkCallHandler();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myNetworkCall.getCategoriesData(completionBlock: categoriesComplitionHandler)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func categoriesComplitionHandler(response:URLResponse?, data:Data?, error: Error?) -> Void{
        
        do {
            if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {
                print("ASynchronous  :  \(jsonResult)")
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
}

