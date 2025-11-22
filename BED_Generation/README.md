# BED_Generation

This folder contains a Bash script for generating BED files from a list of genes using the hg19 reference annotation (`refGene.txt`). This is useful for panel sequencing analysis or any workflow requiring genomic intervals for a predefined set of genes.

---

## Script: `generate_bed.sh`

### Purpose
The script reads a list of genes (`panel_genes.txt`) and extracts the corresponding chromosome coordinates from a reference gene annotation (`refGene.txt`). It then outputs a BED file with full gene intervals for each gene in the list.

### Inputs
1. **panel_genes.txt** – A plain text file containing one gene name per line.
2. **refGene.txt** – Reference gene annotation file from UCSC (hg19).

### Output
- **panel_hg19_fullgene.bed** – BED-formatted file containing:

| Column | Description |
|--------|-------------|
| chr    | Chromosome |
| start  | Start position of the gene |
| end    | End position of the gene |
| geneName | Gene symbol |

---

### How it works
1. The script loops through each gene in `panel_genes.txt`.
2. For each gene, it searches `refGene.txt` for matching entries.
3. It extracts the chromosome, start, end, and gene name fields using `awk`.
4. Appends each gene’s coordinates as a new line in the BED file.

---

### Usage
```bash
# Make sure the script is executable
chmod +x generate_bed.sh

# Run the script
./generate_bed.sh
