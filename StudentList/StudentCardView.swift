//
//  StudentCardView.swift
//  StudentList
//
//  Created by Chirag's on 11/04/20.
//  Copyright © 2020 Chirag's. All rights reserved.
//

import SwiftUI

struct StudentCardView: View {
    var name: String
    var std: String
    var mobile: String
    var birthdate: String
    var email: String
    var body: some View {
        HStack {
            Image("ic_person").resizable().frame(width: 50, height: 50, alignment: .center).padding(0)
            HStack {
                VStack{
                    Text("Name : ").frame(width: 85, height: 24, alignment: .trailing)
                    Text("Std  : ").frame(width: 85, height: 24, alignment: .trailing)
                    Text("Mobile : ").frame(width: 85, height: 24, alignment: .trailing)
                    Text("Birthdate : ").frame(width: 85, height: 24, alignment: .trailing)
                    Text("Email : ").frame(width: 85, height: 24, alignment: .trailing)
                }
                VStack(alignment: .leading){
                    Text("\(name)").frame(width: nil, height: 24, alignment: .leading)
                    Text("\(std)").frame(width: nil, height: 24, alignment: .leading)
                    Text("\(mobile)").frame(width: nil, height: 24, alignment: .leading)
                    Text("\(birthdate)").frame(width: nil, height: 24, alignment: .leading)
                    Text("\(email)").frame(width: nil, height: 24, alignment: .leading)
                }
            }.padding(4)
        }.frame(width: UIScreen.main.bounds.width - 32, height: nil, alignment: .leading).background(Image("background").resizable()).cornerRadius(8
        ).foregroundColor(.white)
    }
}

struct StudentCardView_Previews: PreviewProvider {
    static var previews: some View {
        StudentCardView(name: "Chirag", std: "12th", mobile: "9033473266", birthdate: "20th September", email: "jodhanichatur9@gmail.com")
    }
}
