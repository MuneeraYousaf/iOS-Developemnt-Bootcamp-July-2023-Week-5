//
//  UserData.swift
//  ThreadsClone
//
//  Created by Muneera Y on 05/02/1445 AH.
//

import Foundation
class UserDataViewModel: ObservableObject {
    @Published var post: Array <Post> = []
    @Published var users: Array <UserModel> = []
    
    init(){
        //prepare data
        let  maxNumberOfUsers = 100
        for _ in 0..<100{
            let  firstandlastname = makeRandomFullName()
            let fullname =  "\(firstandlastname[0]) \(firstandlastname[1])"
            let username = "\(firstandlastname[0]).\(firstandlastname[1])".lowercased()
            let user = UserModel(userName: username,
                                 fullName: fullname,
                                 bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                                 image: URL(string: "https://source.unsplash.com/300x400/?person")!,
                                 followers: [],
                                 following: [],
                                 posts: [])
            users.append(user)
 
      
        }
        let maxNumberOfPosts = maxNumberOfUsers * 5
        for _ in 0..<maxNumberOfPosts {
            let userId = users.randomElement()!.id
            let postData =
            Post(createdBy: userId, content: makeRandomContent(),
                 createdAt: Date(), attachment: makeRandomAttachments(), replay: [], likes:[])
            
            post.append(postData)
//            let index = users.firstIndex(where: { user in
//            user.id == userId
//            })
//            if let index = index {
//            users[index].posts.append(postData.id)
//            }
            let index = users.firstIndex(where: { user in
                user.id == userId
            })
            if let index = index {
                users[index].posts.append(postData.id)
            }
        }
        // prepare following
        for _ in 0..<(maxNumberOfUsers * 2) {
            let user1 = users.indices.randomElement()!
            let user2 = users.indices.randomElement()!
            if user1 != user2 {
                users [user1].following.append(users[user2].id)
                users[user2].followers.append(users[user1].id)
            }
        }
        
//        fetchPost()
        // prepare likes
        for _ in 0..<(maxNumberOfPosts * 5) {
            let userIndex = users.indices.randomElement()!
            let postIndex = post.indices.randomElement()!
            let isNotLiking = post[postIndex].likes
                .contains (users[userIndex].id) == false
            if isNotLiking {
                post[postIndex].likes.append(users[userIndex].id)
            }
        }
    }
    
   
    
    
    
    func fetchPost() {
        let numberOfPost = Int.random(in: 3...10)
//        let randomUserId = users.Id
        var _post:  Array <Post> = []

        for _ in 0...numberOfPost {
            let arraypost = Post(createdBy: UUID() , content: makeRandomContent(),
                                 createdAt: Date(), attachment: makeRandomAttachments(), replay: [], likes:[])
            
            
            _post.append(arraypost)
            
        }
        post = _post
//        print("\(post)")
    }
    //userName: makeRandomFullName(), userImage: URL(string: "https://source.unsplash.com/600x500/?person")!
    func  makeRandomFullName() -> Array<String>{
        //        let shouldContainContent = Bool.random()
        let username = """
        Abd al-Uzza
        Abdus Salam
        Abd Manaf
        Abd Rabbo
        Abdel Fattah
        Abdel Nour
        Abdul Ahad
        Abdul Ali
        Abdul Alim
        Abdul Azim
        Abd al-Aziz
        Abdul Baqi
        Abdul Bari
        Abdul Basir
        Abdul Basit
        Abdul Ghaffar
        Abdul Ghani
        Abdul Hadi
        Abdul Hafiz
        Abdul Hai
        Abdul Hakim
        Abdul Halim
        Abdul Hamid
        Abdul Haq
        Muneera Yousaf
        Hanadi Yousef
        """
            .components(separatedBy: "\n")
        //random line
        
        return username.randomElement()!.components(separatedBy: " ")
        //        return ""
    }
    func makeRandomContent() -> Optional<String>{
        let shouldContainContent = Bool.random()
        if shouldContainContent{
            return "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable."
            
        }
        else{
            return ""
        }
    }
    func makeRandomAttachments() -> Array<URL> {
        let numberOfImage = Int.random(in: 0...5)
        var arrayOfURL =  Array<URL>()
        for _ in 0...numberOfImage{
            arrayOfURL.append( URL(string: "https://source.unsplash.com/40x40/?person")!)
        }
        return arrayOfURL
    }
    
    func fetchUserById(_ userID: UserModel.ID) -> Optional<UserModel>{
        let index = users.firstIndex(where: { user in
            user.id == userID
        } )
        if let index = index {
            return users[index]
        } else {
            return nil
            
        }
    }
    
    
    
    func fetchPostById(_ postId: Post.ID) -> Optional<Post> {
        let index = post.firstIndex(where: { post in
            post.id == postId})
        if let index = index {
            return post[index]
        }
        return nil
        
        
    }
    
    //    func makeRandomReplies() -> Array<Post> {
    //        let numberOfPost = Int.random(in: 0...10)
    //        var arrayOfPost = Array <Post>()
    //        for _ in 0...numberOfPost {
    //            let postReplay = Post(userName: makeRandomFullName(), userImage: URL(string: "https://source.unsplash.com/250x150/?person")!, content: makeRandomContent(), createdAt: Date(), attachment: makeRandomAttachments(), replay: [], likes: Int.random(in: 0...5))
    //            arrayOfPost.append(postReplay)
    //        }
    //        return arrayOfPost
    //    }
    
}


//            Post(username: makeRandomUsername(),
//                                       userImage: URL(string: "https://source.unsplash.com/250x150"),
//                                       content: makeRandomContent(),
//                                       attachement: makeRandomAttachments(),
//                                       replies: [],
//                                       likes: Int.random(in: 0..<100),
//                                       createdAt: Date())


// .append(makeRandomPost(shouldHaveReplies : false))

//import Foundation
//import SwiftUI
//
//class UserDataViewModel: ObservableObject {
//    @Published var posts: Array<PostModel> = []
//
//    init() {
//        fetchData()
//    }
//
//    func fetchData(){
//        let numberOfPost = Int.random(in: 0...10)
//        var arrayOfPost = Array <Post>()
//        for _ in 0...numberOfPost {
//            let  post = PostModel (username: makeRandomUsername(),
//                                   userImage: URL(string: "https://source.unsplash.com/250x150"),
//                                   content: makeRandomContent(),
//                                   attachement: makeRandomAttachment(),
//                                   replies: makeRandomReplies(),
//                                   likes:Int.random(in: 0..<100),
//                                   createdAt: Date()
//            )
//            arrayOfPost.append(post)
//
//        }
//        posts = arrayOfPost
//    }
//
//    func makeRandomPost() -> Array<PostModel> {
//        let shouldContainContent = Bool.random()
//        var arrayOfPost = Array <PostModel>()
//        let  post = PostModel (username: makeRandomUsername(),
//                               userImage: URL(string: "https://source.unsplash.com/250x150"),
//                               content: makeRandomContent(),
//                               attachement: makeRandomAttachment(),
//                               replies: makeRandomReplies(),
//                               likes:Int.random(in: 0..<100),
//                               createdAt: Date()
//        )
//        arrayOfPost.append(post)
//        return arrayOfPost
//    }
//

//
//    func makeRandomAttachment() -> Array<URL> {
//
//        let numberOfImage = Int.random(in: 0...5)
//        var arrayOFURLs = Array<URL>()
//        for _ in 0...numberOfImage {
//            arrayOFURLs.append(URL(string: "https://source.unsplash.com/250x150")!)
//        }
//        return arrayOFURLs
//    }
//
//    //
//    func makeRandomArrayOfPosts()-> Array<PostModel> {
//        let numberOfPost = Int.random(in: 3...10)
//        var arrayOfPost = Array <PostModel>()
//        // var _posts : Array<PostModel> = []
//        for _ in 0...numberOfPost {
//            arrayOfPost
//            //                .append(makeRandomPost(shouldHaveReplies: false))
//        }
//        return arrayOfPost
//    }
//
//    func makeRandomUsername() ->String
//    {
//        let name = """
//Abbad
//Abbas
//Abd al-Uzza
//Abdus Salam
//Abd Manaf
//Abd Rabbo
//Abdel Fattah
//Abdel Nour
//Abdi
//Abdolreza
//Abdu
//Abdul
//Abdul Ahad
//Abdul Ali
//Abdul Alim
//Abdul Azim
//Abd al-Aziz
//Abdul Baqi
//Abdul Bari
//Abdul Basir
//Abdul Basit
//Abdul Ghaffar
//Abdul Ghani
//Abdul Hadi
//Abdul Hafiz
//Abdul Hai
//Abdul Hakim
//Abdul Halim
//Abdul Hamid
//Abdul Haq
//"""
//            .components(separatedBy: "\n")
//        return name.randomElement()!
//    }
//    func makeRandomContent() -> Optional<String> {
//        let shouldContainContent = Bool.random()
//        if shouldContainContent {
//            return """
//
//Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
//
//"""
//        }
//      return ""





/*
 Mark:
 - Launch Screen.storyBoard
 -makeRandomDate()
 - Enhance PostComponentsView Vertical line
 
 */


// سوينا فنكشن من 
