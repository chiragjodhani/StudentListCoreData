//
//  AddStudentDetail.swift
//  StudentList
//
//  Created by Chirag's on 11/04/20.
//  Copyright © 2020 Chirag's. All rights reserved.
//

import SwiftUI

struct AddStudentDetail: View {
    @State var addName = ""
    @State var addStd = ""
    @State var addMobile = ""
    @State var addBirthDate = ""
    @State var addEmailId = ""
    
    @Binding var isActive : Bool
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View {
        VStack{
            Text("Add Student Detail")
            TextField("Enter your Name", text: $addName).padding()
            TextField("Enter your Std", text: $addStd).padding()
            TextField("Enter your Mobile", text: $addMobile).padding()
            TextField("Enter your Birthdate", text: $addBirthDate).padding()
            TextField("Enter your EmailId", text: $addEmailId).padding()
            
            Button(action: {
                let student = StudentData(context: self.managedObjectContext)
                student.name = self.addName
                student.std = self.addStd
                student.mobile = self.addMobile
                student.birthdate = self.addBirthDate
                student.email = self.addEmailId
                do {
                    try self.managedObjectContext.save()
                }catch {
                    print("Error:- \(error.localizedDescription)")
                }
                self.addName = ""
                self.addStd = ""
                self.addMobile = ""
                self.addBirthDate = ""
                self.addEmailId = ""
                self.isActive.toggle()
            }) {
                Text("Add").frame(width: 100, height: 40, alignment: .center).background(Color.green).foregroundColor(.white).cornerRadius(10)
            }
            
        }.padding()
    }
}

//struct AddStudentDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        AddStudentDetail()
//    }
//}
