//
//  Logger.swift
//  Created by Tamim_Dari on 7/2/25.
//

import Foundation

public enum Logger {
    public enum LogLevel {
        case info
        case warning
        case error
        
        fileprivate var prefix: String {
            switch self {
            case .info: return "LOGGER_EVENT: INFO"
            case .warning: return "LOGGER_EVENT: WARN ⚠️"
            case .error: return "LOGGER_EVENT: ALERT ❌"
            }
        }
    }

    public struct Context {
        let file: String
        let function: String
        let line: Int
        
        var description: String {
            "\((file as NSString).lastPathComponent):\(line):\(function)"
        }
    }

    fileprivate static func handleLog(level: LogLevel, str: String, shouldLogContext: Bool, context: Context) {
        let logComponents = [ "[\(level.prefix)]", str ]
        var fullString = logComponents.joined(separator: ": ")
        if shouldLogContext {
            fullString += " (\(context.description))"
        }
        #if DEBUG
            print(fullString)
        #endif
    }

    public static func info(_ str: StaticString, shouldLogContext: Bool = true, file: String = #file, function: String = #function, line: Int = #line){
        let context = Context(file: file, function: function, line: line)
        Logger.handleLog(level: .info, str: str.description, shouldLogContext: shouldLogContext, context: context)
    }
    public static func info(_ str: String, shouldLogContext: Bool = true, file: String = #file, function: String = #function, line: Int = #line){
        let context = Context(file: file, function: function, line: line)
        Logger.handleLog(level: .info, str: str.description, shouldLogContext: shouldLogContext, context: context)
    }
    
    public static func warning(_ str: StaticString, shouldLogContext: Bool = true, file: String = #file, function: String = #function, line: Int = #line){
        let context = Context(file: file, function: function, line: line)
        Logger.handleLog(level: .warning, str: str.description, shouldLogContext: shouldLogContext, context: context)
    }
    
    public static func warning(_ str: String, shouldLogContext: Bool = true, file: String = #file, function: String = #function, line: Int = #line){
        let context = Context(file: file, function: function, line: line)
        Logger.handleLog(level: .warning, str: str.description, shouldLogContext: shouldLogContext, context: context)
    }
    
    public static func error(_ str: StaticString, shouldLogContext: Bool = true, file: String = #file, function: String = #function, line: Int = #line){
        let context = Context(file: file, function: function, line: line)
        Logger.handleLog(level: .error, str: str.description, shouldLogContext: shouldLogContext, context: context)
    }
    
    public static func error(_ str: String, shouldLogContext: Bool = true, file: String = #file, function: String = #function, line: Int = #line){
        let context = Context(file: file, function: function, line: line)
        Logger.handleLog(level: .error, str: str.description, shouldLogContext: shouldLogContext, context: context)
    }
}

