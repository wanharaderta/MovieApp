//
//  NSManagedObjectContext+Extensions.swift
//  KBApp
//
//  Created by Wanhar on 16/03/21.
//

import Foundation
import UIKit
import CoreData

extension NSManagedObjectContext {
    static var current : NSManagedObjectContext {
        let appDelegate  = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}
