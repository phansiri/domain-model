//
//  main.swift
//  SimpleDomainModel
//
//  Created by Ted Neward on 4/6/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import Foundation

public func testMe() -> String {
    return "I have been tested"
}

open class TestMe {
    open func Please() -> String {
        return "I have been tested"
    }
}

////////////////////////////////////
// Money
//
public struct Money {
    public var amount : Int // pennies
    public var currency : String
    
    enum Currency {
        case USD, EUR, CAN, GBP
    }
    
    init(amount: Int, currency: String) {
        self.amount = amount
        self.currency = currency
    }

    
    public func convert(_ to: String) -> Money {
//        switch value {
//        case .GBP:
//            switch
//        }
       let conversionRate = [
            "usdToGBP": 0.5,
            "usdToEUR": 1.5,
            "usdToCAN": 1.25,
            "canToGBP": 0.61,
            "canToEUR": 0.6667,
            "canToUSD": 0.8,
            "gbpToUSD": 2.0,
            "gbpToEUR": 1.11,
            "gbpToCAN": 1.64,
            "eurToGBP": 0.90,
            "eurToUSD": 0.6667,
            "eurToCAN": 1.48,
            ]
        
        
        
        switch self.currency {
        case "GBP":
            switch to {
            case "USD":
                return Money(amount: Int(Double(self.amount) * conversionRate["gbpToUSD"]!) * 100, currency: "USD")
            case "EUR":
                return Money(amount: Int(Double(self.amount) * conversionRate["gbpToEUR"]!) * 100, currency: "EUR")
            case "CAN":
                return Money(amount: Int(Double(self.amount) * conversionRate["gbpToCAN"]!) * 100, currency: "CAN")
            default:
                return Money(amount: self.amount, currency: self.currency)
            }
        case "CAN":
            switch to {
            case "USD":
                return Money(amount: Int(Double(self.amount) * conversionRate["canToUSD"]!) * 100, currency: "USD")
            case "EUR":
                return Money(amount: Int(Double(self.amount) * conversionRate["canToEUR"]!) * 100, currency: "EUR")
            case "GBP":
                return Money(amount: Int(Double(self.amount) * conversionRate["canToGBP"]!) * 100, currency: "GBP")
            default:
                return Money(amount: self.amount, currency: self.currency)
            }
        case "EUR":
            switch to {
            case "USD":
                return Money(amount: Int(Double(self.amount) * conversionRate["eurToUSD"]!) * 100, currency: "USD")
            case "EUR":
                return Money(amount: Int(Double(self.amount) * conversionRate["eurToGBP"]!) * 100, currency: "GBP")
            case "CAN":
                return Money(amount: Int(Double(self.amount) * conversionRate["eurToCAN"]!) * 100, currency: "CAN")
            default:
                return Money(amount: self.amount, currency: self.currency)
            }
        default:
            switch to {
            case "USD":
                return Money(amount: Int(Double(self.amount) * conversionRate["usdToGBP"]!) * 100, currency: "GBP")
            case "EUR":
                return Money(amount: Int(Double(self.amount) * conversionRate["usdToEUR"]!) * 100, currency: "EUR")
            case "CAN":
                return Money(amount: Int(Double(self.amount) * conversionRate["usdToCAN"]!) * 100, currency: "CAN")
            default:
                return Money(amount: self.amount * 100, currency: self.currency)
            }
        }
    }
}

//    public func add(_ to: Money) -> Money {
//        return Money(amount: to.amount + self.convert(to.currency).amount, currency: to.currency)
//    }
//    
//    public func subtract(_ from: Money) -> Money {
//        return Money(amount: from.amount + self.convert(from.currency).amount, currency: from.currency)
//    }


let tenUSD = Money(amount: 10, currency: "USD")
let twelveUSD = Money(amount: 12, currency: "USD")
let fiveGBP = Money(amount: 5, currency: "GBP")
let fifteenEUR = Money(amount: 15, currency: "EUR")
let fifteenCAN = Money(amount: 15, currency: "CAN")

//let total = tenUSD.add(tenUSD)
//print(total.amount == 20)
//print(total.currency == "USD")


////////////////////////////////////
// Job
//
open class Job {
  fileprivate var title : String
  fileprivate var type : JobType

  public enum JobType {
    case Hourly(Double)
    case Salary(Int)
  }
  
  public init(title : String, type : JobType) {
    self.title = title
    self.type = type
  }
  
  open func calculateIncome(_ hours: Int) -> Int {
    switch self.type {
    case .Hourly(let time):
        return Int(time * Double(hours))
    case .Salary(let time):
        return time
    }
  }
  
  open func raise(_ amt : Double) {
    switch self.type {
    case .Hourly(let hourly):
        self.type = Job.JobType.Hourly(hourly + amt)
    case .Salary(let salary):
        self.type = Job.JobType.Salary(salary + Int(amt))
    }
  }
}


/*
////////////////////////////////////
// Person
//
open class Person {
  open var firstName : String = ""
  open var lastName : String = ""
  open var age : Int = 0

  fileprivate var _job : Job? = nil
  open var job : Job? {
    get { }
    set(value) {
    }
  }
  
  fileprivate var _spouse : Person? = nil
  open var spouse : Person? {
    get { }
    set(value) {
    }
  }
  
  public init(firstName : String, lastName: String, age : Int) {
    self.firstName = firstName
    self.lastName = lastName
    self.age = age
  }
  
  open func toString() -> String {
  }
}

////////////////////////////////////
// Family
//
open class Family {
  fileprivate var members : [Person] = []
  
  public init(spouse1: Person, spouse2: Person) {
  }
  
  open func haveChild(_ child: Person) -> Bool {
  }
  
  open func householdIncome() -> Int {
  }
}
*/

