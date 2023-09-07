//
//  HomeViewController.swift
//  PostApplication
//
//  Created by Mykhailo Zagiko on 05.09.2023.
//

import UIKit

class HomeVoewController: UIViewController, UITableViewDataSource {
   
    private lazy var tableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.dataSource = self
        return table
    }()
    
    override func viewDidLoad() {
        
        tableView.register(DefaultCell.self, forCellReuseIdentifier: "DefaultCell")

        
        view.backgroundColor = .white
        
//        navigationController?.title = "Title"
//        navigationController?.setNavigationBarHidden(false, animated: true)
        title = "Title"
        
        let rightBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "sort"), style: .done, target: self, action: #selector(HomeVoewController.sortItems))


        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        
        addSubviews()
        setupConstraints()
        
    }
    
    
    @objc func sortItems() {
        
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
       
    }
    
    private func setupConstraints() {
        
        tableView.align(with: view)
                
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
    
    
}


