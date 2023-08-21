
    
#Specify transit start and stop times
source $HAWCSOFT/analysis-tools/dev/initHAWCSoft.sh 
source $HAWCSOFT/activate config-hawc -v master
START=1124015599
STOP=1124099659

#Specify GRB location and search/model parameters
RA=59.386
DEC=39.701
DUR=84060
NSTEP=2
MODEL=Gilmore12Fiducial
N=10
PIVOT=1.0

#Specify directories
DR=/storage/hawc/hawcroot/maps/pass-5/maps-fHit100pct-20210114/config/dr-zebra-dataBkg_alignedGammas.root

#INPUT_FILES="$HAWCROOT/data/hawc/aligned/links_allbins/allbins_from_reco_run007084_00426_to_reco_run007084_00475.xcd $HAWCROOT/data/hawc/aligned/links_allbins/
INPUT_FILES=/storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run004173_00153_to_reco_run004173_00202.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run004173_00203_to_reco_run004173_00252.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run004173_00253_to_reco_run004173_00302.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run004173_00303_to_reco_run004173_00352.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run004173_00353_to_reco_run004173_00402.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run004173_00403_to_reco_run004173_00452.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run004173_00453_to_reco_run004173_00500.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run004174_00001_to_reco_run004190_00012.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run004190_00013_to_reco_run004191_00045.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run004191_00046_to_reco_run004191_00095.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run004191_00096_to_reco_run004191_00145.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run004191_00146_to_reco_run004191_00195.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run004191_00196_to_reco_run004191_00245.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run004191_00246_to_reco_run004191_00295.xcd
OUTPUTFILE=/storage/hawc/users/scastell/GRBsZeroUncer/GRB150819440file.txt
#TEMPLATE_DIRECTORY=
TEMPLATE=/storage/hawc/users/scastell/GRBsZeroUncer/TEMPLATES
#TEMPLATES=$TEMPLATE_DIRECTORY/full_binB{0..10}C{0..1}_N1024_mjd59782p00-59922p00.fits.gz
#Run the search with specified variables
for n in  {0..9};
do
zebra-transient-search -i $INPUT_FILES --dr $DR --localMaps $TEMPLATE/full_binB${n}C{0..1}_N1024_mjd59782p00-59922p00.fits.gz -b B${n}C{0..1} -s PowerLaw,$N,2.5 --pivot $PIVOT --ebl $MODEL,$z --duration $DUR --nSteps $NSTEP --ra $RA --dec $DEC --startTime $START --stopTime $STOP --rateFromData -o $OUTPUTFILE
done
