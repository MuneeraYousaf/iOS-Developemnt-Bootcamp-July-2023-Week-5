//
//  MainView.swift
//  ThreadsClone
//
//  Created by Muneera Y on 04/02/1445 AH.
//

import SwiftUI

struct MainView: View {
    enum Screen: String, CaseIterable{
        case home
        case search
        case newPost
        case activity
        case profile
    
        var title: String{
            switch self{
                
            case .home: return
                "Home"
            case .search:return
                "Search"
            case .newPost: return
                "New Post"
            case .activity: return
                "Activity"
            case .profile: return
                "Profile"
            }
        }
        var body: AnyView{
            switch self{
                
            case .home: return AnyView(HomeView())
               
            case .search:return
                AnyView(SearchView())
            case .newPost: return
                AnyView(NewPostView())
            case .activity: return
                AnyView(ActivityView())
            case .profile: return
                AnyView(ProfileView())
            }
        }
        var image: String
        {
            switch self{
                
            case .home: return
                "house"
            case .search:return
                "magnifyingglass"
            case .newPost: return
                "plus"
            case .activity: return
                "heart"
            case .profile: return
                "person"
            }
        }
    
    }
    @State var currentTitle:String  = "Home"
    @State var shouldPresent: Bool = false
    var body: some View {
        
        NavigationView {
            TabView{
    //            HomeView()
    //                .tabItem({
    //                    Image(systemName: "house")
    //                })
    //            SearchView()
    //                .tabItem({
    //                    Image(systemName: "magnifyingglass")
    //                })
    //
    //            NewPostView()
    //                .tabItem({
    //                    Image(systemName: "plus")
    //                })
    //            ActivityView()
    //                .tabItem({
    //                    Image(systemName: "heart")
    //                })
    //            ProfileView()
    //            .tabItem({
    //                Image(systemName: "person")
//                })
                
                ForEach(Screen.allCases, id: \.self ){
                    screen in
                    screen.body
                        .tabItem({
                            Image(systemName: screen.image)
                           Text( screen.title)
                            
                            
                        }).onAppear(){
                            currentTitle = screen.title
                        }
                }
               
            } .navigationTitle(currentTitle)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
