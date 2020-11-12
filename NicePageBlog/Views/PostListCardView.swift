//
//  PostListCardView.swift
//  NicePageBlog
//
//  Created by sm on 2020/11/09.
//

import SwiftUI

struct PostImage: View {
    private enum LoadState {
        case loading, success, failure
    }

    private class Loader: ObservableObject {
        var data = Data()
        var state = LoadState.loading

        init(url: String) {
            guard let parsedURL = URL(string: url) else {
                fatalError("Invalid URL: \(url)")
            }

            URLSession.shared.dataTask(with: parsedURL) { data, response, error in
                if let data = data, data.count > 0 {
                    self.data = data
                    self.state = .success
                } else {
                    self.state = .failure
                }

                DispatchQueue.main.async {
                    self.objectWillChange.send()
                }
            }.resume()
        }
    }

    @StateObject private var loader: Loader
    var loading: Image
    var failure: Image

    var body: some View {
        selectImage()
            .resizable()
    }

    init(url: String, loading: Image = Image(systemName: "photo"), failure: Image = Image(systemName: "multiply.circle")) {
        _loader = StateObject(wrappedValue: Loader(url: url))
        self.loading = loading
        self.failure = failure
    }

    private func selectImage() -> Image {
        switch loader.state {
        case .loading:
            return loading
        case .failure:
            return failure
        default:
            if let image = UIImage(data: loader.data) {
                return Image(uiImage: image)
            } else {
                return failure
            }
        }
    }
}

struct PostListCardView: View {
    var imageURL: String
    var category: String = ""
    var heading: String = ""
//    var author: String = ""

    var body: some View {
       
        VStack(alignment: .leading) {
            PostImage(url: imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: 150, alignment: .center)
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

struct PostListCardView_Previews: PreviewProvider {
    static var previews: some View {
        PostListCardView(imageURL: "https://media.nicepage.pe.kr/storage/blog/upload/2dc0670d170685f1b1adbaed16901dcbb9bab92a/fef79c92-3bbf-4125-80d1-f9d721706f6b.png")
    }
}
