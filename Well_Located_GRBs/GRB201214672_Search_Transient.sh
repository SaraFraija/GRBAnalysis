
    
#Specify transit start and stop times
source $HAWCSOFT/analysis-tools/dev/initHAWCSoft.sh 
source $HAWCSOFT/activate config-hawc -v master
START=1291997266
STOP=1292063326

#Specify GRB location and search/model parameters
RA=187.971
DEC=9.1031
DUR=66060
NSTEP=2
MODEL=Gilmore12Fiducial
N=10
PIVOT=1.0

#Specify directories
DR=/storage/hawc/hawcroot/maps/pass-5/maps-fHit100pct-20210114/config/dr-zebra-dataBkg_alignedGammas.root

#INPUT_FILES="$HAWCROOT/data/hawc/aligned/links_allbins/allbins_from_reco_run007084_00426_to_reco_run007084_00475.xcd $HAWCROOT/data/hawc/aligned/links_allbins/
INPUT_FILES=/storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run009754_00351_to_reco_run009754_00400.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run009754_00401_to_reco_run009754_00450.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run009756_00001_to_reco_run009756_00050.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run009756_00051_to_reco_run009756_00100.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run009756_00101_to_reco_run009756_00150.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run009756_00151_to_reco_run009756_00200.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run009756_00201_to_reco_run009756_00250.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run009756_00251_to_reco_run009756_00300.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run009756_00301_to_reco_run009756_00350.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run009756_00351_to_reco_run009756_00400.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run009756_00401_to_reco_run009756_00450.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run009756_00451_to_reco_run009756_00500.xcd
OUTPUTFILE=/storage/hawc/users/scastell/GRBsZeroUncer/GRB201214672file.txt
#TEMPLATE_DIRECTORY=
TEMPLATE=/storage/hawc/users/scastell/GRBsZeroUncer/TEMPLATES
#TEMPLATES=$TEMPLATE_DIRECTORY/full_binB{0..10}C{0..1}_N1024_mjd59782p00-59922p00.fits.gz
#Run the search with specified variables
for n in  {0..9};
do
zebra-transient-search -i $INPUT_FILES --dr $DR --localMaps $TEMPLATE/full_binB${n}C{0..1}_N1024_mjd59782p00-59922p00.fits.gz -b B${n}C{0..1} -s PowerLaw,$N,2.5 --pivot $PIVOT --ebl $MODEL,$z --duration $DUR --nSteps $NSTEP --ra $RA --dec $DEC --startTime $START --stopTime $STOP --rateFromData -o $OUTPUTFILE
done
