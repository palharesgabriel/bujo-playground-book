//
//  ComponentCell.swift
//  Book_Sources
//
//  Created by Gabriel Palhares on 19/03/19.
//

import UIKit

class ComponentCell : UICollectionViewCell {
    
    let component = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        component.contentMode = .scaleAspectFit
        self.addSubview(component)
        component.translatesAutoresizingMaskIntoConstraints = false
        component.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        component.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        component.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        component.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    }
    
    override func layoutSubviews() {

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
