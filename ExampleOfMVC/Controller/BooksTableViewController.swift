//
//  BooksTableViewController.swift
//  ExampleOfMVC
//
//  Created by Faiq Khan on 02/05/2021.
//

import UIKit

class BooksTableViewController: UITableViewController {
    
    
    var booksModel   = [Books]()
    let cellId       = "bookCell"
    let bookQuantity = 25
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupTableView()
        fetchData()
        
    }
    
    
    
    //TABLEVIEW:
    fileprivate func setupTableView() {
        //REGISTER AND INSET
        tableView.register(BookCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorInset     = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        //ROW HEIGHT
        tableView.rowHeight          = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
        //COLOUR
        tableView.backgroundColor    = .mainThemeColour
        tableView.separatorColor     = .lightGray
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return booksModel.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! BookCell
        cell.books = booksModel[indexPath.row]
        return cell
    }
    //-------------------------------
    
    
    
    
    //NAV BAR:
    fileprivate func setupNavBar() {
        //SET UP SIZE/TINTS
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor    = .mainThemeColour
        //navigationController?.navigationBar.isTranslucent      = true
        navigationController?.navigationBar.barTintColor       = .mainThemeColour
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes      = [.foregroundColor: UIColor.white]
        //TITLE
        navigationItem.title = "Books"
        
        //REFRESH BAR BUTTON
        let refreshBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshAndAlert))
        refreshBarButtonItem.tintColor = .white
        self.navigationItem.rightBarButtonItem  = refreshBarButtonItem
    }
    
    
    @objc func refreshAndAlert() {
        fetchData()
        Alerts.simple(title: "Book Collection Refreshed", body: "Another \(bookQuantity) books loaded", button: "Dismiss", vc: self)
    }
    //-------------------------------
    
    
    
    
    //NETWORK
    @objc func fetchData() {
        ApiService.shared.fetchCourses(urlString: "https://fakerapi.it/api/v1/books?_quantity=\(bookQuantity)") { (collection, err) in
            if let err = err {
                print("Failed to fetch courses:", err)
                return
            }
            
            self.booksModel = collection?.data ?? []
            self.tableView.reloadData()
        }
    }
    //-------------------------------
    
}




