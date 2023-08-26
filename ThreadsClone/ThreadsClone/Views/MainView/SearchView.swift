
import SwiftUI

struct SearchView: View {
    @State var searched: String = ""
    var body: some View {
        
        VStack{
            //search field
            HStack{
                Image(systemName: "person")
                TextField("search", text: $searched).frame(height: 40)
                
                
            }.frame(maxWidth: .infinity)
            .padding(.horizontal)
                .background(RoundedRectangle(cornerRadius: 12.5).fill(.gray.opacity(0.25))
                            
                )
                .padding()
            
            
            ScrollView{
                ForEach(0...10, id:\.self){ _ in
                    HStack(alignment: .top){
                        AsyncImage(url:URL(string:  "https://source.unsplash.com/40x40/?person")
                        ) {result in
                            if let image = result.image {
                                image.resizable()
                                    .scaledToFill()
                                    .clipShape(Circle())
                                //                                .cornerRadius(16)
                                
                            } else {
                                //                    Rectangle()
                                //                        .fill(Color.black.opacity(0.1))
                                ProgressView()
                            }
                            
                        } .frame(width: 40, height: 40)
                        VStack(alignment: .leading){
                            Text("Username")
                            Text("Flawless")
                            Text("455 Followers")
                        }.frame(maxWidth: .infinity, alignment: .leading)
                        Button(action: {
                            
                        }, label:{
                            Text("Follow")
                                .padding(.horizontal, 19)
                                .padding(.vertical, 8)
                                .background(RoundedRectangle(cornerRadius: 12.5).stroke(.gray.opacity(0.25))
                                )
                        }).buttonStyle(.plain)
                    
                    }.padding(.horizontal)
                    Divider()
                }.padding(5)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
