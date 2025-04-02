#' Count lines matching pattern
#' @param pattern Regex pattern
#' @param file File path
#' @return Line count
#' @export
grep_count <- function(pattern, file) {
  if (!file.exists(file)) {
    stop("File does not exist")
  }
  # check file extension
  file_ext <- tools::file_ext(file)
  if (file_ext == "csv") {
    # if the file is a csv file, use fread()
    number <- fread(cmd = "grep pattern file") |>
      nrow()
    return(number)
  } else {
    # if the file is not a csv file, use system()
    cmd <- paste("grep -c", shQuote(pattern), shQuote(file))
    result <- as.numeric(system(cmd, intern = TRUE))
    return(result)
  }
}

# Create function grep_read
#' Read lines matching pattern
#' @inheritParams grep_count
#' @return data.table
#' @export
grep_read <- function(pattern, file) {
  if (!file.exists(file)) {
    stop("File does not exist")
  }

  # check file extension
  file_ext <- tools::file_ext(file)

  if (file_ext == "csv") {
    # if the file is a csv file, use fread()
    cmd <- paste("grep", shQuote(pattern), shQuote(file))
    result <- tryCatch(
      data.table::fread(cmd = cmd),
      error = function(e) data.table::data.table()
    )
    return(result)
  } else {
    # if the file is not a csv file, use system()
    cmd <- paste("grep -n", shQuote(pattern), shQuote(file))
    raw_lines <- tryCatch(
      system(cmd, intern = TRUE),
      warning = function(w) character(0),
      error = function(e) character(0)
    )

    if (length(raw_lines) == 0) {
      return(data.table::data.table(line = integer(), text = character()))
    }
    split_data <- strcapture("^([0-9]+):(.*)$", raw_lines,
                             proto = data.frame(line = integer(),
                                                text = character()))
    return(data.table::as.data.table(split_data))
  }
}
