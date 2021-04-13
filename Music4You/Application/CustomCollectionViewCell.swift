//
//  CustomCollectionViewCell.swift
//  Application
//
//  Created by Mélanie Drevet on 11/02/2021.
//  Copyright © 2021 Mélanie Drevet. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageMusique : UIImageView!
    @IBOutlet weak var titleMusique: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configure(imageName : String, musiqueName:String) {
        imageMusique.image = UIImage(named:imageName)
        titleMusique.text = musiqueName
    }
}

