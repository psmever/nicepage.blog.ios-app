//
//  Views.swift
//  NicePageBlog
//
//  Created by sm on 2020/11/05.
//

import SwiftUI

public extension View {
    func alert(isPresented: Binding<Bool>, title: String, message: String? = nil, dismissButton: Alert.Button? = nil) -> some View {

        alert(isPresented: isPresented) {
            Alert(title: Text(title), message: {
                    if let message = message {
                        return Text(message)
                    } else {
                        return nil
                    }
            }(),
            dismissButton: dismissButton)
        }
    }
}
