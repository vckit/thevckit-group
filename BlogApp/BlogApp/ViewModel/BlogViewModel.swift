//
//  BlogViewModel.swift
//  BlogApp
//
//  Created by Абдулхаким Магомедов on 21.11.2021.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

class BlogViewModel: ObservableObject{
    // Посты
    @Published var posts: [Post]?
    
    // Ошибки
    @Published var alertMsg = ""
    @Published var showAlert = false
    
    // Новый пост
    @Published var createPost = false
    @Published var isWriting = false
    
    // Асинхронный метод
    func fetchPosts() async {
        do {
            let db = Firestore.firestore().collection("Blog")
            let posts = try await db.getDocuments()
            
            self.posts = posts.documents.compactMap({post in
                return try? post.data(as: Post.self)
            })
        }
        catch {
            alertMsg = error.localizedDescription
            showAlert.toggle()
        }
    }
    
    func deletePost(post: Post) {
        guard let _ = posts else { return }
        
        let index = posts?.firstIndex(where: { currentPost in
            return currentPost.id == post.id
        }) ?? 0
        
        Firestore.firestore().collection("Blog").document(post.id ?? "").delete()
        
        withAnimation{posts?.remove(at: index)}
    }
    
    func writePost(content: [PostContent], author: String, postTitle: String) {
        do {
            // Загрузка анимации
            withAnimation {
                isWriting = true
            }
            
            let post = Post(title: postTitle, author: author, postContent: content, date: Timestamp(date: Date()))
            let _ = try Firestore.firestore().collection("Blog").document().setData(from: post)
            
            withAnimation {
                posts?.append(post)
                isWriting = true
                createPost = false
            }
        }
        catch {
            print(error.localizedDescription)
        }
    }
}
