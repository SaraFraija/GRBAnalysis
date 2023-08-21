
    
#Specify transit start and stop times
source $HAWCSOFT/analysis-tools/dev/initHAWCSoft.sh 
source $HAWCSOFT/activate config-hawc -v master
START=1174520758
STOP=1174520758

#Specify GRB location and search/model parameters
RA=127.483
DEC=20.526
DUR=0
NSTEP=2
MODEL=Gilmore12Fiducial
N=10
PIVOT=1.0

#Specify directories
DR=/storage/hawc/hawcroot/maps/pass-5/maps-fHit100pct-20210114/config/dr-zebra-dataBkg_alignedGammas.root

#INPUT_FILES="$HAWCROOT/data/hawc/aligned/links_allbins/allbins_from_reco_run007084_00426_to_reco_run007084_00475.xcd $HAWCROOT/data/hawc/aligned/links_allbins/
INPUT_FILES=/storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run006418_00646_to_reco_run006419_00003.xcd
OUTPUTFILE=/storage/hawc/users/scastell/GRBsZeroUncer/GRB170325331file.txt
#TEMPLATE_DIRECTORY=
TEMPLATE=/storage/hawc/users/scastell/GRBsZeroUncer/TEMPLATES
#TEMPLATES=$TEMPLATE_DIRECTORY/full_binB{0..10}C{0..1}_N1024_mjd59782p00-59922p00.fits.gz
#Run the search with specified variables
for n in  {0..9};
do
zebra-transient-search -i $INPUT_FILES --dr $DR --localMaps $TEMPLATE/full_binB${n}C{0..1}_N1024_mjd59782p00-59922p00.fits.gz -b B${n}C{0..1} -s PowerLaw,$N,2.5 --pivot $PIVOT --ebl $MODEL,$z --duration $DUR --nSteps $NSTEP --ra $RA --dec $DEC --startTime $START --stopTime $STOP --rateFromData -o $OUTPUTFILE
done
