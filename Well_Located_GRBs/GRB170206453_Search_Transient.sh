
    
#Specify transit start and stop times
source $HAWCSOFT/analysis-tools/dev/initHAWCSoft.sh 
source $HAWCSOFT/activate config-hawc -v master
START=1170413517
STOP=1170491517

#Specify GRB location and search/model parameters
RA=212.79
DEC=14.48
DUR=78000
NSTEP=2
MODEL=Gilmore12Fiducial
N=10
PIVOT=1.0

#Specify directories
DR=/storage/hawc/hawcroot/maps/pass-5/maps-fHit100pct-20210114/config/dr-zebra-dataBkg_alignedGammas.root

#INPUT_FILES="$HAWCROOT/data/hawc/aligned/links_allbins/allbins_from_reco_run007084_00426_to_reco_run007084_00475.xcd $HAWCROOT/data/hawc/aligned/links_allbins/
INPUT_FILES=/storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run006275_00251_to_reco_run006275_00300.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run006275_00301_to_reco_run006275_00350.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run006275_00351_to_reco_run006275_00400.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run006275_00401_to_reco_run006275_00450.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run006275_00451_to_reco_run006275_00500.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run006275_00501_to_reco_run006275_00550.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run006275_00551_to_reco_run006275_00600.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run006275_00601_to_reco_run006275_00650.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run006275_00651_to_reco_run006276_00008.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run006276_00009_to_reco_run006276_00058.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run006276_00059_to_reco_run006276_00108.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run006276_00109_to_reco_run006276_00158.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run006276_00159_to_reco_run006276_00208.xcd
OUTPUTFILE=/storage/hawc/users/scastell/GRBsZeroUncer/GRB170206453file.txt
#TEMPLATE_DIRECTORY=
TEMPLATE=/storage/hawc/users/scastell/GRBsZeroUncer/TEMPLATES
#TEMPLATES=$TEMPLATE_DIRECTORY/full_binB{0..10}C{0..1}_N1024_mjd59782p00-59922p00.fits.gz
#Run the search with specified variables
for n in  {0..9};
do
zebra-transient-search -i $INPUT_FILES --dr $DR --localMaps $TEMPLATE/full_binB${n}C{0..1}_N1024_mjd59782p00-59922p00.fits.gz -b B${n}C{0..1} -s PowerLaw,$N,2.5 --pivot $PIVOT --ebl $MODEL,$z --duration $DUR --nSteps $NSTEP --ra $RA --dec $DEC --startTime $START --stopTime $STOP --rateFromData -o $OUTPUTFILE
done
