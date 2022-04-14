/// Exception indicating that a talk cannot be added because the track would be too long.
class TrackTooLongException implements Exception {}

/// Exception indicating that not all tasks can be placed because there is not enough
/// tracks / track time.
class NotEnoughSpaceForAllTalksException implements Exception {}

/// Exception indicating that a talk cannot be added because the talk's constraint
/// is not compatible with the track.
class ConstrainedTalkAddedToTrackException implements Exception {}

/// Exception indicating that a FixedTalk (e.g. a lunch break) cannot be
/// constructed because its end time is before its start time.
class FixedTalkStartAfterEndException implements Exception {}

/// Exception indicating that a FixedTalk (e.g. a lunch break) that should take
/// place before a track start cannot be placed on a track because it ends
/// after the track program already started.
class FixedTalkEndAfterTrackStart implements Exception {}

/// Exception indicating that a FixedTalk (e.g. a lunch break) that should take
/// place after a track end cannot be placed on a track because it starts
/// before the track program ends.
class FixedTalkStartBeforeTrackEnd implements Exception {}
