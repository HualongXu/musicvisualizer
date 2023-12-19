#' Metadata for all xkcd comics (thus far)
#'
#' @format  A data frame/list???? with 40 rows and 39 columns
#' \describe{
#'    \item{artist_name}{Artist name}
#'    \item{artist_id}{Artist Spotify ID}
#'    \item{album_id}{Album Spotify ID}
#'    \item{album_type}{Album type that could be album, single, or compilation}
#'    \item{album_images}{The cover art for the album in various sizes, widest first.}
#'    \item{album_release_date}{The date the album was first released.}
#'    \item{album_release_year}{The year the album was first released}
#'    \item{album_release_date_precision}{The precision with which album_release_date value is known.}
#'    \item{danceability}{A measure that describes how suitable a track is for dancing based on a combination of musical elements including tempo, rhythm stability, beat strength, and overall regularity.}
#'    \item{energy}{A measure that is from 0.0 to 1.0 and represents a perceptual measure of intensity and activity.}
#'    \item{key}{The key the tracks are in.}
#'    \item{loudness}{The overall loudness of a track in decibels (dB).}
#'    \item{mode}{A measure that indicates the modality (major or minor) of a track, the type of scale from which its melodic content is derived.}
#'    \item{speechiness}{A measure that detects the presence of spoken words in a track.}
#'    \item{acousticness}{A confidence measure from 0.0 to 1.0 of whether the track is acoustic.}
#'    \item{instrumentalness}{A measure that predicts whether a track contains no vocals.}
#'    \item{liveness}{A measure that detects the presence of an audience in the audio recording.}
#'    \item{valence}{}
#'    \item{tempo}{}
#'    \item{track_id}{}
#'    \item{analysis_url}{}
#'    \item{time_signature}{}
#'    \item{artists}{}
#'    \item{available_markets}{}
#'    \item{disc_number}{}
#'    \item{duration_ms}{}
#'    \item{explicit}{}
#'    \item{track_href}{}
#'    \item{is_local}{}
#'    \item{track_name}{}
#'    \item{track_preview_url}{}
#'    \item{track_number}{}
#'    \item{type}{}
#'    \item{track_uri}{}
#'    \item{external_urls.spotify}{}
#'    \item{album_name}{}
#'    \item{key_name}{}
#'    \item{mode_name}{}
#'    \item{key_mode}{}
#' }
#'
#' @source <https://developer.spotify.com/documentation/web-api>
"musicvisualizer_data"
