//
//  ContentView.swift
//  ThreadsClone
//
//  Created by Muneera Y on 04/02/1445 AH.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var userPrefrences: UserPrefrencesViewModel
    @State var showSplah = true
    var body: some View {
        VStack {
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
            
            if showSplah{
                splashView()
            }
            else{
                OnboardingView()
            }
//            if !userPrefrences.userPrefrences{
//                OnboardingView()
//            }
//            else{
//                MainView()
//            }
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView().environmentObject(UserPrefrencesViewModel())
            
    }
}
