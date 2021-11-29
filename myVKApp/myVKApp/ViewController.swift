//
//  ViewController.swift
//  myVKApp
//
//  Created by Sergey Makeev on 29.11.2021.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var loginInput: UITextField!
	@IBOutlet weak var passwordInput: UITextField!
	@IBOutlet weak var scrollView: UIScrollView!
	
	// MARK: - LifeCycle
	override func viewDidLoad() {
		super.viewDidLoad()
		let hideKeyBoardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
		scrollView.addGestureRecognizer(hideKeyBoardGesture)
	}
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown),
											   name: UIResponder.keyboardWillShowNotification,
											   object: nil)
		
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(notification:)),
											   name: UIResponder.keyboardWillHideNotification,
											   object: nil)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		NotificationCenter.default.removeObserver(self,
												  name: UIResponder.keyboardWillShowNotification,
												  object: nil)
		
		NotificationCenter.default.removeObserver(self,
												  name: UIResponder.keyboardWillHideNotification,
												  object: nil)
	}
	
	// MARK: - Sign in button action
	@IBAction func signInButton(_ sender: Any) {
		if loginInput.text == "admin" && passwordInput.text == "1234" {
			print("success")
		} else {
			print("failure")
		}
	}
	
	@objc func hideKeyboard() {
		scrollView.endEditing(true)
	}
	
	@objc func keyboardWasShown(notification: Notification) {
		let info = notification.userInfo! as NSDictionary
		// get size of keyboard:
		let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as!
					  NSValue).cgRectValue.size
		let contentInsert = UIEdgeInsets(top: 0, left: 0, bottom: kbSize.height, right: 0)
		
		self.scrollView.contentInset = contentInsert
		self.scrollView.scrollIndicatorInsets = contentInsert
	}
	
	@objc func keyboardWillBeHidden(notification: Notification) {
		let contentInsert = UIEdgeInsets.zero
		scrollView.contentInset = contentInsert
	}
}

