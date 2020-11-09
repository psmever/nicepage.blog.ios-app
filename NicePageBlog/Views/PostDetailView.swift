//
//  PostDetailView.swift
//  NicePageBlog
//
//  Created by sm on 2020/11/09.
//

import SwiftUI
import Parma
import KingfisherSwiftUI

struct PostDetailView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    @State var slugTitle: String
    
    var body: some View {
        VStack {

            ScrollView {
                Parma(self.viewModel.contents_text, render: MyRender())
                    .padding(.horizontal, 24)
            }
        }
        .animation(.linear)
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarTitle(self.viewModel.post_title)
        .onAppear() {
            self.viewModel.getPostDetailData(slugTitle: self.slugTitle)
            
        }
    }
}

struct PostDetailView_Previews: PreviewProvider {
    
    static let viewmodel = PostDetailView.ViewModel()
    
    static var previews: some View {
        PostDetailView(viewModel: PostDetailView_Previews.viewmodel, slugTitle: "간단한-nodejs-express-mysql-api-서버-만들기")
    }
}

struct MyRender: ParmaRenderable {
    func heading(level: HeadingLevel?, textView: Text) -> Text {
        switch level {
        case .one:
            return textView.font(.system(.largeTitle, design: .serif)).bold()
        case .two:
            return textView.font(.system(.title, design: .serif)).bold()
        case .three:
            return textView.font(.system(.title2)).bold()
        default:
            return textView.font(.system(.title3)).bold()
        }
    }
    
    func headingBlock(level: HeadingLevel?, view: AnyView) -> AnyView {
        switch level {
        case .one, .two:
            return AnyView(
                VStack(alignment: .leading, spacing: 2) {
                    view
                        .padding(.top, 4)
                    Rectangle()
                        .foregroundColor(.pink)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 1, alignment: .center)
                        .padding(.bottom, 8)
                }
            )
        default:
            return AnyView(view.padding(.bottom, 4))
        }
    }
    
    func listItem(view: AnyView) -> AnyView {
        let bullet = "•"
        return AnyView(
            HStack(alignment: .top, spacing: 8) {
                Text(bullet)
                view.fixedSize(horizontal: false, vertical: true)
            }
            .padding(.leading, 4)
        )
    }
    
    func imageView(with urlString: String, altTextView: AnyView?) -> AnyView {
        AnyView(
            KFImage(URL(string: urlString))
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                
        )
    }
}
