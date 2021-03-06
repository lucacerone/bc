# These settings control the behavior of all chunks in the novice R materials.
# For example, to generate the lessons with all the output hidden, simply change
# `results` from "markup" to "hide".
# For more information on available chunk options, see
# http://yihui.name/knitr/options#chunk_options

library("knitr")
opts_chunk$set(tidy = FALSE, results = "markup", comment = NA)

# The hooks below add html tags to the code chunks and their output so that they
# are properly formatted when the site is built with jekyll.
hook_in <- function(x, options) {
  stringr::str_c("\n\n<pre class='in'><code>",
                 paste0(x, collapse="\n"),
                 "</code></pre>\n\n")
}

hook_out <- function(x, options) {
  stringr::str_c("\n\n<div class='out'><pre class='out'><code>",
                   paste0(x, collapse="\n"),
                 "</code></pre></div>\n\n")
}

knit_hooks$set(source = hook_in, output = hook_out, warning = hook_out,
               error = hook_out, message = hook_out)