//
//  TLButtonView.swift
//  ToDoList
//
//  Created by apple on 15/05/24.
//

import SwiftUI

struct TLButtonView: View {
    let title : String
    let backkground : Color
    let action: () ->  Void
    
    
    var body: some View {
        Button {
            action()
            //Attempt Log in
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color.brown)
                
                Text(title)
                    .bold()
                    .foregroundColor(Color.white)
            }
        }
        .padding()
    }
    
    struct TLButtonView_Previews: PreviewProvider {
        static var previews: some View {
            TLButtonView(title: "Title",
                         backkground: .brown,action: {
                
            })
        }
    }
}
