//
//  HomeViewRow.swift
//  DinosaurEducationApp
//
//  Created by Nicolas A. Kerkau on 8/23/22.
//

import SwiftUI

struct HomeViewRow: View {
    
    var image: String
    var title: String
    var description: String
    var count: String
    var time: String
    
    var body: some View {
        
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
                Image(image)
                    .resizable()
                    .frame(width: 116, height: 116)
                    .clipShape(Circle())
                Spacer()
                // Text
                VStack (alignment: .leading, spacing: 10) {
                    Text(title)
                        .bold()
                    Text(description)
                        .padding(.bottom, 20)
                        .font(.caption)
                    // Icons
                    HStack {
                        Image(systemName: "text.book.closed")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(count)
                            .font(Font.system(size: 10))
                        Spacer()
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(time)
                            .font(Font.system(size: 10))
                    }
                }
                .padding(.leading, 10)
            }
            .padding(.horizontal, 20)
        }
        
    }
}

struct HomeViewRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewRow(image: "swift", title: "Learn Swift!", description: "some description", count: "10 lessons", time: "3 hours")
    }
}
