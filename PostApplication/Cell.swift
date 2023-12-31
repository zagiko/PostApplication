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
        stackView.alignment = .fill
        stackView.spacing = 8
        return stackView
    }()
    
    lazy var stackViewDataLike = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()
    
    lazy var stackViewLike = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 4
        return stackView
    }()
    
    lazy var containerView = {
        let view = UIView()
        return view
    }()
    
    lazy var headerLabel = {
        let headerLabel = UILabel()
        headerLabel.font = UIFont(name: "SFProDisplay-Bold", size: 17)
        headerLabel.text = "Charlie Deets"
        headerLabel.textColor = .black
        headerLabel.numberOfLines = 1
        headerLabel.textAlignment = .left
        return headerLabel
    }()
    
    lazy var textPostLabel = {
        let textPostLabel = UILabel()
        textPostLabel.font = UIFont(name: "SFProDisplay-Medium", size: 12)
        textPostLabel.text = "Charlie Deets Charlie DeetsCharlie DeetsCharlie DeetsCharlie DeetsCharlie DeetsCharlie DeetsCharlie Deets"
        textPostLabel.textColor = .lightGray
        textPostLabel.numberOfLines = 2
        textPostLabel.textAlignment = .left
        return textPostLabel
    }()
    
    lazy var likeIcon = {
        let likeIcon = UILabel()
        likeIcon.font = UIFont(name: "SFProDisplay-Bold", size: 12)
        likeIcon.text = "❤️"
        return likeIcon
    }()
    
    lazy var likesAmountLabel = {
        let likesAmountLabel = UILabel()
        likesAmountLabel.font = UIFont(name: "SFProDisplay-Regular", size: 12)
        likesAmountLabel.text = "2343"
        likesAmountLabel.textColor = .lightGray
        return likesAmountLabel
    }()
    
    lazy var dateLabel = {
        let dateLabel = UILabel()
        dateLabel.font = UIFont(name: "SFProDisplay-Regular", size: 12)
        dateLabel.text = "21 day ago"
        dateLabel.textColor = .lightGray
        dateLabel.textAlignment = .left
        return dateLabel
    }()
    
    lazy var buttonExpand = {
        let button = UIButton()
        button.setTitle("Expand", for: .normal)
        button.addTarget(self, action: #selector(expandButton), for: .touchUpInside)
        button.backgroundColor = .darkGray
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Regular", size: 12)
        button.layer.cornerRadius = 8
        return button
    }()
    
    @objc func expandButton() {
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Initialize your custom properties here
        
        addSubviews()
        configureContstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    private func addSubviews() {
        
        contentView.addSubview(stackViewCell)
        
        
        stackViewCell.addArrangedSubview(headerLabel)
        stackViewCell.addArrangedSubview(textPostLabel)
        
        stackViewCell.addArrangedSubview(stackViewLike)
        stackViewCell.addArrangedSubview(stackViewDataLike)
        
        stackViewLike.addArrangedSubview(likeIcon)
        stackViewLike.addArrangedSubview(likesAmountLabel)
        
        stackViewDataLike.addArrangedSubview(stackViewLike)
        stackViewDataLike.addArrangedSubview(UIView())
        stackViewDataLike.addArrangedSubview(dateLabel)
        
        stackViewCell.addArrangedSubview(buttonExpand)
        
    }
    
    
    private func configureContstraints() {
        stackViewCell.align(with: contentView, constant: 16)
        buttonExpand.alignTop(to: stackViewLike.bottomAnchor, constant: 16)
        buttonExpand.setHeightGreaterThanOrEqualTo(constant: 32)
    }
    
}




