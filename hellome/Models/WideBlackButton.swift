//
//  WideBlackOrangeButton.swift
//  hellome
//
//  Created by Gustavo Munhoz Correa on 08/03/23.
//

import SwiftUI

struct WideBlackButton: ButtonStyle {
    let width: Double;
    let height: Double;
    
    init(width: Double, height: Double) {
        self.width = width;
        self.height = height;
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: width, height: height)
            .foregroundColor(.white)
            .padding()
            .background( RoundedRectangle(cornerRadius: 10).fill(Color.black)
        )
    }
}
