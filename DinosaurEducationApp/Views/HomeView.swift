//
//  ContentView.swift
//  DinosaurEducationApp
//
//  Created by Nicolas A. Kerkau on 8/22/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        // Scroll view parent container
        ScrollView {
            LazyVStack {
                //loop for the entire array of modules
                ForEach(model.modules) { module in
                    //Learning cards
                    ZStack {
                        // Background
                        Rectangle()
                            .foregroundColor(.white)
                            .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
                            .cornerRadius(15)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.07), radius: 10, x: 5, y: 5)
                        
                        HStack {
                            // Image
                            Image(module.content.image)
                                .resizable()
                                .frame(width: 116, height: 116)
                                .clipShape(Circle())
                            Spacer()
                            // Text
                            VStack (alignment: .leading, spacing: 10) {
                                Text("Learn \(module.category)!")
                                    .bold()
                                Text(module.content.description)
                                    .padding(.bottom, 20)
                                    .font(.caption)
                                // Icons
                                HStack {
                                    Image(systemName: "text.book.closed")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                    Text("\(module.content.lessons.count) Lessons")
                                        .font(.caption)
                                    Spacer()
                                    Image(systemName: "clock")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                    Text(module.content.time)
                                        .font(.caption)
                                }
                            }
                            .padding(.leading, 10)
                        }
                        .padding(.horizontal, 20)
                    }
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
