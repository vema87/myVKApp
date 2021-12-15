//
//  FriendModel.swift
//  myVKApp
//
//  Created by Sergey Makeev on 06.12.2021.
//

import UIKit

struct FriendModel {
	let friendName: String
	let friendAvatar: UIImage?
}

// Singleton friends
class Friends {
    static let shared: Friends = Friends()
    
	var internalFriendsList: [FriendModel] = [
		FriendModel(friendName: "Friend1", friendAvatar: UIImage(named: "friend1")),
		FriendModel(friendName: "MyFriend2", friendAvatar: UIImage(named: "friend2")),
		FriendModel(friendName: "OldFriend3", friendAvatar: UIImage(named: "friend3")),
		FriendModel(friendName: "OldFriend4", friendAvatar: UIImage(named: "friend4"))
	]

    private init() {}

}
