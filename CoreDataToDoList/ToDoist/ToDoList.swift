//
//  ToDoList.swift
//  ToDoist
//
//  Created by Parker Rushton on 10/28/22.
//

import Foundation

extension ToDoList {
    
    var itemsArray: [Item] {
        let array = items?.allObjects as? [Item]
        return array ?? []
    }
    
}
