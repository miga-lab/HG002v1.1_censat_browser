# HG002_censat_browser
Browser setup for HG002 v1.1 CenSat annotation.

### Tracks I Need to Add Still:      
 * DiMeLo Tracks (modkit pileups) - [Do we need to filter better?]     
 * Fiberseq Data (nucleosome/msp/dinucleosome bigwigs)      
 * ipd bigwig       
 * HorHap/CenHap          
 * HSat SubFamily      

## Instructions
Follow the instructions in setup.sh in order:
* Get the files from this repo
* Pull in the assembly (to `hub` folder)
* Create a 2bit file for the assembly
* Run code in track_builds to create bigbeds for each annotation file

## Notes
This browser's files are currently stored on Courtyard. To view the browser navigate to the UCSC genome browser, click the **my data** dropdown then **trackhubs**. Got to **Connected Hubs** and then enter the following URL
```
http://public.gi.ucsc.edu/~jmmenend/HG002v1.1_censat_browser/hub/hub.txt
```
