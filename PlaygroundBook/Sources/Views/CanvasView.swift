//
//  CanvasView.swift
//  Book_Sources
//
//  Created by Gabriel Palhares on 18/03/19.
//

import UIKit

class CanvasView: UIImageView {
    
    let drawer = ContextDrawer.init(with: 3, and: UIColor.black.cgColor)
    var line = [CGPoint]()
    weak var delegate: CanvasViewDelegate?
    var lastState: UIImage?
    
    // track finger touch
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.drawer.drawView = self
    }
    
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: self) else {
            return
        }
        self.line.append(point)
        if line.count == 3 {
            self.image = self.drawer.drawSmoothLine(point1: line[0], point2: line[1], point3: line[2])
            line.removeFirst()
        }
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
       self.line.removeAll()
    }
    
    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.line.removeAll()
    }
    
}

// MARK: DragInteraction Delegate
 extension CanvasView : UIDragInteractionDelegate {
    public func dragInteraction(_ interaction: UIDragInteraction, itemsForBeginning session: UIDragSession) -> [UIDragItem] {
        let touchedPoint = session.location(in: self)
        if let touched = self.hitTest(touchedPoint, with: nil) as? UILabel {
            let touchedLabel = touched
            print(touchedLabel)
            
            let itemProvider = NSItemProvider(object: touchedLabel.text! as NSString)
            let dragItem = UIDragItem(itemProvider: itemProvider)
            dragItem.localObject = touched
            return [dragItem]
        }
        
        return []
    }
    
      func dragInteraction(_ interaction: UIDragInteraction, previewForLifting item: UIDragItem, session: UIDragSession) -> UITargetedDragPreview? {
        return UITargetedDragPreview(view: item.localObject as! UIView)
    }
    
      func dragInteraction(_ interaction: UIDragInteraction, willAnimateLiftWith animator: UIDragAnimating, session: UIDragSession) {
        
        session.items.forEach { (dragItem) in
            if let label = dragItem.localObject as? UIView{
                label.removeFromSuperview()
            }
        }
    }
    
        func dragInteraction(_ interaction: UIDragInteraction, item: UIDragItem, willAnimateCancelWith animator: UIDragAnimating) {
        self.addSubview(item.localObject as! UIView)
    }
}

// MARK: Drop Delegate

extension CanvasView : UIDropInteractionDelegate {
    public func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: UIImage.self) || session.canLoadObjects(ofClass: NSString.self)
    }
    
    public func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        return UIDropProposal.init(operation: .copy)
    }
    
    public func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        
        for dragItem in session.items {
            
            var isImage = false
            
            dragItem.itemProvider.loadObject(ofClass: UIImage.self) { (obj, err) in
                
                if let err = err {
                    print("Failed to load out dragged item: ", err)
                    return
                }
                
                isImage = true
                
                guard let draggedImage = obj as? UIImage else { return }
                
                DispatchQueue.main.async {
                    if draggedImage.size == CGSize(width: 461, height: 381) {
                        
                        let containerView = UIView(frame: CGRect(x:0,y:0, width:240, height:420))
                        
                        let ratio = draggedImage.size.width / draggedImage.size.height
                        
                        let newHeight = containerView.frame.width / ratio
                        
                        let xPosition = session.location(in: self).x - containerView.frame.width/2
                        let yPosition = session.location(in: self).y - newHeight/2
                        
                        
                        let frame = CGRect(x: xPosition, y: yPosition, width: containerView.frame.width, height: newHeight)
                        
                        self.delegate?.shouldAddImageView(image: draggedImage, withFrame: frame)
                        
                        return
                    } else {
                        
                        let containerView = UIView(frame: CGRect(x:0,y:0,width:320/6,height:500/6))
                        
                        let ratio = draggedImage.size.width / draggedImage.size.height
                        
                        let newHeight = containerView.frame.width / ratio
                        
                        let xPosition = session.location(in: self).x - containerView.frame.width/2
                        let yPosition = session.location(in: self).y - newHeight/2
                        
                        
                        let frame = CGRect(x: xPosition, y: yPosition, width: containerView.frame.width, height: newHeight)
                        
                        self.delegate?.shouldAddImageView(image: draggedImage, withFrame: frame)
                        
                        return
                    }
                    
                }
            }
            
            dragItem.itemProvider.loadObject(ofClass: NSString.self) { (obj, err) in
                
                if let err = err {
                    print("Failed to load out dragged item: ", err)
                    return
                }
                
                guard let draggedText = obj as? NSString else { return }
                
                DispatchQueue.main.async {
                    
                    let label = UILabel()
                    label.numberOfLines = 0
                    label.text = String(draggedText)
                    
                    label.font = UIFont(name: "Blenda Script", size: 26)
                    
                    let maximumLabelSize: CGSize = CGSize(width: 320, height: 9999)
                    let expectedLabelSize: CGSize = label.sizeThatFits(maximumLabelSize)
                    
                    
                    if expectedLabelSize.width < 320 {
                        label.frame.size = CGSize(width: expectedLabelSize.width, height: expectedLabelSize.height)
                    } else {
                        label.frame.size = CGSize(width: 320, height: expectedLabelSize.height)
                    }
                    
                    let xPosition = session.location(in: self).x - label.frame.width/2
                    let yPosition = session.location(in: self).y - label.frame.height/2
                    
                    label.frame.origin = CGPoint(x: xPosition, y: yPosition)
                    
                    label.isUserInteractionEnabled = true
                    
                    if isImage == false {
                        self.addSubview(label)
                    }
                    
                    return
                }
            }
        }
    }
}
