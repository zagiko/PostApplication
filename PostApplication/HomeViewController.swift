//
//  HomeViewController.swift
//  PostApplication
//
//  Created by Mykhailo Zagiko on 05.09.2023.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
//    private lazy var tableView = {
//        let table = UITableView(frame: .zero, style: .plain)
//        table.dataSource = self
//        return table
//    }()
  
    let tableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(DefaultCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.delaysContentTouches = false
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
                let recivedPost = try await fetchPosts()
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
        1
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create and return a UITableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath) as! DefaultCell
        
           
           // Configure the cell with data
//           cell.textLabel?.text = "Row \(indexPath.row)"


//        cell = DefaultCell.init(style: .default, reuseIdentifier: "DefaultCell")
        print("Cell created")
           return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsViewController = DetailsViewController()
        self.navigationController?.pushViewController(detailsViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    
    
}


