//
//  library view controller.swift
//  Video Game Library
//
//  Created by Cody Dubree on 10/29/18.
//  Copyright © 2018 Cody Dubree. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController {
    
    let library = Library.sharedInstance
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        library.games.append(Game(title: "Fallout", description: "10/10", rating: .mature , genre: .action))
        tableView.reloadData()
    }
}

extension LibraryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return library.games.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "My Cell", for: indexPath) as! LibraryCell
        
        let game = library.games[indexPath.row]
        cell.setup(game : game)
        
        return cell
    }
    func checkOut(at indexPath: IndexPath) {
        let game = self.library.games[indexPath.row]
        
        let calendar = Calendar(identifier: .gregorian)
        let dueDate = calendar.date(byAdding: .day, value: 7, to: Date())!
        
        game.availablility = .checkedOut(dueDate: dueDate)
        (tableView.cellForRow(at: indexPath) as! LibraryCell).setup(game: game)
    }
    
    func checkIn(at indexPath: IndexPath) {
        let game = self.library.games[indexPath.row]
        game.availablility = .checkedIn
        (tableView.cellForRow(at: indexPath) as! LibraryCell).setup(game: game)
    }
    
    // Here the tableview is asking if any row should have an "edit" action.
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        // We create the delete action, with a closure associated with it.
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, indexPath in
            Library.sharedInstance.games.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        let game = library.games[indexPath.row]
        
        // If the game is checked out, we create and return the check in action.
        // If the game is checked in, we create and return the check out action.
        
        switch game.availablility {
        case .checkedIn:
            let checkOutAction = UITableViewRowAction(style: .normal, title: "Check Out") { _, indexPath in
                
                self.checkOut(at: indexPath)
                
            }
            
            return [checkOutAction, deleteAction]
            
        case .checkedOut:
            let checkInAction = UITableViewRowAction(style: .normal, title: "Check In") { _, indexPath in
                self.checkIn(at: indexPath)
            }
            
            return [checkInAction, deleteAction]
            
        }
    }
    
}
