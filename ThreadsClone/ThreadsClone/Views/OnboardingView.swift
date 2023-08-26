//
//  OnboardingView.swift
//  ThreadsClone
//
//  Created by Muneera Y on 04/02/1445 AH.
//

import SwiftUI
enum CurrentPresentView{
    case authentication
    case mainView
}
struct OnboardingView: View {
    @State var presentView: CurrentPresentView = .authentication
    @EnvironmentObject var auth: AuthViewModel
    @EnvironmentObject var userData : UserDataViewModel
    var body: some View {
    
        switch presentView{
            
        case .authentication:
            VStack{
                Image("1")
                    .resizable()
                    .scaledToFit()
                Spacer()
                
//                NavigationLink(destination: {
//                    MainView()
//                }, label: {
//                    Text("Log in")
//                }).frame(width: 300, height: 50)
//                //                .padding()
//                                    .background(.gray.opacity(0.7))
//                                    .padding()
                Button(action: {
//                    presentView = .mainView
//                    let disSignInSucessfully  = auth.signIn()
//                    if let n =  auth.token{
//
//                    }
                    if auth.signIn(userData.users.randomElement()!.id){
                        presentView = .mainView
                    }
                    else {
                        presentView = .authentication
                    }
//                    presentView =  disSignInSucessfully ? .mainView : .authentication
                }, label:  {
                    Text("Log in") .frame(width: 300, height: 50)
                    //                .padding()
                                        .background(.gray.opacity(0.7))
                                        .cornerRadius(12)
                                        .padding()
                                        .foregroundColor(.white)
                    
                })
               
            }.onAppear(){
                if auth.token.isEmpty == false{
                    presentView = .mainView
                }
            }
            
        case .mainView:
            MainView()
        }
//        Text("Hello, OnboardingView!")
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
