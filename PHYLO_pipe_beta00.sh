#!/bin/bash
# Bash is a FUCK; Parasites ARE GOD; Cluster times 1 million
# this script is designed for finding clusters that are not from the same taxa
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
#
echo -e "${txtwht}CLUSTERFRICK version 00 (beta. n = 0.1)"
echo " make sure phylotaR is given valid path to NCBI blast folder"
echo -e "${txtred}+${txtblu}===${txtred}++++++++${txtblu}====${txtred}+++${txtblu}========${txtred}+++++${txtblu}====${txtred}++++++++++${txtblu}====${txtred}+++${txtblu}========${txtred}+++++++++++++++++++++++++"
echo -e "${txtred}+${txtblu}===${txtred}++++++++${txtblu}====${txtred}+++${txtblu}========${txtred}+++++${txtblu}=======${txtred}+++++${txtblu}======${txtred}+++${txtblu}====${txtred}++${txtblu}===${txtred}++++++++++++++++++++++++"
echo -e "${txtred}+${txtblu}===${txtred}++++++++${txtblu}====${txtred}+++${txtblu}====${txtred}++${txtblu}====${txtred}+++${txtblu}====${txtred}+${txtblu}===${txtred}+++${txtblu}===${txtred}+${txtblu}===${txtred}+++${txtblu}====${txtred}+++${txtblu}===${txtred}+++++++++++++++++++++++"
echo -e "${txtred}+${txtblu}=========${txtred}++${txtblu}====${txtred}+++${txtblu}====${txtred}+++${txtblu}===${txtred}+++${txtblu}====${txtred}++${txtblu}======${txtred}+++${txtblu}===${txtred}+++${txtblu}===========${txtred}++++++++++++++++++++++"
echo -e "${txtred}+${txtblu}=========${txtred}++${txtblu}====${txtred}+++${txtblu}==========${txtred}+++${txtblu}====${txtred}+++${txtblu}====${txtred}++++${txtblu}===${txtred}+++${txtblu}====${txtred}++++${txtblu}====${txtred}+++++++++++++++++++++"
echo -e "${txtgrn}version 00"
# god that was so stupid.
echo " NOTE TO USER: input only taken as .txt with two lines:"
echo " FIRST LINE: comma-delimited taxa of interest "
echo " SECOND LINE: as str ::species or ::higher_taxon "
mkdir ./OUTPUT
python3 pipe_imp_1.py $1
# this argument decides how many clusters the reader wants to convert into alignments
# note to self: I want an additional output that is a list of accession number matches and search terms; that way I can filter out
# matches not present in data.
# input a kill switch so I can call accession numbers locally and then cluster on another machine.
echo -e "${txtwht}================================"
echo -e "you have chosen clusters 1 - "$2
echo -e "================================"
echo -e "${txtgrn} these will be used for PhylotaR clustering redundancy"
echo -e "${txtred}=============================================================="
echo -e "NOW RUNNING PHYLOTA_R; finding clusters in sequence."
echo -e "---------------------------------- this may take a moment --"
echo -e "=============================================================="
echo -e "${txtgrn} /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/"
python3 pipe_imp_2.py PIPE_TAXA.txt
python3 pipe_imp_3.py
head -100 ./OUTPUT/*directory/blast/*typ-subtree-db.fa

