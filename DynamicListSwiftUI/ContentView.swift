//
//  ContentView.swift
//  DynamicListSwiftUI
//
//  Created by Jhonatan Fernando on 20/10/19.
//  Copyright © 2019 Jhonatan Fernando. All rights reserved.
//

import SwiftUI

struct User : Identifiable
{
    var id: Int
    
    let userName, message, imageName : String
}

struct ContentView: View {
    
    let users: [User] = [
        .init(id: 1, userName: "Tim Cook", message: "My nice shiny new monitor stand is $999", imageName: "tim_cook"),
        .init(id: 2, userName: "Craig Federighi", message: "My nice shiny new monitor stand is $999", imageName: "craig_f"),
        .init(id: 3, userName: "John Ivey", message: "My nice shiny new monitor stand is $999", imageName: "jon_ivey")
    ]
    
    var body: some View {
        NavigationView
            {
                List
                {
                    Text("Users").font(.title)
                    ForEach(users, id: \.id)
                    { user in
                        UserRow(user: user)
                    }
                    
                }.navigationBarTitle(Text("Dynamic List"))
        }
    }
}

struct UserRow : View
{
    let user : User
    
    var body : some View
    {
        HStack {
            Image(user.imageName)
                .resizable()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 4))
                .frame(width: 70, height:70)
            
            VStack(alignment: .leading) {
                Text(user.userName).font(.headline)
                Text(user.message).font(.subheadline)
                .lineLimit(nil)
            }.padding(.leading, 8)
        }.padding(.init(top:12, leading:0, bottom:12, trailing:0))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
