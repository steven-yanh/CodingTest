//
//  RecomendationsView.swift
//  BMIDiseaseTracker
//
//  Created by Alexander Zhurov on 10.04.22.
//

import SwiftUI

struct RecommendationsView: View {
    struct RecommendationViewItem {
        let id: String
        let label: String
        let text: String
        let highlyRecommended: Bool
        let onlyForYou: Bool
    }
    
    let recommendationViewItems: [RecommendationViewItem] = [
        RecommendationViewItem(
            id: "1",
            label: "Walk at least 12k steps per day",
            text: "Walking at least 12000 steps per day is very can improve health level, help loose weight and lower risks of diseases.",
            highlyRecommended: true,
            onlyForYou: true
        ),
        RecommendationViewItem(
            id: "2",
            label: "Drink Plenty of Water",
            text: "Water can benefit you in a variety of ways. The importance of staying hydrated is at the top of the list.",
            highlyRecommended: true,
            onlyForYou: false
        ),
        RecommendationViewItem(
            id: "3",
            label: "Lower your cholesterol",
            text: "Cholesterol level should be less than 5 mmol/L. Visit your doctor.",
            highlyRecommended: false,
            onlyForYou: false
        ),
        RecommendationViewItem(
            id: "4",
            label: "Take an Excercise Break",
            text: "Get up and drive instead of just grabbing another cup of coffee. Do any stretches or deep lunges.",
            highlyRecommended: false,
            onlyForYou: false
        )
    ]
        
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text("Recommendations")
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
                LazyVStack(spacing: 28) {
                    ForEach(recommendationViewItems, id: \.self.id) { item in
                        VStack(spacing: 12) {
                            if item.highlyRecommended || item.onlyForYou {
                                HStack {
                                    if item.highlyRecommended {
                                        HStack {
                                            Image(systemName: "star.fill")
                                                .resizable()
                                                .frame(width: 13, height: 13)
                                                
                                            Text("Highly Recommended")
                                                .font(.system(size: 12, weight: .bold))
                                        }
                                        .padding(.vertical, 4)
                                        .padding(.horizontal, 10)
                                        .foregroundColor(.white)
                                        .background(Color(hex: "#FBAC4F"))
                                        .cornerRadius(50)
                                    }
                                    
                                    if item.onlyForYou {
                                        Text("Only for you")
                                            .font(.system(size: 12, weight: .bold))
                                            .padding(.vertical, 4)
                                            .padding(.horizontal, 10)
                                            .foregroundColor(.appBlue)
                                            .contentShape(Rectangle())
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 50)
                                                    .stroke(Color.appBlue, lineWidth: 1)
                                            )
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 22)
                            }
                            
                            Text(item.label)
                                .foregroundColor(.appBlue)
                                .font(.system(size: 20, weight: .bold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 22)
                            
                            HStack {
                                Text(item.text)
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                    
                            }
                            .padding(.horizontal, 22)
                            .padding(.vertical, 12)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.lightGray)
                            .cornerRadius(6, corners: [.bottomLeft, .bottomRight])
                        }
                        .padding(.top, 12)
                        .contentShape(Rectangle())
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Color.lightGray, lineWidth: 1)
                        )
                    }
                    
                    NavigationLink(destination: Text("A view with personal recommendations")) {
                        HStack {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Personnel Recommendations")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .bold))
                                Text("Subscribe Now and Try one month for free!")
                                    .foregroundColor(.white)
                                    .font(.system(size: 12, weight: .medium))
                            }
                            Spacer()
                            Image(systemName: "chevron.right")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.white)
                                .font(Font.system(size: 18).weight(.light))
                                .frame(height: 16)
                                
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 23)
                        .background(Color(hex: "#FBAC4F"))
                        .cornerRadius(6)
                    }
                    
                    VStack(spacing: 15) {
                        Text("Consult a Doctor/Specialist.")
                        Text("This is not a Medical Report.")
                    }
                    .foregroundColor(.placeholderGray)
                    .font(.system(size: 18, weight: .regular))
                    .padding(.top, 80)
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 20)
                .padding(.top, 10)
                .padding(.bottom, 50)
            }
        }
        
    }
}

struct RecommendationsView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationsView()
    }
}
