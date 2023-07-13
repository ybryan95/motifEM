# Motif Discovery Code README

[![Language](https://img.shields.io/badge/Language-Mathematica-purple)](https://www.wolfram.com/mathematica/)
[![Topic](https://img.shields.io/badge/Topic-Bioinformatics-green)](https://en.wikipedia.org/wiki/Bioinformatics)

## Table of Contents
- [Introduction](#introduction)
- [Applications](#applications)
- [Methods](#methods)
- [Core Functions](#core-functions)
- [Usage](#usage)

## Introduction <a name = "introduction"></a>
This repository contains a powerful tool built with the Mathematica language for **motif discovery** in biological sequences. This forms a fundamental part of bioinformatics, the field that combines biology and computer science to understand and interpret biological data.

This repository contains an efficient and powerful Expectation-Maximization (EM) algorithm implementation in Mathematica, tailored for motif discovery within DNA sequences. It serves as a valuable resource for researchers and practitioners in genomics and related fields, simplifying the task of identifying biologically significant patterns, crucial for understanding gene regulation and advancing personalized medicine.

Recognition to WashU FL2022.E81.CSE.587A.01 - Algorithms for Computational Biology

## Applications <a name = "applications"></a>
Motifs are recurring patterns in DNA sequences that are believed to have a biological significance. Recognizing these motifs is critical for understanding the regulatory mechanisms of genes. This tool can aid biological researchers and bioinformatics professionals in uncovering these motifs, contributing to advances in genomics, medicine, and drug discovery.

> **_NOTE:_** **Expectation Maximization (EM) is a powerful statistical tool used to find likely parameter values within a model when you have missing or hidden data. In the context of biological research and bioinformatics, EM, specifically in the form of the Expectation-Maximization algorithm for motif discovery, is used to uncover motifs in DNA sequences.

In simple terms, a motif is a recurring pattern in DNA, RNA, or protein sequences that has a specific function or is associated with particular biological activity. They can be binding sites for proteins (like transcription factors), signals for protein domains, or indicators of disease states, among other things. Identifying these motifs is crucial to understanding biological processes and functions.

Here's how the Expectation-Maximization algorithm aids in uncovering these motifs:

Expectation Step (E-step): This involves the estimation of the motif occurrences in the given sequence data given the current parameters (typically a Position Frequency Matrix, or PFM, representing the motif). During this step, for every subsequence of the length of the motif in each DNA sequence, a "posterior probability" is calculated that reflects the likelihood this subsequence is a motif instance. This probability is calculated using the current PFM and background nucleotide frequencies.

Maximization Step (M-step): In this step, the PFM is re-estimated using the posterior probabilities calculated in the E-step. Each position in the PFM is updated to reflect the weighted average of the nucleotides in the corresponding position of each subsequence, where the weights are the posterior probabilities. This essentially means that subsequences that are more likely to be instances of the motif have a greater influence on the PFM.

By iteratively performing the E-step and M-step, the algorithm refines its estimates of the motif's PFM, effectively "learning" the motif from the data. Over time, the algorithm converges to a solution where the PFM (and therefore, the motif) is well-defined and corresponds to a recurring pattern in the sequences.

This process helps bioinformatics professionals and biological researchers uncover motifs in large biological datasets, aiding in the understanding of gene regulation, protein function, disease markers, and more. It is particularly useful in the discovery of novel motifs and in the analysis of large genomic sequences where manual motif discovery would be unfeasible.**

## Methods <a name = "methods"></a>
The script employs a combination of statistical techniques to identify motifs in DNA sequences:

- **Nucleotide frequency calculation**: Understanding the prevalence of different nucleotides (A, T, C, G) in the sequence.
- **Position Frequency Matrix (PFM) initialization**: This matrix holds the probabilities of each nucleotide occurring at each position in the potential motif.
- **Posterior probabilities calculation**: Determining the probabilities of each position in the sequence being part of the motif.
- **Motif prior updating**: Refining our prior beliefs about the likelihood of a motif based on newly calculated posterior probabilities.
- **PFM count updating**: Adjusting the PFM based on the latest motif information.

## Core Functions <a name = "core-functions"></a>
Some of the fundamental functions in this script are:

- `nucleotideCounts`: Calculates the counts of different nucleotides in the sequence.
- `initializePFM`: Initializes the PFM with uniform random probabilities.
- `updateProbs`: Updates the probabilities for motif detection.
- `normalizePosteriorWindows`: Normalizes the posterior probabilities for each window.
- `readInput`: Reads the input sequences from a FASTA file.

## Usage <a name = "usage"></a>
To use this code, import the Mathematica notebook and provide your DNA sequences in a FASTA file to the `readInput` function. Adjust the parameters such as motif length, pseudocount weight, and accuracy according to your requirements. If needed, you can also enable reverse strand inclusion and specify the number of motifs to find. The results will be stored in a designated output file.
