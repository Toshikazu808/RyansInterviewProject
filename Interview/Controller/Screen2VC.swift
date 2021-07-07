//
//  Screen2VC.swift
//  Interview
//
//  Created by Ryan Kanno on 5/21/21.
//

import UIKit

class Screen2VC: UIViewController {
   
   @IBOutlet weak var tableView: UITableView!
   var overview_paragraph = ""
   var extracurricular_activities = ""
   
   override func viewDidLoad() {
      super.viewDidLoad()
      print("\nScreen2VC \(#function)")
      tableView.delegate = self
      tableView.dataSource = self
      tableView.register(Screen2Cell.nib(), forCellReuseIdentifier: Screen2Cell.nibName)
      tableView.reloadData()
      tableView.estimatedRowHeight = 25
      tableView.rowHeight = UITableView.automaticDimension
   }
   
}


extension Screen2VC: UITableViewDelegate, UITableViewDataSource {
   func numberOfSections(in tableView: UITableView) -> Int {
      return 1
   }
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 1
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(
         withIdentifier: Screen2Cell.nibName,
         for: indexPath) as! Screen2Cell
      cell.configure(overview: overview_paragraph, extracurricular: extracurricular_activities)
      print("\nOverview: \(cell.overviewLabel.text ?? "")")
      print("\nExtracurricular activities: \(cell.extracurricularLabel.text ?? "")")
      return cell
   }
   
}
