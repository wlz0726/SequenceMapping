# FastQtrimmer.pl
### Filter and Trim your Paired-end FastQ file

As you get the Illumina sequencing data from a company like BGI/Novogene, first thing 
you (probably) need to do is to do the sequnce quality check and filter the low quality reads.

Here I assume you have no adaptor problem and the sequencing company have already remove 
the adaptor before hand over you the data.

FastQtrimmer.pl will trim and filtering Paired-end reads in gz format, and the following reads
will be removed:
  1) >=10% unidentified nucleotides (N)
  2) with a phred quality <=7 for >65% of the read length
  3) reads are trimmed if they had three consecutive bp with a phred quality of <=13, 
     and discarded if they were shorter than 45 bp

Example:
Your have one Paired-end FastQ file named `SampleID.1.fq.gz` and  `SampleID.2.fq.gz` with phred33 quality system, 
the read length is 100 bp, 

```
perl FastQtrimmer.pl SampleID.1.fq.gz SampleID.2.fq.gz SampleID.Filter 33 100
```

the results will be:
SampleID.Filter.1.TrimTwoSide.fq.gz 
SampleID.Filter.2.TrimTwoSide.fq.gz

---

# fastq_Phred64_to_33_gz.pl

If your reads are in Phred64 quality system, and you need to transform Phred64 reads to Phred33, run like this:
```
perl fastq_Phred64_to_33_gz.pl input.1.fq.gz input.2.fq.gz OutputPrefix
```

