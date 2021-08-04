//
//  PostTableViewCell.swift
//  haultail
//
//  Created by Eugene Lysenko on 04.08.2021.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func oddCell(odd:Bool) {
        backgroundColor = odd ? UIColor(named:"color-grey-lighter") : UIColor(named:"color-grey-navigation")
    }

}
