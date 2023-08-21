
    
#Specify transit start and stop times
source $HAWCSOFT/analysis-tools/dev/initHAWCSoft.sh 
source $HAWCSOFT/activate config-hawc -v master
START=1208069046
STOP=1208135046

#Specify GRB location and search/model parameters
RA=170.121
DEC=24.9328
DUR=66000
NSTEP=2
MODEL=Gilmore12Fiducial
N=10
PIVOT=1.0

#Specify directories
DR=/storage/hawc/hawcroot/maps/pass-5/maps-fHit100pct-20210114/config/dr-zebra-dataBkg_alignedGammas.root

#INPUT_FILES="$HAWCROOT/data/hawc/aligned/links_allbins/allbins_from_reco_run007084_00426_to_reco_run007084_00475.xcd $HAWCROOT/data/hawc/aligned/links_allbins/
INPUT_FILES=/storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run007831_00054_to_reco_run007831_00103.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run007831_00104_to_reco_run007831_00153.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run007831_00154_to_reco_run007831_00203.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run007831_00204_to_reco_run007831_00253.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run007831_00254_to_reco_run007831_00303.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run007831_00304_to_reco_run007831_00353.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run007831_00354_to_reco_run007831_00403.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run007831_00404_to_reco_run007831_00413.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run007832_00001_to_reco_run007832_00050.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run007832_00051_to_reco_run007832_00100.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run007832_00101_to_reco_run007832_00150.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run007832_00151_to_reco_run007832_00200.xcd
OUTPUTFILE=/storage/hawc/users/scastell/GRBsZeroUncer/GRB180418281file.txt
#TEMPLATE_DIRECTORY=
TEMPLATE=/storage/hawc/users/scastell/GRBsZeroUncer/TEMPLATES
#TEMPLATES=$TEMPLATE_DIRECTORY/full_binB{0..10}C{0..1}_N1024_mjd59782p00-59922p00.fits.gz
#Run the search with specified variables
for n in  {0..9};
do
zebra-transient-search -i $INPUT_FILES --dr $DR --localMaps $TEMPLATE/full_binB${n}C{0..1}_N1024_mjd59782p00-59922p00.fits.gz -b B${n}C{0..1} -s PowerLaw,$N,2.5 --pivot $PIVOT --ebl $MODEL,$z --duration $DUR --nSteps $NSTEP --ra $RA --dec $DEC --startTime $START --stopTime $STOP --rateFromData -o $OUTPUTFILE
done
