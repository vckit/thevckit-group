//
//  CreatePost.swift
//  BlogApp
//
//  Created by Абдулхаким Магомедов on 21.11.2021.
//

import SwiftUI

struct CreatePost: View {
    @EnvironmentObject var blogData : BlogViewModel
    
    // Свойства поста
    @State var postTitle = ""
    @State var authorName = ""
    @State var postContent: [PostContent] = []
    
    //  Фокус клавиатуры
    @FocusState var showKeyboard: Bool
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack (spacing: 15) {
                    VStack (alignment: .leading) {
                        TextField("Заголовок поста", text: $postTitle)
                            .font(.title2)
                        Divider()
                    }
                    VStack (alignment: .leading, spacing: 11) {
                        Text("Автор")
                            .font(.caption.bold())
                        
                        TextField("Имя автора", text: $authorName)
                        Divider()
                    }
                    .padding(.top, 5)
                    .padding(.bottom, 20)
                    
                    ForEach($postContent) { $content in
                        
                        VStack {
                            if content.type == .Image {
                                if content.showImage && content.value != "" {
                                    WebImage(url: content.value)
                                        .onTapGesture {
                                            withAnimation {
                                                content.showImage = false
                                            }
                                        }
                                }
                                else {
                                    VStack {
                                        TextField("Изображение ссылка", text: $content.value, onCommit: {
                                            withAnimation {
                                                content.showImage = true
                                            }
                                        })
                                        
                                        Divider()
                                    }
                                    .padding(.leading, 5)
                                }
                            }
                            else {
                                TextView(text: $content.value, height: $content.height, fontSize: getFontSize(type: content.type))
                                    .focused($showKeyboard)
                                    .frame(height: content.height == 0 ? getFontSize(type: content.type) * 2 : content.height)
                                    .background (
                                        Text(content.type.rawValue)
                                            .font(.system(size: getFontSize(type: content.type)))
                                            .foregroundColor(.gray)
                                            .opacity(content.value == "" ? 0.7 : 0)
                                            .padding(.leading, 5)
                                        
                                        ,alignment: .leading
                                    )
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .contentShape(Rectangle())
                        // Свайп удалить
                        .gesture(DragGesture().onEnded({value in
                            if -value.translation.width < (UIScreen.main.bounds.width / 2.5) && !content.showDeleteAlert {
                                content.showDeleteAlert = true
                            }
                        }))
                        .alert("Вы действительно хотите удалить этот контент?", isPresented: $content.showDeleteAlert) {
                            Button("Удалить", role: .destructive) {
                                // Удаление контента
                                let index = postContent.firstIndex { currentPost in
                                    return currentPost.id == content.id
                                } ?? 0
                                
                                withAnimation {
                                    postContent.remove(at: index)
                                }
                            }
                        }
                    }
                    
                    Menu {
                        ForEach(PostType.allCases, id: \.rawValue) { type in
                            Button(type.rawValue) {
                                withAnimation {
                                    postContent.append(PostContent(value: "", type: type))
                                }
                            }
                        }
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                            .foregroundColor(.primary)
                    }
                    .foregroundStyle(.primary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
            })
            // Динамичное изменение заголовка поста
                .navigationTitle(postTitle == "" ? "Заголовок" : postTitle)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        if !showKeyboard {
                            Button("Отмена") {
                                blogData.createPost.toggle()
                            }
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        if showKeyboard {
                            Button("Готово") {
                                // Закрыть клавиатуру
                                showKeyboard.toggle()
                            }
                        }
                        else {
                            Button("Постить") {
                                blogData.writePost(content: postContent, author: authorName, postTitle: postTitle)
                            }
                            .disabled(authorName == "" || postTitle == "")
                        }
                    }
                }
        }
    }
}

struct CreatePost_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


func getFontSize(type: PostType) -> CGFloat {
    switch type {
        case .Header:
            return 24
        case .SubHeading:
            return 22
        case .Paragraph:
            return 18
        case .Image:
            return 18
    }
}


struct WebImage: View {
    var url : String
    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            if let image = phase.image {
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width - 30, height: 250)
                    .cornerRadius(15)
            }
            else {
                if let _ = phase.error {
                    Text("Ошибка при загрузке изображения :(((")
                }
                else {
                    ProgressView()
                }
            }
        }
        .frame(height: 250)
    }
}
