//
//  HomeScreenView.swift
//  BookApp
//
//  Created by Sandro Boka on 08.10.2024..
//

import SwiftUI

struct HomeScreenView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                HStack {
                    Text("Home")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Button {} label: {
                        Image(systemName: "gearshape")
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(.black)
                    }
                        
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 10)
                .background(
                    Color(.lightGray)
                        .ignoresSafeArea()
                )
                
                // Search Bar
                HStack {
                    TextField("Search books...", text: $searchText)
                        .padding(10)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal, 16)
                }
                
                // Featured Books Section
                Text("Featured Books")
                    .font(.title2)
                    .bold()
                    .padding(.leading, 16)
                    .padding(.top, 24)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<5, id: \.self) { index in
                            FeaturedBookView()
                        }
                    }
                    .padding(.horizontal, 16)
                }
                
                // Book Categories
                Text("Categories")
                    .font(.title2)
                    .bold()
                    .padding(.leading, 16)
                    .padding(.top, 16)
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                        ForEach(0..<8, id: \.self) { index in
                            CategoryView(categoryName: "Category \(index + 1)")
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
                }
            }
        }
    }
}

struct FeaturedBookView: View {
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.blue)
                .frame(width: 150, height: 220)
                .cornerRadius(8)
            Text("Book Title")
                .font(.caption)
                .lineLimit(1)
        }
        .padding(.trailing, 8)
    }
}

struct CategoryView: View {
    var categoryName: String
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.green)
                .frame(height: 120)
                .cornerRadius(8)
            Text(categoryName)
                .font(.caption)
        }
        .padding(.bottom, 8)
    }
}

#Preview {
    HomeScreenView()
}
