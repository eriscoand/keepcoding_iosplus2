//
//  Files.swift
//  MadridShops
//
//  Created by Eric Risco de la Torre on 11/05/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation

//This function recieves a url string. First it confirms that the file already exists and returns a Data value.
//If it doesn't exist, it saves it to the documents folder and returns the Data value
public func getFileFrom(urlString sUrl: String) throws -> Data{
    if(!fileAlreadyExists(urlString: sUrl)){
        return try saveToLocalStorage(stringUrl: sUrl)
    }else{
        return try dataFromStringUrl(stringUrl: sUrl)
    }
}

//Delete file from library with an internal name
public func deteleFileFrom(urlString sUrl: String) throws{
    if(fileAlreadyExists(urlString: sUrl)){
        let fileManager = FileManager.default
        let fileName = fileNameFromStringUrl(urlString: sUrl)
        
        try fileManager.removeItem(at: URL.init(string: fileName)!)
        
    }
}

//Returns the internal URL of a file
public func getInternalUrl(file sUrl: String) throws -> URL{
    let fileName = fileNameFromStringUrl(urlString: sUrl)
    guard let fileUrl = URL.init(string: fileName) else {
        throw Errors.resourcePointedByUrlNotReachable
    }
    return fileUrl
}

//Get the name of the file in the document folder. The name of a file is the url hashed
private func fileNameFromStringUrl(urlString sUrl: String) -> String{
    return String(sUrl.hashValue)
}

//This function check if a file exists on the documents folder
private func fileAlreadyExists(urlString sUrl: String) -> Bool{
    
    let fileManager = FileManager.default
    let fileName = fileNameFromStringUrl(urlString: sUrl)
    
    //The documents folder url
    let docsurl = try! FileManager().url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    let dataUrl = docsurl.appendingPathComponent(fileName)
    
    // Check if file exists
    if fileManager.fileExists(atPath: dataUrl.path){
        return true
    } else {
        return false
    }
    
}

//This function saves a file on a external url to the documents folder and returns the Data value
private func saveToLocalStorage(stringUrl sUrl: String) throws -> Data{
    
    guard let url = NSURL(string: sUrl) else{
        throw Errors.resourcePointedByUrlNotReachable
    }
    
    guard let downloadedData = try? Data(contentsOf: url as URL) else{
        throw Errors.resourcePointedByUrlNotReachable
    }
    
    let fileName = fileNameFromStringUrl(urlString: sUrl)
    
    let sourcePaths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    let path = sourcePaths[0]
    let file: URL = URL(fileURLWithPath: fileName, relativeTo: path)
    let fileManager = FileManager.default
    fileManager.createFile(atPath: file.path, contents: downloadedData, attributes: nil)
    
    return try dataFromStringUrl(stringUrl: sUrl)
}

//This function returns the Data value of a file that exists on the documents folder.
private func dataFromStringUrl(stringUrl sUrl: String) throws -> Data{
    
    let fileManager = FileManager.default
    let docsurl = try! fileManager.url(for:.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
    let fileName = fileNameFromStringUrl(urlString: sUrl)
    let dataUrl = docsurl.appendingPathComponent(fileName)
    
    if let dataFromUrl = try? Data.init(contentsOf: dataUrl) {
        return dataFromUrl
    }else{
        throw Errors.resourcePointedByUrlNotReachable
    }
}
