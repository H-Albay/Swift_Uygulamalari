//
//  FlowTVCell.swift
//  StoryBoardApp
//
//  Created by Hakan Albay on 20.04.2019.
//  Copyright © 2019 Hakan Albay. All rights reserved.
//

import UIKit

class FlowTVCell: UITableViewCell {
    @IBOutlet weak var UserEmailLabel: UILabel!
    @IBOutlet weak var UserImageView: UIImageView!
    @IBOutlet weak var UserComment: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
