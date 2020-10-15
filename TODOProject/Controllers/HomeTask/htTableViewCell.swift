//
//  htTableViewCell.swift
//  TODOProject
//
//  Created by Pawan  on 14/10/2020.
//

import UIKit

class htTableViewCell: UITableViewCell {
    
    
    //MARK: - Outlet
    @IBOutlet weak var taskNameLabel: UILabel!
    
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
