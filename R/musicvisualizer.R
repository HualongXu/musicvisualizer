#' @title Retrieve metadata relevant to the albums of an artist
#'
#' @description
#' Given an artist's name, this function retrieves a dataset from Spotify that
#' includes relevant albums' information such as danceability, energy, valence, etc.
#'
#' @param album_name A string character vector identifying an existing album
#' @param artist_name A string character vector identifying an existing singer that possesses the album
#'
#' @return A list of class `musicvisualizer` with the following fields
#' * artist_name
#' * album_images
#' * album_release_date
#' * danceability
#' * energy
#' * valence
#' * instrumentalness
#' * acousticness
#' * track_name
#' * album_name
#'
#' Note

musicvisualizer <- function(album_name, artist_name) {

  x <- get_artist_audio_features(artist_name) |>
    filter(album_name == album_name) |>
    select(artist_name, album_images, album_release_date, danceability, energy, valence,
           instrumentalness, acousticness, track_name, album_name)
  x <- new_music_visualizer(x)
  x <- validate_music_visualizer(x)
  x

}

new_music_visualizer <- function(x) {

  stopifnot(is.list(x))

  structure(x,
            class = "musicvisualizer")

}

validate_music_visualizer <- function(x) {

  required_fields <- c("artist_name", "album_images", "album_release_date", "danceability", "energy",
                       "valence", "instrumentalness", "acousticness", "track_name", "album_name")

  if (!all(required_fields %in% names(x))) {
    difference <- setdiff(required_fields, names(x))
    stop("music visualizer object is missing the following required fields: ",
         paste(difference, collapse = ", "))
  }

  char_fields <- c("artist_name", "album_release_date", "track_name", "album_name")

  for (f in char_fields) {
    if (!(is.character(x[[f]]) && length(x[[f]] == 1))) {
      stop("The ", f, "field in a music visualizer object must be a character vector of length 1")
    }
  }

  if (!is.list(x[["album_images"]])) {
    stop("The album_images field in a music visualizer object must be a list")
  }

  double_fields <- c("danceability", "energy", "valence", "instrumentalness", "acousticness")

  for (f in double_fields) {
    if (!is.double(x[[f]])) {
      stop("The ", f, "field in a music visualizer object must be a double vector")
    }
  }

  return(x)

}

#' Visualize the relevant features - danceability, energy, valence, instrumentalness, and acousticness
#'
#' @param x An ['musicvisualizer'] object
#' @param ... Currently ignored
#'

plot.musicvisualizer <- function(x, ...) {

  ggplot(data = x,
         aes(x=, y=))

}
