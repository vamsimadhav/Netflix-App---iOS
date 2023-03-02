//
//  HeroHeaderUIView.swift
//  Netflix Clone
//
//  Created by Vamsi on 03/12/22.
//

import UIKit

class HeroHeaderUIView: UIView {
    
    private let heroImageView : UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "heroImage")
        return imageView
    }()
    
    private let playButton : UIButton = {
        let button = UIButton()
         button.setTitle("Play", for: .normal)
         button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.white.cgColor
         button.layer.borderWidth = 1
         button.translatesAutoresizingMaskIntoConstraints = false
         return button
     }()
    
    private let downloadButton : UIButton = {
       let button = UIButton()
        button.setTitle("Download", for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        layer.addSublayer(gradientLayer)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient()
        addSubview(downloadButton)
        addSubview(playButton)
        addConstraints()
    }
    
    private func addConstraints() {
        let downloadButtonConstraints = [
            downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60),
            downloadButton.widthAnchor.constraint(equalToConstant: 120)
        ]
        
        let playButtonConstraints = [
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60),
            playButton.widthAnchor.constraint(equalToConstant: 120)
        ]
        
        NSLayoutConstraint.activate(downloadButtonConstraints)
        NSLayoutConstraint.activate(playButtonConstraints)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    required init?(coder : NSCoder){
        fatalError()
    }
}
