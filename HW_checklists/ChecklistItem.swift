//
//  ChecklistItem.swift
//  HW_checklists
//
//  Created by sgcs on 2019. 4. 12..
//  Copyright © 2019년 KwangHee Lim. All rights reserved.
//

import Foundation

class ChecklistItem:NSObject {
    var text=""
    var checked = false
    
    /* For toggling */
    func toggleChecked() {
        checked = !checked
    }
}
