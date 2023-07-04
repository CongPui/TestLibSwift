//
//  String+.swift
//  TestFramework
//
//  Created by Cong Bui Thanh on 04/07/2023.
//

import Foundation
import UIKit

// MARK: - String Size
extension String {
    
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
    
    public func heightOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.height
    }
    
    func sizeOfString(usingFont font: UIFont) -> CGSize {
        let fontAttributes = [NSAttributedString.Key.font: font]
        return self.size(withAttributes: fontAttributes)
    }
}

// MARK: - Encode url
extension String {
    
    var encodeUrl: String {
        return self.addingPercentEncoding(withAllowedCharacters: .alphanumerics) ?? ""
    }
}

// MARK: - Formater
extension String {
    
    static func format(decimal:Float, _ maximumDigits:Int = 1, _ minimumDigits:Int = 1) ->String? {
        let number = NSNumber(value: decimal)
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = maximumDigits
        numberFormatter.minimumFractionDigits = minimumDigits
        return numberFormatter.string(from: number)
    }
    
    var isBlank: Bool {
        if self.isEmpty {
            return true
        }
        
        let isWhiteSpace = self.trimmingCharacters(in: .whitespaces) == ""
        if isWhiteSpace {
            return true
        }
        
        let isBreakline = self.trimmingCharacters(in: .newlines) == ""
        if isBreakline {
            return true
        }
        
        let isWhiteSpaceAndBreakline = self.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        if isWhiteSpaceAndBreakline {
            return true
        }
        
        return false
    }
}

// MARK: - Version comparation
extension String {
    
    func compare(otherVersion: String) -> ComparisonResult {
        let versionDelimiter = "."
        
        var versionComponents = self.components(separatedBy: versionDelimiter)
        var otherVersionComponents = otherVersion.components(separatedBy: versionDelimiter)
        
        let zeroDiff = versionComponents.count - otherVersionComponents.count
        
        if zeroDiff == 0 {
            // Same format, compare normally
            return self.compare(otherVersion, options: .numeric)
        } else {
            let zeros = Array(repeating: "0", count: abs(zeroDiff))
            if zeroDiff > 0 {
                otherVersionComponents.append(contentsOf: zeros)
            } else {
                versionComponents.append(contentsOf: zeros)
            }
            return versionComponents.joined(separator: versionDelimiter)
                .compare(
                    otherVersionComponents.joined(separator: versionDelimiter), options: .numeric
                )
        }
    }
}
