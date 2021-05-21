//
//  Screen1Cell.swift
//  Interview
//
//  Created by Ryan Kanno on 5/21/21.
//

import UIKit

class Screen1Cell: UITableViewCell {
      
   @IBOutlet weak var schoolNameLabel: UILabel!
   @IBOutlet weak var cityLabel: UILabel!
   @IBOutlet weak var zipLabel: UILabel!
   @IBOutlet weak var schoolEmailLabel: UILabel!
   @IBOutlet weak var websiteLabel: UILabel!
   @IBOutlet weak var phoneLabel: UILabel!
   static let nibName = "Screen1Cell"
   
   override func awakeFromNib() {
      super.awakeFromNib()
      self.backgroundColor = .white
      self.selectionStyle = .none
   }
   static func nib() -> UINib {
      return UINib(nibName: Screen1Cell.nibName, bundle: nil)
   }
   
   override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)
   }
   
   func configure(schoolName: String, city: String, zip: String, schoolEmail: String, website: String, phoneNumber: String) {
      self.schoolNameLabel.text = schoolName
      self.cityLabel.text = city
      self.zipLabel.text = zip
      self.schoolEmailLabel.text = schoolEmail
      self.websiteLabel.text = website
      self.phoneLabel.text = phoneNumber
   } //: configure()
   
}
