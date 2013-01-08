#! /bin/bash
# executes the pdfcrop for all .pdf
for i in *.pdf 
do
  pdfcrop --margins '2' $i
done
