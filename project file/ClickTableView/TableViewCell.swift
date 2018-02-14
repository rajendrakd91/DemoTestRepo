//
//  tableCell.swift
//  ClickTableView
//
//  Created by lokesh chand on 10/01/17.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cellnamelabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
