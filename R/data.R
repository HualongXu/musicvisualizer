#' Metadata for all xkcd comics (thus far)
#'
#' @format  A data frame with 2850 rows and 12 columns
#' \describe{
#'    \item{artist_name}{Artist's name}
#'    \item{artist_id}{Artist's Spotify ID}
#'    \item{album_id}{Album's Spotify ID}
#'    \item{album_type}{Album type that could be album, single, or compilation}
#'    \item{album_images}{URL linking to the cover image of the album}
#'    \item{album_release_date}{Date in form of year-month-day that album got released}
#'    \item{album_release_year}{Year that album got released}
#'    \item{album_release_date_precision}{How precise is the provided release date? To day? To month? To year?}
#'    \item{danceability}{How suitable is the music for dancing along?}
#'    \item{energy}{How intense (fast, loud) is the music?}
#'    \item{key}{a number that represents the key the music uses}
#'    \item{loudness}{How loud is the music?}
#'    \item{mode}{}
#'    \item{speechiness}{}
#'    \item{acousticness}{}
#'    \item{instrumentalness}{}
#'    \item{liveness}{}
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
