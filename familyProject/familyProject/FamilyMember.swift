//
//  FamilyMember.swift
//  familyProject
//
//  Created by Easton Butterfield on 10/31/22.
//
import UIKit
import Foundation
struct FamilyMember {
    var name: String
    var description: String
//    var images: UIImage
    let imageName: String
    static var family: [FamilyMember] = [
        FamilyMember(name:"Tara", description:"Tara is my mom she loves the outdoors and loves to mountain bike.", imageName: "download"),
        FamilyMember(name:"Cole", description:"Cole is my little brother. He likes to play video games and ride bikes.", imageName: "computer"),
        FamilyMember(name:"Roxy", description:"Roxy is my dog she is really adorable and loves to go on walks and hikes.", imageName: "Roxy")
    ]
}
