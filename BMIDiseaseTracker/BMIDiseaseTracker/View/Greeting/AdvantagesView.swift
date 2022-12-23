//
//  AdvantagesView.swift
//  BMIDiseaseTracker
//
//  Created by Alexander Zhurov on 6.04.22.
//

import SwiftUI

struct AdvantagesView: View {
    @State var currentAdvantage: Advantage = .Welcome
    
    enum Advantage: CaseIterable {
        case Welcome
        case AIPowered
        case LiveLonger
        
        func label() -> String {
            switch self {
                case .Welcome: return "Welcome!"
                case .AIPowered: return "AI Powered"
                case .LiveLonger: return "Live Longer InTime"
            }
        }
        
        func image() -> String {
            switch self {
                case .Welcome: return "advantage-1"
                case .AIPowered: return "advantage-2"
                case .LiveLonger: return "advantage-3"
            }
        }
        
        func text() -> String {
            switch self {
                case .Welcome: return "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic"
                case .AIPowered: return "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic"
                case .LiveLonger: return "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic"
            }
        }
        
        func nextAdvantage() -> Advantage? {
            switch self {
                case .Welcome: return .AIPowered
                case .AIPowered: return .LiveLonger
                case .LiveLonger: return nil
            }
        }
        
        func prevAdvantage() -> Advantage? {
            switch self {
                case .Welcome: return nil
                case .AIPowered: return .Welcome
                case .LiveLonger: return .AIPowered
            }
        }
    }
    
    var body: some View {
        TabView(selection: $currentAdvantage) {
            ForEach(Advantage.allCases, id: \.self) { advantage in
                VStack {
                    Group {
                        Text(advantage.label())
                            .foregroundColor(.appBlue)
                            .font(.system(size: 32, weight: .bold))
                    }
                    .frame(maxHeight: UIScreen.main.bounds.height * 0.2, alignment: .bottom)
                    
                    
                        

                    Group {
                        Image(advantage.image())
                            .resizable()
                            .padding()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width * 0.6)
                            .frame(width: 300)
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                        
                    Group {
                        Text(advantage.text())
                            .padding(.horizontal, 60)
                            .padding(.top, UIScreen.main.bounds.height * 0.1)
                            .lineLimit(3)
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .lineSpacing(7)
                            .minimumScaleFactor(0.4)
                    }
                    .frame(height: UIScreen.main.bounds.height * 0.4, alignment: .top)
                    
                    
                   
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.vertical)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .background(
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                Circle()
                    .fill(LinearGradient(
                        colors: [Color(hex: "#40a3fd"), Color.appBlue, Color.appBlue, Color.appBlue, Color.appBlue],
                        startPoint: .top,
                        endPoint: .bottom)
                    )
                    .frame(width: UIScreen.main.bounds.height)
                    .offset(y: UIScreen.main.bounds.height * 0.6)
            }
                
        )
        .edgesIgnoringSafeArea(.vertical)
        .overlay(
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    ForEach(Advantage.allCases, id: \.self) { item in
                        Rectangle()
                            .fill(currentAdvantage == item ? .white : .white.opacity(0.3))
                            .frame(width: 38, height: 1.5)
                    }
                }
                .padding(.horizontal, 20)
            }
            .padding(.bottom, 40)
        )
        .onTapGesture {
            guard let nextAdvantage = currentAdvantage.nextAdvantage() else {
                AppData.shared.setGreetingShown()
                return
            }
            
            withAnimation {
                self.currentAdvantage = nextAdvantage
            }
        }
    }
}

struct AdvantagesView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AdvantagesView()
            AdvantagesView()
                .previewDevice("iPhone SE (3rd generation)")
        }
    }
}
