#' South Africa Macroeconomic Database API
#'
#' An R API providing access to a relational database with public macroeconomic data for South Africa, obtained from
#' from the South African Reserve Bank (SARB) and Statistics South Africa (STATSSA), and updated on a regular basis via the
#' EconData (https://www.econdata.co.za/) platform and automated scraping of the SARB and STATSSA websites.
#' The database is maintained at the Department of Economics at Stellenbosch University.
#'
#' @section Functions:
#' Functions and data providing information about the available data
#'
#' \code{\link[=sm_datasources]{sm_datasources()}}\cr
#' \code{\link[=sm_datasets]{sm_datasets()}}\cr
#' \code{\link[=sm_series]{sm_series()}}
#'
#' Function to retrieve the data from the database
#'
#' \code{\link[=sm_data]{sm_data()}}
#'
#' Functions to reshape data and add temporal identifiers
#'
#' \code{\link[=sm_pivot_wider]{sm_pivot_wider()}}\cr
#' \code{\link[=sm_pivot_longer]{sm_pivot_longer()}}\cr
#' \code{\link[=sm_expand_date]{sm_expand_date()}}
#'
#' Function to export wide format data to Excel
#'
#' \code{\link[=sm_write_excel]{sm_write_excel()}}\cr
#'
#' Helper functions to convert inputs to R dates and transpose the data
#'
#' \code{\link[=sm_as_date]{sm_as_date()}}\cr
#' \code{\link[=sm_transpose]{sm_transpose()}}\cr
#'
#' Global Macros with core ID variables in the database
#'
#' \code{\link{.SAMADB_ID}}\cr
#' \code{\link{.SAMADB_T}}
#'
#'
#' @docType package
#' @name samadb-package
#' @aliases samadb
#'
#' @importFrom utils packageVersion assignInMyNamespace
#' @importFrom stats as.formula setNames
#' @importFrom DBI dbConnect dbGetQuery dbDisconnect
#' @importFrom RMySQL MySQL
#' @importFrom collapse collapv pivot ffirst fmedian funique ftransformv get_vars get_vars<- date_vars add_vars add_vars<- cat_vars ss qF vlabels vlabels<- ckmatch qDT fnobs fnrow fncol unattrib namlab allNA whichNA
#' @importFrom data.table setDT melt fifelse transpose setcolorder %ilike%
#' @importFrom writexl write_xlsx
#'
NULL


.onAttach <- function(libname, pkgname) {

  packageStartupMessage(paste0("samadb ", packageVersion("samadb"), ", see help(samadb). Commercial users require a license at https://econdata.co.za/support/"))

}

.onUnload <- function(libpath) {

  if(length(.sm_con)) tryCatch(dbDisconnect(.sm_con), error = function(e) cat(""))

}

.connect <- function() {
  tryCatch({
      dbConnect(MySQL(), user = 'SAMADB_READ', password = '0c7Wg975vj',
                dbname = 'SAMADB', port = 3306L, host = '102.214.9.244')
  }, error = function(e) {
    message("Could not connect to database. Please make sure your internet connection is working, and your firewall does not block remote IP connections.")
    NULL})
}





