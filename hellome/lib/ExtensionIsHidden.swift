//
//  ExtensionIsHidden.swift
//  hellome
//
//  Created by Gustavo Munhoz Correa on 09/03/23.
//

import SwiftUI

extension View {
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}
