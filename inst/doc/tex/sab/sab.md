---
author:
- |
  [Jae S. Choi, Angelia S.M. Vanderlaan, Gordana Lazin,]{.smallcaps}\
  [Mike McMahon, Ben Zisserson, Brent Cameron, Jenna
  Munden]{.smallcaps}\
  [Population Ecology Division]{.smallcaps}\
  [Fisheries and Oceans Canada]{.smallcaps}\
  [Bedford Institute of Oceanography]{.smallcaps}\
  [2024-11-01]{.smallcaps}
bibliography:
- sab.bib
title: |

  ------------------------------------------------------------------------

  \
  An assessment Framework for the St Anns Bank Marine Protected Area\

  ------------------------------------------------------------------------

  \
---

# Abstract {#abstract .unnumbered}

We begin the dialogue required to develop a framework for monitoring and
assessing spatially managed areas such as Marine Protected Areas (MPA).
In particular, we begin with the Ocean's Act requirement to describe
productivity, biodiversity, habitat and species of interest by
identifying pragmatic metrics of these ecosystem-level attributes from
pre-existing monitoring systems in the area of interest: St. Anns Bank
in the Maritimes Region of Canada. We also identify a few human
influences/pressures that are also readily quantified, namely fishing
and vessel activity and some of the data gaps that evident in the area.
The nature of these data and the steps required to use them properly are
made explicit in an open-sourced and revision-controlled environment (R
and git) for the purpose of developing a transparent, vetted data and
code system from which future assessment and modeling attempts can be
staged. This should reduce the replication of effort in future. The
rationale for the methods chosen to quantify the characteristic space
and time scales of processes and features are identified and discussed.
Ultimately, the intent is to develop approaches similar to the
risk-based approach frequently encountered in fishery stock assessments,
such that we can begin to express the \"status\" of an area or MPA. It
is perhaps even possible to attempt to define reference points and
obtain a better sense of the \"health\" of these areas, or at least
assess the relative influence of area-based management closures. This
first report will focus only upon the \"Data\" side of the issues and
clarify the proposed \"Methods\".

# Résumé {#résumé .unnumbered}

We begin the dialogue required to develop a framework for monitoring and
assessing spatially managed areas such as Marine Protected Areas (MPA).
In particular, we begin with the Ocean's Act requirement to describe
productivity, biodiversity, habitat and species of interest by
identifying pragmatic metrics of these ecosystem-level attributes from
pre-existing monitoring systems in the area of interest: St. Anns Bank
in the Maritimes Region of Canada. We also identify a few human
influences/pressures that are also readily quantified, namely fishing
and vessel activity and some of the data gaps that evident in the area.
The nature of these data and the steps required to use them properly are
made explicit in an open-sourced and revision-controlled environment (R
and git) for the purpose of developing a transparent, vetted data and
code system from which future assessment and modeling attempts can be
staged. This should reduce the replication of effort in future. The
rationale for the methods chosen to quantify the characteristic space
and time scales of processes and features are identified and discussed.
Ultimately, the intent is to develop approaches similar to the
risk-based approach frequently encountered in fishery stock assessments,
such that we can begin to express the \"status\" of an area or MPA. It
is perhaps even possible to attempt to define reference points and
obtain a better sense of the \"health\" of these areas, or at least
assess the relative influence of area-based management closures. This
first report will focus only upon the \"Data\" side of the issues and
clarify the proposed \"Methods\".

# Introduction

## Terms of reference

The Health of the Oceans (2007;
<http://www.dfo-mpo.gc.ca/sds-sdd/sea-ees/hoto-sdo-eng.htm>) initiative
and the National Conservation Plan (2014; <https://www.ec.gc.ca/ee-ea>)
support the conservation and restoration of lands and waters in Canada.
In this context, the Science Branch of the Department of Fisheries and
Oceans (DFO), has been tasked with developing a monitoring approach for
Marine Protected Areas (MPAs) and, if possible, to assess their
effectiveness in meeting their objectives.

## Scope of this report

An MPA is defined in the Oceans Act 35(1) as, \"An area of the sea that
forms part of the internal waters of Canada, the territorial sea of
Canada or the exclusive economic zone of Canada and has been designated
under this section for special protection for one or more of the
following reasons:

-   the *conservation and protection* of commercial and non-commercial
    fishery resources, including marine mammals, and their habitats;

-   the *conservation and protection* of endangered or threatened marine
    species, and their habitats;

-   the *conservation and protection* of unique habitats;

-   the *conservation and protection* of marine areas of high
    biodiversity or biological productivity;

-   the *conservation and protection* of any other marine resource or
    habitat as is necessary to fulfill the mandate of the Minister.

As a result, for the purposes of this report, we will likewise focus
upon these key ecosystem attributes or components, namely:
**productivity, biodiversity, habitat, and species of interest**. In
reality, however, there are many other attributes or components of
ecosystems that are also known to be important and relevant, including:
ecological integrity and health, trophic structure and balance,
ecosystem function, complexity, network structure, resilience,
sustainability as well an open-ended number of species or life history
stages of the resident species. These other components will be touched
upon where possible or necessary.

## St. Anns Bank

The St. Anns Bank Marine Protected Area (herein, SAB) is an area of
interest for eventual designation as an MPA. It is located east of Cape
Breton Island, Nova Scotia, Canada
(Figure [1](#fig:SABCloseup){reference-type="ref"
reference="fig:SABCloseup"}). Previous advisory processes
[@DFO:2012:conservation; @Kenchington:2013:sab], identified the primary
objectives of SAB as being to conserve, protect and where appropriate
restore, ecologically distinctive or significant areas, and overall, the
ecosystem \"health\" of SAB. As in the Oceans Act, the focus was upon
the above four ecosystem components: **productivity, biodiversity,
habitat and species of interest**.

Other MPA goals were also expressed in @DFO:2012:conservation and
@Kenchington:2013:sab, but these were less emphatic:

-   contribute to the health, resilience and restoration of the Eastern
    Scotian Shelf ecosystem;

-   contribute to the recovery and sustainability of commercial
    fisheries;

-   promote scientific research and monitoring to further understand and
    protect SAB.

@Ford:2013:sab make more precise the ecological components that the SAB
area of interest might help to protect and conserve, especially in the
context of the Oceans Act's definition of MPAs:

-   Commercial and non-commercial fishery resources, including marine
    mammals, and their habitats (e.g., habitat for Atlantic cod,
    redfish, American plaice, sea urchins, white hake, witch flounder,
    sea anemones, sponges, and sea pens);

-   Endangered or threatened marine species, and their habitats (e.g.,
    habitat for depleted species such as Atlantic wolffish, Atlantic
    cod, and leatherback turtles);

-   Unique habitats (it is the only major bank on the Inner Scotian
    Shelf);

-   Marine areas of high biodiversity or biological productivity of
    invertebrates and fish.

![Bathymetic chart of the St. Anns Bank (SAB) area with the proposed
Marine Protected Area (MPA, thick line) and limited fishing zones
(hatched areas). See Figure [2](#fig:SAB){reference-type="ref"
reference="fig:SAB"} for geographic location in a larger
map.](/home/jae/bio.data/aegis/mpa/sab/SAB_MPA.pdf){#fig:SABCloseup
width="60%"}

## Objectives

The **primary objectives** of this report are straightforward:

-   To develop an Assessment Framework that can:

    -   monitor the status of an MPA;

    -   assess the effectiveness of an MPA in meeting its conservation
        objectives;

-   to identify data gaps and sources of uncertainty.

The method by which this can be accomplished, however, is anything but
straightforward. This is primarily due to the fact that the SAB is:

-   a large ecosystem and as such complex, operating at various space,
    time and organizational scales;

-   connected in various ways to the surrounding environment and so
    cannot be treated as an isolated system;

-   measures of system components of interest, namely, productivity,
    biodiversity, habitat and species of interest, are ambiguous and
    imperfect at best, and usually non-existent or poor in information
    quality and/or quantity.

As such, we emphasize that this report is a simplistic first attempt at
developing a general approach towards assessing MPAs. Indeed, given the
above significant challenges, it is best viewed as a work in progress
that will require further precision and improvement. To this end, we
will in the following, describe the data used for the assessment
(Section [2](#sec:data){reference-type="ref" reference="sec:data"});
outline the methods and assumptions associated with the modeling of this
data (Section [3](#sec:methods){reference-type="ref"
reference="sec:methods"}); summarize the primary results of this
analysis (Section [4](#sec:results){reference-type="ref"
reference="sec:results"}); provide some discussion of salient points
(Section [5](#sec:discussion){reference-type="ref"
reference="sec:discussion"}); and conclude with general recommendations
(Section [6](#sec:conclusions){reference-type="ref"
reference="sec:conclusions"}). The technical aspects of data quality
assurance (QA)/quality control (QC), associated assumptions and methods
are identified in the Appendices.

**NOTE: The primary purpose of this document is Section 2 (data) and to
begin a discussion of Section 3 (proposed methods). There are no Results
nor Conclusions to report at this point.**

# Data {#sec:data}

In this section we focus upon a description of the data chosen for
inclusion in this assessment. The purpose of the section is basic: to
clearly identify the data, sampling design, and the associated
assumptions and methods required/used to filter and integrate them in an
informative manner.

For the sake of transparency, all data assimilation and QA/QC methods
have been encoded in an open-sourced analytical environment R [@rCran]
and made publicly accessible at <https://github.com/jae0/> (packages
under development) and <https://github.com/jae0mes/> (packages thare are
production-ready) to permit flexible and adaptive multiuser
contributions through the **Git** revision control system and a uniform
data interface system. This approach permits the development of a
coherent and vetted approach that is completely opensource in nature. In
this way, we see this project as a real and flexible **structural and
collaborative framework** in the sense of a real scaffolding, to build a
monitoring and assessment system that can be easily transfered to other
Regions, domains and mandates as well as fostering collaborations and
communication with universities and the general public.

## Study area

Evaluating MPA status and effectiveness in meeting conservation
objectives, requires explicit reference to changes both within and
without the area of interest. Even in the most basic BACI-type design,
this requirement is explicit [@green:1979; @underwood1992]. For this
reason, and also to facilitate evaluations of other potential MPAs in
the region, a much larger surrounding area was chosen for analytical
purposes. This area is the continental shelf region off Nova Scotia
(Figure [2](#fig:SAB){reference-type="ref" reference="fig:SAB"}),
bounded by latitudes 37N to 48N and longitudes from 48W to 71W. \[Note:
It should be emphasized that this will not alleviate problems associated
with pseudo-(spatial, temporal) replication
[@hurlbert1984pseudoreplication], although an assumption of a Gaussian
process (see Sections
[3.4.1](#sec:interpolationSpatial){reference-type="ref"
reference="sec:interpolationSpatial"},
[3.4.3](#sec:spacetime){reference-type="ref" reference="sec:spacetime"})
may potentially alleviate this problem.\]

![Map of the data extraction area 37N to 48N and from 48W to 71W and the
relative location of the St Anns Bank
MPA.](/home/jae/bio.data/aegis/mpa/maps/mpa.pdf){#fig:SAB width="60%"}

## Data selection criteria

Exhaustive surveys of available data have been compiled by
@Ford:2013:sab. Their conclusions were that most biological data and
environmental conditions are poorly sampled in the SAB area. The
decision criteria for inclusion of data in this study was as follows:

-   Part of an **on-going sampling** program. This is because the design
    principle behind this project is that the underlying assessment must
    smoothly transition into a routine monitoring approach into the
    future.

-   Sufficient and regular **spatial** coverage ($>$ 100 sampling
    locations) inside MPA and throughout the study area.

-   Sufficient and regular **temporal** coverage ($\sim$ annual, $>$ 10
    years) inside MPA and throughout the study area.

-   **Informative** -- high data quality that is in some manner related
    to productivity, biodiversity, habitat and species of interest.

The same decision criteria were applied to human usage data. The result
was to include the following data streams for MPA characterisation:

-   AZMP/chlorophyll-a and nutrients: BioChem bottle data
    [@DFO:2014:biochem]

-   AZMP/Zooplankton: BioChem database [@DFO:2014:biochem]

-   Remote Sensing Data: ocean colour and SST (Remote Sensing Group)

-   Groundfish: DFO's Groundfish Research Vessel Surveys focus upon
    demersal fish species, since $\sim$ 2000, upon invertebrates as well

-   Snow crab survey, focus upon benthic invertebrates

-   Clam survey data in Banquereau and Western Banks (though it does not
    pass the temporal coverage conditions, it offers very high
    resolution multispecies data on the banks)

-   Temperature records: from various sources, especially, Groundfish,
    Snow crab and AZMP surveys

-   Salinity (Groundfish surveys/AZMP, BioChem)

-   Oxygen and pH (once the data have been reloaded; Groundfish
    surveys/AZMP, BioChem)

-   Bathymetry (CHS, Groundfish survey, Snow crab survey )

To characterise human usage patterns, the following have been chosen for
inclusion:

-   Logbook records of catch and effort (MARFIS/ZIFF)

-   AIS tracks -- Radio-based Automatic Identification System

-   VMS potentially -- Satellite-based Vessel Monitoring System

## Discrete Bottle Data: Chlorophyll-a and Nutrients

-   Relevance: productivity, biodiversity, habitat and species of
    interest (in relative order)

-   Sampling: AZMP surveys, Groundfish surveys, pelagic net tows and
    water profiles

-   Spatial coverage: variable no. stations, 143,499 records, 829
    missions

-   Temporal coverage: 1955 to present, annual surveys

-   Source code:
    <https://github.com/jae0/aegis/blob/master/inst/scripts/biochem.r>

Discrete bottle data consisting of chlorophyll-a and nutrient records
(nitrate, phosphate and silicate) were obtained by laboratory analysis
of water samples collected at discrete depths. For this study all
available nutrient and chlorophyll-a discrete bottle data were extracted
from DFO's BioChem database for the study area. This dataset contains
more than 500,000 records with the earliest records starting in 1955.
After QA/QC, the discrete bottle data retained for analysis was
comprised of 143,499 profiles, collected on 829 missions
(Figure [5](#fig:BottleMap){reference-type="ref"
reference="fig:BottleMap"}).

The number of profiles available in each year
(Figure [3](#fig:ChloroMap){reference-type="ref"
reference="fig:ChloroMap"}) shows that there were few profiles taken
until the mid 60's, and a relatively steady number of yearly profiles
after the initiation of the Atlantic Zone Monitoring Program (AZMP) in
1999. The peak sampling during the period 1976-1982 corresponds to DFO's
Scotian Shelf Ichthyoplankton Program (SSIP) and foreign research
vessels sampling programs which were obtained from the National Oceanic
and Atmospheric Administration's (NOAA) National Oceanographic Data
Center (Pierre Clement, personal communication). Monthly distribution of
the profiles (Figure [4](#fig:ChloroFreq){reference-type="ref"
reference="fig:ChloroFreq"}) demonstrates that most of the data was
collected in July (mostly during DFO's groundfish surveys), followed by
the months of September and April. Note that spatial distribution of the
sampling varies among months with most data collected on the Scotian
Shelf in July and the fewest data in January
(Figures [5](#fig:BottleMap){reference-type="ref"
reference="fig:BottleMap"},
[6](#fig:ChloroProfiles){reference-type="ref"
reference="fig:ChloroProfiles"}.)

![Number of chlorophyll and nutrient profiles extracted from the BioChem
database for each year since
1955.](/home/jae/bio.data/aegis/mpa/sab/2.png){#fig:ChloroMap
width="100%"}

![Number of chlorophyll and nutrient profiles extracted from the BioChem
database for the time period 1955-2014, grouped
monthly.](/home/jae/bio.data/aegis/mpa/sab/3.png){#fig:ChloroFreq
width="80%"}

![Monthly spatial distribution of discrete bottle data for the time
period
1955-2014.](/home/jae/bio.data/aegis/mpa/sab/4.png){#fig:BottleMap
width="100%"}

![Depth profiles of chlorophyll-a and nutrients; all data for the time
period
1955-2014.](/home/jae/bio.data/aegis/mpa/sab/5.png){#fig:ChloroProfiles
width="100%"}

## Zooplankton Data

-   Relevance: productivity, biodiversity, species of interest, habitat
    (in relative order)

-   Sampling: AZMP surveys, Groundfish surveys, pelagic net tows, 400
    taxonomic species

-   Spatial coverage: 2367 net deployments, 126 missions

-   Temporal coverage:, 1999 to 2014, annual surveys

-   Source code:
    https://github.com/jae0/aegis/blob/master/inst/scripts/biochem.r

Number of net deployments for each month is shown in
Figure [7](#fig:AZMPdeploymentsMonthly){reference-type="ref"
reference="fig:AZMPdeploymentsMonthly"} and the corresponding spatial
distribution of the net deployments are shown in
Figure [8](#fig:AZMPdeploymentsMonthlyMap){reference-type="ref"
reference="fig:AZMPdeploymentsMonthlyMap"}. Note that most of the net
data were collected in July during summer groundfish survey missions and
in April and October on AZMP spring and fall missions while winter
months contain mostly fixed station data (Halifax 2 and Prince 5).

Abundance patterns are found in
Figure [9](#fig:AZMPBiomassMonthly){reference-type="ref"
reference="fig:AZMPBiomassMonthly"}.

![Total number of net deployments for each month during the time period
1999-2014.](/home/jae/bio.data/aegis/mpa/sab/6.png){#fig:AZMPdeploymentsMonthly
width="80%"}

![Spatial distribution of net deployments included in the zooplankton
dataset.
](/home/jae/bio.data/aegis/mpa/sab/7.png){#fig:AZMPdeploymentsMonthlyMap
width="100%"}

<figure id="fig:AZMPBiomassMonthly">
<table>
<tbody>
<tr class="odd">
<td style="text-align: center;"><img
src="/home/jae/bio.data/aegis/mpa/sab/8.png" style="width:45.0%"
alt="image" /> <img src="/home/jae/bio.data/aegis/mpa/sab/9.png"
style="width:45.0%" alt="image" /></td>
<td style="text-align: center;"></td>
</tr>
</tbody>
</table>
<table>
<tbody>
<tr class="odd">
<td style="text-align: center;"><img
src="/home/jae/bio.data/aegis/mpa/sab/10.png" style="width:45.0%"
alt="image" /> <img src="/home/jae/bio.data/aegis/mpa/sab/11.png"
style="width:45.0%" alt="image" /></td>
<td style="text-align: center;"></td>
</tr>
</tbody>
</table>
<figcaption>Monthly averages of all data from 1999 to 2014: total
abundance (top left), total biomass computed from wet weight (top
right), ratio of total biomass computed from wet weight to total
abundance (bottom left) as a potential measure of the average weight of
the individual organism, and abundance of <em>Calanus finmarchicus</em>,
<em>Calanus hyperboreus</em>, and <em>Calanus glacialis</em> (botton
right) </figcaption>
</figure>

## Remote Sensing Data

#### Ocean Colour

-   Relevance: productivity, habitat, biodiversity and species of
    interest (in relative order)

-   Sampling: MODIS

-   Spatial coverage: 39 N to 62.5 N and 42 W to 71 W, resolution of 1.5
    km

-   Temporal coverage: August 2002 to March 2015, 610 quarter-monthly
    (8-day) composite images

-   Source code:
    <https://github.com/jae0/aegis/blob/master/inst/scripts/remoting.sensing.r>

Ocean colour refers to the spectral distribution of light emerging from
the ocean which carries information about water constituents,
particularly about biologically useful chlorophyll concentration in the
surface layer. When measured from satellites it provides unique synoptic
view of chlorophyll spatial distribution over large areas of the ocean
on a daily time scale.

The nominal uncertainty of chlorophyll products derived from ocean
colour satellites is 35%, with better agreement with in-situ chlorophyll
for the open ocean [@moore2008impacts] while overestimation is often
observed in the coastal ocean [@darecki2004evaluation]. This is due to
the inability of the algorithms to distinguish chlorophyll from
suspended particulate matter and colored dissolved organic matter often
present in the coastal waters, as for example in the Bay of Fundy and
Northumberland Strait.

Ocean colour satellite data for this study was provided by the Remote
Sensing Unit (RSU) from the Bedford Institute of Oceanography (BIO) as
8-day composite chlorophyll images which are routinely produced by the
unit for the Atlantic Zone Monitoring Program (AZMP). The dataset was
created using the Moderate Resolution Imaging Spectroradiometer
(MODIS-Aqua) data, where the chlorophyll-a values are based on the 2012
reprocessing carried by the National Aeronautics and Space
Administration (NASA) using OC3 chlorophyll algorithm. Composite images
were created from daily Level-2 MODIS-Aqua files downloaded from NASA by
averaging valid chlorophyll-a values for each pixel using all available
daily images within that time period
[@Caverhill:2015:modis; @feldman:2015]. The dataset comprises years 2002
to 2015 and area 39 N to 62.5 N and 42 W to 71 W, with spatial
resolution of about 1.5 km per pixel.

Even though there is ocean color data available before MODIS launch it
was decided to limit our dataset to a single sensor to avoid potential
biases between the sensors. Due to the frequent cloud coverage of the NW
Atlantic it was decided to use 8-day composite images as daily images
would not provide sufficient number of valid pixels.

The values of chlorophyll-a pixels within St. Anns Bank polygon were
extracted from each 8-day composite image and average chlorophyll-a
concentration was computed for the polygon. The time series for the
polygon and the associated climatology that was computed from time
series data show characteristic spring blooms in March and April, with
varying intensity and timing throughout the years
(Figures [11](#fig:modisChlaTS){reference-type="ref"
reference="fig:modisChlaTS"}, [12](#fig:ChlaSeasonal){reference-type="ref"
reference="fig:ChlaSeasonal"}). An example of MODIS semi-monthly
chlorophyll-a products showing spring bloom progression in the St. Anns
Bank area in 2012 is shown on
Figure [10](#fig:MapChlaBloomSpring){reference-type="ref"
reference="fig:MapChlaBloomSpring"}.

<figure id="fig:MapChlaBloomSpring">
<table>
<tbody>
<tr class="odd">
<td style="text-align: center;"><img
src="/home/jae/bio.data/aegis/mpa/sab/12.jpg" style="width:45.0%"
alt="image" /> <img src="/home/jae/bio.data/aegis/mpa/sab/13.jpg"
style="width:45.0%" alt="image" /></td>
<td style="text-align: center;"></td>
</tr>
</tbody>
</table>
<table>
<tbody>
<tr class="odd">
<td style="text-align: center;"><img
src="/home/jae/bio.data/aegis/mpa/sab/14.jpg" style="width:45.0%"
alt="image" /> <img src="/home/jae/bio.data/aegis/mpa/sab/15.jpg"
style="width:45.0%" alt="image" /></td>
<td style="text-align: center;"></td>
</tr>
</tbody>
</table>
<figcaption>MODIS semi-monthly Chl-a concentration showing spring bloom
progression in the NW Atlantic in 2012. Note the intense bloom at St.
Anns Bank during the last two weeks in March.</figcaption>
</figure>

![Chlorophyll-a concentration extracted from MODIS 8-day composite
images for St.Anns Bank polygon for the time period
2002-2015.](/home/jae/bio.data/aegis/mpa/sab/16.png){#fig:modisChlaTS
width="100%"}

![Average Chorophyll-a concentration computed from 8-day composite
images for St.Anns bank polygon for the time period 2002-2015.
](/home/jae/bio.data/aegis/mpa/sab/17.png){#fig:ChlaSeasonal
width="80%"}

#### Primary Production

-   Relevance: productivity, habitat, biodiversity and species of
    interest (in relative order)

-   Sampling: MODIS, \...

-   Spatial coverage: 39 N to 62.5 N and 42 W to 71 W, resolution of 1.5
    km

-   Temporal coverage: July 2002 to December 2014, 150 monthly images

-   Source code
    <https://github.com/jae0/aegis/blob/master/inst/scripts/remoting.sensing.r>

Marine primary production plays an important role in biogeochemical
cycles, in food web dynamics, and in marine fisheries. It may be defined
as the amount of organic material (or organic carbon) produced per unit
area (or volume) per unit time by photosynthetic plants, predominately
by phytoplankton.

Primary production of the ocean on synoptic scale is estimated by models
that use satellite data (SST, ocean colour chlorophyll, and available
light estimates at the surface), shipborne in-situ information on the
vertical distribution of phytoplankton in the water column, and the
phytoplankton's photosynthetic response to light.

Monthly primary production data were provided by the Remote Sensing Unit
(RSU) at BIO that routinely generates production maps for the NW
Atlantic as part of the Atlantic Zone Monitoring Program. The general
approach for the production computation is described in Platt et al.
([@platt2008]) and employs chlorophyll and light estimates from MODIS,
SST produced by the unit, and DFO's archive of shipborne measured
parameters. This particular production algorithm has been validated with
in-situ measured production ([@platt1988]) and also has performed very
well in global comparisons [@carr2006comparison].

Primary production for each pixel within St. Anns Bank polygon was
extracted from the monthly images and average production was computed
for the polygon. The time series for the polygon and the associated
monthly climatology are showing peaks in primary production in spring
and summer with varying intensity and timing throughout the years
(Figure [13](#fig:ppTSmonthly){reference-type="ref"
reference="fig:ppTSmonthly"} and
Figure [14](#fig:ppTSannual){reference-type="ref"
reference="fig:ppTSannual"}).

![Annual monthly Primary Production (PP) computed from PP composite
images for St.Anns bank polygon for the time period
2002-2014.](/home/jae/bio.data/aegis/mpa/sab/18.png){#fig:ppTSmonthly
width="100%"}

![Average Primary Production (PP) computed from monthly composite images
for St.Anns bank polygon for the time period
2002-2014.](/home/jae/bio.data/aegis/mpa/sab/19.png){#fig:ppTSannual
width="80%"}

#### Sea Surface Temperature

-   Relevance: productivity, habitat, biodiversity and species of
    interest (in relative order)

-   Sampling: AVHRR

-   Spatial coverage: 39 N to 62.5 N and 42 W to 71 W, resolution of 1.5
    km

-   Temporal coverage: December 1997 to March 2015, 845 8-day composite
    images

-   Source code:
    <https://github.com/jae0/aegis/blob/master/inst/scripts/remoting.sensing.r>

Sea Surface Temperature (SST) from space was estimated using infrared
channels of the Advanced Very High Resolution Radiometer (AVHRR) on
board the polar-orbiting satellites.

The SST data for this study was provided by the Remote Sensing Unit from
the BIO that has been downlinking AVHRR data from the National
Oceanographic Atmospheric Administration (NOAA) satellites since 1997 on
an L-band satellite receiver that resides on the roof of the BIO. The
received data is routinely processed by the RSU and is supplemented by
the data stream from the AVHRR onboard the European satellites.
Composite SST images of different time periods are operationally
produced as part of the Atlantic Zone Monitoring Program (RSU Technical
Document 1). Here we used 8-day composite images with the same spatial
coverage and spatial resolution as the ocean colour chlorophyll data.

The SST pixels within St. Anns Bank polygon were extracted from each
8-day composite image and average SST was computed for the polygon. The
time series for the polygon and the associated climatology that was
computed from time series data are shown on
Figures [15](#fig:SSTfromAVHRRmap){reference-type="ref"
reference="fig:SSTfromAVHRRmap"} and
[16](#fig:SSTfromAVHRRts){reference-type="ref"
reference="fig:SSTfromAVHRRts"}. An example of semi-monthly SST products
corresponding to the spring bloom progression in the St. Anns Bank area
in 2012 is shown in Figure [17](#fig:SstSeasonal){reference-type="ref"
reference="fig:SstSeasonal"}.

<figure id="fig:SSTfromAVHRRmap">
<table>
<tbody>
<tr class="odd">
<td style="text-align: center;"><img
src="/home/jae/bio.data/aegis/mpa/sab/20.jpg" style="width:45.0%"
alt="image" /> <img src="/home/jae/bio.data/aegis/mpa/sab/21.jpg"
style="width:45.0%" alt="image" /></td>
<td style="text-align: center;"></td>
</tr>
</tbody>
</table>
<table>
<tbody>
<tr class="odd">
<td style="text-align: center;"><img
src="/home/jae/bio.data/aegis/mpa/sab/22.jpg" style="width:45.0%"
alt="image" /> <img src="/home/jae/bio.data/aegis/mpa/sab/23.jpg"
style="width:45.0%" alt="image" /></td>
<td style="text-align: center;"></td>
</tr>
</tbody>
</table>
<figcaption>Bi-weekly composites from AVHRR showing SST in the North
West Atlantic in the spring of 2012, corresponding to the intense spring
bloom at St.Anns bank shown in Figure <a href="#fig:ChlaSeasonal"
data-reference-type="ref"
data-reference="fig:ChlaSeasonal">12</a>.</figcaption>
</figure>

![Sea Surface Temperature (SST) extracted from 8-day AVHRR composite
images for St.Anns bank polygon for the time period
1997-2015.](/home/jae/bio.data/aegis/mpa/sab/24.png){#fig:SSTfromAVHRRts
width="100%"}

![Average Sea Surface Temperature (SST) computed from 8-day AVHRR
composite images for St.Anns bank polygon for the time period
1997-2015.](/home/jae/bio.data/aegis/mpa/sab/25.png){#fig:SstSeasonal
width="80%"}

## Bottom temperatures

-   Relevance: productivity, habitat, biodiversity and species of
    interest

-   Sampling: Groundfish survey, snow crab survey, AZMP profiles

-   Spatial coverage: full extent, varied sampling

-   Temporal coverage: 1950 - present (more historical data present but
    coverage is variable)

-   Source code:
    https://github.com/jae0/aegis/blob/master/inst/scripts/temperature.r

Numerous data sources have been compiled by Ocean Sciences Division. The
data were QA/QC controlled and then modeled in a two-part process,
temporal (first order harmonic analysis) and then spatial interpolation
as indicated in the Methods.

![Average bottom temperatures computed from all available data
1950-2016.](/home/jae/bio.data/stmv/temperature/maps/SSE/bottom.predictions/global/temperatures.bottom.png){#fig:TemperatureBottomMap
width="50%"}

## Demersal fish and macro-invertebrates

-   Relevance: productivity, habitat, biodiversity and species of
    interest

-   Sampling: Groundfish survey, Snow crab survey

-   Spatial coverage

    -   Groundfish: full extent, random stratified, variable number of
        stations

    -   Snow crab: Colder water environment, geostatistical grids of
        $\sim$ 10 minutes, $\sim$ 400 stations

-   Temporal coverage

    -   Groundfish: 2000 - present (started in 1970, but consistent
        sampling since 2000)

    -   Snow crab: 2005 - present (started in 1996, but consistent
        sampling since 2005)

-   Source code

    -   https://github.com/jae0/aegis/blob/master/inst/scripts/groundfish.r

    -   https://github.com/jae0/bio.snowcrab/blob/master/inst/scripts/1.snowcrab.r

### Groundfish survey {#sec:groundfishSurvey}

The Groundfish survey
(Figure [19](#fig:trawlLocationsMap){reference-type="ref"
reference="fig:trawlLocationsMap"}) utilizes a Western II-A Otter Trawl
net with a wingspread that is **assumed** to be 12.5 m and a target
distance of 1.75 nautical miles (3.24 km) and/or a 20-30min tow. This
net was used from 1982 to the present. Prior to this period, a Yankee 36
ft trawl was used with unmeasured net configuration data. It operates
night and day. Sampling occurrence as a function of time and season are
shown in Figure [19](#fig:trawlLocationsMap){reference-type="ref"
reference="fig:trawlLocationsMap"}. The consistent identification of
invertebrates in this survey began in approximately the year 2000. All
species assemblage analyses will use data from the post 2000 period.

<figure id="fig:trawlLocationsMap">
<table>
<tbody>
<tr class="odd">
<td style="text-align: center;"><embed
src="/home/jae/bio.data/aegis/mpa/maps/trawl.spatial.density.pdf"
style="width:50.0%" /></td>
<td style="text-align: center;"><embed
src="/home/jae/bio.data/aegis/mpa/sab/trawl.time.density.pdf"
style="width:50.0%" /></td>
</tr>
</tbody>
</table>
<figcaption>Left: Survey locations in the Groundfish survey (orange) and
snow crab survey (green). Right: Timing of surveys in the Groundfish
survey (orange) and snow crab survey (green). </figcaption>
</figure>

#### Net mensuration

Sensors measuring trawl net configuration and state are ubiquitous in
modern surveys and commercial fishing practices. In the snow crab
survey, net configuration has been monitored and used to determine swept
area manually (since 1996) and also with an automated procedure (since
2004). Unfortunately, in the groundfish survey, this information is
ignored, even though the survey series is a major source of information
for many stock assessments. Net configuration data have been collected
in the groundfish surveys sporadically since 2004
(Figure [20](#fig:groundfishNoSets){reference-type="ref"
reference="fig:groundfishNoSets"}). However, swept area estimates have
never been directly computed. Instead, the catch data is used almost
invariably with the assumption that each tow is equivalent in swept area
(a \"standard tow\"). Alternatively, it has also been used by some
assessments by \"adjusting\" catch data by the linear distance from
\"start\" and \"end\" times and locations and so implicitly assuming the
net configuration to be a constant (Don Clarke, personal communication).
Both approaches are problematic for the reasons identified below.

![Number of sets in the Groundfish surveys and the number of sets with
usable net configuration
data.](/home/jae/bio.data/aegis/mpa/sab/numberOfSets.pdf){#fig:groundfishNoSets
width="50%"}

To address these important and incorrect assumptions, algorithms were
developed to automatically determine lift off and touch down times,
locations and net width [@Munden:2017nets]. Based upon random visual
inspection, the skill was determined to be reasonable, with $>90\%$ of
the cases having estimates within 15 seconds of visual determination of
touch down/lift off locations. Where bias was observed this was mostly
to underestimate total contact time due to an over-smoothing of the lift
off or touch down profiles.

From this re-analysis, the actual time and distance of bottom contact
was found to range from approximately 10 to 40 minutes and distances
from 1.75 to 6 km, bringing into question many historical studies that
assumed a \"standard tow\" of 3.24 km in length. Even when compared to
the \"length\" of a tow, determined from positions recorded of \"start\"
and \"stop\" times or locations were frequently in error relative to
actual locations of net touch down and lift-off determined from GPS
information
(Figure [21](#fig:groundfishTowDistance){reference-type="ref"
reference="fig:groundfishTowDistance"}, @Munden:2017nets).

![Towed distance comparisons in the groundfish
survey.](/home/jae/bio.data/aegis/mpa/sab/toweddistance.pdf){#fig:groundfishTowDistance
width="50%"}

Net structure also varies along tows and between tows as it encounters
differing substrate, bathymetric and hydrodynamic conditions and vessel
speeds, currents, surface sea state, net fullness/filtration efficiency
due to contact with rocks/boulders/mud [@Munden:2017nets]. Assuming net
width to be a constant at 12.5 m is, therefore, problematic
(Figures [22](#fig:groundfishWingDoorAnnual){reference-type="ref"
reference="fig:groundfishWingDoorAnnual"},
[23](#fig:groundfishWingDoorComparison){reference-type="ref"
reference="fig:groundfishWingDoorComparison"}).

![Net spread variations by year. Note in 2011, the doorspread sensors
seem to have failed completely. Note also that wingspread has been
significantly larger from 2013 to
2015.](/home/jae/bio.data/aegis/mpa/sab/wing.v.door.byyear.pdf){#fig:groundfishWingDoorAnnual
width="80%"}

![Net spread variations: doorspread vs wingspread. Note also that
wingspread has been significantly larger from 2013 to 2015 but not
doorspread. The cause of this divergence has not been identified by the
groundfish
group.](/home/jae/bio.data/aegis/mpa/sab/wing.v.door.pdf){#fig:groundfishWingDoorComparison
width="50%"}

<figure id="fig:groundfishSweptArea">
<table>
<tbody>
<tr class="odd">
<td style="text-align: center;"><embed
src="/home/jae/bio.data/aegis/mpa/sab/sa.comparison.pdf"
style="width:50.0%" /></td>
<td style="text-align: center;"><embed
src="/home/jae/bio.data/aegis/mpa/sab/sa.comparison.all.pdf"
style="width:50.0%" /></td>
</tr>
</tbody>
</table>
<figcaption>Left: Surface area estimates based on GSINF logged start-end
positions vs computed surface area estimated from tow track and net
configuration. Right: Surface area estimates based on GSINF logged
start-end positions vs computed surface area estimated from tow track
and net configuration <strong>as well as modeled
solutions</strong>.</figcaption>
</figure>

When the variable nature of the length and width of survey tracks are
both accounted, the potential error in swept area estimates are
evidently large
Figure ([24](#fig:groundfishSweptArea){reference-type="ref"
reference="fig:groundfishSweptArea"}). Indeed, the range in variation of
swept area was approximately the same in magnitude as the swept area of
a standard tow! This means that an unnecessary and large \"observation
error\", potentially as large in magnitude as the magnitude of the catch
in a set, may be needlessly introduced to survey indices. Further, swept
area estimates based upon standard tows were also biased down relative
to estimates based upon net mensuration and actual tow tracks, meaning
that there in a high probability of over-estimating catch densities.

Unfortunately, net mensuration data is still not consistently recorded
nor used in the groundfish surveys
(Figure [20](#fig:groundfishNoSets){reference-type="ref"
reference="fig:groundfishNoSets"}). As a result, it is not possible to
satisfactorily estimate swept area for all historical sets. Statistical
methods of recalibration were used to impute swept area in these latter
sets (Figure [24](#fig:groundfishSweptArea){reference-type="ref"
reference="fig:groundfishSweptArea"}), using GAM-based estimates based
on relationships with location, depth and salinity ($R^2$ ranged from 40
to 60%, depending upon availability of covariates). However, due to
issues with a significant bias detected in wingspread sensors since 2013
(Figure [23](#fig:groundfishWingDoorComparison){reference-type="ref"
reference="fig:groundfishWingDoorComparison"}), this approach cannot be
extended for the period post-2013.

To conclude this section, the observation error (uncertainty) associated
with this data series, used in so many research programs, is needlessly
high and biased high. Removal of these errors by a coherent
representation of net configuration is simple to address and a major
data gap that needs to be fixed , [@Munden:2017nets].

### Snow crab survey {#(se:snowcrab)}

The snow crab survey uses a *Bigouden Nephrops* trawl
(Figure [19](#fig:trawlLocationsMap){reference-type="ref"
reference="fig:trawlLocationsMap"}), a net originally designed to dig
into soft sediments for the capture of lobsters in Europe (headline of
20 m, 27.3 m foot rope mounted with a 3.2 m long 8 mm chain, with a mesh
size of 80 mm in the wings and 60 mm in the belly and 40 mm in the
cod-end). Tows were conducted for $\sim$ 5 minutes in duration with
duration of bottom contact being monitored by Netmind and Seabird
sensors. The width of the mouth of the net was also monitored with
Netmind sensors. The ship speed was maintained at $\sim 2$ knots. The
warp length was $\sim 3 \times$ the depth. Positional information as
well as water temperature measurements were collected using a global
positioning system and Minilog and Seabird data recorders. The surface
area swept by the net was calculated from swept distance and net width
information.

#### Supplemental SAB stations

The 2015 snow crab trawl survey increased sampling in the St. Anns Bank
area to provide additional information about the marine macro-fauna.
Fourteen stations in, and adjacent to the proposed MPA location were
included in this additional sampling. These locations were close to
previous snow crab survey stations and represent varied depths and
bottom-types and habitats. The species composition of the catch at these
stations varied greatly as expected with differences in depth and bottom
type. The sampling at these stations included:

-   all catch identified to species level

-   all species counted and weighed to tenth of a kilogram

-   all finfish and crab species measured and weighed individually

-   stomach samples taken from fin-fish for diet studies.

An overview (in Google Earth format) of the the latest catch and
sampling at these stations can be found at:
<http://www.enssnowcrab.com/mpa/mpatows.kmz>

## Fisheries activity

-   Relevance: productivity, habitat, biodiversity and species of
    interest

-   Sampling: MARFIS and ZIFF

-   Spatial coverage: full extent

-   Temporal coverage: 1999 - present

-   Source code:
    <https://github.com/jae0/aegis/blob/master/R/marfissci*>

Commercial-fishing activities can modify the habitat and ecosystem and
contribute to changes in the structure and functioning of exploited
marine communities. Fishing impacts can be direct, such as the reduction
of targeted and non-targeted species, as well as truncations in age and
size distributions. Other direct effects due to fishing activities
include habitat alterations and substrate modifications through
interactions with fishing gear. Fishing can also cause indirect impacts
via changes in foodweb structure within an ecosystem.

Direct impacts of commercial fishing can be measured using data form the
Marine Fish (MARFIS) database that provides information on
commercial-fishing activities. For most fisheries the fishing position,
gear type, catch per unit effort, estimated weight of catch by species
information is available from the database. The MARFIS database details
information for all fishing trips, where a landing is reported within
the DFO Maritimes region and includes data from 2002 through 2015. The
exploitation of marine species and entanglement threat to cetaceans and
sea turtles will be quantified from data derived from the MARFIS
database.

Trawling and dredging disturbances to the sea floor will require
different estimation techniques. Vessel Monitoring System (VMS) point
locations have been used to estimate fishing-effort distributions [e.g.,
@lee2010developing] and to estimate impacts on the seabed
[@gerritsen2013much]. Similar techniques can be developed within R to
estimated the impacts to benthos from trawling and dredging activities
within the St. Anns Bank area.

St. Anns Bank Area of Interest has four zones within it with various
levels of fishing restrictions (Figure
[1](#fig:SABCloseup){reference-type="ref" reference="fig:SABCloseup"}).
Commercial fishing is restricted in Zone 1, the largest area, with the
exception of the seal harvest. The MPA requires monitoring to ensure
that fishers are complying with these regulations. Monitoring could be
done through a variety of techniques and data sources, including data
reported in the MARFIS database, Vessel Monitoring System (VMS) data
that allow the direct monitoring of fishing activities. Automatic
Identification System (AIS) data may also be used to monitoring fishing
activities if the vessel is large enough to require AIS ($\geq$ 300
gross registered tonnes) or if a fishing vessel has voluntarily
installed an AIS system onboard.

### MARFIS data extraction

Prorated landings for all species from 2002 onwards were extracted from
MARFIS. The proration process distributes the actual reported weights
across the reported efforts as identified within the fishers'logs.

In addition to the landings, we also included several other forms of
catch so as to better reflect the removal of biomass. These catches were
identified by their "CATCH USAGECODE", and include biomass used as bait
or discarded (sometimes identified as dead). Live discards were not
included. These catches were self-reported in a variety of units, so
they have been converted to kg as necessary to match the logged
landings.

Most log records included the spatial location of the catch, and some
catches have multiple sets of coordinates available within the table
MARFISSCI. LOGEFRTSTDINFOID. ENTLATITUDE and ENTLONGITUDE are physically
entered into the logbook by the fisher, and were used preferentially
over DETLATITUDE and DETLONGITUDE, which are determined from other
sources (like Loran-C).

Many logs have no usable coordinates either they are left blank, or they
are clearly incorrect (i.e. on land). Rather than discarding this data,
we still extracted it, and attempted to account for this biomass in the
next section.

The extraction logic is captured in:\
<https://github.com/jae0/aegis/blob/master/R/marfissci.get.data.R>.

The script above allows the user to specify one or more species and on
or more years, and the data will be extracted and saved in a local file.
This file serves as the input to the next step Data Layer Aggregation.

### MARFIS data quality control and aggregation

Once data was extracted, it was processed through a second script,
"marfissci.process.data.r". This script serves to QC and aggregate the
data, as well as apply un-positionable catches of a species
proportionally to the positioned data.

QC occurs in 2 stages, and is quite simple. First, all records without
coordinates are identified and retained, but removed from the main
dataset. Next, all remaining data is compared against a high resolution
coastline (the same as is shown in Figure
[2](#fig:SAB){reference-type="ref" reference="fig:SAB"}), and those
points falling on land are identified and retained, but removed from the
main dataset.

The remaining data are considered good, and these data is then
aggregated. The aggregation level is user-defined, but will likely be a
scale of 3 minutes since it is an even division of a degree, with no
potential for rounding errors (i.e. 3' = 1/60\*3 = 0.05 vs 2' = 0.03).
The aggregation process outputs a single record with a single position
for all of the catch in the area.

Following aggregation, the proportion of the total catch attributable to
each cell is calculated. The data that failed the QC tests are then
summed into a single value, representing the total catch that can't be
positioned. These data are then added to all of the cells in the same
proportion as was calculated in the previous step.

For example, one cell might have a total catch of 3269.7 kg, and this
cell represents 0.002167 of the total catch. If there are 5954.1 kgs of
un-positioned data, then the "corrected"value for the weight attributed
to this cell would be calculated as: 3269.7 kg + (55954.1 kg \*
0.002167) = 3390.9 kg.

The data QC and aggregation logic is captured in the script found at:

<https://github.com/jae0/aegis/blob/master/R/marfissci.process.data.R>.

The script above allows the user to specify the input data, the
aggregation level, and how the results should be output.

An example of the annually aggregated (2010) reported commercial catches
for sea scallops (*Placopecten magellanicus*) is presented in Figure
[25](#fig:Scallop){reference-type="ref" reference="fig:Scallop"}.
Nominal catches ranged to 14,073.8 kg in Bay of Fundy, Georges Bank, and
the Scotian Shelf.

![Commercial catch weights of sea scallops (*Placopecten magellanicus*)
on Georges Bank, the Scotian Shelf, and in the Bay of
Fundy.](/home/jae/bio.data/aegis/mpa/sab/Rplot.png){#fig:Scallop
width="80%"}

Similarly, an example of annually aggregated (2011) reported commercial
catches for Halibut (*Hippoglossus hippoglossus*) is shown in Figure
[26](#fig:halibut){reference-type="ref" reference="fig:halibut"}.
Nominal catches ranged to $\sim$ 9626.9 kg in the same area.

![Commercial catch weights of halibut (*Hippoglossus hippoglossus*) on
Georges Bank, the Scotian Shelf, and in the Bay of
Fundy.](/home/jae/bio.data/aegis/mpa/sab/Rplot01.png){#fig:halibut
width="80%"}

## Vessel activity

-   Relevance: habitat, biodiversity and species of interest

-   Sampling: AIS

-   Spatial coverage: Global for satellite AIS, coastal ($\sim$ 100km)
    for Canadian Coast Guard terrestrial AIS network.

-   Temporal coverage: 2013 - present

-   Source code:
    https://github.com/jae0/aegis/blob/master/inst/scripts/ais.r

Commercial shipping can have various direct and indirect effects on an
ecosystem. Direct effects including the contamination of the ecosystem
from the discharge of contaminates, radiated underwater noise, the
introduction of aquatic invasive species, and vessel-strike risk to
marine mammals and sea turtles. Spatia-temporal data on vessel traffic
is needed to determine the probability and/or magnitude of these effects
on ecosystems. Such information is available through AIS data.

The International Maritime Organization (IMO) requires AIS transponders
on all international vessels $\geq$ 300 gross tonnage and all passenger
vessels. Many studies have used AIS data to examine risk of lethal
vessel collisions to large whales [e.g.,
@vanderlaan:2009:efficacy; @wiley:2011:modeling; @redfern2013assessing; @guzman2013potential
] or to assess and monitor ship noise and assess the impact on marine
mammals
[@hatch2008characterizing; @mckenna2012underwater; @hatch2012quantifying; @merchant2014monitoring].
Similar exercises can be undertaken in the St Anns Bank area with AIS
data.

Fisheries and Oceans Canada has access to two different sources of AIS
data. The first is from the Canadian Coast Guard (CCG) terrestrial
system that was developed to track and monitoring coastal shipping and
provides a real-time, continuous stream of AIS vessel positions.
Archived historical data from this system is available for January 2012
through December 2015 and data from 2016 is currently streaming and
archiving to a server within DFO. Decoding routines have been developed
using native R methods for these data. Both sources of data provide
dynamic and static data, where the dynamic data includes information on
vessel identity, speed, and location, and static data includes
information vessel identity, name, size, and type.

The CCG terrestrial system as 21 AIS coastal receiving stations in in
the Maritime region and 19 AIS coastal receiving stations in
Newfoundland and Labrador. These receiving stations have limited range
for detecting vessels (Figure [27](#fig:TAIS){reference-type="ref"
reference="fig:TAIS"}) as AIS transmission detectability are primarily a
function of the receiving tower height above sea level and the height of
the AIS antenna on the transmitting vessel. AIS data is transmitted via
Very High Frequency (VHF) marine radio on two channels (161.9765 and
162.025 MHz). Based on the height of the associated towers and a vessel
with an AIS antenna 100 m high, line of sight calculations for VHF
provide a reception range of 57 to 113 m in and around St. Anns Bank
(Figure [28](#fig:LOF){reference-type="ref" reference="fig:LOF"}).
However there are several other factors that will contribute to
transmission range including weather conditions. @Simard2014shipping
estimated that coastal antennas within this network generally provide a
reception range of  100 km
(Figure [29](#fig:DetAIS){reference-type="ref" reference="fig:DetAIS"}).
In either case the terrestrial network is insufficient to monitor
vessels across the entire AOI and just north of the AOI. These data can
be combined with satellite AIS data.

![Automatic Identification System (AIS) data collected from the Canadian
Coast Guard terrestrial network of AIS receiving stations on 08 Dec
2015. A total of 127 vessels were detected in the area with each colour
representing a unique
vessel.](/home/jae/bio.data/aegis/mpa/sab/CCG_AIS.pdf){#fig:TAIS
width="100%"}

![Bathymetic (100 m resolution) chart of the St. Anns Bank area with
line of sight detection (red circles) for the terrestrial AIS receiving
stations (red dots) around St. Anns Bank Area of
Interest.](/home/jae/bio.data/aegis/mpa/sab/Line_of_Sight.pdf){#fig:LOF
width="80%"}

![Bathymetic (100 m resolution) chart of the St. Anns Bank area with
@Simard2014shipping estimated vessel detection distances (blue circles)
for the terrestrial AIS receiving stations (blue dots) around St. Anns
Bank Area of
Interest.](/home/jae/bio.data/aegis/mpa/sab/Simard_Sight.pdf){#fig:DetAIS
width="80%"}

The satellite AIS data are available globally for the years 2013, 2014,
and 2015 with on-going data collection for 2016. Although satellite AIS
data coverage if global, data are limited temporally as large sections
of vessel transits are unavailable due (see
Figure [30](#fig:astar){reference-type="ref" reference="fig:astar"})to a
limited number of satellites (n = 8) and their orbital paths. Spatial
interpolation must be completed to "fill in"missing data. Spatial
interpolation is achieved using an A$^{\star}$ function
[@hart1968formal] that estimates the minimum cost to get from one point
to another based on a cost map. The coast map was estimated from
seasonally aggregated annual density distributions of satellite AIS data
for the years 2013 through 2015
(Figure [32](#fig:costmvap){reference-type="ref"
reference="fig:costmvap"}). Grid resolution for this analysis was
inially set to 0.01 degrees and within each grid square the number of
unique vessels, identified by the vessel's Maritime Mobile Service
Identity (MMSI) number was counted daily and summed through time. Cost
maps were estimated quarterly. Two different cost maps were developed
for the St. Anns Bank area to interpolate vessel transits north of Cape
Breton into and out of the Gulf of St. Lawrence. Interpolation was
heavily influenced by the ferries transiting between Cape Breton and
Newfoundland, and therefore a cost map was developed without the data
derived from these ferries. A bathymetric restriction can also be build
into the cost maps.

![Hypothetical vessel positions (large filled circles) and interpolated
vessel positions (lines) based on the A\* algorithm for three vessels
transiting through the St. Anns Bank area. Each colour represents an
unique vessel.
](/home/jae/bio.data/aegis/mpa/sab/Interpolation_Example2.pdf){#fig:astar
width="100%"}

<figure id="fig:countmaps">
<table>
<tbody>
<tr class="odd">
<td style="text-align: center;"><embed
src="/home/jae/bio.data/aegis/mpa/sab/Counts_2013-2015_Q1.pdf"
style="width:50.0%" /></td>
<td style="text-align: center;"><embed
src="/home/jae/bio.data/aegis/mpa/sab/Counts_2013-2015_Q1_NNF.pdf"
style="width:50.0%" /></td>
</tr>
</tbody>
</table>
<figcaption>Vessel density maps for the first quarter of a year based on
satellite AIS data from 2013-2015 for all vessels (left panel) and all
vessels except of the Newfoundland ferries (right panel).</figcaption>
</figure>

<figure id="fig:costmvap">
<table>
<tbody>
<tr class="odd">
<td style="text-align: center;"><embed
src="/home/jae/bio.data/aegis/mpa/sab/Cost_2013-2015_Q1.pdf"
style="width:50.0%" /></td>
<td style="text-align: center;"><embed
src="/home/jae/bio.data/aegis/mpa/sab/Cost_2013-2015_Q1_NNF.pdf"
style="width:50.0%" /></td>
</tr>
</tbody>
</table>
<figcaption>Cost maps developed for the A<span
class="math inline"><sup>⋆</sup></span> function to interpolate
undetected vessel positions as vessels transit in and out of the Gulf of
St. Lawrence.</figcaption>
</figure>

## Data gaps

### Feeding relationships -- Stomach Database

Bottom trawl surveys (see Section
[2.7.1](#sec:groundfishSurvey){reference-type="ref"
reference="sec:groundfishSurvey"}) have been conducted by DFO on the
Scotian Shelf annual since 1970 using a stratified random design.
Sampling protocols changed in the late 1990s with the focus changing
from commercially important finfish species to more comprehensive
ecosystem monitoring that included the sampling of macroinvertebrates
[@tremblay2007distribution]. Stomach contents samples were collected
from finfish using a length-stratified sampling protocol. Prey were
quantified by weight and number, and often identified to the genus or
family level, or to the species level when possible.

For the purpose of determining any change in the diet of finfish pre-
and post- implementation of the MPA on St. Anns Bank or if there were
differences within the MPA compared to other areas on the Scotian shelf,
we explored the stomach database to determine if these dietary
differences could be described and detected. Within the database, 54% of
the prey number observations were missing. Due to the large interannual
variation in prey weights estimating the prey number consistently from
non-missing data where both the prey number and weight was available was
determined to be impracticable and unreliable. Due to the sampling
stratification both by depth and length classes it was further
determined that there would be insufficient samples available to reach
the asymptote of prey species accumulation curves [@cook2010food] and
total diet composition could not be detected. Prey species identified in
the stomach samples could be used for quantifying biodiversity and
species richness [@cook2012use] for the proposed MPA and comparing it to
similar ecosystem or pre- and post-implementation.

### Other ecosystem metrics

On the side of ecosystem characterization, data gaps in the following
are evident: pelagic fish (small and large bodied) and invertebrates
(e.g., squid, jellyfish), substrate characterisation via multibeam
surveys, marine mammals, reptiles, birds and genetic diversity. They are
gaps in that they are expensive and/or difficult to monitor and/or with
information that is not readily available at present.

### Other human usage metrics

A large number of variables and ecosystem descriptors are of course
being ignored. In particular are human influences such as seismic
activity, pollution, ballast water, etc. They may be addressed once the
basic biological features have been fully addressed.

# Methods {#sec:methods}

All methods have been implemented in R, an open-sourced programming
environment. The methods are shared via http://github.com/jae0the
**git** revisioning system. These architectural choices were adopted to
enhance the transparency and ease of sharing and collaborating with all
interested parties. It is structured such that any additional data
series can be easily added to the system to permit adaptive change. In
this way, the approaches developed represents a true **structural
framework** in which to further develop methods and approaches.

The main methods used/developed in this report will be described in this
section.

## Biodiversity and taxonomic richness

Biodiversity is seemingly a simple concept that is, in fact,
fundamentally complex. This is because it ranges in focus from genetic
and phenotypic variations within a local population, breeding
populations to biome or even larger scaled genetic and phylogentic and
community variability, both in terms of their number and relative
dominance. Any and all of these aspects of biodiversity can be
estimated. However, it is the number of unique kinds of organisms found
in a given location (commonly called taxonomic richness) that is most
readily quantified and monitored.

Taxonomic richness is known to increase asymptotically with sampling
intensity. As such, a statistical correction (\"rarefaction\") for
spatial and temporal sampling intensity must be applied to be
meaningfully comparable across locations and time. Specifically, the
model was a simple regression model:

$$\label{eq:biodiversity}
  R \sim \text{Lognormal} ( (\beta + \alpha_s \log(\text{SA}) + \alpha_t \log(\text{TS}) ),  \tau )$$

and used to predict an expected richness $R$ at a standard surface area
and time depth. The other terms are $\beta$ a constant, $SA$ surface
area (ranging from 1 to 50 km, radial length scale), $TS$, the number of
years entering into the count (ranging from 0 to 5 years) and $\tau$ is
a lognormal error. The autocorrelation in SA and TS are ignored for the
present but will eventually be modeled as well via a poisson process.

The intent is to model the spatial/temporal patterns
(Sections [3.4.2](#sec:interpolationTS){reference-type="ref"
reference="sec:interpolationTS"},
 [3.4.1](#sec:interpolationSpatial){reference-type="ref"
reference="sec:interpolationSpatial"}) and then integrate them in a
risk-based approach
(Section [3.5](#sec:riskapproach){reference-type="ref"
reference="sec:riskapproach"}) to permit formal statements of risk and
probability of exceeding thresholds.

## Productivity

Total system standing biomass is generally used as a proxy for
productivity. They are not the same, however, they will be used to
describe aggregate abundance of: various categories of organisms such as
total bottom biomass, macroinvertebrates, zoopankton, phytoplanton,
chlorophyll-a, etc.

To estimate true production, a modeled approach is necessary. These
indices can then be coupled with spatially explicit total landings to
estimate the biomass and secondary production associated with the biota
and fishery exploitation/footprint.

The intent is, therefore, to model the spatial/temporal patterns
(Sections [3.4.2](#sec:interpolationTS){reference-type="ref"
reference="sec:interpolationTS"},
 [3.4.1](#sec:interpolationSpatial){reference-type="ref"
reference="sec:interpolationSpatial"}) and then integrate them in a
risk-based approach
(Section [3.5](#sec:riskapproach){reference-type="ref"
reference="sec:riskapproach"}) to permit formal statements of risk and
probability of exceeding thresholds and perhaps even estimate net
production.

## Habitat

The basic Hutchinsonian notion of \"ecological niche\" is closely tied
to our current understanding of \"habitat\". It is a multi-dimensional
concept in that it incorporates an undefined set of environmental
variables and the associated biological
constraints/specialisations/requirements (e.g., nutrients, thermal,
oxygen, pH, etc.) pertinent to an organism of interest.

Two notions of habitat can be discriminated, depending upon outlook:

-   Functional ($H_f$) -- make increasing more precise habitat
    definitions by adding more environmental and biological factors for
    increasingly more precise categories of organisms

-   Integrative ($H_i$) -- the biota living in a given time and location
    represent a full integration of all relevant environmental and
    biological factors at their proper space time scales and so in
    effect characterises the full system-level concept of \"habitat
    space\"

### Functional-habitat modeling {#sec:habitatSpecies}

A utilitarian way of describing **Functional-habitat** space of an
organism is to examine the presence-absence or relative abundance of
organisms as a function of environmental gradients and biological/life
history constraints. From such information, the likelihood of a given
location to be potential habitat for an organism of interest can be
derived. The simplest method is to develop a probability model under the
assumption that the presence or absence of an organism is a Bernoulli
process. This can be readily parameterised using standard Generalized
Linear Models. However, as environmental constraints are almost always
modal in influence given a wide enough environmental gradient, a
nonlinear model is more useful. Generalized Additive Models and
Autoregressive Models are two methods that can deal with these
environmental constraints in a simple and efficient manner [@choi:2010].

The utility of such an approach is most relevant for organisms with
highly specific habitat requirements. They are used in this framework.
The intent is to develop such Functional habitat models for key species
of interest: wolffish, cod, etc., to assess changes in their available
\"habitat\". Examples are provided from the snow crab assessment in
Figures ([35](#fig:snowcrabHabitat){reference-type="ref"
reference="fig:snowcrabHabitat"},
[36](#fig:snowcrabHabitatTS){reference-type="ref"
reference="fig:snowcrabHabitatTS"}). Though this Functional-habitat
concept itself does not exclude species interactions, in actual
practice, they are generally ignored as they make the statistical
estimation impossibly over-parameterized (but see [@choi:2012:resdoc]
for one possible solution). Further, as there will always be factors
that are either poorly known, poorly sampled, or poorly parameterized
(e.g., dissolved oxygen, pH, redox, bacteria, jellyfish, squid,
pollution, substrate type, etc.), these models will always necessarily
be incomplete.

It is possible to model the spatial/temporal patterns
(Sections [3.4.2](#sec:interpolationTS){reference-type="ref"
reference="sec:interpolationTS"},
 [3.4.1](#sec:interpolationSpatial){reference-type="ref"
reference="sec:interpolationSpatial"}) and then \"integrate\" them in a
risk-based approach
(Section [3.5](#sec:riskapproach){reference-type="ref"
reference="sec:riskapproach"}) to permit more formal statements of risk
and probability of exceeding thresholds.

### Integral habitat -- whole system level {#sec:integralHabitat}

While the Functional habitat concept is interesting and pragmatic, it is
decidedly a reductionistic perspective. The monitoring and assessment
requirements for an MPA also demands a whole system perspective. The
*assumption* we make is that **the relative abundance of organisms found
in a given location and time defines and mirrors the kind of habitat in
which they live**. Sessile organisms that require high flow environments
and associated biota tend to exist and flourish with a given group of
other organisms similarly adapted; and they are different from those
that require cold waters and minimal water flow, etc.

Thus, if we can quantify the observed species composition in a given
location and time, we would, in effect, be describing the habitat. We
will define this as **Integral-habitat** ($H_i$): species assemblage
information that directly reflects all biological and environmental
interactions simultaneously, both measured and unmeasured and some too
fleeting to be measurable.

Fortunately, these associations are readily quantified using a standard
multivariate methods of data ordination. Here we focus upon, Principal
Components Analysis which focuses upon an eigenanalysis of correlational
structure of the species assemblages and Correspondence Analysis which
focuses upon an eigenanalysis of Chi-squared differences.

The intent is to model the spatial/temporal patterns
(Sections [3.4.2](#sec:interpolationTS){reference-type="ref"
reference="sec:interpolationTS"},
 [3.4.1](#sec:interpolationSpatial){reference-type="ref"
reference="sec:interpolationSpatial"}) and then integrate them in a
risk-based approach
(Section [3.5](#sec:riskapproach){reference-type="ref"
reference="sec:riskapproach"}) to permit formal statements of risk and
probability of exceeding thresholds.

## Connectivity: space and time scales {#sec:connectivity}

### Spatial scale {#sec:interpolationSpatial}

MPAs exist in a spatial context. The characteristic spatial scale of
productivity, diversity and habitat found in the MPA will determine
which processes will be relevant to these aspects of an MPA. If the
spatial variations in the productivity of a species of interest is small
relative to the size of an MPA, the chances of the MPA having an
influence upon the species is enhanced. This is usually the case when
short-range processes dominate (e.g., less mobile species, weakly
dispersing, low currents, habitat heterogeneity at small scales). If,
however, the spatial scale is larger than the MPA, then it would mean
that broader/larger processes were influencing the productivity of the
species (e.g., higher mobility or dispersal processes/current, and
stronger spatial connectivity, habitat heterogeneity at larger scales)
-- resulting in a lower likelihood of the MPA having an influence upon
the species or components of interest.

A second important factor is the relationship of the characteristic
spatial scale to monitoring. As organisms exist at a given spatial scale
in a given area, a sampling/monitoring protocol must reference/address
these spatial scales. For example, when a spatial feature (e.g.,
biodiversity) demonstrates short characteristic spatial scales (i.e., a
lot of spatial structure at smaller scales), any sampling approach must
respect this and similarly operate at such shorter scales or even
smaller if one is to be able to resolve the patterns and describe
properly the subject of interest. Similarly, if a feature (e.g.,
biodiversity) is long-ranged and one wishes to resolve the patterns
properly, then a sampling protocol must be similarly long-ranged to
resolve the pattern. A sampling program much smaller than the
characteristic spatial scale would be beneficial, but the accrued
benefits relative to cost of sampling would be rapidly diminishing, in
that time, effort and resources requirements generally increase more
rapidly than any benefit (e.g., in the simplest case, if one is looking
only naively at standard error as a measure of benefit, then it would
increase asymptotically with increased effort with a power of $-1/2$).

For these fundamental reasons, defining the spatial scale of a given
observation or process is imperative for the development of any
assessment or monitoring of MPAs. To this end, we represent any
spatially explicit observation as $Y(\bm{s})$, which are measured in a
coordinate space $\{ \bm{s} \in S \in \Re^d \}$ and domain $S$ of
dimensionality $d$. In this framework, we will mainly focus upon the
case of $d=2$ spatial dimensions (e.g., longitude and latitude or
northing and easting). The observations $Y(\bm{s})$ are assumed to be
realizations of a **spatial stochastic process**, $y$, that is, some
latent, unobservable but real stochastic generative function. The manner
in which the variability of $y$ changes as a function of distance
$h=\| \bm{s} - \bm{s}' \|$, is known as the spatial autocorrelation
function or in a slightly different form as a (semi-) variogram. This
spatial dependence is highly informative in that it defines how
similarity changes with distance and so ultimately defines **spatial
scale**.

The spatial model is succinctly expressed as a regression model of a
stochastic process ([@banerjee2014hierarchical]):

$$Y(\bm{s}) = \mu(\bm{s}) + e(\bm{s})
\label{eq:spatialModel}$$

where, the observations $Y(\bm{s})$ are a function of some mean process
$\mu(\bm{s})$, and a residual error process $e(\bm{s})$. The latter are
further defined as:

$$\begin{aligned}
  \mu(\bm{s}) &=& x(\bm{s})^{T} \beta \\
  e(\bm{s})  &=& \omega(\bm{s}) + \varepsilon(\bm{s})
\end{aligned}$$

where $x(\bm{s})$ are spatially referenced predictors with associated
parameters $\beta$; and the residual error process is decomposed into
spatial $\omega(\bm{s})$ and nonspatial $\varepsilon(\bm{s})$
components. The latter is also known as \"nugget\" error in
geostatistics and represents error associated with measurement and/or
microscale variability/processes.

The error structures are usually assumed to be the following:

$$\begin{aligned}
  \varepsilon(\bm{s})  &\sim& \textrm{N}(0, \tau^2) \\
  \omega(\bm{s}) &\sim& \textrm{GP}(0, C(\bm{s},\bm{s}'; \bm{\theta}))  \\
  \bm{Y} &\sim& \textrm{MVN}( \bm{\mu}, \bm{\Sigma}).
\end{aligned}$$

The nonspatial error is assumed normal with mean 0 and standard
deviation $\tau$. The spatial error is assumed to follow a Gaussian
Process with mean 0 and covariance $C(\bm{s},\bm{s}'; \bm{\theta})$,
that is, a *spatial covariance function* with parameters $\bm{\theta}$.
A multivariate normal likelihood is usually assumed for the observations
$\bm{Y} = (Y(\bm{s}_1), \dots, Y(\bm{s}_n) )^T$, with mean
$\bm{\mu} = \bm{X} \bm{\beta}$ and covariance
$\bm{\Sigma} = \left[ C(\bm{s}_i, \bm{s}_j; \theta) \right]^{n}_{i,j=1}+ \tau^2 I_n$.
$\bm{X} = \left[ \bm{x}(\bm{s}_i)^T \right]^{n}_{i=1}$ is the matrix of
regressors and $I_n$ is an identity matrix of size $n$.

The spatial covariance function $C(h) = C(\bm{s}, \bm{s}')$ expresses
the tendency of observations closer together to be more similar to each
other than those further away; $h=\| \bm{s} - \bm{s}' \|$ is the
distance separating observations. Historically, a number of different
forms have been used. The most frequently used forms include (for
$h>0$):

$$\begin{aligned}
  C(h)_{\textrm{Spherical}} &=&
    \begin{cases}
      \sigma^2( 1 - \frac{3}{2} h/\phi + \frac{1}{2}(h/\phi)^3 )  ; &   0 < h <= \phi \\
      0  ; &  h > \phi
    \end{cases}  \\
  C(h)_{\text{Exponential}} &=& \sigma^2 ( \exp(-h/\phi) )   \\
  C(h)_{\text{Gaussian}} &=& \sigma^2 ( \exp(-(h/\phi)^2) ) \\
  C(h)_{\text{Powered exponential}} &=& \sigma^2 ( \exp(-| h/\phi | ^p) ) \\
  C(h)_{\text{Mat\'{e}rn}} &=& \sigma^2 \frac{1}{2^{\nu-1}\Gamma(\nu) } ( \sqrt{2\nu} h/\phi )^\nu \ K_{\nu} ( \sqrt{2\nu} h/\phi  )  .
\end{aligned}$$

At zero distance,
$C(0) = Cov( Y(s), Y(s)) = Var(Y(s)) = \tau^2 + \sigma^2$ (*i.e.*,
global variance), where $\tau$ is the nonspatial error, $\sigma$ is the
spatial error, and $\theta=\{\phi, \nu, p, \dots \}$ are
function-specific parameters including $\phi$ the *range* parameter.
$\Gamma(\cdotp)$ is the Gamma function and $K_{\nu}(\cdotp)$ is the
Bessel function of the second kind with smoothness $\nu$. The latter,
Matérn covariance function is particularly appealing and more frequently
used as the shape of this function is more flexible (Figure
[33](#fig:matern_acf){reference-type="ref" reference="fig:matern_acf"}),
albeit at the cost of an additional parameter (Appendix
[8](#sec:matern){reference-type="ref" reference="sec:matern"}).

![Matérn autocorrelation function, $\rho(h)=C(h)/C(0)$, the covariance
function $C(h)$ scaled by the total variance $C(0)$, for two values of
$\nu$ (dark lines). At $nu=100$, it approaches the Gaussian curve (upper
dark curve on the left side) while at $\nu=0.5$ the curve is exponential
(lower dark curve on the left side). The associated semi-variograms
(scaled to unit variance) $\gamma(h)$ are shown in light stippled lines.
Spatial scale is defined, in this framework, as the distance $h$ at
which the autocorrelation falls to 0.05% (dashed horizontal line)-- in
this example between 2.5 and 3 units, depending upon value of
$\nu$.](/home/jae/bio.data/bio.snowcrab/assessments/common/matern_covariance.pdf){#fig:matern_acf
width="50%"}

The semivariance, more commonly used in geostatistics, is the covariance
reflected on the horizontal axis of the global variance:
$\gamma(h)=C(0)-C(h) = \frac{1}{2} \ \textrm{Var} [ Y(\bm{s}) - Y(\bm{s}')]$.

The **spatial autocorrelation function** is defined as the covariance
function scaled by the global variance: $\rho(h)=C(h)/C(0)$. For the
purposes of this framework, we will define the **spatial scale** to be
the distance at which the spatial autocorrelation decreases
asymptotically to $\rho(x) \rightarrow 0.05$ (\"practical\" range). This
will be determined in modeled form where possible (Equation
[\[eq:spatialModel\]](#eq:spatialModel){reference-type="ref"
reference="eq:spatialModel"}). Where it is not possible, an empirical
estimate will be made derived from the empirical semivariogram. We focus
upon spatial patterns larger than 1 km in resolution and smaller than
the size of study domain, the \"Scotian Shelf Ecosystem\" (SSE).

### Temporal scale {#sec:interpolationTS}

MPAs also exist in a dynamic frame. As such, similar to the above
spatial considerations, there also exists some characteristic temporal
scale upon which an MPA and its subcomponents operate. If the overall
temporal variations of the biota and environment is small relative to
the overall life of an MPA, the chances of the MPA having an influence
upon the species is enhanced. Presumably, the longevity of MPAs will be
long lasting, and so will guarantee some influence, however small that
may be; an effect that would be enhanced if the subject is
shorter-ranged in spatial scales.

Again, similar to the spatial scale case, this also has a simple and
obvious implication in terms of monitoring and assessment. Short-range
variations require higher sampling effort to resolve/understand the
issues and vice-versa.

As the temporal scale is an informative metric for monitoring and
assessment of an MPA, we must be precise in its definition. Similar to
the spatial case, we focus upon how the correlation and variability of
some quantity changes with greater difference in time. The analogue to
the semivariogram in a timeseries context is known as a **cumulative
periodogram**.

A periodogram expresses the amount of variance found at different
wavelengths ($\omega$). It is a discrete sample estimate of the
continuous concept of spectral density $\gamma(t)$:

$$\label{eq:spectraldDensity}
  \gamma(t) = \int_{-1/2}^{1/2} e^{2\pi i \omega t} f(\omega) d \omega.$$

It is easily obtained from a Fast Fourier Transform of any arbitrary
time-series and so the cumulative distribution permits a rapid
identification of the time scale at which correlation drops to some
arbitrary level. To be approximately comparable to the spatial scale, we
define the temporal scale as the time difference by which the Cumulative
Power Spectral Density increases to 95% of the total variance.

If the goal is to resolve short-term processes then sampling must also,
of necessity be more frequent. However, similar to spatial scale issues,
there is a point where there will be diminishing returns for any
increase in the resolution of a temporal signal. It is the intent of
this framework to operate upon timescale of 1 yr or greater. Sub-annual
signals where they are available would be used to decompose the seasonal
signals from the inter-annual signals to avoid bias due to
discretization errors.

### Space-time models {#sec:spacetime}

In reality, spatial and temporal patterns coexist and evolve. They are
correlated processes and as such a challenge to model properly
(\"nonseparable\" -- see below). This renders the independent treatment
and estimation of autocorrelation in time and space problematic.
Nonetheless, new developments in computational methods are bringing such
models within range of use for a framework such as this. This is
primarily due to efficient methods associated with numerical modeling of
Stochastic Partial Differential Equations (SPDEs), especially in
spectral (Fourier) space.

Again, we follow @banerjee2014hierarchical's development of
spatio-temporal models as a simple extension of the spatial regression
model (Equation
[\[eq:spatialModel\]](#eq:spatialModel){reference-type="ref"
reference="eq:spatialModel"}). The observations, $Y(\bm{s},t)$ are
measured in a coordinate space $(\bm{s},t) \in S \in \Re^d \times \Re$
in the domain $S$ of dimensionality $d +1$. The space-time regression
model can then be specified as:

$$\label{eq:spacetimeModel}
  Y(\bm{s},t) = \mu(\bm{s},t) + e(\bm{s},t) ,$$

where, $\mu(\bm{s},t) = x(\bm{s},t)^{T} \beta(\bm{s},t)$ is the mean
process and $e(\bm{s},t)$ the residual error. The parameters $\beta$ of
the spatially referenced predictors $x$ can have variable forms:

-   $\beta(\bm{s},t)$ -- varying in both time and space

-   $\beta(\bm{s})$ -- spatially varying (fixed in time)

-   $\beta(t)$ -- temporally varying (and fixed in space)

-   $\beta$ -- completely fixed (no variation in time and space)

-   $\beta_{s}(\bm{s}) + \beta_{t}(t)$ -- complex, hierarchical (mixed).

The error process can be separated into a spatiotemporally structured
component $\omega$ and an unstructured component $\varepsilon$s:

$$e(\bm{s},t) = \omega(\bm{s},t) +  \varepsilon(\bm{s},t) .$$

The *unstructured* error is usually assumed to be a white error process:
$\varepsilon(\bm{s},t) \sim N(0, \sigma^2_\varepsilon)$. However, the
manner in which the *spatiotemporally structured* error is handled is
not straight-forward:

-   $\omega_s(t)$ -- temporal effects nested in sites (temporal
    evolution at each site, space is not modelled)

-   $\omega_t(\bm{s})$ -- spatial effects nested in time (spatial
    evolution at each time, time is not modelled)

-   $\omega(\bm{s})  \upsilon(t)$ or $\omega(\bm{s}) + \upsilon(t)$ --
    *separable* (structure in space and structure in time are
    independent)

-   $\omega(\bm{s},t)$ -- non-separable (both time and space structure
    evolve in a nonsimple manner).

If spatial and temporal autocorrelation act independently
(\"separable\") then:\
$$\begin{aligned}
  \upsilon(t) &\sim& \text{GP}(0, C(t,t'; \bm{\theta}_t))  \\
  \omega(\bm{s}) &\sim& \text{GP}(0, C(\bm{s},\bm{s}'; \bm{\theta}_s)) .
\end{aligned}$$

The spatial and temporal errors are usually assumed to follow Gaussian
Processes with mean 0 and covariance $C(\cdotp, \cdotp; \bm{\theta})$.
The spatial covariance can be modelled with any spatial form such as:
$C(\bm{s},\bm{s}'; \bm{\theta}_s) = C(h)_{\text{Mat\'{e}rn}}$.
Similarly, the temporal covariance can be formulated as any
autocorrelation model such as:
$C(t,t'; \bm{\theta}_t) = \sigma^2_t \exp(-\phi_t |t-t'|)$, or if
discrete in time:
$\text{AR(1)}: \upsilon(t+1)=\rho_t \upsilon(t) + \eta(t)$ with
$\eta(t) \stackrel{iid}{\sim} N(0,\sigma^2_t)$, *etc*.

While computationally appealing, even in this simple case of
\"separable\" models, an evaluation of the likelihood requires the
inverse $\Sigma^{-1}_{n\times n}$ which happens to scale with $O(n^3)$
operations. This has been a strong bottleneck to further development of
these covariance-based methods in large scaled problems of space and
space-time. Approximations have been suggested to overcome this
crippling numerical problem: modeling the spatial process $\omega(s)$
with a lower dimensional process via kernel convolutions, moving
averages, low rank splines/basis functions and predictive processes
(projection of spatial process onto a smaller subset) ([@solna1996time],
[@wikle1999dimension], [@hung2004decadal], [@xu2005kernel],
[@banerjee2014hierarchical]); approximating the spatial process as a
Markov random field with Laplace and SPDE Approximations [@rinla:2015];
and approximating the likelihood of the spatial-temporal SPDE process
with a spectral domain process [@sigrist2015stochastic].

In this framework, we focus upon @sigrist2015stochastic's approach due
to the more realistic assumption of non-separability of space and time
processes and the high computational performance of operating in
spectral space. Specifically, the space-time error $\omega(\bm{s},t)$ in
Equation
[\[eq:spacetimeModel\]](#eq:spacetimeModel){reference-type="ref"
reference="eq:spacetimeModel"} is formulated as an advection-diffusion
process (SPDE):

$$\label{eq:adevectionDiffsionSPDE}
\frac{\partial}{\partial t} \omega(\bm{s},t) = - \bm{u}^T \nabla \omega(\bm{s},t)
+ \nabla \cdotp \Sigma \nabla \omega(\bm{s},t) - \zeta  \omega(\bm{s},t) + \epsilon(\bm{s},t).$$

Here, $\bm{s}=(x,y)^T \in \Re^2$: $\bm{u}=(u_x, u_y)^T$ parameterizes
the drift velocity (advection);
$\nabla = \Big( \frac{\partial}{\partial x}, \frac{\partial}{\partial y} \Big)^T$
is the gradient operator;
$\nabla \cdotp \bm{F} = \Big( \frac{\partial F_x}{\partial x}, \frac{\partial F_y}{\partial y} \Big)^T$
is the divergence operator for a given vector field
$\bm{F}=(F_x, F_y)^T$; $\Sigma^{-1} = \frac{1}{\phi^{2}_{d} }
  \Big(
  \begin{array}{cc}
  \cos \alpha & sin \alpha \\
  - \gamma \cdot \sin \alpha & \gamma \cdot \cos \alpha
  \end{array}
  \Big)^T
  \Big(
  \begin{array}{cc}
  \cos \alpha & sin \alpha \\
  - \gamma \cdot \sin \alpha & \gamma \cdot \cos \alpha
  \end{array}
  \Big)$ parameterizes the anisotropy in diffusion via ($\gamma > 0$,
$\alpha \in [0,\pi/2]$) with $\phi_d > 0$ parameterizing the diffusion
range; $\zeta > 0$ parameterizing local damping; and
$\epsilon(\bm{s},t)$ parameterizing a Gaussian random field that
accounts for source-sink processes with white noise in time and Matérn
spatial covariance (aka, \"innovation\").

The full advection-diffusion model specification in state space form is
[@sigrist2015stochastic]:

$$\begin{aligned}
    Y(\bm{s},t) &=& x(\bm{s},t)^{T} \bm{\beta} +  \omega(\bm{s},t) + \varepsilon(\bm{s},t) \\
    \omega(\bm{s},t) &=& \bm{\Phi} \bm{\alpha} (\bm{s},t)  \quad \text{\{discretized advection-diffusion process\}}\\
    \alpha (\bm{s},t)&=& \bm{G} \bm{\alpha} (\bm{s},t-1) + \hat{\epsilon}(\bm{s},t)  \quad \text{\{transition model\}} \\
    \varepsilon(\bm{s},t) &\sim& N(\bm{0}, \tau^2 \bm{1} ) \quad \text{\{unstructured error\}}\\
    \hat{\epsilon}(\bm{s},t) &\sim& N(\bm{0}, \bm{\hat{Q}})  \quad \text{\{innovation\}}\\
  
\end{aligned}$$

where, $\bm{\alpha} (\bm{s},t)$ are Fourier coefficients;
$\bm{\Phi}=[ \bm{\phi}(\bm{s}_1), \dots, \bm{\phi}(\bm{s}_N) ]^T$ is a
matrix of spatial basis functions; $\bm{G}$ is the transition matrix;
and $\bm{\hat{Q}}$ is the innovation covariance matrix (residual
errors). See Appendix
[9](#advectionDiffsionSPDEsolution){reference-type="ref"
reference="advectionDiffsionSPDEsolution"} for more details.

Once the form of the space-time model is formulated, it can be used as a
predictive/interpolating method. Such interpolation is required to
describe and understand the linkages between the key ecosystem
attributes of productivity, biodiversity, habitat, and species of
interest as well as to estimate the spatial and temporal scales.

We use an R-package implementation of the above space and space-time
methods that interfaces with the data structures identified in Section
[2](#sec:data){reference-type="ref" reference="sec:data"}, \"lattice
based models\" (*stmv*, <https://github.com/jae0/stmv>) to permit
localised, hierarchical, model-based interpolations, for a given (local)
subdomain indexed by $\lambda$. Note that, $\mu$ indicates a global
regressor in a linear, nonlinear or binomial functional form $f$, and
$\mu_\lambda$ represents a local regressor specific to the subdomain
$\lambda$. The model specifications for each data series are as follows:

-   bathymetry (pure space model): $$\begin{aligned}
        Y_\lambda(\bm{s}) &=& \omega_\lambda(\bm{s}) + \varepsilon_\lambda(\bm{s}) \\
        \omega_\lambda(\bm{s}) &\sim& \textrm{GP}(0, C(\bm{s},\bm{s}'; \bm{\theta}_\lambda))  \\
        \varepsilon_\lambda(\bm{s}) &\sim& \textrm{N}( \bm{0}, \tau_\lambda(\bm{s})^2)
      
    \end{aligned}$$

-   substrate grainsize (space with covariates): $$\begin{aligned}
       Y_\lambda(\bm{s}) &=& \mu(\bm{s}) + \omega_\lambda(\bm{s}) + \varepsilon_\lambda(\bm{s}) \\
       \mu(\bm{s}) &=& f ( \text{ depth, slope, curvature } ) \\
       \omega_\lambda(\bm{s}) &\sim& \textrm{GP}(0, C(\bm{s},\bm{s}'; \bm{\theta}_\lambda))  \\
       \varepsilon_\lambda(\bm{s}) &\sim& \textrm{N}(\bm{0}, \tau_\lambda(\bm{s})^2)
     
    \end{aligned}$$

-   bottom temperature (temporal effects nested in sites):
    $$\begin{aligned}
      Y_\lambda(\bm{s},t) &=& \mu(\bm{s}) + \omega_\lambda(\bm{s}) + \varepsilon_\lambda(\bm{s}) \\
      \mu(\bm{s}) &=& f ( \text{ depth } ) \\
      \omega_\lambda(\bm{s},t) &=& \bm{\Phi}_\lambda \bm{\alpha}_\lambda (\bm{s},t)  \\
      \alpha_\lambda(\bm{s},t)&=& \bm{G}_\lambda \bm{\alpha}_\lambda (\bm{s},t-1) + \hat{\epsilon}_\lambda(\bm{s},t)  \\
      \varepsilon_\lambda(\bm{s},t) &\sim& N(\bm{0}, \tau_\lambda^2 \bm{1} )  \\
      \hat{\epsilon}_\lambda(\bm{s},t) &\sim& N(\bm{0}, \bm{\hat{Q}}_\lambda)
      
    \end{aligned}$$

-   ecosystem indicators (including integrative habitat $H_i$; temporal
    effects nested in sites): $$\begin{aligned}
      Y_\lambda(\bm{s},t) &=& \mu(\bm{s}) + \mu_\lambda(\bm{s},t) + \omega_\lambda(\bm{s}) + \varepsilon_\lambda(\bm{s}) \\
      \mu(\bm{s}) &=& f ( \text{ depth, slope, curvature, substrate grainsize } ) \\
      \mu_\lambda(\bm{s},t) &=& f_\lambda ( \text{ temperature } ) \\
      \omega_\lambda(\bm{s},t) &=& \bm{\Phi}_\lambda \bm{\alpha}_\lambda (\bm{s},t)  \\
      \alpha_\lambda(\bm{s},t) &=& \bm{G}_\lambda \bm{\alpha}_\lambda (\bm{s},t-1) + \hat{\epsilon}_\lambda(\bm{s},t)  \\
      \varepsilon_\lambda(\bm{s},t) &\sim& N(\bm{0}, \tau_\lambda^2 \bm{1} )  \\
      \hat{\epsilon}_\lambda(\bm{s},t) &\sim& N(\bm{0}, \bm{\hat{Q}}_\lambda)
    \end{aligned}$$

-   abundance and functional habitat ($H_f$; temporal effects nested in
    sites): $$\begin{aligned}
      Y_\lambda(\bm{s},t) &=& \mu(\bm{s}) + \mu_\lambda(\bm{s},t) + \omega_\lambda(\bm{s}) + \varepsilon_\lambda(\bm{s}) \\
      \mu(\bm{s}) &=& f ( \text{ depth, slope, curvature, substrate grainsize } ) \\
      \mu_\lambda(\bm{s},t) &=& f_\lambda ( \text{ temperature, ecosystem indicators } ) \\
      \omega_\lambda(\bm{s},t) &=& \bm{\Phi}_\lambda \bm{\alpha}_\lambda (\bm{s},t)  \\
      \alpha_\lambda (\bm{s},t) &=& \bm{G}_\lambda \bm{\alpha}_\lambda (\bm{s},t-1) + \hat{\epsilon}_\lambda(\bm{s},t)  \\
      \varepsilon_\lambda(\bm{s},t) &\sim& N(\bm{0}, \tau_\lambda^2 \bm{1} )  \\
      \hat{\epsilon}_\lambda(\bm{s},t) &\sim& N(\bm{0}, \bm{\hat{Q}}_\lambda)
    \end{aligned}$$

Completed examples of the above methods can be seen in Maritimes Region
snow crab assessments [@ref:snowcrabAssessment2016].

### Tagging, mark-recapture

A tangible way of quantifying time and space scales (connectivity) is to
demonstrate movement and genetic similarity. In the latter, no effort
has been made. In the former, due to synergies with the fishing
industry, increased tagging efforts have been made in the vicinity of
SAB. Most of the effort has been driven by industry, Ocean Tracking
Network (OTN), and Emera interest in snow crab movement near SAB (see
Section [\[se:snowcrab\]](#se:snowcrab){reference-type="ref"
reference="se:snowcrab"}). However, acoustic tagging of other species of
interest have been completed as well. In total, 80 tags were deployed:
58 cod, 14 Atlantic Striped Wolffish, 1 Shorthorn Sculpin and 7 Snow
crab. These tags will allow us to track these species over the coming
years within the MPA (through the two existing receiver lines) as well
as outside the MPA with other OTN receiver lines and potentially with an
OTN glider; and help define the spatial connectivity and range of the
species of interest. The intent is to develop movement models where
possible and estimate spatial range directly.

Mark-recapture information for sea turtles, seals, sharks and various
other species exist in the area. These data have not been examined nor
are they always available and represent a data gap at present.

## Risk modeling {#sec:riskapproach}

Risk means many things to many people. We use the term specifically in
the sense of having a believable error distribution for some quantity of
interest such that probabilistic inferences can be made. Once the error
distributions are determined, it is simple to make probablity statements
related to how likely the current state is different from some previous
state or arbitrary threshold.

The estimation of such error distributions requires a reliable method to
propagate the errors from observations to predictions. One venerable
(**deterministic**) method is to build a mechanistic model and then
using approximations or simulations to determine the error distributions
of interest. A second (**phenomenological**) method empirically
quantifies the errors and propagates them via statistical/correlational
methods. The latter is chosen in this framework as it is very general
and simple to implement. The former is not chosen as no operating model
of an ecosystem nor any subcomponent is known to the authors that can be
said to be able to perform with sufficient skill to be able to propagate
errors, let alone, magnitudes.

The proposed approach is to use the discrete form of the logistic
equation for this purpose. Verhulst, Pearl and Lotka in the late 1800s
and early 1900s popularized this equation, using it to describe patterns
of asymptotic increase (population growth, economic growth, etc). The
model is sufficiently general that it can be readily applied most
quantities of interest that show some dynamic behaviour, such as, for
example: aggregate estimates of biomass (productivity), biodiversity
(biodiversity change), habitat (habitat change). Similar techniques can
be applied to the other indicators of interest and may be applied
depending upon availability of time. The justification of why it can be
so generally applied is developed in
Appendix [10](#sec:logisticModel){reference-type="ref"
reference="sec:logisticModel"}.

The discrete form the basic logistic equation is, after normalization to
$K$, the \"carrying capacity\" (see
Appendix [10](#sec:logisticModel){reference-type="ref"
reference="sec:logisticModel"}):

$$\label{eqLogisticDiscrete}
y_t  \approx r y_{t-1} (1 - y_{t-1} ).$$

Perhaps the most powerful and flexible method of estimation of the
parameters, $\theta=\{r,K\}$, is a state space representation where an
additional observation model is added to connect observed indices $O$ to
the unobserved and (usually unobservable) real system state $y$. The
simplest such model is a linear scaling factor, $q$, though again others
are possible, at the cost of more complexity:

$$\label{eqLogisticDiscreteStateSpace}
O_t = q y_t$$

where, $\theta=\{r,K,q\}$.

The use of a Bayesian approach to solve the above nonlinear state space
problem (Eqs.
[\[eqLogisticDiscrete\]](#eqLogisticDiscrete){reference-type="ref"
reference="eqLogisticDiscrete"},
[\[eqLogisticDiscreteStateSpace\]](#eqLogisticDiscreteStateSpace){reference-type="ref"
reference="eqLogisticDiscreteStateSpace"}) is frequently used as it
provides an opportunity to: have greater numerical stability;
incorporate prior scientific knowledge in a formal manner; realistically
propagate credible errors; estimate unobserved (\"true\") states; and
simultaneously estimate model \"process\" errors and data
\"observation\" errors. \[Note that process errors ($\sigma^2_p$) are
the uncertainties that feeds back into future states via error
propagation -- e.g., via the recursive form of the logistic equation
(i.e., errors in $y_{t+1}$ in the state space of $y_t$ vs $y_{t+1}$).
They are important if predictive risk is being assessed. Observation
errors ($\sigma^2_o$) refer to the uncertainties associated with
measurement and observation (i.e., measurement/data-related errors of
both variables in the state space of $y_t$ vs $y_{t+1}$).\]

This latter ability is particularly important as parameter estimates and
forecasts based on observation-only errors provide unrealistically
optimistic (small and constant) error bounds; and parameter estimates
and forecasts based on process-only errors expand rapidly into the
future, resulting in potentially unrealistically pessimistic (large and
usually growing) error bounds.

The posterior distribution of the parameters of interest, $\theta$,
conditional upon the data were estimated via MCMC (Gibbs) sampling using
the JAGS platform [@Plummer03jags]. The JAGS model used for parameter
estimation can be found at:
<https://github.com/jae0/aegis/blob/master/inst/mpa.r>

## Anthropogenic Threats

Productivity, habitat and biodiversity monitoring is essential if one is
to assess if MPAs are achieving their primary objectives. It is also
essential to examine the anthropogenic threats in the St. Anns bank area
and examine the cumulative impacts on productivity, habitat,
biodiversity, and endangered or threatened species. From the data
available we can examine trawling and dredging disturbances,
exploitation of marine resources by fisheries, fishing-gear entanglement
threats to marine mammals and sea turtles, and vessel collision threats
due to marine traffic, and vessel-noise disturbances. Each threat can be
normalised on a zero-one scale to compare the intensity of threats
across the region and then weighted and combined to examine cumulative
anthropogenic threats as in @coll:2012:mediterranean.

# Results {#sec:results}

Most analyses have not been completed. The effort so far has been to
assimilate and develop the scaffolding to support the analyses and
future monitoring and assessment. These headings are here mostly as
place holders. However, some preliminary results can be reported upon to
show direction. We highlight a few of these results but emphasize their
very preliminary nature.

## Biodiversity

No analytical results are available for presentation at this time.

## Productivity

At present, only the models for snow crab have been completed using this
method (Figure [34](#fig:snowcrabAbundance){reference-type="ref"
reference="fig:snowcrabAbundance"}; see [@choi:2012:resdoc] for more
details).

![Predicted biomass density of snow crab in Maritimes Region based upon
a combination of a Functional-habitat method and simple spatial
interpolation.](/home/jae/bio.data/bio.snowcrab/R/gam/maps/prediction.abundance.mean.R0.mass.2010.png){#fig:snowcrabAbundance
width="60%"}

## Habitat

### Functional Habitat

At present, only the models for snow crab have been completed using this
method (Figure [35](#fig:snowcrabHabitat){reference-type="ref"
reference="fig:snowcrabHabitat"};
[36](#fig:snowcrabHabitatTS){reference-type="ref"
reference="fig:snowcrabHabitatTS"}; see [@choi:2012:resdoc] for more
details).

![**Function habitat** $H_f$, the predicted probability of observing
snow
crab.](/home/jae/bio.data/bio.snowcrab/maps/snowcrab.large.males_presence_absence/snowcrab/annual/snowcrab.large.males_presence_absence.mean.2016.png){#fig:snowcrabHabitat
width="60%"}

![Surface area of potential Functional habitat $H_f$ of snow crab in
Maritimes
Region.](/home/jae/bio.data/bio.snowcrab/assessments/2016/timeseries/interpolated/snowcrab.habitat.sa.png){#fig:snowcrabHabitatTS
width="50%"}

### Integral Habitat

An example of **Integral habitat** ($H_i$) as expressed through an
ordination of taxa found together in various bottom trawls
(Figures [37](#fig:speciesCompostionMap){reference-type="ref"
reference="fig:speciesCompostionMap"},
[38](#fig:speciesCompostionMapPCA){reference-type="ref"
reference="fig:speciesCompostionMapPCA"}).

![Integral habitat ($H_i$) based upon species composition variations.
Note the first (left) is primarily a temperature gradient and the second
(right) is a depth-related gradient in taxonomic
composition.](/home/jae/bio.data/aegis/oneoffs/ca.png){#fig:speciesCompostionMap
width="100%"}

![Integral habitat ($H_i$) based upon species associations in Maritimes
Region. Based upon Correspondence Analysis. Note the first axis is
primarily a temperature gradient as was found in Figure
[37](#fig:speciesCompostionMap){reference-type="ref"
reference="fig:speciesCompostionMap"} (but with colour scale being
inverted).](/home/jae/bio.data/aegis/speciescomposition/maps/pca1/SSE/climatology/pca1.mean.climatology.png){#fig:speciesCompostionMapPCA
width="50%"}

## Connectivity

### Spatial scale {#spatial-scale}

This is a first attempt at describing the spatial scale of SAB and
outlying areas. Essentially, $S_s$ represents the distance one must walk
before one loses memory of where one started (arbitrarily defined at the
5% level of autocorrelation). Using this level of similarity as the
standard, depth variations are demonstrably patchy/clustered
([39](#fig:spatialrangeBathy){reference-type="ref"
reference="fig:spatialrangeBathy"}). In the SAB area, there is a mixture
of large autocorrelation scales (exp(6)=400 km) in the north-east areas,
while the south-west areas have spatial scales of approximately 20 km or
less.

![First estimate of log(spatial range; km) based upon depth
variations.](/home/jae/bio.data/aegis/oneoffs/range.bathy.jpg){#fig:spatialrangeBathy
width="30%"}

Recall that, if $S_s$ is small then short-range processes dominate
(e.g., less mobile species, weakly dispersing, low currents, habitat
heterogeneity at small scales). If $S_s$ is large then broader/larger
processes were influencing the productivity of the species (e.g., higher
mobility or dispersal processes/current, and stronger spatial
connectivity, habitat heterogeneity at larger scales).

As an another example, snow crab densities suggest different spatial
autocorrelation patterns (Figure
[40](#fig:spatialrangeSnowcrab){reference-type="ref"
reference="fig:spatialrangeSnowcrab"}), with the majority of core
fishing grounds being in the range of 60-90 km in length scale. In the
vicinity of SAB, these spatial scales decline to about 10-60 km.

![A first estimate of $log_e$(spatial range; km) of snow crab abundance
variations.](/home/jae/bio.data/bio.snowcrab/maps/snowcrab.large.males_abundance/snowcrab/climatology/snowcrab.large.males_abundance.range.png){#fig:spatialrangeSnowcrab
width="65%"}

### Temporal scale {#temporal-scale}

Similar to spatial scale, we have defined temporal scale ($S_t$) as the
time required to reach a state where autocorrelation drops to an
insignificant level (5%). Recall that if $S_t$ is small, short-range
variations dominate (higher sampling effort to resolve/describe). If
$S_t$ is large, long-range variations dominate (lower sampling effort
required to resolve/describe). No analytical results are available for
presentation at this time.

### Tagging

No analytical results are available for presentation at this time beyond
the overviews in: <http://www.enssnowcrab.com/mpa/mpatows.kmz>

# Discussion {#sec:discussion}

No discussions are forthcoming until more analysis can be completed.

# Conclusions and Recommendations {#sec:conclusions}

This report was an exercise in demonstrating what is available and
possible. All methods discussed are viable and informative and so should
serve as a strong basis for any future monitoring framework in SAB and
MPAs in general.

# Acknowledgements {#acknowledgements .unnumbered}

We highlight the invaluable assistance of a great number of scientists
that have been part of the various surveys that inform this document.
This report could not have been completed without their guidance and
assistance: Shelley Bond (DataShop), Carla Caverhill, George White
(Remote Sensing Group), Catherine Johnson, Benoit Casault (Atlantic Zone
Monitoring Progarm), Ben Zisserson, Brent Cameron, snow crab industry
(snow crab survey), Scott Wilson, Bill MacEachern, Don Clark (groundfish
survey), Dale Roddick (clam survey), Vladimir Kostelev, Charles Hannah
(substrate grain size), Canadian Hydrographic Service (bathymetry data),
Roger Pettipas (Ocean Sciences, ocean temperature data), Robert Grandy,
Greg Croft and Krista Wry (Commercial Data Division) and Tanya
Koropatnick and Norman Cochrane (vessel data).

::: appendices
# Data quality control of AZMP data

All data extraction, quality control and processing methods are
documented in R scripts found in https://github.com/jae0/aegis/.

## Discrete bottle data

BioChem data are generally not subject to any quality control (QC). As
such, substantial QC was required. The QC protocol used was based on
procedures designed at DFO's Institut Maurice-Lamontagne (IML). These
were in turn was based on procedures developed by NOAA's National
Oceanographic Data Center/World Ocean Database (Conkright *et al*. 2002)
as well as many of the tests proposed in the GTSPP Real-Time Quality
Control Manual (Unesco 1990). The quality control procedure was as
follows:

**Step 1: Impossible dates**

Due to known issues with dates, database query for nutrients and
chlorophyll were designed to extract records for which the sampling date
is within start and end dates of the mission. Another check includes
comparing HEADER_START and EVENT_START dates which should be the same.
It is often found that month and day were reversed in EVENT_START field.
Those records were retained and HEADER_START was used as a more reliable
date.

**Step 2: Quality control flags**

Small number of records in BioChem was subject to quality control and
include flags for position (POSITION_QC_CODE) and data (DATA_QC_CODE).
The meaning of the codes are as follows:

  --- --------------------------------------------
  0   No quality control performed
  1   Value appears correct
  2   Value appears inconsistent
  3   Value appears doubtful
  4   Value appears erroneous
  5   Value changed as result of quality control
  --- --------------------------------------------

QC flags were checked for parameter and inconsistent (2), doubtful (3)
and erroneous (4) values were removed from the dataset.

**Step 3: Depth check**

For bottle data, start and end depth at which the water samples were
collected are verified to be the same. Records with different start and
end depths were removed from the dataset.

**Step 4: Duplicated records**

BioChem often contains duplicated records as same data was sometimes
loaded into database twice and treated as different records. Duplicated
records were removed and the first record of each duplicate is kept in
the dataset.

**Step 4: Suspect missions**

Missions with suspect data were identified and removed. Those missions
often show unusual data values (for example, integer numbers without
decimal places with only some values out of range) suggesting that the
data for the whole mission might be compromised. The suspect mission for
each parameter are following:

  --------------- ----------------------
  Chlorophyll-a   OC7908, 32G879008
  Phosphate       18HU88026
  Silicate        180167005, 31TR26870
  --------------- ----------------------

**Step 5: Global impossible parameter values**

Chlorophyll and all nutrients values were examined if they fell within
expected limits for NW Atlantic, which are adopted from IML quality
control procedure (IML Test 2.1). The expected range of values are:

-   Chlorophyll-a: 0-50 mg/m^3^

-   Nitrate: 0-515 mmol/m^3^

-   Phosphate: 0-4.5 mmol/m^3^

-   Silicate: 0-250 mmol/m^3^

Any values outside of expected range were removed for open ocean data
only. Coastal data ( up to 5km from the coast) were not filtered using
expected ranges as in coastal water chlorophyll-a and nutrients
concentrations can be higher.

**Step 6: Profile envelope**

Data for each parameter are checked if they fall within the expected
limits by depth interval, as shown in
Table [1](#table:BioChemQC){reference-type="ref"
reference="table:BioChemQC"} (IML Test 2.4). This test does not allow
zero values for silicate and phosphate in the deep water. Again, only
open ocean data were subject to the profile envelope test.

[]{#table:BioChemQC label="table:BioChemQC"}

::: {#table:BioChemQC}
  Parameter       Depth interval   Expected Range
  --------------- ---------------- -----------------------
  Chlorophyll-a   0-1500 m         0-50 mg/m$^{3}$
  Silicate        0-150 m          0-250 mmol/m$^{3}$
  Silicate        150-900 m        0.01-250 mmol/m$^{3}$
  Phosphate       0-500 m          0-4.5 mmol/m$^{3}$
  Phosphate       150-1500 m       0.01-4.5 mmol/m$^{3}$
  Nitrate         0-1500 m         0-515 mmol/m$^{3}$

  : Expected ranges of parameters for the profile envelope test (IML
  Test 2.4)
:::

**Step 7: Impossible profiles**

This check was not implemented in the code and impossible profiles were
identified by investigating unusual outliers.

Additional steps from IML QC procedure such as checks for constant
profile, excessive gradient and inversions were not implemented in this
quality control procedure. However, due to eutrophication from
terrestrial sources, phosphate levels in coastal regions often exceeded
the upper limits for globally and locally possible values, with the
phosphate concentrations sometimes six times higher than the upper
limits for the NW Atlantic in offshore waters. Therefore coastal and
open ocean data were examined separately, non-coastal data were filtered
using the expected limits for the NW Atlantic. Coastal data were defined
as the ones collected less than 5 km away from the coast, where 5 km
limit was chosen as an optimal distance at which all coastal inlets are
included. Buffer polygons along the coastline were created
(Figure [41](#fig:aoiBuffer){reference-type="ref"
reference="fig:aoiBuffer"}) and used for flagging the data as open ocean
records (flag 1) and coastal records (flag 2).

![Polygons used for separation of coastal and ocean data, arbitrarily
assumed to be a 5 km buffer from the
coastline.](/home/jae/bio.data/aegis/mpa/sab/26.png){#fig:aoiBuffer
width="75%"}

## Chlorophyll-a

Chlorophyll-a data are derived from four methods. The methods are listed
and described in Table [2](#table:ChlaMethods){reference-type="ref"
reference="table:ChlaMethods"} and the aggregate time series associated
with each method is shown in
Figure [42](#fig:ChlaTimeseries){reference-type="ref"
reference="fig:ChlaTimeseries"}. For most of the chlorophyll data the
method is not specified (unknown); Holm-Hansen fluorometric method is
the standard AZMP method and is the second most frequent; Welschmeyer
fluorometric method is used least frequently, often by the Quebec and
Newfoundland regions.

In a number of cases, the same water sample was processed using two
different methods, resulting in two sets of chlorophyll estimates for
the same samples. Comparisons between these two sets of values are shown
in Figure [43](#fig:ChlaComparison){reference-type="ref"
reference="fig:ChlaComparison"}. In both cases chlorophyll-a estimated
by the Welschmeyer method are lower than the ones using the Holm-Hansen
method or \"unknown\" method. Since there is more data mapped to the
Holm-Hansen method than to the Welschmeyer method, only data derived
from Chl_a and Chl-a_Holm_Hansen_sF methods were retained. No
corrections were applied to correct for differences in methodology.

[]{#table:ChlaMethods label="table:ChlaMethods"}

::: {#table:ChlaMethods}
  Method                 Description
  ---------------------- ----------------------------------------------------------------
  Chl_a                  Unknown method
  Chl_a_Holm-Hansen_F    Holm-Hansen method; Prefiltered; Frozen before analysis (-20 )
  Chl_a_Holm-Hansen_sF   Holm-Hansen method ; Super Frozen before analysis (-196 )
  Chl_a_Welschmeyer_sF   Welschmeyer method; Super Frozen before analysis (-196 )

  : Methods associated with chlorophyll-a records in BioChem.
:::

![Time series of chlorophyll-a data from BioChem grouped by
methods.](/home/jae/bio.data/aegis/mpa/sab/27.png){#fig:ChlaTimeseries
width="80%"}

<figure id="fig:ChlaComparison">
<table>
<tbody>
<tr class="odd">
<td style="text-align: center;"><img
src="/home/jae/bio.data/aegis/mpa/sab/28.png" style="width:50.0%"
alt="image" /> <img src="/home/jae/bio.data/aegis/mpa/sab/29.png"
style="width:50.0%" alt="image" /></td>
<td style="text-align: center;"></td>
</tr>
</tbody>
</table>
<table>
<tbody>
<tr class="odd">
<td style="text-align: center;"><img
src="/home/jae/bio.data/aegis/mpa/sab/30.png" style="width:50.0%"
alt="image" /> <img src="/home/jae/bio.data/aegis/mpa/sab/31.png"
style="width:50.0%" alt="image" /></td>
<td style="text-align: center;"></td>
</tr>
</tbody>
</table>
<figcaption>Comparison of the chlorophyll-a values collected using
different methods is shown on the scatter plots on the top panel and the
geographical locations of those samples is shown on the maps in the
bottom panel.</figcaption>
</figure>

## Nitrate

Nitrate estimates are derived from 10 methods. The methods are listed
and described in Table [3](#table:Nmethods){reference-type="ref"
reference="table:Nmethods"} and the time series of data associated with
each method is shown in
Figure [44](#fig:NTimeseries){reference-type="ref"
reference="fig:NTimeseries"}. Most of the methods measure nitrate and
nitrite together. We also included data for nitrate only since in most
seawater the concentration of nitrite is small compared to that of
nitrate.

::: {#table:Nmethods}
  Method            Description
  ----------------- -------------------------------------------------------------
  NO2NO3_0          Nitrate+Nitrite / Unknown method
  NO2NO3_Alp_F      Nitrate+Nitrite / Alpchem / Frozen
  NO2NO3_Alp_SF     Nitrate+Nitrite / Alpchem / SuperFrozen
  NO2NO3_S&P1968    Nitrate+Nitrite/ S&P(1968) / filtered and frozen
  NO2NO3_Tech_F     Nitrate+Nitrite / Technicon / Frozen
  NO2NO3_Tech_Fsh   Nitrate + Nitrite / Technicon / Fresh / Strain / Unfiltered
  NO2NO3_Tech_SF    Nitrate+Nitrite / Technicon / SuperFrozen
  NO2NO3_Tech2_F    Nitrate+Nitrite / Technicon2 / Frozen
  NO3_Tech_F        Nitrate / Technicon / Frozen, corrected for NO2
  NO3_Tech_SF       Nitrate / Technicon / SuperFrozen

  : Methods associated with nitrate records in BioChem.
:::

![Time series of nitrate data from BioChem grouped by
methods.](/home/jae/bio.data/aegis/mpa/sab/32.png){#fig:NTimeseries
width="80%"}

## Phosphate

Phosphate data available in BioChem are mapped to 7 methods. The methods
are listed and described in
Table [4](#table:PhosphateMethods){reference-type="ref"
reference="table:PhosphateMethods"} and the time series of data
associated with each method is shown in
Figure [45](#fig:PhosphateTimeseries){reference-type="ref"
reference="fig:PhosphateTimeseries"}.

::: {#table:PhosphateMethods}
  Method         Description
  -------------- -----------------------------------------------------
  PO4_0          Phosphate / Unknown method
  PO4_Alp_SF     Phosphate / Alpchem / SuperFrozen / Filtered
  PO4_Tech_2     Phosphate / Murphy and Riley / filtered and frozen
  PO4_Tech_F     Phosphate / Technicon / Frozen / Unfiltered
  PO4_Tech_Fsh   Phosphate / Technicon / Fresh / Strain / Unfiltered
  PO4_Tech_SF    Phosphate / Technicon / SuperFrozen / Filtered
  PO4_Tech2_F    Phosphate / Technicon2 / Frozen / Unfiltered

  : Methods associated with phosphate records in BioChem.
:::

![Time series of phosphate data from BioChem grouped by
methods.](/home/jae/bio.data/aegis/mpa/sab/33.png){#fig:PhosphateTimeseries
width="100%"}

## Silicate

Silicate data available in BioChem are mapped to 8 methods
(Table [5](#table:SilicateMethods){reference-type="ref"
reference="table:SilicateMethods"}). Their time series of are shown on
Figure [46](#fig:silicateTimeseries){reference-type="ref"
reference="fig:silicateTimeseries"}.

[]{#table:SilicateMethods label="table:SilicateMethods"}

::: {#table:SilicateMethods}
  Method          Description
  --------------- -----------------------------------------------------
  SiO4_0          Silicate, Unknown methods and handling
  SiO4_1          Silicate / Mullin and Riley / filtered and frozen
  SiO4_Alp_F      Silicate / Alpchem / Frozen / Unfiltered
  SiO4_Alp_SF     Silicate / Alpchem / SuperFrozen / Filtered
  SiO4_Tech_F     Silicate / Technicon / Frozen / Strain / Unfiltered
  SiO4_Tech_Fsh   Silicate / Technicon /Fresh /Strain / Unfiltered
  SiO4_Tech_SF    Silicate / Technicon / SuperFrozen / Filtered
  SiO4_Tech2_F    Silicate / Technicon2 / Frozen

  : Methods associated with silicate records in BioChem.
:::

![Time series of silicate data from BioChem grouped by
methods.](/home/jae/bio.data/aegis/mpa/sab/34.png){#fig:silicateTimeseries
width="100%"}

## Zooplankton

Zooplankton data was extracted from DFO's BioChem database
([@DFO:2014:biochem]) from 1914 to 2014. They were comprised of 687
missions and 53,787 samples, using 13 different kind of nets, 35
different mesh sizes ranging from 20 microns to 4.23 mm, and various net
deployment and sample processing protocols. To ensure data consistency
and comparability, only samples collected and analyzed using Atlantic
Zone Monitoring Program (AZMP) protocol (Mitchell *et al*. 2002) were
retained for study, reducing the time scope to 1999-2014.

As AZMP samples are not always properly flagged in the BioChem database,
a list of missions that followed the AZMP protocol were provided by
Ocean and Ecosystem Science Division (OESD) and Ocean Data and
Information Services (ODIS). The relevant missions include AZMP spring
and fall cruises, summer and winter groundfish survey missions,
bi-weekly sampling at fixed stations (Halifax Station 2 and Prince 5)
and samples collected on the Scotian Shelf during Labrador Sea missions.

AZMP protocol samples zooplankton with Ring nets (0.75 m diameter,mesh
size of 202 um) deployed as vertical tows from either near bottom or
1000 m (whichever is shallower) to the surface. The sample analysis
includes estimation of abundance, species composition and biomass in
terms of wet and dry weight in two size fractions; one for organisms
ranging from 0.2 mm to 10 mm in size and the other for all organisms
larger than 10 mm. The protocol is as follows:

-   Organisms larger than 10 mm are manually separated from the sample,
    identified and counted. Wet weight is determined and reported for
    each individual species. In addition total wet weight for all large
    organisms is reported as the sum of all individual wet weights.

-   Captured organisms smaller than 10 mm (0.2 - 10 mm fraction), are
    identified and counted. Dry and wet weight is determined and
    reported for the whole sample, containing all organisms in that size
    fraction.

-   Total wet weight is reported for all captured organisms as the sum
    of wet weights of large and small organisms.

-   Developmental stages are identified for *Calanus finmarchicus*, *C.
    glacialis* and *C. hyperboreus*.

Since the data hosted in BioChem is generally not subject to quality
control and can contain erroneous records substantial quality control
was conducted to ensure correct representation of actual measurements.
The quality control included verification of the following fields:

-   time stamps: comparing mission dates with header dates and event
    dates start and end depths of the nets that cannot be equal or close
    together

-   volume of the samples: all records with volumes 0, or NA were
    removed

-   split fraction of the sample: all the records with split fraction
    NA, 0 or $>$ 1 were removed

-   minimum and maximum sieve for dry weight records: records NA sieve
    were removed

-   repeated records

Finally the numerical and biomass density for each species per unit
surface area of a tow was computed as follows: $$\begin{aligned}
\text{abundance} &=& \text{counts} \times \frac{  abs( \text{depth}_{\text{start}} - \text{depth}_{\text{end}} ) } { \text{split fraction} \times \text{volume} } \; \; [\text{individuals}/ \text{m}^{2} ]  \\
\text{biomass} &=& \text{weight} \times \frac{ abs( \text{depth}_{\text{start}} - \text{depth}_{\text{end}} )} { \text{split fraction} \times \text{volume}} \; \; [\text{g}/\text{m}^2],
\end{aligned}$$

where counts refer to number of organisms encountered in the sample,
$\text{depth}_{\text{start}}$ and $\text{depth}_{\text{end}}$ to the
start and end depth of the net deployment, split fraction to the
fraction of the sample analyzed and volume to the sample volume. The
final filtered dataset includes 126 missions in the time period 1999 to
2014, with 2,367 net deployments and more than 400 taxonomic species.

# Matérn function {#sec:matern}

The Matérn *correlation* function (Figure
[33](#fig:matern_acf){reference-type="ref" reference="fig:matern_acf"})
is parameterised in several ways and nomenclature of variables have also
been inconsistent and can potentially cause confusion. The geoR library
[@diggle:2007; @ribeiro:2001] defines it as:

$$\rho(x) = \frac{1}{2^{\kappa-1} \Gamma(\kappa)}
    {\left( \frac{x}{\phi} \right)  }^{\kappa} K_{\kappa}\left( \frac{x}{\phi} \right),$$

where, $\phi > 0$ is the \"range parameter\"; $\kappa > 0$ is the shape
(smoothness) parameter; $K_{\kappa}()$ is the modified Bessel function
of the third kind of order $\kappa$; and $\Gamma()$ is the Gamma
function. It is also related to the fractal dimension of the surface
complexity ([@Schepers:2002:fractals; @constantine:1994]).

spBayes's [@finley:2007] parameterization just a little different as
well as is the nomenclature:

$$\rho(x) = \frac{ 1 }{ 2^{\nu-1} \; \Gamma(\nu) }  \left( \phi x \right) ^{\nu} K_{\nu} \left( \phi x  \right).$$

INLA's [@rinla:2015] parameterization is the same as spBayes', but
nomenclature is slightly different again:

$$\rho(x) = \frac{ 1 }{ 2^{\lambda-1} \; \Gamma(\lambda) }  \left( \kappa x \right) ^{\lambda} K_{\lambda} \left( \kappa x  \right) .$$

Thus, the following identities are important to interpret the
discussions and outputs from these authors:

$$\begin{aligned}
  \kappa_{geoR} &\equiv& \nu_{spBayes}  \equiv  \lambda_{INLA} \\
  1/\phi_{geoR} &\equiv& \phi_{spBayes} \equiv \kappa_{INLA}.
\end{aligned}$$

Additionally, INLA defines $range_{13\%} = \sqrt{8 \lambda} / \kappa$.
The following adopts the notation used by INLA.

The Matérn *covariance* function, $\gamma(x)$ is the correlation
function $\rho(x)$ scaled by the variance. An offset of $\tau^2$ the
variability at local scales associated with sampling error smaller than
the unit of measurement (sometimes called \"nugget\" variance) is also
modeled:

$$\gamma(x) = \tau^2 + \sigma^2 ( 1- \rho(x)) .$$

When $\nu_{spBayes} = 1/2$, this become the exponential model. When
$\nu_{spBayes}  \rightarrow \infty$, the model becomes the Gaussian
model. The curves become only incrementally different once
$\nu_{spBayes} > 2$ and so @finley:2007 suggests limiting the prior to
the interval (0,2) as a pragmatic solution to speeding up MCMC
convergence. We have used the interval $\nu_{spBayes}= (0,5)$, just to
be sure.

Further, the effective range of spatial dependence (distance at which
the correlation drops to 0.05 is given by $-ln(0.05)/\phi_{spBayes}$
[@finley:2007]. As such, they recommend a uniform prior in the interval
of ($\phi_{spBayes}, -ln(0.05)$).

The spatial scale we define as exactly this practical or effective
spatial range: the distance at which spatial dependence drops
asymptotically to $\rho(x) \rightarrow 0.05$. To clarify, it should be
noted that INLA defines this effective range at
$\sqrt{8}/\phi_{spBayes}$ which is the approximate distance where the
correlation falls to 0.13 (vs 0.05) because of eq.
[\[eq:inlaRange\]](#eq:inlaRange){reference-type="ref"
reference="eq:inlaRange"}.

This Matérn covariance happens to be the stationary solution to the
SPDE:

$$(\kappa^2 - \Delta)^{\alpha/2} ( \tau \xi(s)) = W(s),$$

where $W(s)$ is Gaussian spatial white noise and $\tau$ controls the
variance and $\kappa$ is the scale parameter. More precisely,

$$\begin{cases}
    \lambda  &=  \alpha - d/2 \\
    \sigma^2 &=  \frac{\Gamma(\lambda)}{\Gamma(\alpha)(4\pi)^{d/2}{\kappa}^{2\lambda} \tau^2 },
  \end{cases}$$

which for d=2 dimensions:

$$\begin{cases}
\lambda  &=  \alpha - 1 \\
\sigma^2 &=  \frac{\Gamma(\lambda)}{\Gamma(\alpha)(4\pi){\kappa}^{2\lambda} \tau^2 },
\end{cases}$$

and $\alpha=2$ by default and so $\lambda=1$ such that:

$$\label{eq:inlaRange}
\begin{cases}
  range    &=  \sqrt{8} / \kappa \\
  \sigma^2 &=  \frac{1}{4 \pi \kappa^2 \tau^2 },
\end{cases}$$

$$\begin{aligned}
\text{range} = \sqrt{8} / \kappa .
\end{aligned}$$

# Advection-diffusion Stochastic Partial Differential Equation (SPDE) {#advectionDiffsionSPDEsolution}

Following the development of @sigrist2015stochastic, we being with the
general regression model

$$Y(\bm{s},t) = \mu(\bm{s},t) + e(\bm{s},t) ,$$

where, $\mu(\bm{s},t) = x(\bm{s},t)^{T} \beta(\bm{s},t)$ is the mean
process and $e(\bm{s},t)$ the residual error. This error process can be
separated into a spatiotemporally structured component $\omega$ and an
unstructured component $\varepsilon$:
$e(\bm{s},t) = \omega(\bm{s},t) +  \varepsilon(\bm{s},t)$. The
*unstructured* error is usually assumed to be a white error process:
$\varepsilon(\bm{s},t) \sim N(0, \sigma^2_\varepsilon)$.

The structured error $\omega(\bm{s},t)$ can be defined in terms of the
following advection-diffusion SPDE:

$$\frac{\partial}{\partial t} \omega(\bm{s},t) = - \bm{u}^T \nabla \omega(\bm{s},t)
+ \nabla \cdotp \Sigma \nabla \omega(\bm{s},t) - \zeta  \omega(\bm{s},t) + \epsilon(\bm{s},t),$$

where, $\bm{s}=(x,y)^T \in \Re^2$: $\bm{u}=(u_x, u_y)^T$ parameterizes
the drift velocity (advection);
$\nabla = \Big( \frac{\partial}{\partial x}, \frac{\partial}{\partial y} \Big)^T$
is the gradient operator;
$\nabla \cdotp \bm{F} = \Big( \frac{\partial F_x}{\partial x}, \frac{\partial F_y}{\partial y} \Big)^T$
is the divergence operator for a vector field $\bm{F}=(F_x, F_y)^T$;
$\Sigma^{-1} = \frac{1}{\phi^{2}_{d} }
\Big(
\begin{array}{cc}
\cos \alpha & sin \alpha \\
- \gamma \cdot \sin \alpha & \gamma \cdot \cos \alpha
\end{array}
\Big)^T
\Big(
\begin{array}{cc}
\cos \alpha & sin \alpha \\
- \gamma \cdot \sin \alpha & \gamma \cdot \cos \alpha
\end{array}
\Big)$ parameterizes the anisotropy in diffusion via ($\gamma > 0$,
$\alpha \in [0,\pi/2]$) with $\phi_d > 0$ parameterizing the diffusion
range; $\zeta > 0$ parameterizing local damping; and
$\epsilon(\bm{s},t)$ parameterizing a Gaussian random field that
accounts for source-sink processes with white noise in time and Matérn
spatial covariance (aka, \"innovation\").

If $\epsilon(\bm{s},t)$ is stationary and has the form of a Whittle
spatial covariance function, then it has the following spectrum:

$$\tilde{f}(\bm{k}) = \frac {\sigma^2} {(2 \pi)^2}
\Bigg(
\bm{k}^T\bm{k} + \frac{1}{\phi_s^2}
\Bigg)^{-(\nu+1)},$$

where $\bm{k}$ are the spatial wave numbers. The spectrum of the
$\omega(\bm{s},t)$ process is then:
$$f(w,\bm{k}) = \tilde{f}(\bm{k}) \frac {1} {(2 \pi)}
\Big(
(\bm{k}^T \Sigma \bm{k} + \zeta)^2 + (w + \bm{u}^T \bm{k} )^2
\Big)^{-1} ,$$

where $w$ is temporal frequency. The covariance function can be
recovered as:

$$\begin{aligned}
  C(\bm{s},t) &=& \int f(w,k) \; exp(i \cdot tw ) \; exp(i \cdot \bm{s}'\bm{k} ) \; d\bm{k} dw \\
  &=& \int \tilde{f}(\bm{k}) \frac{exp(-i \cdot \bm{u}^T \bm{k} t - (\bm{k}^T \Sigma \bm{k} + \zeta) |t| )} {2(\bm{k}^T \Sigma \bm{k} + \zeta) } \, exp( i \cdot \bm{s}' \bm{k} ) \, d\bm{k} .
\end{aligned}$$

Upon discretization: $$\begin{aligned}
    \omega(\bm{s},t)  &=& \bm{\phi}(\bm{s})^T \alpha(t) \\
    &\approx& \sum_{j=1}^{K} \phi_j(\bm{s}) \alpha_j(t)   \\
    &\approx& \sum_{j=1}^4 \phi_j^{(cos)} (\bm{s}_l) \alpha_j^{(cos)}(t)
    + \sum_{j=5}^{K/2+2} (  \phi_j^{(cos)} (\bm{s}_l )\alpha_j^{(cos)}(t) +   \phi_j^{(sin)} (\bm{s}_l ) \alpha_j^{(sin)}(t) ) ,
  
\end{aligned}$$

where $\bm{k}=(k_{x,j}, k_{y,j} )^T$ is the spatial wavenumber of the j
component of K Fourier components and
$\phi_j(\bm{s}) = \exp(\imath \cdot \bm{k}_j^T\bm{s} ) = \{ \cos( \bm{k}_j^T\bm{s}),  \sin( \bm{k}_j^T\bm{s} ) \}$
is the spatial function. And, for each time $t$ and location $s_l$,
$l=1,\dots, n^2$ in the SPDE:

$$\begin{aligned}
    \bm{u}^T \nabla \phi_j^{(cos)}(\bm{s}_l) &=& -\bm{u}^T \bm{k}_j \phi_j^{(sin)} (\bm{s}_l) \\
    \bm{u}^T \nabla \phi_j^{(sin)}(\bm{s}_l) &=& -\bm{u}^T \bm{k}_j \phi_j^{(cos)} (\bm{s}_l),
  
\end{aligned}$$ and,

$$\begin{aligned}
    \nabla \cdot \Sigma \nabla \phi_j^{(cos)}(\bm{s}_l) &=& -\bm{k}_j^T \Sigma \bm{k} \phi_j^{(cos)} (\bm{s}_l) \\
    \nabla \cdot \Sigma \nabla \phi_j^{(sin)}(\bm{s}_l) &=& -\bm{k}_j^T \Sigma \bm{k} \phi_j^{(sin)} (\bm{s}_l) .
  
\end{aligned}$$

The full non-separable, advection-diffusion model specification is thus:

$$\begin{aligned}
    Y(\bm{s},t) &=& x(\bm{s},t)^{T} \bm{\beta} +  \omega(\bm{s},t) + \varepsilon(\bm{s},t) \\
    \omega(\bm{s},t) &=& \bm{\Phi} \bm{\alpha} (\bm{s},t)  \quad \text{\{advection-diffusion model\}}\\
    \alpha (\bm{s},t)&=& \bm{G} \bm{\alpha} (\bm{s},t-1) + \hat{\epsilon}(\bm{s},t)  \quad \text{\{transition model\}} \\
    \varepsilon(\bm{s},t) &\sim& N(\bm{0}, \tau^2 \bm{1} ) \quad \text{\{unstructured error\}}\\
    \hat{\epsilon}(\bm{s},t) &\sim& N(\bm{0}, \bm{\hat{Q}})  \quad \text{\{innovation\}} , \\
  
\end{aligned}$$

where, $\bm{\alpha} (\bm{s},t)$ are Fourier coefficients;
$\bm{\Phi}=[ \bm{\phi}(\bm{s}_1), \dots, \bm{\phi}(\bm{s}_N) ]^T$ is a
matrix of spatial basis functions; $\bm{G}$ is the transition
(propagator) matrix; and $\bm{\hat{Q}}$ is the innovation covariance
matrix (residual errors). The Fourier functions are:

$$\bm{\phi}(\bm{s}_l) = ( \cos(\bm{k}^T_1\bm{s}_l),  \dots , \cos(\bm{k}^T_4\bm{s}_l),
   \cos(\bm{k}^T_5\bm{s}_l), \sin(\bm{k}^T_5\bm{s}_l)\dots,
   \cos(\bm{k}^T_{K/2+2}\bm{s}_l), \sin(\bm{k}^T_{K/2+2}\bm{s}_l).
 )$$

# Interpretation of the logistic model {#sec:logisticModel}

The derivation of the logistic model, presented below is more
phenomenological than mechanistic and attributed to @lotka1925. It is
our opinion that this phenomenological interpretation renders it so
useful as a general characterisation of system state. The argument is
that the rate of change in time $t$ of any state $Y$ (in our context:
abundance, species richness, \"habitat\", size) can be expected to be in
some way, a function of itself:

$$\begin{aligned}
\label{eqLogisticContinuous}
dY / dt = g(Y).
\end{aligned}$$

It is expected that when $Y = 0$, $dY/dt$ will also be zero and so
represents an algebraic root of $g$. A Taylor series expansion of $g$
near this root $Y=0$ gives:

$$\begin{aligned}
  \label{eqLogisticTaylorSeries}
  dY / dt &=&  g'(0) Y + g''(0) Y^{2}/2  + \text{higher order terms} \dots; \\
  &\approx& Y [g'(0) + g''(0) Y/2  ].
\end{aligned}$$

With the identities $g'(0) = r$ and $g''(0) = - 2r/K$, the standard form
of the logistic equation is obtained:

$$\label{eqLogistic}
dY/dt \approx r Y (1 - Y/K).$$

The intrinsic rate of increase, $r$, is therefore, some abstract and
aggregate function that describes the net increase or decrease of the
system state $Y$ when $Y$ is small. In biological systems, this means a
maximum rate of growth, recruitment, mortality, movement, climatic
change, extinction, speciation, etc. as the rate is expected to decline
as it approaches some upper limit $K$ of the magnitude of the system
state $Y$.

With normalization by $K$ such that $y = Y/K$:

$$\label{eqLogisticBasic}
dy/dt  \approx  r y (1 - y).$$

Many variations of this basic model are known, mostly different ways of
adjusting the shape of the curve and/or the location of the inflection
point (i.e., $K/2$). This is done by adding additional parameters in the
form of exponentiation of different components which ultimately amounts
to adding higher order and even fractional order terms in the Taylor
series) and also adding additional terms $f(\dots)$ that are external to
the dynamic that $r$ and $K$ govern, such as fishing, advection,
diffusion, noise:

$$\begin{aligned}
\label{eqLogisticGeneral}
dy / dt &=& r y^{\alpha} ( 1 - y )^{\beta} + f(\dots).
\end{aligned}$$

The \"$\dots$\", above, indicate other factors or parameters influencing
these \"externalities\" through the action of $f$. For the purposes of
this discussion, we will use only the basic model and estimate the
parameters of interest, $\theta = \{r, K \}$ (Eq.
[\[eqLogisticBasic\]](#eqLogisticBasic){reference-type="ref"
reference="eqLogisticBasic"}), but the reader should be aware that other
parameterizations are possible such as Eq.
[\[eqLogisticGeneral\]](#eqLogisticGeneral){reference-type="ref"
reference="eqLogisticGeneral"}, at the expense of course, a slightly
greater model complexity $\theta=\{r,K,\alpha,\beta\}$. The intent is to
explore the utility of this more flexible formulation in conjunction
with the basic model.

In discrete form, where $\Delta t = 1 \; \text{year}$ and after a Euler
discretization, the basic model becomes:

$$\label{eqLogisticDiscrete:appendix}
y_t  \approx r y_{t-1} (1 - y_{t-1} ).$$

This we will call the \"basic\" form of the discrete logistic model.
:::
