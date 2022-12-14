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
        NavigationView {
            VStack (alignment: .leading) {
                Text("What do you want to do today?")
                    .padding(.leading, 20)
                // Scroll view parent container
                ScrollView {
                    LazyVStack {
                        //loop for the entire array of modules
                        ForEach(model.modules) { module in
                            VStack (spacing: 20) {
                                //MARK: Lesson Card Navigation
                                NavigationLink (tag: module.id, selection: $model.currentContentSelected) {
                                    ContentsView()
                                        .onAppear {
                                            model.beginModule(module.id)
                                        }
                                } label: {
                                    // Lesson Card
                                    HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) Lessons", time: module.content.time)
                                }
                                //MARK: Test Card Navigation
                                NavigationLink(tag: module.id, selection: $model.currentTestSelected) {
                                    TestView().onAppear {
                                        model.beginTest(module.id)
                                    }
                                } label: {
                                    // Test Card
                                    HomeViewRow(image: module.test.image, title: "\(module.category) Test", description: module.test.description, count: "\(module.test.questions.count) Questions", time: module.test.time)
                                }
                            }
                        }
                    }
                    .accentColor(.black)
                    .padding()
                }
            }
            .navigationTitle("Get Started")
        }
        .navigationViewStyle(.stack)
    }
}

/*
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
*/
