//
//  CustomTableViewCell.swift
//  ExampleOfMVC
//
//  Created by Faiq Khan on 02/05/2021.
//

import UIKit

class BookCell: UITableViewCell {

    
    var books: Books! {
        didSet {
            textLabel?.text       = books.title
            detailTextLabel?.text = "• Author: \(books.author)\n• Description: \(books.description)"
        }
    }
    
    //STYLING
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        // cell customization
        textLabel?.font                = UIFont.boldSystemFont(ofSize: 22)
        textLabel?.numberOfLines       = 0
        detailTextLabel?.textColor     = .black
        detailTextLabel?.font          = UIFont.systemFont(ofSize: 16, weight: .light)
        detailTextLabel?.numberOfLines = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

}
