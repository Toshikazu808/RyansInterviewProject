//
//  ViewController.swift
//  Interview
//
//  Created by Ryan Kanno on 5/20/21.
//

import UIKit

class ViewController: UIViewController {
   
   @IBOutlet weak var tableView: UITableView!
   private var schoolData: [SchoolModel] = []
   private var overview_paragraph = ""
   private var extracurricular_activities = ""
   private var helper = Helper()
   private let url = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
   
   override func viewDidLoad() {
      super.viewDidLoad()
      tableView.backgroundColor = .white
      tableView.delegate = self
      tableView.dataSource = self
      tableView.register(Screen1Cell.nib(), forCellReuseIdentifier: Screen1Cell.nibName)
      helper.performRequest(urlString: url, returnType: [SchoolModel].self) { [weak self] result in
         switch result {
         case .failure(let error):
            print(error)
         case .success(let success):
            self?.schoolData = success
            DispatchQueue.main.async {
               self?.tableView.reloadData()
            }
         }
      }
      tableView.estimatedRowHeight = 25
      tableView.rowHeight = UITableView.automaticDimension
   }
   
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.destination is Screen2VC {
         let vc = segue.destination as? Screen2VC
         vc?.overview_paragraph = self.overview_paragraph
         vc?.extracurricular_activities = self.extracurricular_activities
      }
   }
}


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
      overview_paragraph = schoolData[indexPath.row].overview_paragraph ?? ""
      extracurricular_activities = schoolData[indexPath.row].extracurricular_activities ?? ""
      performSegue(withIdentifier: "toScreen2", sender: nil)
   }
   
} //: UITableViewDelegate, UITableViewDataSource
