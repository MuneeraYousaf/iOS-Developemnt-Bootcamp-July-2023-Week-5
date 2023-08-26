//
//  PostCardCompenetView.swift
//  ThreadsClone
//
//  Created by Muneera Y on 05/02/1445 AH.
//

import Foundation
import SwiftUI

struct PostCardCompenetView: View {
   @State var post: Post
 
   
    @EnvironmentObject var auth: AuthViewModel
    // post model
    let userModel: UserModel
    var body: some View {
   
            HStack{
                VStack{
//               Text("jwhaoihdpi")
                    AsyncImage(url: userModel.image)
                    {result in
                        if let image = result.image {
                            image.resizable()
                                .scaledToFill()
                               
                                .cornerRadius(16)
                            
                        } else {
                            //                    Rectangle()
                            //                        .fill(Color.black.opacity(0.1))
                            ProgressView()
                        }
                        
                    }   .frame(width: 30,height: 20)
                    Spacer()
                  
                }
                VStack{
                    HStack{
                        Text(userModel.userName)
                        Spacer()
                        Text(changeformatOfDate())
                        Image(systemName: "ellipsis")
                    }.padding(1)
                    
                    if let content = post.content{
                        Text(content).frame(maxWidth: .infinity, alignment: .leading)
                    } //
                    
                    
                    if post.attachment.count > 0 {
                        
                    
                        ScrollView(.horizontal){
                            
                            HStack{
                                ForEach(post.attachment, id:\.self){ i in
                                    AsyncImage(url:URL(string:  "https://source.unsplash.com/300x200/?person")
                                    ){ result in
                                        if let image = result.image {
                                            image.resizable()
                                                .scaledToFill()
                    
                                                .cornerRadius(16)
                                            
                                        } else {
    
                                            ProgressView()
                                        }
                                        
                                    }.frame(width: 250, height: 200)
                                        .scaledToFit()
                                        .cornerRadius(12)

                                    
                                    Spacer()
                                }
                            }
                        }
                        
                    }
                    HStack{
                        if post.likes.contains(UUID(uuidString: auth.token)!){
                            
                            Image(systemName: "heart.fill").foregroundColor(.red)
                        }
                        else
                        {
                            Image(systemName: "heart")
                        }
                        Image(systemName: "message")
                        Image(systemName: "repeat")
                        Image(systemName: "location")
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(post.replay.count) replies \(post.likes.count) likes").frame(maxWidth: .infinity, alignment: .leading)
                    Divider()
                        .padding()
                }
              
            }

        .padding(.horizontal)
    }
    func changeformatOfDate() -> String {
            //        var postDate: PostModel
              let formatter: DateIntervalFormatter = .init()
                 formatter.timeStyle = .short
    //           return  postModel.createdAt.formatted(date : .long , time : .omitted)
        let components = Calendar.current.dateComponents([.minute, .hour, .day], from: post.createdAt, to: Date())
            
            if let minuteCount = components.minute {
                if minuteCount >= 60 {
                    if let hoursCount = components.hour {
                        if hoursCount >= 24 {
                            if let dayCount = components.day {
                                if dayCount >= 28 {
                    return post.createdAt.formatted(date: .long, time: .omitted)

                                } else {
                                    return" \(dayCount) d"
                                }
                            }
                            
                        } else {
                            return " \(hoursCount)h"
                        }
                        
                    }
                } else {
                    return "\(minuteCount) m"
                }
                
            }
                return ""
        }
}





