//
//  Language.swift
//  MadridShops
//
//  Created by Eric Risco de la Torre on 12/05/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation

public func getPhoneLanguage() -> String {
    return Locale.current.languageCode!
}
