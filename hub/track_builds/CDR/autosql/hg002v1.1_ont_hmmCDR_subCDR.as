table hmmCDR_ONT
"hmmCDR(0.2.0) Preditions generated using Q100 Ultra-Long ONT Data Aligned to HG002v1.1 [Modkit(0.4.0) Filters Used are C:0.5, m:0.8]"
    ( 
    string chrom;    "Genomic sequence name"
    uint chromStart;     "Start in genomic sequence"
    uint chromEnd;       "End in genomic sequence"
    string name;     "Name of item"
    uint score;       "Average of HMM Scores in subCDR"
    char[1] strand;     "always ."
    uint thickStart;   "Start of where display should be thick"
    uint thickEnd;     "End of where display should be thick"
    uint reserved;     "color"
    )