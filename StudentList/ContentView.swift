//
//  ContentView.swift
//  StudentList
//
//  Created by Chirag's on 11/04/20.
//  Copyright © 2020 Chirag's. All rights reserved.
//

import SwiftUI
struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: StudentData.getAllStudentList()) var students: FetchedResults<StudentData>
    @State var isActive : Bool = false
    var body: some View {
        NavigationView {
            VStack{
                NavigationLink(destination: AddStudentDetail(isActive: $isActive), isActive: $isActive, label: {
                    Text("")
                })
                List {
                    ForEach(students, id: \.self) { s in
                        StudentCardView(name: s.name ?? "", std: s.std ?? "", mobile: s.mobile ?? "", birthdate: s.birthdate ?? "", email: s.email ?? "")
                    }.onDelete { (index) in
                        self.delete(at: index)
                    }
                }.onAppear { UITableView.appearance().separatorStyle = .none }
                    .navigationBarTitle("Student List", displayMode: .inline)
                    .navigationBarItems(trailing:Image(systemName : "plus").onTapGesture {
                        self.isActive = true
                    } )
            }
        }
    }
    
    func delete(at offset: IndexSet) {
        let deleteStudent = self.students[offset.first!]
        self.managedObjectContext.delete(deleteStudent)
        do {
            try self.managedObjectContext.save()
        }catch {
            print("Error:- \(error.localizedDescription)")
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
