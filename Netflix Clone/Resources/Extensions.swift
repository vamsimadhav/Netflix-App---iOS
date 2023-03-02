//
//  Extensions.swift
//  Netflix Clone
//
//  Created by Vamsi on 04/12/22.
//

import Foundation
extension String {
    func capitalizeOnlyFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
