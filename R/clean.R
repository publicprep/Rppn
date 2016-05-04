#' PPN names to codes
#'
#' @param name_vector character vector of school names
#'
#' @return character vector of codes
#' @export
#'
#' @examples
#' ex_sch <- c("Girls Prep Lower East Side Elementary School",
#' "Girls Prep Bronx Elementary School", "Boys Prep Elementary School")
#' ppn_names_to_codes(ex_sch)

ppn_names_to_codes <- function(name_vector) {

  #data
  clean <- list(
    "Pre Prep" = "JGCELP",

    "Girls Prep Lower East Side Elementary School" = "GPLESES",
    "Girls Prep Bronx Elementary School" = "GPBXES",
    "Boys Prep Elementary School" = "BPBXES",

    "Girls Prep Lower East Side Middle School" = "GPLESMS",
    "Girls Prep Bronx Middle School" = "GPBXMS"
  )

  clean_name <- function(x) {
    z = clean[[x]]
    z = ifelse(is.null(z), x, z)
    return(z)
  }

  name_vector <- sapply(X = name_vector, FUN = clean_name)

  return(unname(name_vector))
}
