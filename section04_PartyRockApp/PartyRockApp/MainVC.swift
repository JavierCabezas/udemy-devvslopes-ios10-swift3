//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Javier Cabezas Leyton on 5/8/17.
//  Copyright © 2017 Javier Cabezas Leyton. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var partyRocks = [ PartyRock ]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = PartyRock(imageURL: "https://i.ytimg.com/vi/2qvMDcKnbas/hqdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/yRMmGGdsvbw?ecver=1\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Silva Gunner")
        let p2 = PartyRock(imageURL: "http://rk.pbimgs.com/pbimgs/rk/images/dp/wcm/201711/0005/aaron-wood-seat-chair-j.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/s91jgcmQoB0?ecver=1\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Chairs")
        let p3 = PartyRock(imageURL: "https://static.pexels.com/photos/7720/night-animal-dog-pet.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Qnf_1laqE9I?ecver=1\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Dog")
        let p4 = PartyRock(imageURL: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Trampoline_with_enclosure.jpg/220px-Trampoline_with_enclosure.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/FB7lXepNktE?ecver=1\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Trampoline")
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell{
            
            let partyRock = partyRocks[indexPath.row]
            cell.updateUI(partyRock: partyRock)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }

}

