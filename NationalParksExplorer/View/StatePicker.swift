//
//  StatePicker.swift
//  NationalParksExplorer
//
//  Created by AJMac on 4/23/19.
//  Copyright © 2019 AJMac. All rights reserved.
//

import Foundation
import UIKit

class StatePicker: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let states: [String]
    
    init(states: [String]) {
        self.states = states
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func stateFor(row: Int) -> String {
        return states[row]
    }
    
}
