## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(musicvisualizer)

## ----example------------------------------------------------------------------
library(musicvisualizer)
##basic example code

first_musicvisualizer <- musicvisualizer("Olivia Rodrigo", "GUTS")
first_musicvisualizer

## -----------------------------------------------------------------------------
plot(first_musicvisualizer)

## -----------------------------------------------------------------------------
midnights_musicvisualizer <- musicvisualizer("Taylor Swift", "Midnights")
midnights_musicvisualizer

plot(midnights_musicvisualizer)

## -----------------------------------------------------------------------------
head(musicvisualizer_data)

## -----------------------------------------------------------------------------
library(dplyr)
library(ggplot2)

## -----------------------------------------------------------------------------
musicvisualizer_songs_count <- musicvisualizer_data |>
  group_by(album_name) |>
  summarize(songs_count = n())

## -----------------------------------------------------------------------------
ggplot(data = musicvisualizer_songs_count,
       aes(x = album_name, y = songs_count)) +
  geom_col()

