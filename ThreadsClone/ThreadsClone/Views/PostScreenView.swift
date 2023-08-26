//
//  PostScreenView.swift
//  ThreadsClone
//
//  Created by Muneera Y on 06/02/1445 AH.
//

import Foundation
import SwiftUI
// عدلنا هنا اضفنا userData Enviroment

struct PostScreenView: View {
    @State var posModelt: Post
    @State var userModel: UserModel
    @EnvironmentObject var userData: UserDataViewModel

    var body: some View {
//                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//        VStack{
            ScrollView(showsIndicators: false){
                PostCardCompenetView(post: posModelt, userModel: userModel )
                Divider()
                ForEach(posModelt.replay, id: \.self){ postID in
                    if let post = userData.fetchPostById(postID) {
                        if let user = userData.fetchUserById(post.createdBy){
                            PostCardCompenetView(post: post, userModel: user )
                            
                        }
                        
                    }
                    
                }
            }
//        }
    }
}
//struct PostScreenView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostScreenView()
//    }
//}
