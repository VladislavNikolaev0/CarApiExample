//
//  CarCell.swift
//  CarApiExample
//
//  Created by Ангел предохранитель on 29.09.2024.
//

import UIKit

final class CarCell: UICollectionViewCell {
    
    static let reuseId = "carID"
    
    private lazy var mark = CALable(size: 12, alignment: .left)
    private lazy var model = CALable(size: 12, alignment: .left)
    private lazy var image = CAImageView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(car: Cars) {
        mark.setText(text: car.make)
        model.setText(text: car.model)
        image.downLoadImage(urlString: car.image)
    }
    
    private func configure() {
        addSubview(image)
        addSubview(mark)
        addSubview(model)
        
        let padding: CGFloat = 5
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            image.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            image.heightAnchor.constraint(equalTo: image.widthAnchor),
            
            mark.topAnchor.constraint(equalTo: image.bottomAnchor, constant: padding),
            mark.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            mark.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            mark.heightAnchor.constraint(equalToConstant: 20),
            
            model.topAnchor.constraint(equalTo: mark.bottomAnchor, constant: padding),
            model.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            model.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            model.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}
