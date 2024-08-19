//
//  Crypto_App_SwiftUIApp.swift
//  Crypto-App-SwiftUI
//
//  Created by Saurabh  Verma on 18/08/24.
//

import SwiftUI

@main
struct Crypto_App_SwiftUIApp: App {
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
//            .preferredColorScheme(.dark)
            .environmentObject(vm) /// all of the navigation view can access it
        }
    }
}
