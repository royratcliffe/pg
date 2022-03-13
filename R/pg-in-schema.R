globalVariables(c("schemaname", "tablename"))

#' PostgreSQL Schemas from Schema Tables
#'
#' Mutates a data frame by adding `in_schema` equal to the database schema-table
#' tuple based on the PostgreSQL schema name and table name.
#'
#' @inheritDotParams dplyr::collect
#' @return Collected data frame with `in_schema` column of type
#'   list-encapsulated `dbplyr_s` structure representing the database
#'   schema-table.
#' @export
#' @examples
#' \dontrun{
#' pg::pg_catalog.pg_tables(src) %>%
#'   dplyr::filter(!(schemaname %in% c("pg_catalog", "information_schema"))) %>%
#'   pg::pg_in_schema()
#' }
pg_in_schema <- function(...) {
  dplyr::collect(...) %>%
    dplyr::rowwise(schemaname, tablename) %>%
    dplyr::mutate(in_schema = list(
      dbplyr::in_schema(schemaname, tablename))
    )
}
