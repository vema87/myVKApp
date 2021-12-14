//
//  ExternalGroupsTableViewController.swift
//  myVKApp
//
//  Created by Sergey Makeev on 07.12.2021.
//

import UIKit

class ExternalGroupsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return Groups.shared.externalGroups.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let groupCell = tableView.dequeueReusableCell(withIdentifier: "ExternalGroupCellID", for: indexPath) as? GroupCell
		else {
			return UITableViewCell()
		}
		
		groupCell.groupName.text = Groups.shared.externalGroups[indexPath.row].groupName
		groupCell.groupAvatar.image = Groups.shared.externalGroups[indexPath.row].groupAvatar
		
		return groupCell
	}
	
//	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//		return true
//	}
//
	
	override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
		let action = UIContextualAction(style: .normal, title: "Join") { [weak self] (action, view, completionHandler) in
			Groups.shared.join(indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
			tableView.reloadData()
			completionHandler(true)
		}
		
		action.backgroundColor = .blue
		return UISwipeActionsConfiguration(actions: [action])
	}
	
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .insert {
            Groups.shared.join(indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
			tableView.reloadData()
        }
    }
    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
