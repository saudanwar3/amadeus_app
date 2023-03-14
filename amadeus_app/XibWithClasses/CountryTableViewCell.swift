//
//  CountryTableViewCell.swift
//  amadeus_app
//
//  Created by Test on 14/03/2023.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    // MARK: IBOutlets
    @IBOutlet weak var flagImgView: UIImageView!
    @IBOutlet weak var cityNameLbl: UILabel!
    @IBOutlet weak var latLongLbl: UILabel!
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var countryLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
