//
//  HomeViewController.swift
//  PostApplication
//
//  Created by Mykhailo Zagiko on 05.09.2023.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    var sortedState = false
    
    var expandedIndex: IndexPath = []
    
    var recivedPosts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(DefaultCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.delaysContentTouches = false
        tableView.rowHeight = UITableView.automaticDimension
        view.backgroundColor = .white
        
        //        navigationController?.title = "Title"
        //        navigationController?.setNavigationBarHidden(false, animated: true)
        title = "Title"
        
        let rightBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "sort"), style: .done, target: self, action: #selector(HomeViewController.sortItems))
        
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        
        addSubviews()
        setupConstraints()
        
        Task {
            do {
                
                let post = try await fetchPosts()
                self.recivedPosts = post.posts
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    
                }
                
            } catch postError.invalidURL {
                print("URL is invalid")
            } catch postError.invalidResponce {
                print("Responce is invalid")
            } catch postError.invalidData {
                print("Data is invalid")
            }
        }
    }
    
    
    @objc func sortItems() {
        if sortedState {
            sortedState = false
        } else {
            sortedState = true
        }
        if sortedState {
            recivedPosts.sort(by: {$0.likesCount < $1.likesCount})
            self.tableView.reloadData()
        } else {
            recivedPosts.sort(by: {$0.likesCount > $1.likesCount})
            self.tableView.reloadData()
        }
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
        
    }
    
    private func setupConstraints() {
        tableView.align(with: view)
    }
    
    deinit {
        print("\(self) deinit")
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recivedPosts.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create and return a UITableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath) as! DefaultCell
        
        // Configure the cell with data
        let postCell = recivedPosts[indexPath.row]
        let unixTimestamp = postCell.timeshamp
        let dateConvert = Date(timeIntervalSince1970: TimeInterval(unixTimestamp))
        let dateConverted = DateFormatter.localizedString(from: dateConvert, dateStyle: .long, timeStyle: .none)
        
        
        cell.headerLabel.text = postCell.title
        cell.textPostLabel.text = postCell.previewText
        cell.likesAmountLabel.text = String(postCell.likesCount)
        cell.dateLabel.text = dateConverted
        
        cell.callOnExpand = {
            tableView.beginUpdates()
//            tableView.reloadRows(at: [indexPath], with: .automatic)
            cell.updateState()
            tableView.endUpdates()
            
            
        }
        
        
        return cell
        
        
    }
    
    func updateCellAtIndexPath(indexPath: IndexPath) {
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        let detailsViewController = DetailsViewController(with: self.recivedPosts[indexPath.row])
        let detailsViewController = DetailsViewController(with: recivedPosts[indexPath.row].postID)
        
        let indexPathForReload = IndexPath(row: indexPath.row, section: 0)
        expandedIndex = indexPathForReload
        print(expandedIndex)
        
        self.navigationController?.pushViewController(detailsViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
//        self.tableView.reloadRows(at: [indexPath], with: .automatic)
        
//        tableView.reloadRows(at: [indexPathForReload], with: .automatic)
        print(indexPathForReload)
        self.tableView.reloadRows(at: [expandedIndex], with: .automatic)

    }
    

    
    
    
    
}


