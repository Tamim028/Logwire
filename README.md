# Logwire

A lightweight logging utility for Swift projects. Supports `.info`, `.warning`, and `.error` levels with optional source context.

## 📦 Installation

### Swift Package Manager (SPM)

Add this to your `Package.swift`:

```swift
.package(url: "https://github.com/Tamim028/Logwire", from: "1.0.0")

Example 1: 
Input: Logger.info("User signed in.")
Output: [LOGGER_EVENT: INFO]: User signed in (YourFile.swift:23:yourFunctionName())

Example 2:
Input: Logger.warning("Low memory!")
Output: [LOGGER_EVENT: WARN ⚠️]: Low memory! (YourFile.swift:24:yourFunctionName())

Example 3: 
Input: Logger.error("Unexpected nil found!")
Output: [LOGGER_EVENT: ALERT ❌]: Unexpected nil found! (YourFile.swift:25:yourFunctionName())

Example 4: 
Input: Logger.info("No context shown", shouldLogContext: false)
Output: [LOGGER_EVENT: INFO]: No context shown

Note: You can use either StaticString or String based on your needs. Using StaticString is preferred when possible, as it is known at compile time, incurs less runtime overhead, and can improve performance in cases where logging is frequent.
