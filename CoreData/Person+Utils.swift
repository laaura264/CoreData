//
//  Person+Utils.swift
//  CoreDataSample
//
//  Created by Laura Arranz on 05/02/2019.
//  Copyright © 2019 Laura Arranz. All rights reserved.
//

import Foundation
import CoreData

extension Person {
    
    func fullName() -> String{
        return "\(self.firstname) \(self.lastname)"
    }
}
