//
//  ItemDetailView.swift
//  WisdomLeafProject
//
//  Created by Swapnil baranwal on 16/05/23.
//

import SwiftUI

struct ItemDetailView: View {
    let item: Item
    
    var body: some View {
        VStack {
            // use live url image and display
            AsyncImage(url: URL(string: item.downloadURL)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .aspectRatio(contentMode: .fit)
            // author detail present in api
            Text(item.author)
                .font(.title)
                .padding()
        }
        .navigationTitle(item.url)
        .navigationBarTitleDisplayMode(.inline)
    }
}


