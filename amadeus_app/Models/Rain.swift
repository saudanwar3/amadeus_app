//
//	Rain.swift
//  Created by MSA on 14/03/2023.

import Foundation

struct Rain{

	var rainHour : Float!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
        rainHour = dictionary["3h"] as? Float
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if rainHour != nil{
			dictionary["3h"] = rainHour
		}
		return dictionary
	}

}
