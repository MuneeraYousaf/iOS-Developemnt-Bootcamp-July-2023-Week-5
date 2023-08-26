//
//  HomeView.swift
//  ThreadsClone
//
//  Created by Muneera Y on 04/02/1445 AH.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var UserData: UserDataViewModel

    var body: some View {
        VStack{
//            Text("hwlcajhncljahsbcld")
            ScrollView{
                ForEach(UserData.post){
                    postData in
                    if let user = UserData.fetchUserById(postData.createdBy){
                        NavigationLink(destination: {
                            PostScreenView(posModelt: postData, userModel: user)
                        }, label: {
                            PostCardCompenetView(post: postData, userModel: user )
                        }).buttonStyle(.plain)
                        
                        //                PostCardCompenetView()
                        //                PostCardCompenetView()
                    }
                    
                }
            }
            
        }
    }
}
//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView().environmentObject()
//    }
//}
//هعلهعله٧٧٧٧
