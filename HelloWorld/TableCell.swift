//
//  TableCell.swift
//  HelloWorld
//
//  Created by Nimit Dineshbhai Kalaria on 8/24/17.
//  Copyright © 2017 Nimit Dineshbhai Kalaria. All rights reserved.
//

import Foundation
import UIKit


class TableCell : UICollectionViewCell {
    
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var myswitch: UISwitch!
    
    var switchDelegate: CellDelegate?
    
    @IBAction func mySwitchPressed(_ sender: UISwitch) {
        
        switchDelegate!.didChangeSwitchState(self, isOn: sender.isOn)
        
    }
    
}
