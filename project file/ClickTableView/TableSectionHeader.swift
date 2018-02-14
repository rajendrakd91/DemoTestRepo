//
//  TableSectionHeader.swift
//  ClickTableView
//
//  Created by lokesh chand on 10/01/17
//

import UIKit

class TableSectionHeader: UITableViewHeaderFooterView {
    typealias addBtnCompletionHandler = ()->Void
    var addBtnCompletionBlock : addBtnCompletionHandler?

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailButton: UIButton!
    @IBOutlet weak var mImageView: UIImageView!

    
    
    @IBAction func detailButtonClicked(_ sender: UIButton) {
        if(addBtnCompletionBlock != nil)
        {
            addBtnCompletionBlock!()
        }
    }
    func setCollapsed(_ collapsed: Bool) {
        detailButton.rotate(collapsed ?CGFloat(M_PI_2) : 0.0 )
    }


}
