//
//  ViewController.swift
//  HelloWorld
//
//  Created by Nimit Dineshbhai Kalaria on 8/22/17.
//  Copyright © 2017 Nimit Dineshbhai Kalaria. All rights reserved.
//

import UIKit


protocol CellDelegate : class {
    func didChangeSwitchState(_ sender: TableCell, isOn: Bool)
}

class ViewController: UIViewController, UICollectionViewDataSource, CellDelegate {

    let myNetworkCall = NetworkCallHandler();
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var switchArray = Array(repeating: 0, count: 20);
    
    let identifier = "CellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.dataSource = self;
        //myNetworkCall.getCategoriesData(completionBlock: categoriesComplitionHandler)
        
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! TableCell
        cell.textField.text = "row \(indexPath.row)";
        cell.myswitch.isOn = switchArray[indexPath.row] == 0 ? false : true
        cell.switchDelegate = self
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    func categoriesComplitionHandler(response:URLResponse?, data:Data?, error: Error?) -> Void{
//        
//        do {
//            if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {
//                print("ASynchronous  :  \(jsonResult)")
//            }
//        } catch let error as NSError {
//            print(error.localizedDescription)
//        }
//    }
    
    func didChangeSwitchState(_ sender: TableCell, isOn: Bool){
        let indexPath = collectionView.indexPath(for: sender)
        if isOn {
            switchArray[indexPath!.row] = 1;
        } else {
            switchArray[indexPath!.row] = 0;
        }
        
    }
    
}

