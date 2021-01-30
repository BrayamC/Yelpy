//
//  RestaurantCell.swift
//  Yelpy
//
//  Created by Brayam Corral on 1/28/21.
//  Copyright © 2021 memo. All rights reserved.
//

import UIKit

class RestaurantCell: UITableViewCell {

    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var stars: UIImageView!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var reviews: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
