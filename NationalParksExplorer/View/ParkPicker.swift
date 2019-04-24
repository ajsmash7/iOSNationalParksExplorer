//
//  ParkPicker.swift
//  NationalParksExplorer
//
//  Created by AJMac on 4/23/19.
//  Copyright © 2019 AJMac. All rights reserved.
//

import Foundation
import UIKit

class ParkPicker: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var parks: [NationalPark] = []
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return parks.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if parks.indices.contains(row) {
            return parks[row].fullName
        } else {
            return nil
        }
    }
    
    func parkFor(row: Int) -> NationalPark? {
        if parks.indices.contains(row) {
            return parks[row]
        } else {
            return nil
        }
    }
}
