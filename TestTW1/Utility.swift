//
//  Utility.swift
//  Nice&Bella
//
//  Created by Charan on 23/08/18.
//  Copyright © 2018 CodeBrew. All rights reserved.
//

import UIKit
typealias alert = (Int) -> ()

class Utility {
    
    //convert array into string
    class func json(from object:Any) -> String? {
        guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
            return nil
        }
        return String(data: data, encoding: String.Encoding.utf8)
    }
    
    class func convertDateFormater(_ date: String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "dd MMM, yyyy"
        return  dateFormatter.string(from: date!)
        
    }
    
    class func convertDateFormaterSubscriptionDetail(_ date: String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssa"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return  dateFormatter.string(from: date!)
        
    }
    
    class func converOnlytDateFormater(_ date: String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "dd MMM, yyyy"
        return  dateFormatter.string(from: date!)
        
    }
    
    class func converOnlytDateFormater2(_ date: String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return  dateFormatter.string(from: date!)
        
    }
    
    class func converOnlytDateFormater3(_ date: String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return  dateFormatter.string(from: date!)
        
    }
    
    class func converOnlytDateFormater4(_ date: String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "dd MMM yyyy"
        return  dateFormatter.string(from: date!)
        
    }
    
    class func converTimeFormater(_ time: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let fullDate = dateFormatter.date(from: time)
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: fullDate!)
    }
    
    //MARK: - conver timestamp into date
    class func convertUnixTimestamptoDateString(timestamp: String) -> String {
        let date = Date(timeIntervalSince1970: Double(timestamp)!)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC") //Set timezone that you want
        dateFormatter.locale = NSLocale.current
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = " dd MMM, yyyy" //Specify your format that you want
        return dateFormatter.string(from: date)
    }
    func getReadableDate(timeStamp: TimeInterval) -> String{
        let date = Date(timeIntervalSince1970: (timeStamp)/1000)
        let dateFormatter = DateFormatter()
        if Calendar.current.isDateInTomorrow(date){
            return "Tomorrow"
        }else if Calendar.current.isDateInYesterday(date){
            return "Yesterday"
        }else if datFallsIncurrentWeek(date: date){
            if Calendar.current.isDateInToday(date){
                dateFormatter.dateFormat = "h:mm a"
                return dateFormatter.string(from: date)
            }else{
                dateFormatter.dateFormat = "EEEE"
                return dateFormatter.string(from: date)
            }
        }else{
            dateFormatter.dateFormat = "MM d, yyyy"
            return dateFormatter.string(from: date)
        }
        
    }
    func datFallsIncurrentWeek(date:Date) -> Bool{
        let currentWeek = Calendar.current.component(Calendar.Component.weekOfYear, from: Date())
        let datesWeek = Calendar.current.component(Calendar.Component.weekOfYear, from: date)
        return (currentWeek == datesWeek)
    }
    class func concatStringOfTextFieldDelegate(text:String,string:String)->String{
        var str = text + string
        if string == ""{
            if str.count > 0{
                str = String(str.prefix(str.count-1))
            }
        }
        return str
    }
    
    class func getCurrentVersionOfApp()->Float?{
        if let bundel = Bundle.main.infoDictionary{
            if let str = bundel["CFBundleShortVersionString"] as? String{
                return Float(str)
            }
        }
        return 0
    }
    
    class func formatedDateFromString(dateString: String, withFormat format: String) -> String? {
        
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = inputFormatter.date(from: dateString) {
            
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = format
            
            return outputFormatter.string(from: date)
        }
        
        return nil
    }
    
    class func timeConversion12(time24: String) -> String {
        let dateAsString = time24
        let df = DateFormatter()
        df.dateFormat = "HH:mm:ss"
        
        let date = df.date(from: dateAsString)
        df.dateFormat = "hh:mm a"
        
        let time12 = df.string(from: date!)
        print(time12)
        return time12
    }
    
}
