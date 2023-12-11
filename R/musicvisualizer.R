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
#'
#' @importFrom spotifyr get_spotify_access_token
#' @importFrom spotifyr get_artist_audio_features
#' @importFrom dplyr filter
#' @importFrom dplyr select
#'
#' @export
musicvisualizer <- function(album_name, artist_name) {

  #I am not sure if this trunk of code is supposed to be here in this R file -
  id <- 'd0f427dc24ea4235a017135aaa1cd5ba'
  secret <- '4866b1333932467cb761e1abd0d669bf'
  Sys.setenv(SPOTIFY_CLIENT_ID = id)
  Sys.setenv(SPOTIFY_CLIENT_SECRET = secret)
  access_token <- spotifyr::get_spotify_access_token()


  x <- spotifyr::get_artist_audio_features(artist_name) |>
    dplyr::filter(album_name == album_name) |>
    dplyr::select(artist_name, album_images, album_release_date, danceability, energy, valence,
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
#' Description HERE!!! My brain is not FUNCTIONING at the moment!!! We will come back in one day!!!
#'
#' @param x An ['musicvisualizer'] object
#' @param ... Currently ignored
#'
#' @importFrom tidyr pivot_longer
#' @importFrom ggplot2 ggplot
#'
#' @exportS3Method
plot.musicvisualizer <- function(x, ...) {

  tracks_features <- x %>%
    tidyr::pivot_longer(cols = c(danceability, energy, valence, acousticness),
                        names_to = "Features", values_to = "Value of Features")

  ggplot2::ggplot(tracks_features, aes(x = track_name, y = `Value of Features`, color = Features)) +
    geom_point(size = 2) +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 25, hjust = 1)) +
    labs(title = "Music Features of Tracks in Album", x = "Track Names", y = "Value of Features")

}

