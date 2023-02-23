//
//  Extension.swift
//  RickAndMortyApp
//
//  Created by suraj kumar on 23/02/23.
//

import Foundation
import UIKit
extension UIView {
    func addSubview(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
