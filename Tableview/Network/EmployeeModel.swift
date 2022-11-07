//
//  Employee.swift
//  Tableview
//
//  Created by Алексей Гуляев on 07.11.2022.
//

import Foundation

// MARK: - Employee
struct Employee: Codable {
    let company: Company
}

// MARK: - Company
struct Company: Codable {
    let name: String
    let employees: [EmployeeElement]
}

// MARK: - EmployeeElement
struct EmployeeElement: Codable {
    let name, phoneNumber: String
    let skills: [String]

    enum CodingKeys: String, CodingKey {
        case name
        case phoneNumber = "phone_number"
        case skills
    }
}
