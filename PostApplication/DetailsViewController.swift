//
//  DetailsViewController.swift
//  PostApplication
//
//  Created by Mykhailo Zagiko on 12.09.2023.
//

import UIKit

class DetailsViewController: UIViewController {
        
        lazy var stackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.alignment = .leading
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
        
        lazy var image = {
            let image = UIImageView()
            image.tintColor = .blue
            return image
        }
        
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
        
        
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
