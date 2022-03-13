#' Tables from PostgreSQL Catalogue
#' @param src Database connection.
#' @inheritDotParams pg_catalog
#' @return Lazy table. Table of tables. Columns include schema and table name,
#'   table owner.
#' @export
#' @examples
#' \dontrun{
#' pg::pg_catalog.pg_tables(src) %>%
#'   dplyr::filter(!(schemaname %in% c("pg_catalog", "information_schema")))
#' }
pg_catalog.pg_tables <- function(src, ...) {
  pg_catalog(src, "pg_tables", ...)
}

#' Views from PostgreSQL Catalogue
#' @param src Database connection.
#' @inheritDotParams pg_catalog
#' @return Lazy table.
#' @export
pg_catalog.pg_views <- function(src, ...) {
  pg_catalog(src, "pg_views", ...)
}

#' PostgreSQL Catalogue Table
#' @param src PostgreSQL database connection.
#' @param pg_table Character vector. Name of PostgreSQL catalogue table.
#' @inheritDotParams dplyr::tbl
#' @return Lazy catalogue table.
#' @export
pg_catalog <- function(src, pg_table, ...) {
  dplyr::tbl(src, dbplyr::in_schema("pg_catalog", pg_table), ...)
}
