//
//  CAFavoritButton.swift
//  CarApiExample
//
//  Created by Ангел предохранитель on 08.10.2024.
//

import UIKit

final class CAFavoriteButton: UIView {
    
    private var isFavorite: Bool = false
    
    private lazy var hearImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "heart")
        image.tintColor = .gray
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .systemBackground
        layer.cornerRadius = bounds.width / 2
        
        addSubview(hearImage)
        
        NSLayoutConstraint.activate([
            hearImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            hearImage.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
        
        addGestureRecognizer(gesture)
    }
    
    @objc private func didTap() {
        isFavorite.toggle()
        hearImage.image = isFavorite ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        hearImage.tintColor = isFavorite ? .systemRed : .gray
    }
}
