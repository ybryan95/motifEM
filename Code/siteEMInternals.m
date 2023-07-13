(* ::Package:: *)

(* Put your code for sequencePosteriors, updateMotifPrior, and updatePFMCounts,
   along with any other functions you write to implement them, in this file.
   Don't forget that you can use your implementation of sitePosterior as part of your
   implementation of sequencePosteriors or, if you prefer, you can request a correct
   version from the TAs. *)
sitePosterior[sequence_, sitePrior_, backgroundPrior_, siteProbs_, backgroundProbs_] := 
Module[{ i, temp, seqLen = Length[sequence], siteChosen = {}, backChosen = {},
		l1, l2, mProb, pProb },
 	(*Figure out which probability index (and therefore value) was used for
 	siteProbs and backgroundProbs*)
 	For[i = 1, i <= seqLen, i++,
 		temp = sequence[[i]];	
 		AppendTo[backChosen, 
 			backgroundProbs[[temp]]
 		];
 		AppendTo[siteChosen, 
 			siteProbs[[i]][[temp]]
 		]
	];
	(*calculate likelihood probability for site and background based on previous
	info extracted*)
	l1 = Apply[Times, siteChosen];
	l2 = Apply[Times, backChosen];	
	(*marginal probability for following posterior probability calculation*)
	mProb = (l1 * sitePrior) + (l2 * backgroundPrior);
	pProb = (l1 * sitePrior) / mProb
]

sequencePosteriors[inputsequence_,oldMotifPrior_, oldPFM_, backgroundFreqs_]:= 
Module[{i,w = Length[oldPFM], m = 1 + Length[inputsequence] - Length[oldPFM], dividend = {} },
	
	(*Take the input sequence and divide them into m lists with length w*)
	For[i = 1, i <= m, i++,
		dividend = Append[dividend, 
							   Take[inputsequence,{i, i + w - 1}]
					 	 ]
		];	
	Map[sitePosterior[#, oldMotifPrior, 1 - oldMotifPrior, oldPFM, backgroundFreqs] &, dividend]
]

updateMotifPrior[normalizedPosteriors_]:= 
(*All row lengths may not be the same, {2} enables summarizing the matrix with different row length *)
Module[{rowSum = Total[normalizedPosteriors, {2}], rowLength = Map[Length, normalizedPosteriors], 
	matrixSum, matrixLength, return},
	
	matrixSum = Total[rowSum];
	matrixLength = Total[rowLength];
	
	return = matrixSum/matrixLength;
	
	(*return updated motif priors*)
	return

];

updatePFMCounts[motifLength_, input_, normalizedPosteriors_, motifPseudocounts_, erasers_]:= 
Module[ {newMotif = Table[motifPseudocounts, motifLength], defaultEraser,
	i, j, k, temp, endPoint, update	}, 
	
	 (*when eraser comes in as false, its value is protected, defaultEraser serves to save the protected value and use this instead*)
	 defaultEraser = erasers;
	 If[erasers == False,defaultEraser = Map[ConstantArray[1.0,Length[#]]&,input]]; (*eraser dimension matched with input sequence*)
	 
	 
	 Table[ 
	 	Table[
	 		endPoint = i + motifLength -1;
	 		temp = Take[input[[j]], {i, endPoint}];
	 		
	 		Do[
	 			(*update newmotif using normalized psoteriors and eraser*)
	 			update = normalizedPosteriors[[j,i]] * defaultEraser[[j,i+k-1]];
	 			newMotif[[k, temp[[k]]]] += update;,
	 			{k,motifLength}
	 			];, 			
	 	{i,Length[input[[j]]]-motifLength+1}
	 	];,
	 {j,Length[input]}
	 ];
	 
	 Return[newMotif];	
]
































