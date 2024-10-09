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
    private lazy var carImage = CAImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
    
    private lazy var leftStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .equalSpacing
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var rightStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .equalSpacing
        stack.alignment = .trailing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = false
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var favButton = CAFavoriteButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupInfoInLabels(car: car)
        configureImege()
        configureButton()
        configureScrollView()
        configureStacks()
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
    
    private func configureImege() {
        self.navigationController?.navigationBar.tintColor = .white
        
        carImage.downLoadImage(urlString: car.image)
        
        view.addSubview(carImage)
        
        NSLayoutConstraint.activate([
            carImage.topAnchor.constraint(equalTo: view.topAnchor),
            carImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            carImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            carImage.heightAnchor.constraint(equalToConstant: view.bounds.height / 3)
        ])
    }
    
    private func configureButton() {
        let backview = UIView()
        backview.backgroundColor = .systemBackground
        backview.layer.cornerRadius = 20
        backview.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(backview)
        view.addSubview(favButton)
        
        NSLayoutConstraint.activate([
            backview.topAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.height / 3.2),
            backview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20),
            
            favButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            favButton.topAnchor.constraint(equalTo: backview.topAnchor, constant: -30),
            favButton.heightAnchor.constraint(equalToConstant: 60),
            favButton.widthAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    private func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: favButton.bottomAnchor, constant: 10),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 34),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -34),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
    }
    
    private func configureStacks() {
        
        for i in 0..<infoLables.count {
            i % 2 == 0 ?
            leftStackView.addArrangedSubview(infoLables[i]) :
            rightStackView.addArrangedSubview(infoLables[i])
            
            contentView.addSubview(leftStackView)
            contentView.addSubview(rightStackView)
            
            NSLayoutConstraint.activate([
                leftStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
                leftStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                leftStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -contentView.bounds.width / 2),
                leftStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                
                rightStackView.topAnchor.constraint(equalTo: leftStackView.topAnchor),
                rightStackView.leadingAnchor.constraint(equalTo: leftStackView.trailingAnchor),
                rightStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                rightStackView.bottomAnchor.constraint(equalTo: leftStackView.bottomAnchor),
            ])
        }
    }
}
