//
//  MainView.swift
//  NicePageBlog
//
//  Created by sm on 2020/11/05.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var mainViewController: MainViewController = MainViewController()
    


    
    var body: some View{
        List {
            CardView(imageURL:"https://media.nicepage.pe.kr/storage/blog/upload/2dc0670d170685f1b1adbaed16901dcbb9bab92a/fef79c92-3bbf-4125-80d1-f9d721706f6b.png", category:"세종시의 이상한 아파트",heading: "왜 구멍이 뚫려 있을까요?", author:"왜 뚫렸나요" )
            CardView(imageURL:"https://media.nicepage.pe.kr/storage/blog/upload/2dc0670d170685f1b1adbaed16901dcbb9bab92a/fef79c92-3bbf-4125-80d1-f9d721706f6b.png", category:"세종시의 이상한 아파트",heading: "왜 구멍이 뚫려 있을까요?", author:"왜 뚫렸나요" )
            CardView(imageURL:"https://media.nicepage.pe.kr/storage/blog/upload/2dc0670d170685f1b1adbaed16901dcbb9bab92a/fef79c92-3bbf-4125-80d1-f9d721706f6b.png", category:"세종시의 이상한 아파트",heading: "왜 구멍이 뚫려 있을까요?", author:"왜 뚫렸나요" )
            CardView(imageURL:"https://media.nicepage.pe.kr/storage/blog/upload/2dc0670d170685f1b1adbaed16901dcbb9bab92a/fef79c92-3bbf-4125-80d1-f9d721706f6b.png", category:"세종시의 이상한 아파트",heading: "왜 구멍이 뚫려 있을까요?", author:"왜 뚫렸나요" )
            CardView(imageURL:"https://media.nicepage.pe.kr/storage/blog/upload/2dc0670d170685f1b1adbaed16901dcbb9bab92a/fef79c92-3bbf-4125-80d1-f9d721706f6b.png", category:"세종시의 이상한 아파트",heading: "왜 구멍이 뚫려 있을까요?", author:"왜 뚫렸나요" )
        }
        
//        if self.items.count != 0 {
//
//           ScrollView(showsIndicators: false) {
//               ForEach(self.items, id: \.self) { _ in
//                   RowItem()
//               }
//           }
//
//        }
        
//        NavigationView {
//            List(mainViewController.getPostListResult) { posts in
//                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
//                    CardView(imageURL:"https://media.nicepage.pe.kr/storage/blog/upload/2dc0670d170685f1b1adbaed16901dcbb9bab92a/fef79c92-3bbf-4125-80d1-f9d721706f6b.png", category:"세종시의 이상한 아파트",heading: "왜 구멍이 뚫려 있을까요?", author:"왜 뚫렸나요" )
//                }
//            }
//            .navigationBarTitle(Text("Landmarks"))
//
//        }
        
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
