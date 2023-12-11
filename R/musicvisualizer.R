#' @title Retrieve metadata relevant to the albums of an artist
#'
#' @description
#' Given an artist's name, this function retrieves a dataset from Spotify that
#' includes relevant albums' information such as danceability, energy, valence, etc.
#'
#' @param album_name A string character vector identifying an existing album
#' @param artist_name A string character vector identifying an existing singer that possesses the album
#'
#' @return A data frame of class `musicvisualizer` with the following fields
#' * artist_name
#' * album_images
#' * album_release_date
#' * danceability
#' * energy
#' * valence
#' * instrumentalness
#' * acousticness
#' * track_name
#'
#' Note
#'
#' @importFrom spotifyr get_spotify_access_token
#' @importFrom spotifyr get_artist_audio_features
#' @importFrom dplyr filter
#' @importFrom dplyr select
#'
#' @export
musicvisualizer <- function(artist_n, album_n) {

  id <- 'd0f427dc24ea4235a017135aaa1cd5ba'
  secret <- '4866b1333932467cb761e1abd0d669bf'
  Sys.setenv(SPOTIFY_CLIENT_ID = id)
  Sys.setenv(SPOTIFY_CLIENT_SECRET = secret)
  access_token <- spotifyr::get_spotify_access_token()


  x <- spotifyr::get_artist_audio_features(artist_n)

  x <- x %>%
    dplyr::filter(album_name == album_n) %>%
    dplyr::select(track_name, danceability, energy, valence, instrumentalness, acousticness)
  x <- new_music_visualizer(x)
  x <- validate_music_visualizer(x)
  x

}

new_music_visualizer <- function(x) {

  stopifnot(is.data.frame(x))

  structure(x,
            class = "musicvisualizer")

}

validate_music_visualizer <- function(x) {

  required_fields <- c("track_name", "danceability", "energy",
                       "valence", "instrumentalness", "acousticness")

  if (!all(required_fields %in% names(x))) {
    difference <- setdiff(required_fields, names(x))
    stop("music visualizer object is missing the following required fields: ",
         paste(difference, collapse = ", "))
  }

  if (!(is.character(x[["track_name"]]) && length(x[["track_name"]] == 1))) {
    stop("The ", f, "field in a music visualizer object must be a character vector of length 1")
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
#' @importFrom ggplot2 ggplot aes geom_point theme_minimal theme element_text labs
#'
#' @exportS3Method
plot.musicvisualizer <- function(x, ...) {

  new_data <- data.frame(danceability = x$danceability,
                         energy = x$energy,
                         valence = x$valence,
                         acousticness = x$acousticness,
                         track_name = x$track_name)

  tracks_features <- new_data %>%
    tidyr::pivot_longer(cols = c(danceability, energy, valence, acousticness),
                        names_to = "Features", values_to = "Value of Features")

  ggplot2::ggplot(tracks_features, ggplot2::aes(x = track_name, y = `Value of Features`, color = Features)) +
    ggplot2::geom_point(size = 2) +
    ggplot2::theme_minimal() +
    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 25, hjust = 1)) +
    ggplot2::labs(title = "Music Features of Tracks in Album", x = "Track Names", y = "Value of Features")

}

