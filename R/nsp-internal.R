.First <-
function () 
{
    if (!interactive()) 
        return()
    try(utils::loadhistory("~/.Rhistory"))
    set.seed(19850725)
    inTerminal <- isatty(stdout())
    options(menu.graphics = !inTerminal, defaultPackages = c(getOption("defaultPackages"), 
        if (inTerminal) c("colorout")))
    if (inTerminal) {
        if (Sys.getenv("STY") != "") 
            cat(sprintf("\033_%s\033\\", R.version.string))
        colorout::setOutputColors256(verbose = FALSE)
    }
    grDevices::pdf(tempfile())
    grDevices::palette(c("#444444", "#8DD3C7", "#FFFFB3", "#BEBADA", 
        "#FB8072", "#80B1D3", "#FDB462", "#B3DE69", "#FCCDE5", 
        "#D9D9D9", "#BC80BD", "#CCEBC5"))
    grDevices::dev.off()
    utils::timestamp()
}
.Last <-
function () 
{
    if (!interactive()) 
        return()
    try(savehistory("~/.Rhistory"))
}
