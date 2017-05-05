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
    "GIRLS PREP CHARTER SCHOOL" = "GPLES",

    #data.nysed.gove
    "GIRLS PREPARATORY CHARTER SCHOOL OF THE BRONX" = "GPBX",
    "GIRLS PREPARATORY CHARTER SCHOOL OF NEW YORK" = "GPLES",

    #eRate
    "GIRLS PREPARATORY CHARTER SCHOOL OF THE BRONX-ELEMENTARY" = "GPBXE",
    "GIRLS PREPARATORY CHARTER SCHOOL OF NEW YORK- ELEMENTARY" = "GPLESE",
    "GIRLS PREPARATORY CHARTER SCHOOL OF THE BRONX- MIDDLE" = "GPBXM",
    "GIRLS PREPARATORY CHARTER SCHOOL OF NEW YORK - MIDDLE" = "GPLESM",
    "BOYS PREPARATORY CHARTER SCHOOL OF THE BRONX ELEMENTARY" = "BPBXE",
    "PUBLIC PREPARATORY NETWORK INC- MANAGEMENT OFFICE" = "PPN"
  )

  name_vector <- sapply(X = name_vector, FUN = clean_name, clean = clean)

  return(unname(name_vector))
}


#' Clean a name vector
#'
#' @param x character vector
#'
#' @return character vector

clean_name <- function(x, clean) {
  z = clean[[x]]
  z = ifelse(is.null(z), x, z)
  return(z)
}
