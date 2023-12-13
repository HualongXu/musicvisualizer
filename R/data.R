#' Metadata for music visualizer
#'
#' @format  A data frame with 40 rows and 39 columns
#' \describe{
#'    \item{artist_name}{artist name (minimum 1, maximum 40)}
#'    \item{artist_id}{Year comnic was published}
#'    \item{album_id}{Month the comic was published}
#'    \item{album_type}{Day the comic was published}
#'    \item{album_images}{URL linking to relevant context, source information or large version of the comic.}
#'    \item{news}{Seemingly random information about the comic, like a backstory, contributors, mechandise link. May contain raw HTML.}
#'    \item{title}{Title of the comic}
#'    \item{safe_title}{We still don't know what this is safe for. Embedding maybe?? IDK}
#'    \item{transcript}{Transcription of the text in the comic.}
#'    \item{alt}{Alt text for the image in web browser}
#'    \item{img}{URL for the comic image itself}
#' }
#' @source <https://developer.spotify.com/documentation/web-api>
"musicvisualizer_data"
