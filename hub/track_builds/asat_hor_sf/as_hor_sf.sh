#!/bin/bash

# GOT THE FILES FROM HAILEY AGAIN

# had to round to an int 
awk 'BEGIN{OFS="\t"} {$5 = int($5); print}' hg002v1.1.as_hor.bed > temp && mv temp hg002v1.1.as_hor.bed
awk 'BEGIN{OFS="\t"} {$5 = int($5); print}' hg002v1.1.as_sf.bed > temp && mv temp hg002v1.1.as_sf.bed

bedToBigBed \
    -extraIndex=name \
    -type=bed9 \
    -as=hg002v1.1.as_hor.as \
    hg002v1.1.as_hor.bed \
    /public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
    hg002v1.1.as_hor.bb

bedToBigBed \
    -extraIndex=name \
    -type=bed9 \
    -as=hg002v1.1.as_sf.as \
    hg002v1.1.as_sf.bed \
    /public/groups/migalab/HG002v1.1_censat_browser/hub/hg002v1.1.fasta.2bit.sizes \
    hg002v1.1.as_sf.bb