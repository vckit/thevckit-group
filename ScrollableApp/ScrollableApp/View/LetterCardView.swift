//
//  LetterCardView.swift
//  ScrollableApp
//
//  Created by Абдулхаким Магомедов on 06.11.2021.
//

import SwiftUI

struct LetterCardView: View {
    var letter: Letter
    
    @State var rect: CGRect = .zero
    
    var body: some View {
        VStack (spacing: 15) {
            VStack (alignment: .leading, spacing: 12) {
                Text(letter.date)
                    .font(.title2.bold())
                Text(letter.title)
                    .font(.callout)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Divider()
                .padding(.vertical, 10)
            Text("Augue platea dictumst. Morbi et. Sed platea arcu mattis aenean ornare dictum. Venenatis consectetur mauris et odio. Et. Dapibus vulputate interdum cursus platea et aenean morbi id et. Mattis dolor elit. Dolor sodales ex. Id quam, luctus sit lacinia lectus justo adipiscing sed vel lectus lacinia platea in dictumst. Dolor nulla hac amet odio. Leo, molestie dictum sed arcu morbi est. Luctus ipsum mollis quis, ornare venenatis non dictum sed ut. Mattis odio. Faucibus. Non molestie faucibus. Leo, sit lacinia risus mattis ipsum ex. Et. Est. Vestibulum dolor mattis arcu sed interdum non morbi orci, dolor orci, cras vel non in mollis malesuada imperdiet tortor, dolor augue urna molestie molestie dictum mattis elit. Sit cras non non sit risus consectetur dictum ornare aenean integer mattis habitasse accumsan integer vestibulum tempus molestie velit vulputate arcu odio. Dapibus risus pellentesque imperdiet non non justo nisi urna sed augue dictum habitasse eleifend nisi urna molestie adipiscing ")
                .lineSpacing(11)
                .multilineTextAlignment(.leading)
                .foregroundColor(.gray)
        }
        .padding()
        .background(
            Color.white
                .cornerRadius(6)
        )
        .mask (
            Rectangle()
                .padding(.top, rect.minY < (getIndex() * 50) ? -(rect.minY - (getIndex() * 50)): 0)
        )
        .offset(y: rect.minY < (getIndex() * 50) ? (rect.minY - (getIndex() * 50)): 0)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
        .overlay (
            ScrolledLetterShape()
            ,alignment: .top
        )
        .offset(y: rect.minY < (getIndex() * 50) ? -(rect.minY - (getIndex() * 50)): 0)
        .modifier(OffsetModifier(rect: $rect))
        .background (
            Text("No More Letters")
                .font(.title.bold())
                .foregroundColor(.gray)
                .opacity(isLast() ? 1 : 0)
                .offset(y: rect.minY < 0 ? -rect.minY : 0)
        )
        .padding(.bottom, isLast() ? rect.height : 0)
    }
    
    @ViewBuilder
    func ScrolledLetterShape() -> some View {
        Rectangle()
            .fill(Color.white)
            .frame(height: 30 * getProcess())
            .overlay {
                Rectangle()
                    .fill (
                        .linearGradient(.init(colors: [
                            Color.black.opacity(0.1),
                            Color.clear,
                            Color.black.opacity(0.1),
                            Color.black.opacity(0.05)
                        ]), startPoint: .top, endPoint: .bottom)
                    )
                //,alignment: .top
            }
            .cornerRadius(6)
            .shadow(color: Color.black.opacity(0.06), radius: 5, x: 5, y: 5)
            .shadow(color: Color.black.opacity(0.06), radius: 5, x: -5, y: -5)
    }
    
    func isLast() -> Bool {
        return letters.last == letter
    }
    
    func getIndex() -> CGFloat {
        let index = letters.firstIndex { letter in
            return self.letter.id == letter.id
        } ?? 0
        return CGFloat(index)
    }
    
    func getProcess() -> CGFloat {
        let progress = -rect.minY / rect.height
        return (progress > 0 ? (progress < 1 ? progress: 1) : 0)
    }
}
