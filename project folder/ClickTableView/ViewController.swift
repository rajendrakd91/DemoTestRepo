//
//  ViewController.swift
//  ClickTableView
//
//  Created by lokesh chand on 10/01/17.
//

import UIKit

struct Section {
    var name: String!
    var items: [String]!
    var images: String!
    var collapsed: Bool!
    
    init(name: String, items: [String], collapsed: Bool = false, images: String) {
        self.name = name
        self.items = items
        self.collapsed = collapsed
        self.images = images
    }
}



class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate
{
    @IBOutlet weak var exptableview: UITableView!
    
    var sections = [Section]()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        sections = [
            Section(name: "April-2016", items: ["FirstViewController", "SecondViewController", "FifthViewController"], images : "room 2"),
            Section(name: "May -2016", items: ["ThirdViewController", "FourthViewController", "FirstViewController", "FirstViewController"], images : "room 1"),
            Section(name: "June-2016", items: ["FifthViewController", "SixthViewController", "SixthViewController", "ThirdViewController"], images : "room 1"),
            Section(name: "ThirdViewController", items: [], images : "room 2"),
            Section(name: "FifthViewController", items: [], images : "room 1"),
            Section(name: "ThirdViewController", items: [], images : "room 2"),
            Section(name: "october-2016", items: ["SixthViewController", "ThirdViewController"], images : "room 1"),
        ]
        
        let nib = UINib(nibName: "TableSectionHeader", bundle: nil)
        exptableview.register(nib, forHeaderFooterViewReuseIdentifier: "TableSectionHeader")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController {
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sections[section].items.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath) as? TableViewCell ?? TableViewCell(style: .default, reuseIdentifier: "cell")
        cell.cellnamelabel?.text = sections[(indexPath as NSIndexPath).section].items[(indexPath as NSIndexPath).row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TableSectionHeader")
        let header = cell as! TableSectionHeader
        header.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        header.detailButton.translatesAutoresizingMaskIntoConstraints = false
        header.setCollapsed(sections[section].collapsed)
        header.titleLabel.text = sections[section].name
        header.mImageView.image = UIImage(named: "\(sections[section].images!)")
//        header.mImageView.image = UIImage(named: "room 1")

        header.tag = section
        let gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapHeader(_:)))
        header.addGestureRecognizer(gesture)

        weak var weakSelf : ViewController? = self
        
        if (sections[section].items).count == 0 {
            header.detailButton.isHidden = true
        }
        else
        {
            header.detailButton.isHidden = false
        }
        header.addBtnCompletionBlock = {Void -> Void in
            
            if let strongself = weakSelf
            {
                strongself.toggleSection(header, section: section)
            }
        }
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 75.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
    {
        return 1.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return sections[(indexPath as NSIndexPath).section].collapsed! ? 75.0 : 0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(sections[(indexPath as NSIndexPath).section].items[(indexPath as NSIndexPath).row])")
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc :UIViewController?
            vc  = mainStoryboard.instantiateViewController(withIdentifier: "\(sections[(indexPath as NSIndexPath).section].items[(indexPath as NSIndexPath).row])")
        self.navigationController?.pushViewController(vc!, animated: true)
        

        
    }
    func tapHeader(_ gestureRecognizer: UITapGestureRecognizer) {
        guard let cell = gestureRecognizer.view as? TableSectionHeader else {
            return
        }
        toggleSection(cell, section: cell.tag)
    }

    func toggleSection(_ header: TableSectionHeader, section: Int) {
        if sections[section].items.count == 0 {
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc  = mainStoryboard.instantiateViewController(withIdentifier: "\((sections[section].name)!)")
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else{
        let collapsed = !sections[section].collapsed

        // Toggle collapse
        sections[section].collapsed = collapsed
        header.setCollapsed(collapsed)
        // Adjust the height of the rows inside the section
        exptableview.beginUpdates()
        for i in 0 ..< sections[section].items.count {
            exptableview.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        }
        exptableview.endUpdates()
        }
    }

}

extension UIView {
    
    func rotate(_ toValue: CGFloat, duration: CFTimeInterval = 0.2) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        
        animation.toValue = toValue
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        
        self.layer.add(animation, forKey: nil)
    }
}




