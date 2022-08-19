//
//  LoadingView.swift
//  CatProject
//
//  Created by Jordan Niedzielski on 18/08/2022.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            Text("🐈")
                .font(.system(size: 80))
            Text("Calling the kittens...")
                .foregroundColor(.gray)
            ProgressView()
        }
        .padding()
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
