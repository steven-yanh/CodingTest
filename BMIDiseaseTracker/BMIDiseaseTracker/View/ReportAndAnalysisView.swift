//
//  ReportAndAnalysisView.swift
//  BMIDiseaseTracker
//
//  Created by Alexander Zhurov on 10.04.22.
//

import SwiftUI

struct ReportAndAnalysisView: View {
    struct ReportViewItem {
        let id: String
        let text: String
        var value: String? = nil
        let color: Color
    }
    
    let reportViewItems: [ReportViewItem] = [
        ReportViewItem(
            id: "1",
            text: "The probability of dying in the next 10 years from cardiovascular diseases.",
            value: "60%",
            color: Color(hex: "#DE6969")
        ),
        ReportViewItem(
            id: "2",
            text: "Your cancer risks are the same as other people with normal weight.",
            value: "20%",
            color: Color(hex: "#E89900")
        ),
        ReportViewItem(
            id: "3",
            text: "Your cancer risks are the same as other people with normal weight.",
            value: nil,
            color: Color(hex: "#2C8F3C")
        ),
        ReportViewItem(
            id: "4",
            text: "Your lung capacity is normal",
            value: nil,
            color: Color(hex: "#2C8F3C")
        )
    ]
        
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text("Report & Analysis")
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
                    ForEach(reportViewItems, id: \.self.id) { item in
                        HStack {
                
                            
                            Text(item.text)
                                .font(.system(size: 18, weight: .medium))
                                .padding(.horizontal, 22)
                                .padding(.vertical, 26)
                            

                                
                            Spacer()
                            
                            if let value = item.value {
                                Text(value)
                                    .foregroundColor(.white)
                                    .font(.system(size: 24, weight: .bold))
                                    .frame(maxHeight: .infinity)
                                    .padding(.horizontal, 20)
                                    .background(item.color)
                            }
                        }
                        
                        
                        .contentShape(Rectangle())
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(item.color, lineWidth: 3)
                        )
                    }
                    
                    NavigationLink(destination: Text("A view with report")) {
                        HStack {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("View Report")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .bold))
                                Text("(Data Available)")
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
                        .background(Color.appBlue)
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


struct ReportAndAnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        ReportAndAnalysisView()
    }
}
