//
//  Game.swift
//  Video Game Library
//
//  Created by Cody Dubree on 10/29/18.
//  Copyright © 2018 Cody Dubree. All rights reserved.
//

import Foundation


class Game{
    enum Genre: String {
        case rpg = "Role Playing Game"
        case royale = "Royale"
        case fps = "First Person Shooter"
        case jprg = "Japeneese RPG"
        case puzzle = "Puzzle"
        case action = "Action"
        case arcade = "Arcade"
        case coolMath = "CoolMath"
    }
    
    enum Rating: String {
        case kids = "K"
        case everyone = "E"
        case tenplus = "10+"
        case teen = "T"
        case mature = "M"
        case adultsOnly = "AO"
        
        var symbol: String {
            switch self {
            case .kids : return "K"
            case .everyone : return "E"
            case .tenplus : return "10+"
            case .teen : return "T"
            case .mature : return "M"
            case .adultsOnly : return "AO"
            default:
                break
            }
        }
        
    }
    
    enum Availability {
        case checkedIn
        case checkedOut(dueDate: Date)
        init (date : Date?) {
            if let date = date {
                self = .checkedOut(dueDate: date)
            } else {
                self = .checkedIn
                
            }
        }
    }
    
    let title: String
    let description: String
    let dueDate: Date? = nil
    let genre: Genre
    let rating: Rating
    var availablility: Availability = .checkedIn
    
    
    init(title: String, description: String, rating: Rating, genre: Genre) {
        
        self.title = title
        self.description = description
        self.genre = genre
        self.rating = rating
        
    }
}
