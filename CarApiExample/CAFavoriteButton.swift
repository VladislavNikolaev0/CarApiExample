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
        layer.cornerRadius = 30
        translatesAutoresizingMaskIntoConstraints = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 10
        layer.masksToBounds = false
        
        addSubview(hearImage)
        
        NSLayoutConstraint.activate([
            hearImage.topAnchor.constraint(equalTo: topAnchor, constant: 13),
            hearImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            hearImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            hearImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -13),
        ])
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
        
        addGestureRecognizer(gesture)
    }
    
    @objc private func didTap() {
        UIView.animate(withDuration: 0.3) {
            self.isFavorite.toggle()
            self.hearImage.image = self.isFavorite ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
            self.hearImage.tintColor = self.isFavorite ? .systemRed : .gray
        }
    }
}
