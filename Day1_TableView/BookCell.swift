//
//  BookCell.swift
//  Day1_TableView
//
//  Created by Chinh Ng on 01/06/2022.
//

import UIKit

class BookCell: UITableViewCell {
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookID: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bookTitle.numberOfLines = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
