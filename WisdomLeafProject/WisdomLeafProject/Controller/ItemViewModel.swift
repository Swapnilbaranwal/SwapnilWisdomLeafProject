//
//  ItemViewModel.swift
//  WisdomLeafProject
//
//  Created by Swapnil baranwal on 16/05/23.
//

import Foundation

class ItemViewModel: ObservableObject {
    @Published var items = [Item]()
    @Published var isLoading: Bool = false
    @Published var isError: Bool = false
    
    init() {
        loadData() // this will first load the function
    }
    
    func loadData() {
        isLoading = true
        //api called
        let url = URL(string: "https://picsum.photos/v2/list?page=2&limit=20")!
        // task created
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                self.isLoading = false
                if let data = data {
                    do {
                        // decoding the code in JSON format
                        let items = try JSONDecoder().decode([Item].self, from: data)
                        self.items = items
                    } catch {
                        self.isError = true
                    }
                } else if error != nil {
                    self.isError = true
                }
            }
        }
        task.resume()
    }
}
