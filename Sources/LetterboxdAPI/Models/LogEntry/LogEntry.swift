import Foundation

public struct LogEntry: Decodable, Sendable, Hashable {
  public let id: String
  public let name: String

  /// The member who created the log entry.
  public let owner: MemberSummary

  /// The film being logged.
  public let film: FilmSummary

  /// Details about the log entry, if present.
  public let diaryDetails: DiaryDetails?

  /// Review details for the log entry, if present.
  public let review: Review?

  /// The tags for the log entry.
  public let tags2: [Tag]

  /// The timestamp of when the log entry was created, in ISO 8601 format with UTC timezone.
  public let whenCreated: String

  /// The timestamp of when the log entry was last updated, in ISO 8601 format with UTC timezone.
  public let whenUpdated: String

  /// The member’s rating for the film.
  public let rating: Float?

  /// The member’s like status for this viewing of the film.
  public let like: Bool

  /// Whether comments can be posted to the log entry.
  public let commentable: Bool

  /// A list of relevant URLs for this entity, on Letterboxd and external sites.
  public let links: [Link]

  /// The log entry’s backdrop image at multiple sizes, if available.
  public let backdrop: Image?

  /// The vertical focal point of the backdrop image, if available.
  public let backdropFocalPoint: Float?
}

