//
//  SiteDetailsVC.swift
//  Historic Lemont
//
//  Created by Ethan Dunkin on 12/31/22.
//

import UIKit

class SiteDetailsVC: UIViewController{
    var siteName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        self.renderScreen()
        
    }
    func renderScreen(){
        let screenSize: CGRect = UIScreen.main.bounds
        let titleLabel = UILabel()
        titleLabel.text = siteName
        titleLabel.frame = CGRect(x: 0, y: 0, width: screenSize.width , height: 50)
        titleLabel.textAlignment = NSTextAlignment.center
        view.addSubview(titleLabel)
        
    }
}
