//
//  Home.swift
//  BlogApp
//
//  Created by Абдулхаким Магомедов on 21.11.2021.
//

import SwiftUI

struct Home: View {
    @StateObject var blogData = BlogViewModel()
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        VStack {
            if let posts = blogData.posts {
                if posts.isEmpty {
                    (
                        Text(Image(systemName: "rectangle.and.pencil.and.ellipsis"))
                        +
                        Text("Начать писать блог")
                    )
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                }
                else {
                    List (posts) { post in
                        CardView(post: post)
                            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                Button(role: .destructive) {
                                    blogData.deletePost(post: post)
                                } label: {
                                    Image(systemName: "trash")
                                }
                                
                            }
                    }
                    .listStyle(.insetGrouped)
                }
            } else {
                ProgressView()
            }
        }
        .navigationTitle("Мой блог")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay (
            Button(action: {
                blogData.createPost.toggle()
            }, label: {
                Image(systemName: "plus")
                    .font(.title2.bold())
                    .foregroundColor(scheme == .dark ? Color.black : Color.white)
                    .padding()
                    .background(.primary, in: Circle())
            })
                .padding()
                .foregroundColor(.primary)
            
            ,alignment: .bottomTrailing
        )
        
        .task {
            await blogData.fetchPosts()
        }.fullScreenCover(isPresented: $blogData.createPost, content: {
            // Экран для создания нового поста
            CreatePost()
                .overlay (
                    ZStack {
                        Color.primary.opacity(0.25)
                            .ignoresSafeArea()
                        
                        ProgressView()
                            .frame(width: 80, height: 80)
                            .background(scheme == .dark ? .black : .white, in: RoundedRectangle(cornerRadius: 15))
                    }
                        .opacity(blogData.isWriting ? 1 : 0)
                )
                .environmentObject(blogData)
        })
            .alert(blogData.alertMsg, isPresented: $blogData.showAlert) {
                
            }
    }
    @ViewBuilder
    func CardView(post: Post) -> some View {
        NavigationLink  {
            ScrollView(.vertical, showsIndicators: false) {
                VStack (alignment: .leading, spacing: 15) {
                    
                    Text("Запостил: \(post.author)")
                        .foregroundColor(.gray)
                    
                    Text("Опубликован: \(post.date.dateValue().formatted(date: .numeric, time: .shortened))")
                        .foregroundColor(.gray)
                    
                    ForEach(post.postContent) { content in
                        if content.type == .Image {
                            WebImage(url: content.value)
                        }
                        else {
                            Text(content.value)
                                .font(.system(size: getFontSize(type: content.type)))
                                .lineSpacing(10)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle(post.title)
        } label: {
            VStack (alignment: .leading, spacing: 12) {
                Text(post.title)
                    .fontWeight(.bold)
                
                Text("Запостил \(post.author)")
                    .font(.callout)
                    .foregroundColor(.gray)
                
                
                Text("Опубликован: \(post.date.dateValue().formatted(date: .numeric, time: .shortened))")
                    .font(.caption.bold())
                    .foregroundColor(.gray)
            }
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
