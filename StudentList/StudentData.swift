//
//  StudentData.swift
//  StudentList
//
//  Created by Chirag's on 11/04/20.
//  Copyright © 2020 Chirag's. All rights reserved.
//

import Foundation
import CoreData

public class StudentData: NSManagedObject,Identifiable {
    @NSManaged var name: String?
    @NSManaged var std: String?
    @NSManaged var mobile: String?
    @NSManaged var birthdate: String?
    @NSManaged var email: String?
}
extension StudentData {
    static func getAllStudentList() -> NSFetchRequest<StudentData> {
        let request: NSFetchRequest<StudentData> = StudentData.fetchRequest() as! NSFetchRequest<StudentData>
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        return request
    }
}
