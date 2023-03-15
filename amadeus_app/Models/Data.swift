//
//	Data.swift
//  Created by MSA on 14/03/2023.

import Foundation

struct Data:Decodable{

	var city : City!
	var clouds : Cloud!
	var main : Main!
	var rain : Rain!
	var time : Int!
	var weather : [Weather]!
	var wind : Wind!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let cityData = dictionary["city"] as? [String:Any]{
				city = City(fromDictionary: cityData)
			}
		if let cloudsData = dictionary["clouds"] as? [String:Any]{
				clouds = Cloud(fromDictionary: cloudsData)
			}
		if let mainData = dictionary["main"] as? [String:Any]{
				main = Main(fromDictionary: mainData)
			}
		if let rainData = dictionary["rain"] as? [String:Any]{
				rain = Rain(fromDictionary: rainData)
			}
		time = dictionary["time"] as? Int
		weather = [Weather]()
		if let weatherArray = dictionary["weather"] as? [[String:Any]]{
			for dic in weatherArray{
				let value = Weather(fromDictionary: dic)
				weather.append(value)
			}
		}
		if let windData = dictionary["wind"] as? [String:Any]{
				wind = Wind(fromDictionary: windData)
			}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if city != nil{
			dictionary["city"] = city.toDictionary()
		}
		if clouds != nil{
			dictionary["clouds"] = clouds.toDictionary()
		}
		if main != nil{
			dictionary["main"] = main.toDictionary()
		}
		if rain != nil{
			dictionary["rain"] = rain.toDictionary()
		}
		if time != nil{
			dictionary["time"] = time
		}
		if weather != nil{
			var dictionaryElements = [[String:Any]]()
			for weatherElement in weather {
				dictionaryElements.append(weatherElement.toDictionary())
			}
			dictionary["weather"] = dictionaryElements
		}
		if wind != nil{
			dictionary["wind"] = wind.toDictionary()
		}
		return dictionary
	}

}
