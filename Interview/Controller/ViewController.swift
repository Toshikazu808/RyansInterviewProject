//
//  ViewController.swift
//  Interview
//
//  Created by Ryan Kanno on 5/20/21.
//

import UIKit

protocol ViewControllerDelegate {
   func passDetails(overview: String, extracurricular: String)
}

class ViewController: UIViewController {
   
   var delegate: ViewControllerDelegate?
   @IBOutlet weak var tableView: UITableView!
   var schoolData: [SchoolModel] = []
   var helper = Helper()
   let url = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
   
   override func viewDidLoad() {
      super.viewDidLoad()
      tableView.delegate = self
      tableView.dataSource = self
      tableView.register(Screen1Cell.nib(), forCellReuseIdentifier: Screen1Cell.nibName)
      helper.performRequest(urlString: url, returnType: [SchoolModel].self) { result in
         switch result {
         case .failure(let error):
            print(error)
         case .success(let success):
            print("success: \(success)")
            self.schoolData = success
            DispatchQueue.main.async {
               self.tableView.reloadData()
            }
         }
      } //: performRequest()      
   } //: viewDidLoad()

} //: ViewController


extension ViewController: UITableViewDelegate, UITableViewDataSource {
   func numberOfSections(in tableView: UITableView) -> Int {
      return 1
   }
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return schoolData.count
   }
   
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return UITableView.automaticDimension
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(
         withIdentifier: Screen1Cell.nibName,
         for: indexPath) as! Screen1Cell
      cell.configure(
         schoolName: schoolData[indexPath.row].school_name ?? "",
         city: schoolData[indexPath.row].city ?? "",
         zip: schoolData[indexPath.row].zip ?? "",
         schoolEmail: schoolData[indexPath.row].school_email ?? "",
         website: schoolData[indexPath.row].website ?? "",
         phoneNumber: schoolData[indexPath.row].phone_number ?? "")
      return cell
   }
   
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//      Helper.tempOverview_paragraph = schoolData[indexPath.row].overview_paragraph ?? ""
//      Helper.tempExtracurricular_activities = schoolData[indexPath.row].extracurricular_activities ?? ""
      
      self.delegate?.passDetails(
         overview: schoolData[indexPath.row].overview_paragraph ?? "",
         extracurricular: schoolData[indexPath.row].extracurricular_activities ?? "")
      performSegue(withIdentifier: "toScreen2", sender: nil)
   }
   
} //: UITableViewDelegate, UITableViewDataSource
