//
//  LibraryView.swift
//  SlipsReader
//
//  Created by ITCharge on 2024/11/1.
//

import SwiftUI

struct BooksView: View {
    @State private var searchText = ""
    @State private var isSearching = false
    
    // 添加示例书籍数据
    @State private var books: [Book] = [
        Book(title: "三体", author: "刘慈欣", publisher: "重庆出版社", coverImage: "book1"),
        Book(title: "活着", author: "余华", publisher: "作家出版社", coverImage: "book2"),
        Book(title: "哈利波特", author: "琳", publisher: "作家出版社", coverImage: "book3"),
        // 添加更多示例书籍...
    ]
    
    // 计算过滤后的书籍
    var filteredBooks: [Book] {
        if searchText.isEmpty {
            return books
        }
        return books.filter { book in
            book.title.localizedCaseInsensitiveContains(searchText) ||
            book.author.localizedCaseInsensitiveContains(searchText) ||
            book.publisher.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    // 修改网格布局配置
    let spacing: CGFloat = 16
    let numberOfColumns: CGFloat = 3
    
    var body: some View {
        NavigationView {
            ScrollView {
                // 搜索栏
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        TextField("搜索", text: $searchText)
                            .onTapGesture {
                                isSearching = true
                            }
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 8)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    
                    // 搜索状态下显示取消按钮
                    if isSearching {
                        Button("取消") {
                            isSearching = false
                            searchText = ""
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        }
                        .foregroundColor(.blue)
                    }
                }
                .padding(.bottom, 8)
                
                GeometryReader { geometry in
                    let availableWidth = geometry.size.width // 使用整个屏幕宽度
                    let itemWidth = (availableWidth - (spacing * (numberOfColumns - 1))) / numberOfColumns
                    // numberOfColumns - 1 表示只需要中间的间距数（2个间距）
                    
                    LazyVGrid(
                        columns: Array(repeating: GridItem(.fixed(itemWidth), spacing: spacing), count: Int(numberOfColumns)),
                        spacing: spacing
                    ) {
                        // 显示过滤后的书籍
                        ForEach(filteredBooks) { book in
                            BookItemView(book: book)
                                .frame(width: itemWidth, height: 160)
                        }
                        
                        // 添加新书按钮
                        Button(action: {
                            // 处理添加新书的操作
                        }) {
                            AddBookView()
                                .frame(width: itemWidth, height: 160)
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline) // 设置为inline模式
            .navigationTitle("") // 设置空标题
        }
    }
}

// 书籍项视图
struct BookItemView: View {
    let book: Book
    
    var body: some View {
        VStack {
            Image(book.coverImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 120)
            
            Text(book.title)
                .lineLimit(2)
                .font(.caption)
                .padding(.horizontal, 8)
                .padding(.bottom, 8)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 160)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        )
    }
}

// 添加书籍视图
struct AddBookView: View {
    var body: some View {
        VStack {
            Image(systemName: "plus")
                .font(.system(size: 40))
            Text("添加书籍")
                .font(.caption)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 160)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        )
        .foregroundColor(.gray)
    }
}

struct BooksView_Previews: PreviewProvider {
    static var previews: some View {
        BooksView()
    }
}
