//
//  CustomTextField.swift
//  CustomTextFieldExample
//
//  Created by cano on 2024/01/31.
//

import SwiftUI

struct CustomTextField: View {
    var sfIcon: String
    var iconTint: Color = .gray
    var hint: String
    // パスワード入力欄にするか？
    var isPassword: Bool = false
    @Binding var value: String
    // パスワードの場合に入力内容を表示するか
    @State private var showPassword: Bool = false
    // パスワードの場合に入力内容の表示／非表示切り替え時のフォーカス
    @FocusState private var passwordState: HideState?
    
    enum HideState {
        case hide
        case reveal
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 8, content: {
            // アイコン
            Image(systemName: sfIcon)
                .foregroundStyle(iconTint)
                .frame(width: 30)
                .offset(y: 1)
            
            VStack(alignment: .leading, spacing: 8, content: {
                if isPassword {
                    Group {
                        // パスワードの場合は入力内容の表示／非表示でUIを分ける
                        if showPassword {
                            TextField(hint, text: $value)
                                .focused($passwordState, equals: .reveal)
                        } else {
                            SecureField(hint, text: $value)
                                .focused($passwordState, equals: .hide)
                        }
                    }
                } else {
                    // 通常の入力欄
                    TextField(hint, text: $value)
                }
                
                // 区切り線
                Divider()
            })
            // パスワード用の入力内容表示／非表示ボタン
            // オーバーレイで右側に表示
            .overlay(alignment: .trailing) {
                if isPassword {
                    Button(action: {
                        withAnimation {
                            showPassword.toggle()
                        }
                        passwordState = showPassword ? .reveal : .hide
                    }, label: {
                        Image(systemName: showPassword ? "eye.slash" : "eye")
                            .foregroundStyle(.gray)
                            .padding(10)
                            .contentShape(.rect)
                    })
                }
            }
        })
    }
}

