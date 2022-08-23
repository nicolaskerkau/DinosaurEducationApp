//
//  ContentView.swift
//  DinosaurEducationApp
//
//  Created by Nicolas A. Kerkau on 8/23/22.
//

import SwiftUI

struct ContentsView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        ScrollView {
            LazyVStack {
                // Confirm that currentModule is set
                if model.currentModule != nil {
                    ForEach (0..<model.currentModule!.content.lessons.count) { index in
                        
                        NavigationLink {
                            ContentDetailView()
                        } label: {
                            ContentsViewRow(index: index)
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("Learn \(model.currentModule?.category ?? "")")
        }
    }
}

/*
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentsView()
    }
}
*/
