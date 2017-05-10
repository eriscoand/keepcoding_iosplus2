//
//  CONSTANTS.swift
//  MadridShops
//
//  Created by Eric Risco de la Torre on 11/05/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation

struct CONSTANTS {
    
    static let ZONES = "https://eu.api.battle.net/wow/zone/?locale=en_GB&apikey=gtxeenk3s2pw85gvujks3bkuzqh9dehh&date=<<DATE>>"
    static let BOSSES = "https://eu.api.battle.net/wow/boss/?locale=en_GB&apikey=gtxeenk3s2pw85gvujks3bkuzqh9dehh&date=<<DATE>>"
    
    static let IMAGES = "http://media.blizzard.com/wow/renders/npcs/zoom/creature<<BOSS_ID>>.jpg"
    
    static let DBNAME = "WOWBosses"
    
    static let WOWHEAD = "http://www.wowhead.com/npc=<<BOSS_ID>>"
    static let WOWPEDIA = "http://wow.gamepedia.com/<<BOSS_SLUG>>"
    static let WARCRAFT = "http://eu.battle.net/wow/en/zone/<<ZONE_SLUG>>/<<BOSS_SLUG>>"
    
}
