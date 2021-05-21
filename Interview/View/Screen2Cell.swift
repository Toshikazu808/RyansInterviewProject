//
//  Screen2Cell.swift
//  Interview
//
//  Created by Ryan Kanno on 5/21/21.
//

import UIKit

class Screen2Cell: UITableViewCell {
   
   @IBOutlet weak var overviewLabel: UILabel!
   @IBOutlet weak var extracurricularLabel: UILabel!
   static let nibName = "Screen2Cell"
   
   override func awakeFromNib() {
      super.awakeFromNib()
      self.isUserInteractionEnabled = false
      self.selectionStyle = .none
   }
   static func nib() -> UINib {
      return UINib(nibName: Screen2Cell.nibName, bundle: nil)
   }
   
   override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)
   }
   
   func configure(overview: String, extracurricular: String) {
      self.overviewLabel.text = overview
      self.extracurricularLabel.text = extracurricular
   }
   
}
