#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Apr 25 16:20:40 2022
Pipe Line Implementation of NCBI data;
Additional Parameters on the Way
Automation is Creation
Command line is a fuck
1,203,455,673,296,455,678 characters (utf) typed


note: this version of pipe_imp_1.py only takes higher_taxon names
::::::::::: species as an alternative will be added soon.
:: THANKS 
@author: christian
"""
import sys
import ncbi.datasets.openapi
import time
import json
import re
import ncbi.datasets.openapi
from ncbi.datasets.openapi.api import taxonomy_api
from ncbi.datasets.openapi.model.v1_sci_name_and_ids import V1SciNameAndIds
from ncbi.datasets.openapi.model.rpc_status import RpcStatus
from ncbi.datasets.openapi.model.v1_organism_query_request_tax_rank_filter import V1OrganismQueryRequestTaxRankFilter
from pprint import pprint
# Defining the host is optional and defaults to https://api.ncbi.nlm.nih.gov/datasets/v1
# See configuration.py for a list of all supported configuration parameters.
configuration = ncbi.datasets.openapi.Configuration(
    host = "https://api.ncbi.nlm.nih.gov/datasets/v1"
)
configuration.api_key['ApiKeyAuthHeader'] = 'YOUR_API_KEY'
#-- above [ config for heathens; you need API keys and the ncbi.openapi module]
#
pipe_out = open('PIPE_TAXA.txt', 'w')
f = open(sys.argv[1], "r")
str_taxa_OI = (f.readline())
str_taxa_OI = str_taxa_OI.strip('\n')
taxa_OI = str_taxa_OI.split(',')

taxa_bracket_OI = str((f.readline()))
print(taxa_bracket_OI)
#print(taxa_bracket_OI)
#---------------------------- [ taxa_bracket_OI : conditional one ;;;; taxa_OI : sent to API ]
if re.match(r'species|Species', taxa_bracket_OI):
    print('is species')
    print(' :: no current option for species level API')
else:
    for a in taxa_OI:
        print(a)
        with ncbi.datasets.openapi.ApiClient(configuration) as api_client:
            api_instance = taxonomy_api.TaxonomyApi(api_client)
            taxon_query = a # str | NCBI Taxonomy
            tax_rank_filter = V1OrganismQueryRequestTaxRankFilter('higher_taxon') # only takes exact str as match; cannot use str obj as input
            try:
                # Get a list of taxonomy names and IDs given a partial taxonomic name
                api_response = api_instance.tax_name_query(taxon_query)
                pprint(api_response)
            except ncbi.datasets.openapi.ApiException as e:
                print("Exception when calling TaxonomyApi->tax_name_query: %s\n" % e)
            try:
                api_response = api_instance.tax_name_query(taxon_query, tax_rank_filter=tax_rank_filter)
                pprint(api_response)
                api_str=str(api_response)
                pipe_out.write(api_str+'\n')
            except ncbi.datasets.openapi.ApiException as e:
                print("Exception when calling TaxonomyApi->tax_name_query: %s\n" % e)
                
        
