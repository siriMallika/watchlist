//
//  ContentView.swift
//  watchlist
//
//  Created by admin2 on 27/9/2567 BE.
//

import SwiftUI

struct Movie:Identifiable {
    var id: UUID=UUID()
    var title: String
    var detail:String
}

struct ContentView: View {
    
    @State var movies: [Movie] = [Movie( title: "วิมานทุเรียน", detail: "หนึ่งในตัวละครเอกของภาพยนตร์เรื่อง วิมานหนาม ก็คือ บ้านและสวนทุเรียนหมอนทองคำเสก แม้ว่าในตัวเรื่องจะถูกเซ็ตเอาไว้ว่าเป็นจังหวัดแม่ฮ่องสอน แต่ในความเป็นจริง โลเคชั่นนี้ถูกถ่ายทำขึ้นที่ ไร่ตาเพ่ง ตำบลด่านชุมพล อำเภอบ่อไร่ จังหวัดตาก สวนทุเรียนที่มีความกว้างขวางกว่า 4,000 ไร่"), Movie( title: "TRANSFORMERS ONE (2024)", detail: "TRANSFORMERS ONE is the untold origin story of Optimus Prime and Megatron, better known as sworn enemies, but once were friends bonded like brothers who changed the fate of Cybertron forever. In the first-ever fully CG-animated Transformers movie, TRANSFORMERS ONE features a star-studded voice cast, including Chris Hemsworth, Brian Tyree Henry, Scarlett Johansson, Keegan-Michael Key, Steve Buscemi, with Laurence Fishburne, and Jon Hamm."),Movie(title: "A", detail: "Bbbbbb")]
    
    @State var showAlert:Bool = false
    @State var newName: String = ""
    @State var newDetail:String = ""
    
    var body: some View {
        NavigationView{
            List(movies){movie in
                NavigationLink{
                    DetailView(movie:movie)
                }label: {
                    //ใส่หน้าตาปุ่ม
                    VStack (alignment: .leading){
                      Text(movie.title)
                      .font(.title3)
                      .fontWeight(.semibold)
                      Text(movie.detail)
                       .font(.footnote)
                       .foregroundStyle(.gray)
                  }
                }
                
            }
            .listStyle(.plain)
            .navigationTitle("Movie Watchlist")
            .toolbar{
                Button("Add"){
                    showAlert = true
                }
            }
        }
        .alert("Add Movie", isPresented: $showAlert){
            VStack{
                TextField("Title", text: $newName)
                TextField("Detail", text: $newDetail)
                
                Button("Add"){
                    var newMovie = Movie(title: newName, detail: newDetail)
                    movies.append(newMovie)
                    newName=""
                    newDetail=""
                }
                Button("Cancel"){
                    
                }
            }
            
        }
    }
}

struct DetailView:View {
    var movie: Movie
    var body: some View {
        Text(movie.title)
            .font(.title3)
            .fontWeight(.semibold)
        Text(movie.detail)
            .font(.footnote)
            .foregroundStyle(.gray)
    }
}


#Preview {
    ContentView()
}
