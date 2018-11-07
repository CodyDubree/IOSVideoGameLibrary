//
//  Library Cell.swift
//  Video Game Library
//
//  Created by Cody Dubree on 11/1/18.
//  Copyright © 2018 Cody Dubree. All rights reserved.
//

import UIKit

class LibraryCell : UITableViewCell {
    
    @IBOutlet weak var TitleLabel: UILabel!
    
    @IBOutlet weak var GenreLabel: UILabel!
    
    @IBOutlet weak var AvailibilityView: UIView!
    @IBOutlet weak var RatingLabel: UILabel!
    @IBOutlet weak var DueDateLabel: UILabel!
    
    
    
    
    func setup( game : Game) {
        TitleLabel.text = game.title
        GenreLabel.text = game.genre.rawValue
        RatingLabel.text = game.rating.symbol
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        DueDateLabel.text = dateFormatter.dateFormat
   
    }
        
    }

