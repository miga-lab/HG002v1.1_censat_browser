table ASat_HOR
"ASat Higher Order Repeat monomer classification: monomer-by-monomer HOR annotation of human alpha satellites"
    (
    string chrom;    "Genomic sequence name"
    uint chromStart;     "Start in genomic sequence"
    uint chromEnd;       "End in genomic sequence"
    string name;     "Name of item"
    uint score;       "Score"
    char[1] strand;     "Relative orientation + or -"
    uint thickStart;   "Start of where display should be thick"
    uint thickEnd;     "End of where display should be thick"
    uint reserved;     "color"
    )