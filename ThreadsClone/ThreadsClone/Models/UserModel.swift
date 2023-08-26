//
//  UserModel.swift
//  ThreadsClone
//
//  Created by Muneera Y on 07/02/1445 AH.
//

import Foundation

struct UserModel: Codable, Identifiable{
    typealias ID = UUID
    var id: ID = .init()
    let userName: String
    let fullName: String
    let bio : String
    let image: URL
    var followers: Array<UserModel.ID>
    var following: Array<UserModel.ID>
    var posts: Array<UserModel.ID>

}
