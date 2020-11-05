//
//  CardView.swift
//  NicePageBlog
//
//  Created by sm on 2020/11/05.
//

import SwiftUI

struct CardView: View {
    var imageURL: String
    var category: String = ""
    var heading: String = ""
    var author: String = ""

    var body: some View {
       
        VStack(alignment: .leading) {
            PostImage(url: imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, alignment: .center)
            HStack {
                VStack(alignment: .leading){
                    Text(heading)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                    
                    Text(category)
                        .font(.headline)
                        .foregroundColor(.secondary)

                    Text(author.uppercased())
                        .font(.caption)
                        .foregroundColor(.secondary)
                    }
                .layoutPriority(100)
                Spacer()
                }
        .padding()
          
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB,red: 150/255, green: 150/255, blue: 150/255, opacity: 0.5), lineWidth: 1)
        )
        .padding([.top, .horizontal])
        
    }
}



struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(imageURL: "https://media.nicepage.pe.kr/storage/blog/upload/2dc0670d170685f1b1adbaed16901dcbb9bab92a/fef79c92-3bbf-4125-80d1-f9d721706f6b.png")
    }
}
