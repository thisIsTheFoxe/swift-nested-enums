import Foundation


enum Err: Error {
    case e
    
    
    static func t() throws {
        throw Err.e
    }
}

public protocol P: CustomStringConvertible {
    init?(rawValue: String)
    var rawValue: String { get }

    static var allEnumCases: [P] { get }
}

public extension P where Self: CaseIterable {
    static var allEnumCases: [P] { allCases as! [P] }
    
    static func a() {
        try! Err.t()
    }
}
