//
//  Note.swift
//  MakeSchoolNotes
//
//  Created by Apple on 7/16/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import Foundation
import RealmSwift
class Note: Object
{
    dynamic var title = ""
    dynamic var content = ""
    dynamic var modificationTime = NSDate()
}