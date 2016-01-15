//
//  MXXmlReader.swift
//  MXXmlReader
//
//  Created by 牟潇 on 16/1/15.
//  Copyright © 2016年 muxiao. All rights reserved.
//

import UIKit

class MXXmlReader: NSObject,NSXMLParserDelegate {
    var currentName :String? = nil
    var xmlData :NSMutableDictionary! = NSMutableDictionary()
    var level :Int = 0
    init(add: String) {
        super.init()
        let data:NSData! = NSData(contentsOfFile: add)!
        guard let parserXML = NSXMLParser(data: data) as? NSXMLParser else{return}
        parserXML.delegate = self
        parserXML.parse()
    }
    func parserDidStartDocument(parser: NSXMLParser) {
        print("开始")
    }
    func parserDidEndDocument(parser: NSXMLParser) {
        print("结束 \(self.xmlData)")
    }
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
    }
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        print("\(level) end, \(elementName)")
        self.currentName = elementName
        self.level--
    }
    func parser(parser: NSXMLParser, parseErrorOccurred parseError: NSError) {
        print(parseError)
    }
    func parser(parser: NSXMLParser, var foundCharacters string: String) {
        string = string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        if string.isEmpty{
            return
        }
        self.xmlData.setObject(string, forKey: self.currentName!)
        print("----\(string)")
    }

}
