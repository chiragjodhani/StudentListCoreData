//
//  AddStudentDetail.swift
//  StudentList
//
//  Created by Chirag's on 11/04/20.
//  Copyright © 2020 Chirag's. All rights reserved.
//

import SwiftUI
import Neumorphic
struct AddStudentDetail: View {
    @State var addName = ""
    @State var addStd = ""
    @State var addMobile = ""
    @State var addBirthDate = ""
    @State var addEmailId = ""
    
    @Binding var isActive : Bool
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        let cornerRadius : CGFloat = 10
        Neumorphic.shared.colorScheme = colorScheme
        let mainColor = Neumorphic.shared.mainColor()
        let darkShadow = Neumorphic.shared.darkShadowColor()
        let lightShadow = Neumorphic.shared.lightShadowColor()
        return VStack{
            Text("Add Student Detail")
            HStack {
                Image(systemName: "person.circle")
                TextField("Enter your Name", text: $addName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding(8)
            HStack {
                Image(systemName: "book.circle")
                TextField("Enter your Std", text: $addStd)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding(8)

            HStack {
                Image(systemName: "phone.circle")
                TextField("Enter your Mobile", text: $addMobile)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding(8)
            HStack {
                Image(systemName: "calendar.circle")
                 TextField("Enter your Birthdate", text: $addBirthDate)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding(8)
            
            HStack {
                Image(systemName: "envelope.circle")
                 TextField("Enter your EmailId", text: $addEmailId)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding(8)
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
                Text("Add").foregroundColor(.green)
            }.softButtonStyle(RoundedRectangle(cornerRadius: cornerRadius), mainColor: mainColor, textColor: .white, darkShadowColor: darkShadow, lightShadowColor: lightShadow)
            .frame(width: 100, height: 40, alignment: .center).padding()
            
        }.padding()
    }
}

//struct AddStudentDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        AddStudentDetail()
//    }
//}

//            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0), lineWidth: 1))
