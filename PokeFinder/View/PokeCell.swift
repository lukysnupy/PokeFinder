//
//  PokeCell.swift
//  PokeFinder
//
//  Created by Lukáš Růžička on 04.04.18.
//  Copyright © 2018 Lukáš Růžička. All rights reserved.
//

import UIKit

class PokeCell: UITableViewCell {

    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var lbl: UILabel!
    
    func configureCell(name: String, pokeId: Int) {
        self.thumb.image = UIImage(named: "\(pokeId)")
        self.lbl.text = name.capitalized
    }

}
