//
//  CAImageView.swift
//  CarApiExample
//
//  Created by Ангел предохранитель on 29.09.2024.
//

import UIKit

final class CAImageView: UIImageView {
    
    //MARK: - private properties
    
    private lazy var icon = UIImage(named: "standartImage")
    
    //MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImage(imageName: String) {
        icon = UIImage(named: imageName)
    }
    
    //MARK: - configure
    
    private func configure() {
        layer.cornerRadius = 10
        image = icon
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
}
