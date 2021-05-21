//
//  ObjModel.swift
//  Interview
//
//  Created by Ryan Kanno on 5/21/21.
//

import Foundation


struct SchoolModel: Codable {
   let school_name: String?
   let city: String?
   let zip: String?
   let school_email: String?
   let website: String?
   let phone_number: String?
   
   let overview_paragraph: String?
   let extracurricular_activities: String?
}
