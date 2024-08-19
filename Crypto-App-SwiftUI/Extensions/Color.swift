//
//  Color.swift
//  Crypto-App-SwiftUI
//
//  Created by Saurabh  Verma on 18/08/24.
//

import SwiftUI

protocol AppColorTheme {
    var accent: Color {get}
    var background: Color {get}
    var green: Color {get}
    var red: Color {get}
    var secondaryText: Color {get}
}
extension Color {
    static let theme: AppColorTheme = ColorTheme()
}

struct ColorTheme: AppColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")
}
