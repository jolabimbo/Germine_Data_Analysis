# Germline Data Analysis Pipeline

This repository contains reproducible steps for performing germline variant analysis from FASTQ files following primary processing.
The workflow adheres to GATK Best Practices and uses GATK for variant calling and ANNOVAR for variant annotation.

# Pipeline Overview

The pipeline covers all major stages of germline analysis:

## Quality Control

FastQC for per-sample QC

MultiQC for combined QC reporting

## Optional Read Trimming

fastp or Trimmomatic (if adapter removal is needed)

## Alignment

BWA-MEM against hg19 or hg38

Conversion to BAM, sorting, and indexing using Samtools

## Duplicate Marking

GATK MarkDuplicatesSpark or Picard MarkDuplicates

## Base Quality Score Recalibration (BQSR)

GATK BaseRecalibrator

GATK ApplyBQSR

Uses known sites:

dbSNP

Mills and 1000G Gold Standard INDELs

## Variant Calling

GATK HaplotypeCaller

Outputs GVCF (recommended)

GATK GenotypeGVCFs

Produces final joint VCF (if multiple samples)

## Variant Filtering

Hard filtering according to GATK guidelines
Example (SNPs):

QD < 2.0 
FS > 60.0 
MQ < 40.0 
MQRankSum < -12.5 
ReadPosRankSum < -8.0

## Variant Annotation

ANNOVAR (table_annovar.pl)

RefGene or Ensembl gene annotation

ClinVar

gnomAD

dbnsfp (for functional predictions)

CADD (optional)

📁 Repository Structure
Germline_Data_Analysis/
│
├── scripts/                 # Bash scripts for each pipeline stage
├── annovar_db/              # Instructions for downloading ANNOVAR databases
├── config/                  # Reference genome paths and tool configs
├── docs/                    # Documentation for teaching or onboarding
├── examples/                # Sample FASTQ → BAM → VCF workflow
└── README.md                # This file

⚙️ Requirements

Install via Conda:

bwa

samtools

gatk

picard

fastqc

multiqc

annovar (manual installation required)

perl (for ANNOVAR)

🚀 How to Run
Clone the repository
git clone https://github.com/<your-username>/Germline_Data_Analysis.git
cd Germline_Data_Analysis

Make scripts executable
chmod +x scripts/*.sh

Run the pipeline
./scripts/run_pipeline.sh \
  --fastq sample_R1.fastq.gz \
  --fastq2 sample_R2.fastq.gz \
  --out sample_output

🧬 Output Files

You will get:

sample.bam + index

sample.recal.bam + index

sample.g.vcf.gz (GVCF)

sample.vcf.gz (final VCF)

sample.anno.txt (ANNOVAR annotation)

QC/ folder containing FastQC & MultiQC reports
