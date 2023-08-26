//
//  AuthViewModel.swift
//  ThreadsClone
//
//  Created by Muneera Y on 05/02/1445 AH.
//

import Foundation
import SwiftUI
class AuthViewModel: ObservableObject{
    
//    @AppStorage("token") var auth :Bool = false
    @AppStorage ("token") var token: String = ""
    
    func signIn(_ id: UserModel.ID) -> Bool{
        token = id.uuidString
        return true
    }
    func signOut()->Bool{
        token = ""
        return false
    }
    func reset() {
        token = ""
        
    }
}
