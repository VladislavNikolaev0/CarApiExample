//
//  InfoController.swift
//  CarApiExample
//
//  Created by Ангел предохранитель on 07.10.2024.
//

import UIKit

final class InfoController: UIViewController {
    
    public var car: Cars! = nil
    
    private var infoLables: [CALable] = []
    private lazy var carImage = CAImageView(frame: .zero)
    
    private lazy var leftStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var rightStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .trailing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupInfoInLabels(car: car)
    }
    
    private func setupInfoInLabels(car: Cars) {
        var info: ([String], [Any]) = ([], [])
        
        do {
            try info = car.allProperties()
        } catch {
            print("Error")
        }
        
        for i in 0..<info.0.count {
            let leftLable = CALable(size: 16, alignment: .left, text: info.0[i])
            let rightLabel = CALable(size: 16, alignment: .right, text: "\(info.1[i])")
            
            infoLables.append(leftLable)
            infoLables.append(rightLabel)
        }
    }
    
    
}
