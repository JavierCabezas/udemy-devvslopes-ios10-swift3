//
//  PartyCell.swift
//  PartyRockApp
//
//  Created by Javier Cabezas Leyton on 5/15/17.
//  Copyright © 2017 Javier Cabezas Leyton. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    @IBOutlet weak var videoPreviewImage: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateUI(partyRock: PartyRock){
        videoTitle.text = partyRock.videoTitle
        let url = URL(string: partyRock.imageURL)!
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {
                    self.videoPreviewImage.image = UIImage(data: data)
                }
            }catch {
                //TO-DO
            }
        }
    }
}
