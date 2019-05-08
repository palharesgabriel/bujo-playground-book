//
//  ContextDrawer.swift
//  Book_Sources
//
//  Created by Gabriel Palhares on 19/03/19.
//

import UIKit

public class ContextDrawer {
    
    public var drawView: UIImageView?
    public var lineWidth: CGFloat
    public var lineColor: CGColor
    
    init(with lineWidth: CGFloat, and lineColor: CGColor){
        self.lineWidth = lineWidth
        self.lineColor = lineColor
    }
    
    func drawSmoothLine(point1: CGPoint, point2: CGPoint, point3: CGPoint) -> UIImage? {
        
        guard let drawImage =  self.drawView else {
            return nil
        }
        
        UIGraphicsBeginImageContext(drawImage.frame.size)
        let context = UIGraphicsGetCurrentContext()
        self.drawView?.draw(drawImage.frame)
        
        let firstMidPoint = point1.midPoint(to: point2)
        let secondMidPoint = point2.midPoint(to: point3)
        
        context?.move(to: firstMidPoint)
        context?.addQuadCurve(to: secondMidPoint, control: point2)
        context?.setLineCap(.round)
        context?.setLineWidth(lineWidth)
        context?.setStrokeColor(lineColor)
        context?.strokePath()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    func drawPoint(inPosition position: CGPoint) -> UIImage?{
        guard let drawImage = drawView else {
            return nil
        }
        
        UIGraphicsBeginImageContext(drawImage.frame.size)
        let context = UIGraphicsGetCurrentContext()
        self.drawView?.draw(drawImage.frame)
        
        context?.move(to: position)
        context?.addLine(to: position)
        context?.setLineCap(.round)
        context?.setLineWidth(lineWidth)
        context?.setStrokeColor(lineColor)
        context?.strokePath()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image
    }
    
    func setLineWidth(to width: CGFloat?) {
        if let newWidth = width {
            self.lineWidth = newWidth
        }
    }
    
    func getLineWidth() -> CGFloat? {
        return self.lineWidth
    }
    
    func setLineColor(to color: CGColor) {
        self.lineColor = color
    }
    
    func setViewToDraw(view: UIImageView) {
        self.drawView = view
    }
    
}
