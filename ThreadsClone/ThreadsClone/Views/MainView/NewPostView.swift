//
//  NewPostView.swift
//  ThreadsClone
//
//  Created by Muneera Y on 04/02/1445 AH.
//

import SwiftUI

struct NewPostView: View {
    @State var postContent: String = ""
    var body: some View {
        VStack{
//            ZStack{
//                Text("New thread")
//                HStack{
//
//                    Button(action: {
//
//                    }, label: {
//                        Text("Cancel")
//                    }).foregroundColor(.gray)
//                    Spacer()
//                }
//            }
            HStack(alignment: .top
            ){
                VStack{
                    AsyncImage(url:URL(string:  "https://source.unsplash.com/40x40/?person")
                    ) {result in
                        if let image = result.image {
                            image.resizable()
                                .scaledToFill()
                               
                                .cornerRadius(16)
                            
                        } else {
                            //                    Rectangle()
                            //                        .fill(Color.black.opacity(0.1))
                            ProgressView()
                        }
                        
                    }
                    .frame(width: 30,height: 20)
                    
                    Rectangle()
                        .fill(.gray)
                        .frame(width: 2, height: 100)
                }
                VStack(alignment: .leading){
                   Text("username")
                    TextEditor(text: $postContent).frame(maxHeight: 65)
                    Button(action: {
                        
                    }, label: {
                        Text("&")
                    })
                }
//                .frame()
            }
            Spacer()
            HStack{
                Button(action: {
                    
                }, label: {
                    Text("Anyone can reply")
                }).foregroundColor(.gray)
                Spacer()
                Button(action: {
                    
                }, label: {
                    Text("Post")
                })
            }.padding()
        }
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}
