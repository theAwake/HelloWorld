//
//  NetworkCallHandler.swift
//  HelloWorld
//
//  Created by Nimit Dineshbhai Kalaria on 8/23/17.
//  Copyright © 2017 Nimit Dineshbhai Kalaria. All rights reserved.
//

import Foundation


class NetworkCallHandler {
    
    
    let zomato_categories_url = "https://developers.zomato.com/api/v2.1/categories"
    let userKeyForZomato = "5fc74b5deb9c4311605cfa6c9d646342"
    
    let queue: OperationQueue = OperationQueue();
    
    func getCategoriesData (completionBlock : @escaping (URLResponse?, Data?, Error?) -> Void){
        
        let url: URL = URL(string: zomato_categories_url)!
        var request = URLRequest(url: url)
        request.setValue(userKeyForZomato , forHTTPHeaderField: "user-key")
        NSURLConnection.sendAsynchronousRequest(request, queue: queue, completionHandler: completionBlock)
        
    }
    
}
