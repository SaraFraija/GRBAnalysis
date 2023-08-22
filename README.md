# GRBAnalysis
This project has as a final product a list of .sh files to be run in the ICN cluster in Mexico using HAWC (High Altitude Water Cherenkov) data. 
HAWC is an observatoy in high energies dedicated to the study of oobjects in GeV-TeV energies. This project focuses on GRBs (Gamma ray bursts), the bightest objects
in the universe. These can be short or long depending on their T90 (Time in which the 5 to 90% of the Flux is observed in a specific
energy range and cahnges with the instrument)

The project has 2 main codes, each one with a specific goal:
1. AnglesinHAWCFOV.ipynb
2. KnowingRuns.ipynb
In AnglesinHAWCFOV.ipynb takes a file called dat2.dat. This file must have the header:

### GRB	ra	dec	Error radius	Trigger	T90	eT90	T90 start	flux64	err flux64	T50	eT50	T50 start

Being GRB, the name of the GRB, ra and dec the Right Asencion and Declination of the GRB. Error radius, the position error. Trigger is the detection time in MJD. The resting parameters are not used in this stage.

The code finds the time in MJD in whic the GRB is under the HAWC FOV. Then, finds the time interval for optimal observation. This time is in MJD and the output file called GRBsAngleFromZenith2.dat has both, the MJD and GPS times.


The input files in  KnowingRuns.ipynb are GRBsAngleFromZenith2.dat, 'data.csv' and 'GPSTimes.csv'. The second file contains redshift information. In 'GPSTimes.csv' are the GPS times for all the runs in HAWC using PASS 5. These times are in GPS. Using these times and runs, it is found where these GRBs are in the HAWC data. Knowing that, bash codes are generated. Codes are generated depending on the amount of runs in which an specific GRB is observed. Each code contains a Start time and a stop time, corresponding to the initial and final time for each run. 
With this information, a search in different time intervals is done with the tool zebra-transient-search. The codes have to be run in the ICN cluster. The detector response used is /storage/hawc/hawcroot/maps/pass-5/maps-fHit100pct-20210114/config/dr-zebra-dataBkg_alignedGammas.root. The EBL model is Gilmore12Fiducial.

The results are shown in the notion page: https://www.notion.so/Well-located-GRBs-and-GW-8631693122574af7bb770ccf6ac9b965

The tutorial to be done in the ICN cluster to produce the file GPSTimes.csv is found in https://www.notion.so/Programas-y-tutoriales-35ca5e7379e24665888f9adfd823d914
