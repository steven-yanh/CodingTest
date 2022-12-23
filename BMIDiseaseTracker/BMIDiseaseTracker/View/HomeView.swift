//
//  HomeView.swift
//  BMIDiseaseTracker
//
//  Created by Alexander Zhurov on 10.04.22.
//

import SwiftUI

struct HomeView: View {
    struct HomeViewItem {
        let icon: String
        let label: String
        let value: String
        let valueTextColor: Color
        var info: String? = nil
    }
    
    let homeViewItems: [HomeViewItem] = [
        HomeViewItem(
            icon: "icon-level-of-risk",
            label: "Level Of Risk",
            value: "Middle",
            valueTextColor: Color(hex: "#E89900"),
            info: "Based on our analysis, there is a direct dependency between your BMI and development of severe diseases."
        ),
        HomeViewItem(
            icon: "icon-weight",
            label: "Body Mass Index",
            value: "18.8",
            valueTextColor: Color(hex: "#DE6969")
        ),
        HomeViewItem(
            icon: "icon-obesity-rate",
            label: "Obesity Rate",
            value: "Normal",
            valueTextColor: Color(hex: "#E89900")
        ),
        HomeViewItem(
            icon: "icon-weight",
            label: "Ideal Weight",
            value: "86.5 Kg",
            valueTextColor: Color(hex: "#00A438")
        ),
        HomeViewItem(
            icon: "icon-metabolism",
            label: "Basic Metabolism",
            value: "2290",
            valueTextColor: Color(hex: "#E89900")
        ),
        HomeViewItem(
            icon: "icon-hips-ratio",
            label: "Waist & Hips Ratio",
            value: "1.2",
            valueTextColor: Color(hex: "#00A438")
        ),
        HomeViewItem(
            icon: "icon-passport-age",
            label: "Passport Age",
            value: "25",
            valueTextColor: .placeholderGray
        ),
        HomeViewItem(
            icon: "icon-body-type",
            label: "Body Type",
            value: "Mesomorph",
            valueTextColor: .placeholderGray
        ),
        HomeViewItem(
            icon: "icon-fat",
            label: "Subcutaneous Fat",
            value: "15%",
            valueTextColor: Color(hex: "#E89900")
        ),
    ]
    
    @State var shownInfo: [String] = []
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text("Health breaf")
                    .font(.system(size: 20, weight: .bold))
                Spacer()
                VStack(spacing: 3) {
                    Image(systemName: "circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 3.5)
                    Image(systemName: "circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 3.5)
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
            
            ScrollView {
                LazyVStack {
                    ForEach(homeViewItems, id: \.self.label) { item in
                        VStack(spacing: 0) {
                            HStack(spacing: 11) {
                                Image(item.icon)
                                    .renderingMode(.template)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: 22, maxHeight: 22)
                                    .foregroundColor(.placeholderGray)
                                
                                Text(item.label)
                                
                                if item.info != nil {
                                    Button {
                                        withAnimation(.easeIn(duration: 0.2)) {
                                            if shownInfo.contains(item.label) {
                                                shownInfo.removeAll { $0 == item.label }
                                            } else {
                                                shownInfo.append(item.label)
                                            }
                                        }
                                    } label: {
                                        Image(systemName: "info.circle.fill")
                                            .imageScale(.small)
                                            .foregroundColor(.black)
                                    }
                                }
                                    
                                Spacer()
                                Text(item.value)
                                    .foregroundColor(item.valueTextColor)
                            }
                            .font(.system(size: 20, weight: .medium))
                            .padding(.horizontal, 22)
                            .padding(.vertical, 26)
                            
                            if let info = item.info, shownInfo.contains(item.label) {
                                HStack {
                                    Text(info)
                                        .foregroundColor(.black)
                                        .font(.system(size: 14, weight: .regular))
                                        
                                }
                                .transition(.opacity)
                                .padding(.horizontal, 22)
                                .padding(.vertical, 10)
                                .frame(maxWidth: .infinity)
                                .background(Color.lightGray)
                                .cornerRadius(12, corners: [.bottomLeft, .bottomRight])
                                
                            }
                        }
                        
                        .contentShape(Rectangle())
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.lightGray, lineWidth: 1)
                        )
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 20)
                .padding(.top, 10)
                .padding(.bottom, 50)
            }
            
            
        }
        
    }
}

