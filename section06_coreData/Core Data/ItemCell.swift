//
//  ItemCell.swift
//  Core Data
//
//  Created by Javier Cabezas Leyton on 7/1/17.
//  Copyright © 2017 Javier Cabezas Leyton. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var details: UILabel!

    //This function links the CoreData Item class and the actual ItemCell class
    func configureCell(item: Item){
        title.text = item.title;
        price.text = "$\(item.price)"
        details.text = item.details
    }
}
