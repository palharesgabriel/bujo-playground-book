//
//  GratitudeViewController.swift
//  LiveViewTestApp
//
//  Created by Gabriel Palhares on 21/03/19.
//

import UIKit

public class GratitudeViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    var canvas = CanvasView()
    var heightProportional: CGFloat?
    
    lazy var inputTextButtom: UIButton = {
        let btn = UIButton()
        
        btn.setImage(UIImage(named: "input_text"), for: .normal)
        btn.contentMode = .scaleAspectFill
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(inputTextButtomDidPressed(_:)), for: .touchUpInside)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    lazy var dayOne: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "one"))
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    
    lazy var dayTwo: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "two"))
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    
    lazy var dayThree: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "three"))
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    
    lazy var dayFour: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "four"))
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    
    lazy var dayFive: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "five"))
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var daySix: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "six"))
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    
    lazy var yellowButtom: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "yellowButtom"), for: .normal)
        btn.contentMode = .scaleAspectFill
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(yellowButtonDidPressed(_:)), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var redButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "redButtom"), for: .normal)
        btn.contentMode = .scaleAspectFill
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(redButtonDidPressed(_:)), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var blueButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "blueButtom"), for: .normal)
        btn.contentMode = .scaleAspectFill
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(blueButtonDidPressed(_:)), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var purpleButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "purpleButtom"), for: .normal)
        btn.contentMode = .scaleAspectFill
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(purpleButtonDidPressed(_:)), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var blackButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "blackButtom"), for: .normal)
        btn.contentMode = .scaleAspectFill
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(blackButtonDidPressed(_:)), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var titleLabel: UIImageView = {
        let image = UIImageView(image: UIImage(named: "Gratitude Log"))
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundBlue")!)
        self.view.addSubview(canvas)
        self.canvas.backgroundColor = UIColor(patternImage: UIImage(named: "grid")!)
        self.canvas.layer.cornerRadius = 10
        
        self.heightProportional = 1/self.view.frame.size.height
        
        self.setupCanvasConstraints()
        self.setupInputTextButtomConstraints()
        self.setupYellowButtonConstraints()
        self.setupRedButtonConstraints()
        self.setupBlueButtonConstraints()
        self.setupPurpleButtonConstraints()
        self.setupBlackButtonConstraints()
        self.setupTitleImageViewConstraints()
        self.setupNumberConstraints()
        
        canvas.addInteraction(UIDropInteraction(delegate: canvas))
        canvas.addInteraction(UIDragInteraction(delegate: canvas))
    }
    
    // Constraints
    
    func setupCanvasConstraints() {
        self.canvas.translatesAutoresizingMaskIntoConstraints = false
        let viewHeigth = round(self.view.frame.size.height)
        let viewWidth = round(self.view.frame.size.width)
        self.canvas.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.canvas.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.canvas.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100).isActive = true
        self.canvas.widthAnchor.constraint(equalToConstant: viewWidth).isActive = true
        self.canvas.heightAnchor.constraint(equalToConstant: viewHeigth).isActive = true
        
        canvas.isUserInteractionEnabled = true
    }
    
    func setupInputTextButtomConstraints() {
        self.view.addSubview(self.inputTextButtom)
        self.inputTextButtom.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 24).isActive = true
        self.inputTextButtom.leadingAnchor.constraint(equalTo: self.canvas.trailingAnchor, constant: 4).isActive = true
        self.inputTextButtom.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -4).isActive = true
        self.inputTextButtom.heightAnchor.constraint(equalTo: self.inputTextButtom.widthAnchor).isActive = true
    }
    
    func setupYellowButtonConstraints() {
        self.view.addSubview(self.yellowButtom)
        self.yellowButtom.topAnchor.constraint(equalTo: self.inputTextButtom.bottomAnchor, constant: heightProportional!).isActive = true
        self.yellowButtom.leadingAnchor.constraint(equalTo: self.canvas.trailingAnchor, constant: 4).isActive = true
        self.yellowButtom.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -4).isActive = true
        self.yellowButtom.heightAnchor.constraint(equalTo: self.yellowButtom.widthAnchor).isActive = true
    }
    
    func setupRedButtonConstraints() {
        self.view.addSubview(self.redButton)
        self.redButton.topAnchor.constraint(equalTo: self.yellowButtom.bottomAnchor, constant: heightProportional!).isActive = true
        self.redButton.leadingAnchor.constraint(equalTo: self.canvas.trailingAnchor, constant: 4).isActive = true
        self.redButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -4).isActive = true
        self.redButton.heightAnchor.constraint(equalTo: self.redButton.widthAnchor).isActive = true
    }
    
    func setupBlueButtonConstraints() {
        self.view.addSubview(self.blueButton)
        self.blueButton.topAnchor.constraint(equalTo: self.redButton.bottomAnchor, constant: heightProportional!).isActive = true
        self.blueButton.leadingAnchor.constraint(equalTo: self.canvas.trailingAnchor, constant: 4).isActive = true
        self.blueButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -4).isActive = true
        self.blueButton.heightAnchor.constraint(equalTo: self.blueButton.widthAnchor).isActive = true
    }
    
    func setupPurpleButtonConstraints() {
        self.view.addSubview(self.purpleButton)
        self.purpleButton.topAnchor.constraint(equalTo: self.blueButton.bottomAnchor, constant: heightProportional!).isActive = true
        self.purpleButton.leadingAnchor.constraint(equalTo: self.canvas.trailingAnchor, constant: 4).isActive = true
        self.purpleButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -4).isActive = true
        self.purpleButton.heightAnchor.constraint(equalTo: self.purpleButton.widthAnchor).isActive = true
    }
    
    func setupBlackButtonConstraints() {
        self.view.addSubview(self.blackButton)
        self.blackButton.topAnchor.constraint(equalTo: self.purpleButton.bottomAnchor, constant: heightProportional!).isActive = true
        self.blackButton.leadingAnchor.constraint(equalTo: self.canvas.trailingAnchor, constant: 4).isActive = true
        self.blackButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -4).isActive = true
        self.blackButton.heightAnchor.constraint(equalTo: self.blackButton.widthAnchor).isActive = true
    }
    
    func setupTitleImageViewConstraints() {
        self.canvas.addSubview(self.titleLabel)
        self.titleLabel.topAnchor.constraint(equalTo: self.canvas.topAnchor, constant: 8).isActive = true
        self.titleLabel.centerYAnchor.constraint(equalTo: canvas.centerYAnchor).isActive = true
        self.titleLabel.centerXAnchor.constraint(equalTo: canvas.centerXAnchor).isActive = true
        self.titleLabel.widthAnchor.constraint(equalTo: canvas.widthAnchor, multiplier: 0.1).isActive = true
        self.titleLabel.heightAnchor.constraint(equalTo: canvas.heightAnchor, multiplier: 0.05).isActive = true
    }
    
    func setupNumberConstraints() {
        self.canvas.addSubview(dayOne)
        self.canvas.addSubview(dayTwo)
        self.canvas.addSubview(dayThree)
        self.canvas.addSubview(dayFour)
        self.canvas.addSubview(dayFive)
        self.canvas.addSubview(daySix)
        
        self.dayOne.topAnchor.constraint(equalTo: self.canvas.topAnchor, constant: 100).isActive = true
        self.dayOne.leadingAnchor.constraint(equalTo: self.canvas.leadingAnchor, constant: 50).isActive = true
        
        self.dayTwo.topAnchor.constraint(equalTo: self.dayOne.bottomAnchor, constant: 50).isActive = true
        self.dayTwo.leadingAnchor.constraint(equalTo: self.canvas.leadingAnchor, constant: 32).isActive = true
        
        self.dayThree.topAnchor.constraint(equalTo: self.dayTwo.bottomAnchor, constant: 50).isActive = true
        self.dayThree.leadingAnchor.constraint(equalTo: self.canvas.leadingAnchor, constant: 32).isActive = true
        
        self.dayFour.topAnchor.constraint(equalTo: self.dayThree.bottomAnchor, constant: 50).isActive = true
        self.dayFour.leadingAnchor.constraint(equalTo: self.canvas.leadingAnchor, constant: 32).isActive = true

        self.dayFive.topAnchor.constraint(equalTo: self.dayFour.bottomAnchor, constant: 50).isActive = true
        self.dayFive.leadingAnchor.constraint(equalTo: self.canvas.leadingAnchor, constant: 32).isActive = true

        self.daySix.topAnchor.constraint(equalTo: self.dayFive.bottomAnchor, constant: 50).isActive = true
        self.daySix.leadingAnchor.constraint(equalTo: self.canvas.leadingAnchor, constant: 32).isActive = true
        
    }
    
    // MARK: Actions
    
    @objc func inputTextButtomDidPressed(_ sender: UIButton) {
        let controller = LabelPopoverViewController()
        controller.modalPresentationStyle = .popover
        controller.preferredContentSize = CGSize(width: 300, height: 120)
        controller.delegate = self
        let presentationController = controller.presentationController as! UIPopoverPresentationController
        presentationController.sourceView = sender
        presentationController.sourceRect = sender.bounds
        presentationController.permittedArrowDirections = [.down, .up]
        self.present(controller, animated: true)
    }
    
    @objc func yellowButtonDidPressed(_ sender: UIButton) {
        self.yellowButtom.setImage(UIImage(named: "selected-yellow-buttom"), for: .normal)
        self.canvas.drawer.setLineColor(to: UIColor(red: 0.89020, green: 0.76471, blue: 0.25490, alpha: 100).cgColor)
        
        self.blackButton.setImage(UIImage(named: "blackButtom"), for: .normal)
        self.purpleButton.setImage(UIImage(named: "purpleButtom"), for: .normal)
        self.redButton.setImage(UIImage(named: "redButtom"), for: .normal)
        self.blueButton.setImage(UIImage(named: "blueButtom"), for: .normal)
        
        self.blackButton.isEnabled = true
        self.purpleButton.isEnabled = true
        self.redButton.isEnabled = true
        self.blueButton.isEnabled = true
        
        self.yellowButtom.isEnabled = false
    }
    
    @objc func redButtonDidPressed(_ sender: UIButton) {
        self.redButton.setImage(UIImage(named: "selected-red-buttom"), for: .normal)
        self.canvas.drawer.setLineColor(to: UIColor(red: 0.81176, green: 0.32157, blue: 0.25098, alpha: 100).cgColor)
        
        self.yellowButtom.setImage(UIImage(named: "yellowButtom"), for: .normal)
        self.purpleButton.setImage(UIImage(named: "purpleButtom"), for: .normal)
        self.blueButton.setImage(UIImage(named: "blueButtom"), for: .normal)
        self.blackButton.setImage(UIImage(named: "blackButtom"), for: .normal)
        
        self.yellowButtom.isEnabled = true
        self.purpleButton.isEnabled = true
        self.blueButton.isEnabled = true
        self.blackButton.isEnabled = true
        
        self.redButton.isEnabled = false
    }
    
    @objc func blueButtonDidPressed(_ sender: UIButton) {
        self.blueButton.setImage(UIImage(named: "selected-blue-buttom"), for: .normal)
        self.canvas.drawer.setLineColor(to: UIColor(red: 0.28235, green: 0.34510, blue: 0.74118, alpha: 100).cgColor)
        
        self.yellowButtom.setImage(UIImage(named: "yellowButtom"), for: .normal)
        self.redButton.setImage(UIImage(named: "redButtom"), for: .normal)
        self.purpleButton.setImage(UIImage(named: "purpleButtom"), for: .normal)
        self.blackButton.setImage(UIImage(named: "blackButtom"), for: .normal)
        
        self.yellowButtom.isEnabled = true
        self.redButton.isEnabled = true
        self.purpleButton.isEnabled = true
        self.blackButton.isEnabled = true
        
        self.blueButton.isEnabled = false
    }
    
    @objc func purpleButtonDidPressed(_ sender: UIButton) {
        self.purpleButton.setImage(UIImage(named: "purple-selected-buttom"), for: .normal)
        self.canvas.drawer.setLineColor(to: UIColor(red: 0.69020, green: 0.35686, blue: 0.70196, alpha: 100).cgColor)
        
        self.yellowButtom.setImage(UIImage(named: "yellowButtom"), for: .normal)
        self.redButton.setImage(UIImage(named: "redButtom"), for: .normal)
        self.blueButton.setImage(UIImage(named: "blueButtom"), for: .normal)
        self.blackButton.setImage(UIImage(named: "blackButtom"), for: .normal)
        
        self.yellowButtom.isEnabled = true
        self.redButton.isEnabled = true
        self.blueButton.isEnabled = true
        self.blackButton.isEnabled = true
        
        self.purpleButton.isEnabled = false
    }
    
    @objc func blackButtonDidPressed(_ sender: UIButton) {
        self.blackButton.setImage(UIImage(named: "selected-black-buttom"), for: .normal)
        self.canvas.drawer.setLineColor(to: UIColor(red: 0, green: 0, blue: 0, alpha: 100).cgColor)
        
        self.yellowButtom.setImage(UIImage(named: "yellowButtom"), for: .normal)
        self.redButton.setImage(UIImage(named: "redButtom"), for: .normal)
        self.blueButton.setImage(UIImage(named: "blueButtom"), for: .normal)
        self.purpleButton.setImage(UIImage(named: "purpleButtom"), for: .normal)
        
        self.yellowButtom.isEnabled = true
        self.redButton.isEnabled = true
        self.blueButton.isEnabled = true
        self.purpleButton.isEnabled = true
        
        self.blackButton.isEnabled = false
    }
}

// MARK: Popover Delegate

extension GratitudeViewController : LabelPopoverDelegate {
    public func addLabel(label: UILabel) {
        label.center = canvas.center
        canvas.addSubview(label)
    }
}




