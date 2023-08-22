The primary objective of this project is to generate a set of .sh files, tailored for execution on the ICN cluster in Mexico, utilizing data from the High Altitude Water Cherenkov (HAWC) observatory. HAWC specializes in probing high-energy phenomena within the GeV-TeV energy range. The central focus of this endeavor is the investigation of Gamma-Ray Bursts (GRBs), which are amongst the most luminous occurrences in the cosmos. Their temporal classification as short or long is contingent upon their T90 value—representing the time interval during which 5% to 90% of the flux becomes observable within a specific energy band, a parameter that adapts based on the observation instrument employed.

Two pivotal codes drive this project's workflow:

    AnglesinHAWCFOV.ipynb
    KnowingRuns.ipynb

In AnglesinHAWCFOV.ipynb, the input file, named dat2.dat, necessitates the following header:


### GRB	ra	dec	Error radius	Trigger	T90	eT90	T90 start	flux64	err flux64	T50	eT50	T50 start

Here, "GRB" denotes the Gamma-Ray Burst's identifier, "ra" and "dec" represent the Right Ascension and Declination of the GRB respectively, "Error radius" pertains to positional uncertainty, and "Trigger" signifies the MJD (Modified Julian Date) at which detection occurred. The remaining parameters are extraneous for this phase.

This code orchestrates the identification of MJD intervals within which a given GRB falls within the HAWC FOV. Subsequently, optimal observation windows are deduced in MJD. The outcomes encompassing MJD and GPS times are captured in the output file, GRBsAngleFromZenith2.dat.

The companion code, KnowingRuns.ipynb, incorporates three input files—GRBsAngleFromZenith2.dat, data.csv, and GPSTimes.csv. "data.csv" encompasses redshift information, while "GPSTimes.csv" is a repository of GPS times corresponding to HAWC runs under PASS 5. Leveraging these temporal data in conjunction with the runs, the code establishes the GRB's presence within HAWC data. On this foundation, it engineers a suite of bash scripts, varying in accordance with the number of runs in which a specific GRB manifests. These scripts encapsulate start and stop times for each run.

These scripted modules are essential for conducting investigations employing the "zebra-transient-search" tool. Analysis unfolds across diverse time intervals, with the backdrop of the detector response file, located at /storage/hawc/hawcroot/maps/pass-5/maps-fHit100pct-20210114/config/dr-zebra-dataBkg_alignedGammas.root. Notably, the EBL model adopted is "Gilmore12Fiducial."

To view the outcomes, refer to the Notion page:  https://www.notion.so/Well-located-GRBs-and-GW-8631693122574af7bb770ccf6ac9b965

For insights into generating the GPSTimes.csv file within the ICN cluster, consult the tutorial available at: https://www.notion.so/Programas-y-tutoriales-35ca5e7379e24665888f9adfd823d914
