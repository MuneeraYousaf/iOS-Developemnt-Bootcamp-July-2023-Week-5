//
//  splashView.swift
//  ThreadsClone
//
//  Created by Muneera Y on 05/02/1445 AH.
//

import Foundation

import SwiftUI

struct splashView: View {
    @EnvironmentObject var userPrefrences: UserPrefrencesViewModel
    @State var showSplah = true
    var body: some View {
        VStack {
            Image("2")

//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
            

        }
//        .padding()
      
        
            .onAppear(){
                DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                    withAnimation{
                        self.showSplah = false
                    }
                }
            }
    }
}

struct splashView_Previews: PreviewProvider {
    static var previews: some View {
        splashView().environmentObject(UserPrefrencesViewModel())
            
    }
}
