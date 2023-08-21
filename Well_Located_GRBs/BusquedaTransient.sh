#Specify transit start and stop times
START=1101801917.490767
STOP=1101809117.490767

#Specify GRB location and search/model parameters
RA=92.8590
DEC=37.8760
DUR=
NSTEP=1
MODEL=Gilmore12Fiducial
N=10
PIVOT=1.0

#Specify directories
DR=/lustre/hawcz01/hawcroot/maps/pass-5/maps-fHit100pct-20210114/config/dr-zebra-dataBkg_alignedGammas.root

#INPUT_FILES="$HAWCROOT/data/hawc/aligned/links_allbins/allbins_from_reco_run007084_00426_to_reco_run007084_00475.xcd $HAWCROOT/data/hawc/aligned/links_allbins/
INPUT_FILES="/storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run002134_00351_to_reco_run002134_00400.xcd" 
OUTPUTFILE=/your/output/directory/file.txt
TEMPLATE_DIRECTORY=/data/disk01/home/klengel/grb_analysis/tests_07-01/tests_07-11/localmaps/test/2022-08_OMtemplates
TEMPLATES=$TEMPLATE_DIRECTORY/full_binB{0..10}C{0..1}_N1024_mjd59782p00-59922p00.fits.gz


#Run the search with specified variables
zebra-transient-search -i $INPUT_FILES --dr $DR --localMaps $TEMPLATES -b B{0..10}C{0..1} -s PowerLaw,$N,2.5 --pivot $PIVOT --ebl $MODEL,0.009 --duration $DUR --nSteps $NSTEP --ra $RA --dec $DEC --startTime $START --stopTime $STOP --rateFromData -o $OUTPUTFILE
