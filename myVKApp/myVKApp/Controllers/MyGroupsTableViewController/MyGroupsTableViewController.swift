//
//  MyGroupsTableViewController.swift
//  myVKApp
//
//  Created by Sergey Makeev on 05.12.2021.
//

import UIKit

class MyGroupsTableViewController: UITableViewController {

	var myGroups: [GroupModel] = [
		GroupModel(groupName: "Group1", groupAvatar: UIImage(named: "group1")),
		GroupModel(groupName: "Group2", groupAvatar: UIImage(named: "group2")),
		GroupModel(groupName: "Group3", groupAvatar: UIImage(named: "group3")),
		GroupModel(groupName: "Group4", groupAvatar: UIImage(named: "group4"))
	]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	
	// MARK: - Table view data source
	
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return myGroups.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let groupCell = tableView.dequeueReusableCell(withIdentifier: "GroupCellID", for: indexPath) as? GroupCell
		else {
			return UITableViewCell()
		}
		
		groupCell.groupName.text = myGroups[indexPath.row].groupName
		groupCell.groupAvatar.image = myGroups[indexPath.row].groupAvatar
		
		return groupCell
	}
	
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			// Delete the row from the data source
			tableView.deleteRows(at: [indexPath], with: .fade)
		} else if editingStyle == .insert {
			// Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
		}
	}
	
	/*
	 // Override to support conditional editing of the table view.
	 override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
	 // Return false if you do not want the specified item to be editable.
	 return true
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