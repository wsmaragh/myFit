//
//  String+.swift
//  myFit
//
//  Created by Winston Maragh on 10/31/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import Foundation

extension String {
    
    /// Converts HTML string to a `NSAttributedString` - removed HTML tags in string
    var htmlAttributedString: NSAttributedString? {
        return try? NSAttributedString(data: Data(utf8), options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
    }
}
