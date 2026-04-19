# LetterboxdAPI

An async Swift package for the public Letterboxd API.

## Highlights

- Async/await-first API surface
- Instance-based client design with dependency injection
- Actor-backed access token caching and refresh coordination
- Typed endpoint helpers plus a generic request API
- Swift Testing coverage for auth, request building, errors, and header parsing

## Requirements

- Swift 6.0+
- iOS 13+
- macOS 10.15+
- tvOS 13+
- watchOS 6+

## Installation

Add the package dependency to your `Package.swift`:

```swift
dependencies: [
  .package(url: "https://github.com/gianpispi/LetterboxdAPI.git", from: "0.1.0"),
]
```

Then add `LetterboxdAPI` to your target dependencies.

## Usage

### Create a client

```swift
import LetterboxdAPI

let client = LetterboxdAPI(
  credentials: .init(
    clientID: "<public key>",
    clientSecret: "<private key>"
  )
)
```

### Resolve a public Letterboxd URL

```swift
let object = try await client.resolveLetterboxdObject(
  for: URL(string: "https://letterboxd.com/film/free-guy/")!
)

print(object.lid)
print(object.type)
```

### Fetch a film

```swift
let film = try await client.film(withID: "free-guy")
print(film.name)
```

### Fetch a member

```swift
let member = try await client.member(withID: "some-member-id")
print(member.username)
```

### Fetch a log entry

```swift
let entry = try await client.logEntry(withID: "some-log-entry-id")
print(entry.name)
```

### Fetch a member watchlist

```swift
let watchlist = try await client.memberWatchlist(
  forMemberWithID: "some-member-id",
  query: ["perPage": "20"]
)

print(watchlist.items.map(\.name))
```

### Run a generic request

```swift
struct List: Decodable {
  let id: String
  let name: String
}

let list: List = try await client.query(
  path: "list/coMSs",
  requiresAuthorization: true
)
```

### Handle errors

```swift
do {
  let news = try await client.news(perPage: 10)
  print(news.items.count)
} catch LetterboxdAPIError.missingCredentials {
  print("This endpoint requires API credentials.")
} catch LetterboxdAPIError.unsuccessfulStatusCode(let statusCode, _) {
  print("Request failed with status code \(statusCode)")
} catch {
  print(error)
}
```

## Design Notes

- The client is a value type, so you can create multiple isolated clients with different credentials or sessions.
- Authenticated requests automatically fetch and reuse access tokens until they are close to expiry.
- Networking is dependency-injected through `URLSession`, which keeps tests deterministic and lightweight.

## API Documentation

- Letterboxd API docs: <https://api-docs.letterboxd.com>

## Development

Run the test suite with:

```bash
swift test
```
