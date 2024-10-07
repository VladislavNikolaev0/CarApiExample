//
//  CALable.swift
//  CarApiExample
//
//  Created by Ангел предохранитель on 29.09.2024.
//

import UIKit

final class CALable: UILabel {
    
    //MARK: - init
    
    init(size: CGFloat, alignment: NSTextAlignment, text: String = "") {
        super.init(frame: .zero)
        
        configure(size: size, alignment: alignment, text: text)
    }
    
    init() {
        super.init(frame: .zero)
        
        configure(size: 16, alignment: .center, text: "1")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setText(text: String) {
        self.text = text
    }
    
    //MARK: - configure
    
    private func configure(size: CGFloat, alignment: NSTextAlignment, text: String) {
        textColor = .label
        font = UIFont(name: "Baskerville", size: size)
        textAlignment = alignment
        translatesAutoresizingMaskIntoConstraints = false
        self.text = text
    }
}
