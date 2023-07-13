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

> **_NOTE:_** The Expectation Maximization (EM) algorithm is like a detective tool used by scientists to find hidden patterns, or 'motifs', in DNA, RNA, or protein sequences. These motifs are important because they can tell us how genes work, how diseases might start, and other cool biological facts. So how does the EM algorithm do its detective work?

> It's a two-step process. In the first step, called the Expectation step (or 'E-step'), the algorithm makes a guess about where the motifs might be in a sequence. It uses a kind of scorecard, called a Position Frequency Matrix (PFM), which shows how often different parts of the motif appear at different positions.

> The second step, called the Maximization step (or 'M-step'), updates this scorecard based on the guesses from the E-step. The sequences that are more likely to be motifs get a higher score.

> The algorithm repeats these two steps over and over again, getting better at finding motifs each time. After a while, it ends up with a scorecard that does a great job of identifying motifs in the sequence data.

> Now, let's talk about "total number of motifs" and "probability of a motif". As the algorithm works, it gives a higher score (or probability) to the sequences that are more likely to be motifs. If we add up the scores of all the sequences that look like a particular motif, we get an estimate of the total number of that motif in the data. Meanwhile, the score of a motif at a particular spot gives us the probability that a motif is there.



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
