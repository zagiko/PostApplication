//
//  DetailsViewController.swift
//  PostApplication
//
//  Created by Mykhailo Zagiko on 12.09.2023.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var id: Int
    private var detailData: Post?
    
    lazy var scrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.backgroundColor = .white
        scrollView.isScrollEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        return contentView
    }()
    
    lazy var stackView = {
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
        stackView.alignment = .leading
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
    
    lazy var imageDatail = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        
        return image
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
        textPostLabel.text = "Charlie Deets"
        textPostLabel.textColor = .lightGray
        textPostLabel.numberOfLines = 0
        textPostLabel.textAlignment = .left
        textPostLabel.setContentHuggingPriority(.required, for: .vertical)
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
    
    init(with id: Int) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
                
        // Do any additional setup after loading the view.
        
        addSubviews()
        setupConstraints()
                
        Task {
            do {
                
                let post = try await fatchPostDetail(id: id)
                self.detailData = post.post
                
                guard let detailData else { return }
                
                headerLabel.text = detailData.title
                textPostLabel.text = detailData.text
                likesAmountLabel.text = String(detailData.likesCount)
                let unixTimestamp = detailData.timeshamp
                let dateConvert = Date(timeIntervalSince1970: TimeInterval(unixTimestamp))
                let dateConverted = DateFormatter.localizedString(from: dateConvert, dateStyle: .long, timeStyle: .none)
                dateLabel.text = dateConverted
                
                DispatchQueue.main.async {
                    if let stringURL = detailData.postImage, let url = URL(string: stringURL) {
                        self.downloadImage(from: url)
                    }
                }
                
                
            } catch postError.invalidURL {
                print("URL is invalid")
            } catch postError.invalidResponce {
                print("Responce is invalid")
            } catch postError.invalidData {
                print("Data is invalid")
            }
        }
        
        
        print(id)
    }
    
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL) {
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            // always update the UI from the main thread
            DispatchQueue.main.async() { [weak self] in
                self?.imageDatail.image = UIImage(data: data)
            }
        }
    }
    
    
    private func addSubviews() {
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        contentView.addSubview(imageDatail)
        contentView.addSubview(stackView)
  
        stackView.addArrangedSubview(headerLabel)
        stackView.addArrangedSubview(textPostLabel)
        
        stackView.addArrangedSubview(stackViewLike)
        stackView.addArrangedSubview(stackViewDataLike)
        
        stackViewLike.addArrangedSubview(likeIcon)
        stackViewLike.addArrangedSubview(likesAmountLabel)
        
        stackViewDataLike.addArrangedSubview(stackViewLike)
        stackViewDataLike.addArrangedSubview(UIView())
        stackViewDataLike.addArrangedSubview(dateLabel)
        
    }
    
    private func setupConstraints() {
        
        imageDatail.alignTop(to: contentView.safeAreaLayoutGuide.topAnchor)
        imageDatail.alignLeading(to: contentView.leadingAnchor)
        imageDatail.alignTrailing(to: contentView.trailingAnchor)
        
        imageDatail.setWidthAspect(ratio: 1)
        imageDatail.setHeightAspect(ratio: 1)
        
        stackView.alignTop(to: imageDatail.bottomAnchor, constant: 16)
        stackView.alignLeading(to: contentView.leadingAnchor, constant: 16)
        stackView.alignTrailing(to: contentView.trailingAnchor, constant: 16)
        stackView.alignBottom(to: contentView.bottomAnchor, constant: 16)
                
        scrollView.alignTop(to: view.topAnchor)
        scrollView.alignBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        scrollView.alignLeading(to: view.leadingAnchor)
        scrollView.alignTrailing(to: view.trailingAnchor)
                
        contentView.alignTop(to: scrollView.topAnchor)
        contentView.alignBottom(to: scrollView.bottomAnchor)
        contentView.alignLeading(to: scrollView.leadingAnchor)
        contentView.alignTrailing(to: scrollView.trailingAnchor)
        contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor).isActive = true
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
