//
//  ItemRowView.swift
//  WisdomLeafProject
//
//  Created by Swapnil baranwal on 16/05/23.
//

import SwiftUI

struct ItemRowView: View {
    let item: Item
    @State private var isShowingDialog = false // for dailogue box
    @State private var isShowingAlert = false // alert when toggle is off
    @State private var isChecked = false //check for toggle value true or false
    var body: some View {
        HStack(alignment: .center) {
            // use live url image and display
            AsyncImage(url: URL(string: item.downloadURL)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 80, height: 80)
            .cornerRadius(8.0)
            
            VStack(alignment: .leading, spacing: 8.0) {
                // author details
                Text(item.author)
                    .font(.headline)
                // url link of the image
                Text(item.url)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            // the toogle check box to display data in discription
            Toggle(isOn: $isChecked) {
            }
            .onChange(of: isChecked) { value in
                            if value {
                                isShowingDialog = true
                            } else {
                                isShowingAlert = true
                            }
                        }.alert(isPresented: $isShowingAlert) {
                            Alert(title: Text("Checkbox is disabled"), message: Text("Please enable the checkbox to view the description."), dismissButton: .default(Text("OK")))
                        }
                        .sheet(isPresented: $isShowingDialog) {
                            ItemDetailView(item: item)
                        }
            
        }
        .padding(.vertical, 8.0)
    }
}


