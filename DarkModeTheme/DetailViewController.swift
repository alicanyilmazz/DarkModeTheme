//
//  DetailViewController.swift
//  DarkModeTheme
//
//  Created by alican on 20.11.2021.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func sendNotificationButtonClicked(_ sender: UIButton) {
        let person = Persons(personName: "Alican", personAge: 26)
        NotificationCenter.default.post(name: .notificationName, object: nil, userInfo: ["message" : "hello" , "todaysDate" : Date(), "data" : person]) // userInfo use key-value pair
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
