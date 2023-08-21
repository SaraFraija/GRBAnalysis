
    
#Specify transit start and stop times
source $HAWCSOFT/analysis-tools/dev/initHAWCSoft.sh 
source $HAWCSOFT/activate config-hawc -v master
START=1191412659
STOP=1191498639

#Specify GRB location and search/model parameters
RA=135.544
DEC=42.849
DUR=85980
NSTEP=2
MODEL=Gilmore12Fiducial
N=10
PIVOT=1.0

#Specify directories
DR=/storage/hawc/hawcroot/maps/pass-5/maps-fHit100pct-20210114/config/dr-zebra-dataBkg_alignedGammas.root

#INPUT_FILES="$HAWCROOT/data/hawc/aligned/links_allbins/allbins_from_reco_run007084_00426_to_reco_run007084_00475.xcd $HAWCROOT/data/hawc/aligned/links_allbins/
INPUT_FILES=/storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run007193_00541_to_reco_run007193_00590.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run007193_00591_to_reco_run007193_00640.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run007193_00641_to_reco_run007193_00690.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run007193_00691_to_reco_run007193_00692.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run007194_00001_to_reco_run007194_00050.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run007194_00051_to_reco_run007194_00100.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run007194_00101_to_reco_run007194_00150.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run007194_00151_to_reco_run007194_00200.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run007194_00201_to_reco_run007194_00250.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run007194_00251_to_reco_run007194_00300.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run007194_00301_to_reco_run007194_00350.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run007194_00351_to_reco_run007194_00400.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run007194_00401_to_reco_run007194_00450.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run007194_00451_to_reco_run007194_00500.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run007194_00501_to_reco_run007194_00550.xcd /storage/hawc/hawcroot/data/hawc/aligned/links_allbins/allbins_from_reco_run007194_00551_to_reco_run007194_00600.xcd
OUTPUTFILE=/storage/hawc/users/scastell/GRBsZeroUncer/GRB171007498file.txt
#TEMPLATE_DIRECTORY=
TEMPLATE=/storage/hawc/users/scastell/GRBsZeroUncer/TEMPLATES
#TEMPLATES=$TEMPLATE_DIRECTORY/full_binB{0..10}C{0..1}_N1024_mjd59782p00-59922p00.fits.gz
#Run the search with specified variables
for n in  {0..9};
do
zebra-transient-search -i $INPUT_FILES --dr $DR --localMaps $TEMPLATE/full_binB${n}C{0..1}_N1024_mjd59782p00-59922p00.fits.gz -b B${n}C{0..1} -s PowerLaw,$N,2.5 --pivot $PIVOT --ebl $MODEL,$z --duration $DUR --nSteps $NSTEP --ra $RA --dec $DEC --startTime $START --stopTime $STOP --rateFromData -o $OUTPUTFILE
done
