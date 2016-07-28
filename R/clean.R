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

    #MAP
    "Girls Prep Lower East Side Elementary School" = "GPLESE",
    "Girls Prep Bronx Elementary School" = "GPBXE",
    "Boys Prep Elementary School" = "BPBXE",

    "Girls Prep Lower East Side Middle School" = "GPLESM",
    "Girls Prep Bronx Middle School" = "GPBXM",

    #NYSED
    "GIRLS PREP CHARTER SCH-BRONX" = "GPBX",
    "GIRLS PREP CHARTER-BRONX" = "GPBX",
    "GIRLS PREP CHARTER SCHOOL" = "GPLES"
  )

  clean_name <- function(x) {
    z = clean[[x]]
    z = ifelse(is.null(z), x, z)
    return(z)
  }

  name_vector <- sapply(X = name_vector, FUN = clean_name)

  return(unname(name_vector))
}
