#' Rename the "name" variable within a flowset
#'
#' A minor annoyance is specifying clean names for plotting many samples within a flowset. This simplifies the process.
#' @param flo_set A flow set produced using `flowCore::read.flowSet()`
#' @param new_names A character vector of new sample names, of the same length as your flow set
#' @returns A flow set with updated names.
#'
#'
#' @export
rename_flowset_samples <- function(flo_set, new_names){
  if(length(new_names) != length(flowCore::sampleNames(flo_set))){
    stop("Length of new_names doesn't match number of samples in flowset. Needed ", length(flowCore::sampleNames(flo_set))," new names, ", length(new_names), " provided")
  }
  flo_copy <- flo_set
  flowCore::pData(flo_copy)$name <- new_names
  return(flo_copy)
}
