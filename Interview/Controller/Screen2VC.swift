//
//  Screen2VC.swift
//  Interview
//
//  Created by Ryan Kanno on 5/21/21.
//

import UIKit

class Screen2VC: UIViewController {

   var vc = ViewController()
   @IBOutlet weak var tableView: UITableView!
   var overviewParagraph: String = ""
   var extracurricularActivities: String = ""
   
    override func viewDidLoad() {
        super.viewDidLoad()
      tableView.delegate = self
      tableView.dataSource = self
      tableView.register(Screen2Cell.nib(), forCellReuseIdentifier: Screen2Cell.nibName)
      vc.delegate = self        
    } //: viewDidLoad()

}


extension Screen2VC: UITableViewDelegate, UITableViewDataSource {
   func numberOfSections(in tableView: UITableView) -> Int {
      return 1
   }
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 2
   }
   
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return UITableView.automaticDimension
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(
         withIdentifier: Screen2Cell.nibName,
         for: indexPath) as! Screen2Cell
      cell.configure(overview: overviewParagraph, extracurricular: extracurricularActivities)
      return cell
   }
   
}


extension Screen2VC: ViewControllerDelegate {
   func passDetails(overview: String, extracurricular: String) {
      overviewParagraph = overview
      extracurricularActivities = extracurricular
      tableView.reloadData()
   }
}
