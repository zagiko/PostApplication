//
//  Cell.swift
//  PostApplication
//
//  Created by Mykhailo Zagiko on 05.09.2023.
//

import UIKit

class DefaultCell: UITableViewCell {
    
    
    lazy var stackViewCell = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 4
        return stackView
    }()
    
    lazy var header = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Medium", size: 17)
        label.text = "Charlie Deets"
        label.textColor = .black
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    lazy var textPost = {
       let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Medium", size: 10)
        label.text = "Charlie Deets Charlie DeetsCharlie DeetsCharlie DeetsCharlie DeetsCharlie DeetsCharlie DeetsCharlie Deets"
        label.textColor = .black
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()
    
    lazy var backgroundFrame =  {
        let frame = UIView()
        frame.backgroundColor = .black
        frame.layer.cornerRadius = 15
    
        return frame
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            // Initialize your custom properties here
        }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        addSubviews()
//        configureContstraints()
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    private func addSubviews() {

        contentView.addSubview(backgroundFrame)
        contentView.addSubview(stackViewCell)

        stackViewCell.addArrangedSubview(header)
        stackViewCell.addArrangedSubview(textPost)
        
        
    }
    
    
    private func configureContstraints() {
        stackViewCell.align(with: self)
        stackViewCell.alignTop(to: contentView.topAnchor)
        stackViewCell.alignBottom(to: contentView.bottomAnchor)
        backgroundFrame.align(with: contentView
        )
    }
    
}




