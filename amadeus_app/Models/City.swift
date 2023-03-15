//
//	City.swift
//  Created by MSA on 14/03/2023.

import Foundation

struct City{

	var coord : Coord!
	var country : String!
	var findname : String!
	var id : Int!
	var name : String!
	var zoom : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let coordData = dictionary["coord"] as? [String:Any]{
				coord = Coord(fromDictionary: coordData)
			}
		country = dictionary["country"] as? String
		findname = dictionary["findname"] as? String
		id = dictionary["id"] as? Int
		name = dictionary["name"] as? String
		zoom = dictionary["zoom"] as? Int
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if coord != nil{
			dictionary["coord"] = coord.toDictionary()
		}
		if country != nil{
			dictionary["country"] = country
		}
		if findname != nil{
			dictionary["findname"] = findname
		}
		if id != nil{
			dictionary["id"] = id
		}
		if name != nil{
			dictionary["name"] = name
		}
		if zoom != nil{
			dictionary["zoom"] = zoom
		}
		return dictionary
	}

}
