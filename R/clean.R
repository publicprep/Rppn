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
    "BOYS PREP CHARTER SCHOOL OF NY" = "BPBX",
    "BOYS PREP CHARTER SCHOOL OF" = "BPBX",

    #data.nysed.gov
    "GIRLS PREPARATORY CHARTER SCHOOL OF THE BRONX" = "GPBX",
    "GIRLS PREPARATORY CHARTER SCHOOL OF NEW YORK" = "GPLES",
    "BOYS PREPARATORY CHARTER SCHOOL OF NEW YORK" = "BPBX",

    #eRate
    "GIRLS PREPARATORY CHARTER SCHOOL OF THE BRONX-ELEMENTARY" = "GPBXE",
    "GIRLS PREPARATORY CHARTER SCHOOL OF NEW YORK- ELEMENTARY" = "GPLESE",
    "GIRLS PREPARATORY CHARTER SCHOOL OF THE BRONX- MIDDLE" = "GPBXM",
    "GIRLS PREPARATORY CHARTER SCHOOL OF NEW YORK - MIDDLE" = "GPLESM",
    "BOYS PREPARATORY CHARTER SCHOOL OF THE BRONX ELEMENTARY" = "BPBXE",
    "PUBLIC PREPARATORY NETWORK INC- MANAGEMENT OFFICE" = "PPN",

    #steptool
    'Boys Prep' = 'BPBXE',
    'Girls Prep Bronx' = 'GPBXE',
    'Girls Prep Lower East Side' = 'GPLESE'
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


#' PPN charter to school
#'
#' @description the state only understands our data as one school, but we have
#' an ES campus and an MS campus.  turn the generic charter name into the
#' school short code
#' @param charter one of: GPBX, GPLES, BPBX
#' @param grade one of: PK, K, 1, 2, 3, 4, 5, 6, 7, 8
#'
#' @return vector of school short codes
#' @export

ppn_charter_to_school <- function(charter, grade) {

  #mash it together
  hash <- paste0(charter, grade)

  #data
  clean <- list(
    #GPLESE
    "GPLESK" = "GPLESE",
    "GPLES1" = "GPLESE",
    "GPLES2" = "GPLESE",
    "GPLES3" = "GPLESE",
    "GPLES4" = "GPLESE",

    #GPLESM
    "GPLES5" = "GPLESM",
    "GPLES6" = "GPLESM",
    "GPLES7" = "GPLESM",
    "GPLES8" = "GPLESM",

    #GPBX
    "GPBXPK" = "GPBXE",
    "GPBXK" = "GPBXE",
    "GPBX1" = "GPBXE",
    "GPBX2" = "GPBXE",
    "GPBX3" = "GPBXE",
    "GPBX4" = "GPBXE",
    "GPBX5" = "GPBXE",

    #GPBXM
    "GPBX6" = "GPBXM",
    "GPBX7" = "GPBXM",
    "GPBX8" = "GPBXM",

    #BPBX
    "BPBXPK" = "BPBXE",
    "BPBXK" = "BPBXE",
    "BPBX1" = "BPBXE",
    "BPBX2" = "BPBXE",
    "BPBX3" = "BPBXE",
    "BPBX4" = "BPBXE"
  )

  sch_vector <- sapply(X = hash, FUN = clean_name, clean = clean)

  return(unname(sch_vector))
}
