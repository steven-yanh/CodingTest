//
//  PopoverView.swift
//  BMIDiseaseTracker
//
//  Created by Alexander Zhurov on 7.04.22.
//

import SwiftUI

struct PopoverView: View {
    @ObservedObject var popoverManager = PopoverManager.shared
    @State var offset: [String: CGFloat] = [:]
    let defaultOffset: CGFloat = UIScreen.main.bounds.width * 0.9
    let popoverWidth: CGFloat = UIScreen.main.bounds.width * 0.8
    let popoverHeight: CGFloat = UIScreen.main.bounds.width * 0.2
    let shownOffset: CGFloat = UIScreen.main.bounds.width * 0.095
    var shown: [String] = []
    
    var body: some View {
        if popoverManager.stack.count > 0 {
            LazyVStack {
                ForEach(popoverManager.stack.reversed()) { popover in
                    VStack {
                        Text(popover.message)
                            .foregroundColor(.white)
                            .fontWeight(.medium)
                            .padding(.vertical, 5)
                            .padding(.horizontal, 10)
                    }
                    .frame(width: popoverWidth, height: popoverHeight, alignment: .topLeading)
                    .background(RoundedRectangle(cornerRadius: 5).fill(getColor(popover: popover)).opacity(0.9))
                    .cornerRadius(5)
                    .offset(x: offset[popover.id] ?? defaultOffset)
                    .transition(.move(edge: .trailing))
                    .tag(popover.id)
                    .onAppear {
                        withAnimation(.easeIn(duration: 0.3).delay(popover.delay)) {
                            offset[popover.id] = shownOffset
                        }
                        
                        Timer.scheduledTimer(withTimeInterval: 2 + popover.delay, repeats: false) { _ in
                            withAnimation {
                                offset[popover.id] = defaultOffset
                            }
                            
                            Timer.scheduledTimer(withTimeInterval: 0.4, repeats: false) { _ in
                                offset.removeValue(forKey: popover.id)
                                popoverManager.remove(popover: popover)
                            }
                        }
                    }
                    .gesture(DragGesture().onEnded { action in
                        guard action.translation.width > 50 else {
                            return
                        }
                        
                        withAnimation {
                            offset[popover.id] = defaultOffset
                        }
                        
                        Timer.scheduledTimer(withTimeInterval: 0.4, repeats: false) { _ in
                            offset.removeValue(forKey: popover.id)
                            popoverManager.remove(popover: popover)
                        }
                    })
                    
                    Spacer()
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.5, alignment: .top)
            .zIndex(999)
        } else {
            EmptyView()
        }
    }
    
    func getColor(popover: PopoverManager.Popover) -> Color {
        switch popover.type {
            case .success: return Color.green
            case .error: return Color.red
            case .info: return Color.appBlue
            default: return Color.lightGray
        }
    }
}



struct PopoverView_Previews: PreviewProvider {
    static var previews: some View {
        PopoverView()
    }
}
