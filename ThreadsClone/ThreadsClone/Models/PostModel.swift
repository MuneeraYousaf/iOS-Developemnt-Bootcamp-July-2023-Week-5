//
//  PostModel.swift
//  ThreadsClone
//
//  Created by Muneera Y on 05/02/1445 AH.
//

import Foundation

struct Post: Codable, Identifiable{
    var id: UUID = .init()
//    let userName: String
//    let userImage: URL
    let createdBy: UserModel.ID
    let content : String?
    let createdAt: Date
    let attachment: Array<URL>
    var replay: Array<UserModel.ID>
    var likes: Array<UserModel.ID>
}
