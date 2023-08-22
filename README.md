# GRBAnalysis
This project has as a final product a list of .sh files to be run in the ICN cluster in Mexico using HAWC (High Altitude Water Cherenkov) data. 
HAWC is an observatoy in high energies dedicated to the study of oobjects in GeV-TeV energies. This project focuses on GRBs (Gamma ray bursts), the bightest objects
in the universe. These can be short or long depending on their T90 (Time in which the 5 to 90% of the Flux is observed in a specific
energy range and cahnges with the instrument)

The project has 2 main codes, each one with a specific goal:
1. AnglesinHAWCFOV.ipynb
2. 
In AnglesinHAWCFOV.ipynb takes a file called dat2.dat. This file must have the header:

### GRB	ra	dec	Error radius	Trigger	T90	eT90	T90 start	flux64	err flux64	T50	eT50	T50 start

Being GRB, the name of the GRB, ra and dec the Right Asencion and Declination of the GRB. Error radius, the position error. Trigger is the detection time in MJD. The resting parameters are not used in this stage.

The code finds the time in MJD in whic the GRB is under the HAWC FOV. Then, finds the time interval for optimal observation. This time is in MJD and the output file called GRBsAngleFromZenith2.dat has both, the MJD and GPS times.


The input file in  
