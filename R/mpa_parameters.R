

mpa_parameters = function( p=NULL, project.name=NULL, project.mode="default", ... ) {

  # ---------------------
  # deal with additional passed parameters
  if ( is.null(p) ) p=list()
  p_add = list(...)
  if (length(p_add) > 0 ) p = c(p, p_add)
  i = which(duplicated(names(p), fromLast = TRUE ))
  if ( length(i) > 0 ) p = p[-i] # give any passed parameters a higher priority, overwriting pre-existing variable


  # ---------------------
  # create/update library list
  p$libs = c( p$libs, RLibrary ( "colorspace",  "fields", "geosphere", "lubridate",  "lattice",
    "maps", "mapdata", "maptools", "parallel",  "rgdal", "rgeos",  "sp", "splancs", "GADMTools" ) )
  p$libs = c( p$libs, project.library ( "aegis", "aegis.mpa" ) )

  p$project.name = ifelse ( !is.null(project.name), project.name, "mpa" )

  if ( !exists("data_root", p) ) p$data_root = project.datadirectory( "aegis", p$project.name )
  if ( !exists("datadir", p) )   p$datadir  = file.path( p$data_root, "data" )
  if ( !exists("modeldir", p) )  p$modeldir = file.path( p$data_root, "modelled" )

  if ( !file.exists(p$datadir) ) dir.create( p$datadir, showWarnings=F, recursive=T )
  if ( !file.exists(p$modeldir) ) dir.create( p$modeldir, showWarnings=F, recursive=T )

  if (!exists("spatial.domain", p) ) p$spatial.domain = "SSE.mpa"
  if (!exists("spatial.domain.subareas", p)) p$spatial.domain.subareas = c( "snowcrab" )
  p = spatial_parameters( p=p)

  # define focal years
  if (!exists("yrs", p)) p$yrs = c(1999:lubridate::year(lubridate::now()))  # years for modelling and interpolation

  p$taxa =  "maxresolved"
  p$map.regions = c("Canada", "USA") # library "map" coastline polygon designations
  p$map.output.directory = file.path( p$project.outdir.root, "maps")
  p$map.palette = colorRampPalette(c("darkblue","blue3", "green", "yellow", "orange","red3", "darkred"), space = "Lab")(100)
  p$map.depthcontours = c( 200, 400, 600 ) # to plot on maps
  p$map.depthcontours.colours = c( "gray90", "gray85", "gray80", "gray74", "gray72", "gray70" )


  if (project.mode=="default") {
    return(p)
  }


  if (project.mode=="stmv") {
    p$libs = c( p$libs, project.library ( "stmv", "netmensuration" ) )

    p$DATA = 'mpa.db( p=p, DS="stmv_inputs" )'
    p$varstomodel = c() ### TODO ..
    if (!exists("variables", p)) p$variables = list()
    if (!exists("LOCS", p$variables)) p$variables$LOCS=c("plon", "plat")
    if (!exists("TIME", p$variables)) p$variables$TIME="tiyr"
    p = aegis_parameters(p=p, DS="stmv_spatiotemporal_model", stmv_dimensionality="space-year" )
    return(p)
  }



  if (project.mode=="carstm") {
    p$libs = c( p$libs, project.library ( "carstm" ) )

    return(p)
  }


}
