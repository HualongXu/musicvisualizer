
<!-- README.md is generated from README.Rmd. Please edit that file -->

# musicvisualizer

<!-- badges: start -->
<!-- badges: end -->

The `musicvisualizer` package retrieves and filters data that contains
[an album’s features](https://spotify.com) from Spotify. It displays all
these features in one plot.

## Installation

You can install the development version of musicvisualizer from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("HualongXu/musicvisualizer")
```

## Visualize Album’s Features

Given an artist’s name and ONE of their album’s name, the
`musicvisualizer()` function retrieves a raw data that is later filtered
down to five features (energy, danceability, valence, instrumentalness,
acousticness) for the album.

``` r
library(musicvisualizer)
##basic example code

first_musicvisualizer <- musicvisualizer("Olivia Rodrigo", "GUTS")
first_musicvisualizer
#>                       track_name danceability energy valence instrumentalness
#> 1             all-american bitch        0.430  0.692   0.401         4.17e-06
#> 2                bad idea right?        0.627  0.879   0.748         6.87e-06
#> 3                        vampire        0.511  0.532   0.350         0.00e+00
#> 4                           lacy        0.455  0.379   0.413         0.00e+00
#> 5  ballad of a homeschooled girl        0.385  0.873   0.469         0.00e+00
#> 6                 making the bed        0.537  0.413   0.226         0.00e+00
#> 7                        logical        0.499  0.246   0.153         0.00e+00
#> 8                  get him back!        0.546  0.846   0.740         0.00e+00
#> 9           love is embarrassing        0.520  0.831   0.677         0.00e+00
#> 10                    the grudge        0.548  0.307   0.317         0.00e+00
#> 11           pretty isn’t pretty        0.554  0.854   0.594         1.78e-06
#> 12                 teenage dream        0.422  0.229   0.104         0.00e+00
#>    acousticness
#> 1       0.25400
#> 2       0.00193
#> 3       0.17700
#> 4       0.80300
#> 5       0.05570
#> 6       0.34600
#> 7       0.85300
#> 8       0.01350
#> 9       0.00261
#> 10      0.91600
#> 11      0.00394
#> 12      0.81600
```

We can plot them in one visualization to see the album’s tendency in
energy, danceability, valence, and acousticness.

``` r
plot(first_musicvisualizer)
```

<img src="man/figures/README-unnamed-chunk-2-1.png" width="100%" />
