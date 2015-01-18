#' Get hierarchy as a data.frame
#'
#' @export
#'
#' @param data An object of class taxon
#' @examples \dontrun{
#' (out <- make_taxon(genus="Poa", epithet="annua", authority="L.",
#'                    family='Poaceae', clazz='Poales', kingdom='Plantae', variety='annua'))
#' gethier(out) # get hierarchy as data.frame
#' }

setGeneric("gethier", function(x) standardGeneric("gethier"))

#' @rdname gethier
#' @aliases gethier
setMethod("gethier", "taxon", function(x){
  tmp <- x@classification
  nn <- slotNames(tmp)[-1]
  vals <- vapply(nn, function(g) slot(tmp, g)@name, "", USE.NAMES = FALSE)
  data.frame(rank=nn, value=vals, stringsAsFactors = FALSE)
})