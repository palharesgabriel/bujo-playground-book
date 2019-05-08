//
//  CanvasViewDelegate.swift
//  LiveViewTestApp
//
//  Created by Gabriel Palhares on 21/03/19.
//

import UIKit

protocol CanvasViewDelegate : class {
    func shouldAddImageView(image: UIImage, withFrame frame: CGRect)
}
