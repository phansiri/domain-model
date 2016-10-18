//
//  MoneyTests.swift
//  SimpleDomainModel
//
//  Created by Ted Neward on 4/6/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import XCTest

import SimpleDomainModel

//////////////////
// MoneyTests
//
class MoneyTests: XCTestCase {
    
    let tenUSD = Money(amount: 10, currency: Money.Currency.USD)
    let twelveUSD = Money(amount: 12, currency: Money.Currency.USD)
    let fiveGBP = Money(amount: 5, currency: Money.Currency.GBP)
    let fifteenEUR = Money(amount: 15, currency: Money.Currency.EUR)
    let fifteenCAN = Money(amount: 15, currency: Money.Currency.CAN)
    
    func testCanICreateMoney() {
        let oneUSD = Money(amount: 1, currency: Money.Currency.USD)
        XCTAssert(oneUSD.amount == 1)
        XCTAssert(oneUSD.currency == Money.Currency.USD)
        
        let tenGBP = Money(amount: 10, currency: Money.Currency.GBP)
        XCTAssert(tenGBP.amount == 10)
        XCTAssert(tenGBP.currency == Money.Currency.GBP)
    }
    
    func testUSDtoGBP() {
        let gbp = tenUSD.convert("GBP")
        XCTAssert(gbp.currency.rawValue == "GBP")
        XCTAssert(gbp.amount == 5)
    }
    func testUSDtoEUR() {
        let eur = tenUSD.convert("EUR")
        XCTAssert(eur.currency.rawValue == "EUR")
        XCTAssert(eur.amount == 15)
    }
    func testUSDtoCAN() {
        let can = twelveUSD.convert("CAN")
        XCTAssert(can.currency == Money.Currency.CAN)
        XCTAssert(can.amount == 15)
    }
    func testGBPtoUSD() {
        let usd = fiveGBP.convert("USD")
        XCTAssert(usd.currency == Money.Currency.USD)
        XCTAssert(usd.amount == 10)
    }
    func testEURtoUSD() {
        let usd = fifteenEUR.convert("USD")
        XCTAssert(usd.currency == Money.Currency.USD)
        XCTAssert(usd.amount == 10)
    }
    func testCANtoUSD() {
        let usd = fifteenCAN.convert("USD")
        XCTAssert(usd.currency == Money.Currency.USD)
        XCTAssert(usd.amount == 12)
    }
    
    func testUSDtoEURtoUSD() {
        let eur = tenUSD.convert("EUR")
        let usd = eur.convert("USD")
        XCTAssert(tenUSD.amount == usd.amount)
        XCTAssert(tenUSD.currency == usd.currency)
    }
    func testUSDtoGBPtoUSD() {
        let gbp = tenUSD.convert("GBP")
        let usd = gbp.convert("USD")
        XCTAssert(tenUSD.amount == usd.amount)
        XCTAssert(tenUSD.currency == usd.currency)
    }
    func testUSDtoCANtoUSD() {
        let can = twelveUSD.convert("CAN")
        let usd = can.convert("USD")
        XCTAssert(twelveUSD.amount == usd.amount)
        XCTAssert(twelveUSD.currency == usd.currency)
    }
    
    func testAddUSDtoUSD() {
        let total = tenUSD.add(tenUSD)
        XCTAssert(total.amount == 20)
        XCTAssert(total.currency == Money.Currency.USD)
    }
    
    func testAddUSDtoGBP() {
        let total = tenUSD.add(fiveGBP)
        XCTAssert(total.amount == 10)
        XCTAssert(total.currency == Money.Currency.GBP)
    }
    
    func testSubtractTenUSDfromTwelveUSD() {
        let difference = tenUSD.subtract(twelveUSD)
        XCTAssert(difference.amount == 2)
    }
}

