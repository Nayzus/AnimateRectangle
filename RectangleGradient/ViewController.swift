//
//  ViewController.swift
//  RectangleGradient
//
//  Created by Pavel Parshutkin on 02.07.2023.
//

import UIKit

class ViewController: UIViewController {

    lazy var rectangleView: UIView = GradientRectangleView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(rectangleView)
        self.setupConstraints()
    }

    
    private func setupConstraints() {
        
        rectangleView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            rectangleView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            rectangleView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            rectangleView.widthAnchor.constraint(equalToConstant: 100),
            rectangleView.heightAnchor.constraint(equalToConstant: 100)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
}



class GradientRectangleView: UIView {
    
    private lazy var gradientLayer: CAGradientLayer = configureGradientLayer()
    
    init() {
        super.init(frame: .zero)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.gradientLayer.frame = bounds
        
        
    }
    
    private func setupView() {
        self.layer.cornerRadius = 16
        self.backgroundColor = .blue
        
        // Shadow Layer
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 16
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        
        // Gradient
       layer.insertSublayer(gradientLayer, at: 0)
        
        
    }
    
    private func configureGradientLayer() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.cornerRadius = 16
        
        return gradientLayer
    }
    
    
}
