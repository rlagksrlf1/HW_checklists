//
//  Checklist.swift
//  HW_checklists
//
//  Created by sgcs on 2019. 4. 13..
//  Copyright © 2019년 KwangHee Lim. All rights reserved.
//

import UIKit

class Checklist: NSObject, Codable {
    var name=""
    
    /* each Checklist object has Checklist item */
    var items = [ChecklistItem]()
    
    init(name: String) {
        self.name = name
        super.init()
    }
}
