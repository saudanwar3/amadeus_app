//
//	Main.swift
//  Created by MSA on 14/03/2023.

import Foundation

struct Main:Decodable{

	var grndLevel : Float!
	var humidity : Int!
	var pressure : Float!
	var seaLevel : Float!
	var temp : Float!
	var tempMax : Float!
	var tempMin : Float!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		grndLevel = dictionary["grnd_level"] as? Float
		humidity = dictionary["humidity"] as? Int
		pressure = dictionary["pressure"] as? Float
		seaLevel = dictionary["sea_level"] as? Float
		temp = dictionary["temp"] as? Float
		tempMax = dictionary["temp_max"] as? Float
		tempMin = dictionary["temp_min"] as? Float
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if grndLevel != nil{
			dictionary["grnd_level"] = grndLevel
		}
		if humidity != nil{
			dictionary["humidity"] = humidity
		}
		if pressure != nil{
			dictionary["pressure"] = pressure
		}
		if seaLevel != nil{
			dictionary["sea_level"] = seaLevel
		}
		if temp != nil{
			dictionary["temp"] = temp
		}
		if tempMax != nil{
			dictionary["temp_max"] = tempMax
		}
		if tempMin != nil{
			dictionary["temp_min"] = tempMin
		}
		return dictionary
	}

}
