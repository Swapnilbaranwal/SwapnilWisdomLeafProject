//
//  ContentView.swift
//  WisdomLeafProject
//
//  Created by Swapnil baranwal on 16/05/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var itemViewModel = ItemViewModel()
    
    var body: some View {
        NavigationView {
            // this will check for the items and calls api if still need tym it will load till the time it is presented.
            if itemViewModel.isLoading {
                ProgressView()
            } else if itemViewModel.isError {
                VStack {
                    Text("Error loading data.")
                    Button("Try again") {
                        itemViewModel.loadData()
                    }
                }
                // this is goin to display the api details in the table form
            } else {
                List(itemViewModel.items,id: \.id) { item in
                    // this will nevigate to the details of the row view when clicked 
                    NavigationLink(destination: ItemDetailView(item: item)) {
                        ItemRowView(item: item)
                    }
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Items")
                .navigationBarItems(trailing: Button(action: {
                    itemViewModel.loadData()
                }) {
                    Image(systemName: "arrow.clockwise")
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
