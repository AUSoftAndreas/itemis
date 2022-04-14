/// Constraints are used to define which talks can be held at a conference track.
enum Constraint {
  /// No constraints apply
  none,

  /// Talks can only be held in the morning
  beforeNoon,

  /// Talks can only be held in the afternoon
  afterNoon,
}
