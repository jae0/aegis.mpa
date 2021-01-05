

mpa_parameters = function( p=NULL, project_name=NULL, project_class="core", ... ) {

  # ---------------------
  # deal with additional passed parameters
  p = parameters_add(p, list(...)) # add passed args to parameter list, priority to args


  # ---------------------
  # create/update library list
  p$libs = c( p$libs, RLibrary ( "colorspace",  "fields", "geosphere", "lubridate",  "lattice",
    "maps", "mapdata", "maptools", "parallel",  "rgdal", "rgeos",  "sp", "splancs", "GADMTools" ) )
  p$libs = c( p$libs, project.library ( "aegis", "aegis.mpa" ) )

  p$project_class = project_class

  p$project_name = ifelse ( !is.null(project_name), project_name, "mpa" )

  if ( !exists("data_root", p) ) p$data_root = project.datadirectory( "aegis", p$project_name )
  if ( !exists("datadir", p) )   p$datadir  = file.path( p$data_root, "data" )
  if ( !exists("modeldir", p) )  p$modeldir = file.path( p$data_root, "modelled" )

  if ( !file.exists(p$datadir) ) dir.create( p$datadir, showWarnings=F, recursive=T )
  if ( !file.exists(p$modeldir) ) dir.create( p$modeldir, showWarnings=F, recursive=T )

  if (!exists("spatial_domain", p) ) p$spatial_domain = "SSE.mpa"
  if (!exists("spatial_domain_subareas", p)) p$spatial_domain_subareas = c( "snowcrab" )
  p = spatial_parameters( p=p)

  # define focal years
  if (!exists("yrs", p)) p$yrs = c(1999:lubridate::year(lubridate::now()))  # years for modelling and interpolation

  p = temporal_parameters(p=p, aegis_dimensionality="space-year")


  p$taxa =  "maxresolved"
  p$map.regions = c("Canada", "USA") # library "map" coastline polygon designations
  p$map.output.directory = file.path( p$project.outdir.root, "maps")
  p$map.palette = colorRampPalette(c("darkblue","blue3", "green", "yellow", "orange","red3", "darkred"), space = "Lab")(100)
  p$map.depthcontours = c( 200, 400, 600 ) # to plot on maps
  p$map.depthcontours.colours = c( "gray90", "gray85", "gray80", "gray74", "gray72", "gray70" )


  if (project_class=="core") {
    return(p)
  }


  if (project_class %in% c("stmv") ) {
    p$libs = c( p$libs, project.library ( "stmv", "netmensuration" ) )

    p$DATA = 'mpa_db( p=p, DS="stmv_inputs" )'
    p$varstomodel = c() ### TODO ..
    if (!exists("stmv_variables", p)) p$stmv_variables = list()
    if (!exists("LOCS", p$stmv_variables)) p$stmv_variables$LOCS=c("plon", "plat")
    if (!exists("TIME", p$stmv_variables)) p$stmv_variables$TIME="tiyr"

    p = aegis_parameters(p=p, DS="stmv" ) # generics:
    return(p)
  }


  if (project_class %in% c("carstm") ) {
    p$libs = c( p$libs, project.library ( "carstm" ) )
    p = carstm_parameters(p=p) # generics:

    return(p)
  }


  if (project_class %in% c("hybrid", "default") ) {
    p$libs = c( p$libs, project.library ( "stmv" ) )
    p = carstm_parameters(p=p) # generics:

    return(p)
  }


}
