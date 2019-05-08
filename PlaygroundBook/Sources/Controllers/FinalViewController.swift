//
//  FinalViewController.swift
//  Book_Sources
//
//  Created by Gabriel Palhares on 21/03/19.
//

import UIKit

public class FinalViewController : UIViewController {
    
    lazy var myImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "me.jpeg"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleToFill
        
        iv.layer.shadowColor = UIColor.black.cgColor
        iv.layer.shadowOffset = CGSize(width: 2, height: 2)
        iv.layer.shadowOpacity = 1
        iv.layer.shadowRadius = 1.0
        iv.clipsToBounds = false
        
        iv.layer.borderWidth = 35
        iv.layer.borderColor = UIColor(patternImage: UIImage(named: "papelonete.jpg")!).cgColor
        
        return iv
    }()
    
    lazy var labelImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "Thank you!"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundBlue")!)
        self.setupImageViewConstraints()
        self.setupLabelImageViewConstraints()
    }
    
    func setupLabelImageViewConstraints() {
        self.view.addSubview(self.labelImageView)
        self.labelImageView.topAnchor.constraint(equalTo: self.myImageView.bottomAnchor, constant: 32).isActive = true
        self.labelImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.labelImageView.widthAnchor.constraint(equalToConstant: 454).isActive = true
        self.labelImageView.heightAnchor.constraint(equalToConstant: 125).isActive = true
    }
    
    func setupImageViewConstraints() {
        self.view.addSubview(self.myImageView)
        
        let ratio = self.myImageView.frame.size.height / self.myImageView.frame.width
        
        self.myImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 64).isActive = true
        self.myImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -64).isActive = true
        self.myImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 64).isActive = true
        self.myImageView.heightAnchor.constraint(equalTo: self.myImageView.widthAnchor, multiplier: ratio).isActive = true
       
    }
    
}
