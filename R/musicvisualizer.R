#' @title Retrieve metadata relevant to the albums of an artist
#'
#' @description
#' Given an artist's name, this function retrieves a dataset from Spotify that
#' includes relevant albums' information such as danceability, energy, valence, etc.
#'
#' @param artist_n A string character vector identifying an existing singer that possesses the album
#' @param album_n A string character vector identifying an existing album
#'
#' @return A data frame of class `musicvisualizer` with the following fields
#' * track_name
#' * danceability
#' * energy
#' * valence
#' * instrumentalness
#' * acousticness
#'
#' Note
#'
#' @examples
#' first_musicvisualizer <- musicvisualizer("Olivia Rodrigo", "GUTS")
#'
#' @importFrom spotifyr get_spotify_access_token
#' @importFrom spotifyr get_artist_audio_features
#' @importFrom dplyr filter select
#'
#' @export
musicvisualizer <- function(artist_n, album_n) {

  id <- 'd0f427dc24ea4235a017135aaa1cd5ba'
  secret <- '4866b1333932467cb761e1abd0d669bf'
  Sys.setenv(SPOTIFY_CLIENT_ID = id)
  Sys.setenv(SPOTIFY_CLIENT_SECRET = secret)
  access_token <- spotifyr::get_spotify_access_token()

  x <- tryCatch({
    spotifyr::get_artist_audio_features(artist_n)
  }, error = function(e) {
    stop(e$message)
  })

  x <- x %>%
    dplyr::filter(album_name == album_n) %>%
    dplyr::select(track_name, danceability, energy, valence, instrumentalness, acousticness)

  if (nrow(x) == 0) {
    message("Can't find the album: ", album_n, ". Please check your spelling or try again with the album name in capital letters, such as '", toupper(album_n), "'")
    return(NULL)
  }

  x <- new_music_visualizer(x)
  x <- validate_music_visualizer(x)
  x

}

new_music_visualizer <- function(x) {

  stopifnot(is.data.frame(x))

  structure(x,
            class = c("musicvisualizer", "data.frame"))

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

#' @title
#' Visualize the relevant features - danceability, energy, valence, and acousticness
#'
#' @description
#' Given a [`musicvisualizer`] object, this [`base::plot`] method retrieves the dataset of features and
#' filters it to four features: danceability, energy, valence, and acousticness.
#' It then displays them in one single plot for a clearer overview.
#'
#' @param x An [`musicvisualizer`] object
#' @param ... Currently ignored
#'
#' @examples
#' first_musicvisualizer <- musicvisualizer("Olivia Rodrigo", "GUTS")
#' first_plot <- plot(first_musicvisualizer)
#'
#' @importFrom tidyr pivot_longer
#' @importFrom dplyr `%>%`
#' @importFrom ggplot2 ggplot aes geom_point theme_minimal theme element_text labs
#'
#' @exportS3Method
plot.musicvisualizer <- function(x, ...) {

  x <- x%>%
    dplyr::select(track_name, danceability, energy, valence, acousticness)

  tracks_features <- x %>%
    tidyr::pivot_longer(cols = c(danceability, energy, valence, acousticness),
                        names_to = "Features", values_to = "Value of Features")

  ggplot2::ggplot(tracks_features, ggplot2::aes(x = track_name, y = `Value of Features`, color = Features)) +
    ggplot2::geom_point(size = 2) +
    ggplot2::theme_minimal() +
    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 25, hjust = 1)) +
    ggplot2::labs(title = "Music Features of Tracks in Album", x = "Track Names", y = "Value of Features")

}

