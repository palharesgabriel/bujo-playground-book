//
//  CGPoint+MidpointExtension.swift
//  Book_Sources
//
//  Created by Gabriel Palhares on 19/03/19.
//

import UIKit

public extension CGPoint {
    func midPoint(to otherPoint: CGPoint) -> CGPoint {
        let midX = (self.x + otherPoint.x) * 0.5
        let midY = (self.y + otherPoint.y) * 0.5
        
        return CGPoint.init(x: midX, y: midY)
    }
    
    func distance(to otherPoint: CGPoint) -> CGFloat {
        let xDist = self.x - otherPoint.x
        let yDist = self.y - otherPoint.y
        return CGFloat(sqrt(xDist * xDist + yDist * yDist))
    }
}
