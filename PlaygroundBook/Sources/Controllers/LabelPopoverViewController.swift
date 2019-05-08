//
//  LabelPopoverViewController.swift
//  LiveViewTestApp
//
//  Created by Gabriel Palhares on 20/03/19.
//

import UIKit

class LabelPopoverViewController: UIViewController {
    
    var delegate: LabelPopoverDelegate?
    
    var label:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Add text to canvas:"
        label.textAlignment = .center
        return label
    }()
    
    var textView:UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = ""
        textView.backgroundColor = UIColor(named: "ColorLightestGray")
        textView.layer.cornerRadius = 10
        return textView
    }()
    
    var addLabelButton:UIButton = {
        let addLabelButton = UIButton()
        addLabelButton.translatesAutoresizingMaskIntoConstraints = false
        addLabelButton.setTitle("Add Label", for: .normal)
        addLabelButton.setTitleColor(.blue, for: .normal)
        
        addLabelButton.addTarget(self, action: #selector(addLabelButtonPressed(_:)), for: .touchUpInside)
        
        return addLabelButton
    }()
    
    var cancelButton:UIButton = {
        let cancelButton = UIButton()
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.titleLabel?.text = "Cancel"
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.red, for: .normal)
        
        cancelButton.addTarget(self, action: #selector(cancelButtonPressed(_:)), for: .touchUpInside)
        
        return cancelButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.addSubview(textView)
        view.addSubview(addLabelButton)
        view.addSubview(cancelButton)
        
        let fontURL = Bundle.main.url(forResource: "Blenda Script", withExtension: "otf")
        CTFontManagerRegisterFontsForURL(fontURL! as CFURL, CTFontManagerScope.process, nil)
        
        // label constraint
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
        label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        
        // textView constraint
        textView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8).isActive = true
        textView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        textView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        
        // add button constraint
        addLabelButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 8).isActive = true
        addLabelButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        addLabelButton.rightAnchor.constraint(equalTo: cancelButton.leftAnchor, constant: -8).isActive = true
        addLabelButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8).isActive = true
        
        // cancel button constraint
        cancelButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 8).isActive = true
        cancelButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        cancelButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8).isActive = true
        
        cancelButton.widthAnchor.constraint(equalTo: addLabelButton.widthAnchor, multiplier: 1).isActive = true
        
        textView.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    
    @objc func addLabelButtonPressed(_ sender: UIButton) {
        let label = UILabel()
        
        label.numberOfLines = 0
        label.textColor = .black
        label.isUserInteractionEnabled = true
        label.text = textView.text
        label.font = UIFont(name: "Blenda Script", size: 26)
        
        let maximumLabelSize: CGSize = CGSize(width: 320, height: 9999)
        let expectedLabelSize: CGSize = label.sizeThatFits(maximumLabelSize)
        
        if expectedLabelSize.width < 320 {
            label.frame.size = CGSize(width: expectedLabelSize.width, height: expectedLabelSize.height)
        } else {
            label.frame.size = CGSize(width: 320, height: expectedLabelSize.height)
        }
        
        self.delegate?.addLabel(label: label)
        
        dismiss(animated: true, completion: nil)
    }
    
    @objc func cancelButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}


