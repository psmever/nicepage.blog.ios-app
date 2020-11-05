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

    var body: some View{
       
        VStack(alignment: .leading){
            RemoteImage(url: imageURL)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200)
            HStack{
                VStack(alignment: .leading){
                    Text(category)
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    Text(heading)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                    
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


