//
//  HomeView.swift
//  Crypto-App-SwiftUI
//
//  Created by Saurabh  Verma on 18/08/24.
//

import SwiftUI

struct HomeView: View {
    /// This is for accessing the injected environmnet object
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolio: Bool = false
    var body: some View {
        ZStack {
            /// background color
            Color.theme.background
                .edgesIgnoringSafeArea(.all)
            
            /// content layer
            VStack {
                homeHeader
                columnTitles
                if !showPortfolio {
                    allCoinsList
                        .transition(.move(edge: .leading))
                } else {
                    portfolioCoinsList
                        .transition(.move(edge: .trailing))
                }
                Spacer(minLength: 0)
            }
        }
    }
}


struct HomeView_Preview: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .navigationBarHidden(true)
        }
        .environmentObject(dev.homeVM)
    }
}

extension HomeView {
    private var homeHeader: some View {
        HStack {
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .animation(.none)
                .background (
                    CircleButtonAnimationView(animate: $showPortfolio)
                )
            Spacer(minLength: 0)
            Text(showPortfolio ? "Portfolio" :"Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(.theme.accent)
                .animation(.none)
            Spacer(minLength: 0)
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    private var allCoinsList: some View {
        List(vm.allCoins) { coin in
            CoinRowsView(coin: coin, showHoldingColum: false)
                .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
        }
        .listStyle(.plain)
    }
    private var portfolioCoinsList: some View {
        List(vm.portfolioCoins) { coin in
            CoinRowsView(coin: coin, showHoldingColum: true)
                .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
        }
        .listStyle(.plain)
    }
    private var columnTitles: some View {
        HStack {
            Text("Coin")
            Spacer()
            if showPortfolio {
                Text("Holdings")
            }
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }
        .font(.caption)
        .foregroundColor(.theme.secondaryText)
        .padding(.horizontal)
    }
}
