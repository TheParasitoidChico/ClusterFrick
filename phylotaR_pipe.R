      # Christian Connors PhylotaR Pipe in the Assembly of God
    # no premarital sex no tattoos no booze no bugs
  # praise be in the name of the lord
      library(phylotaR)
      print('Hello Boys')
args = commandArgs(trailingOnly = TRUE)
  accession_n= as.numeric(args[1])
  nan_ = args[1]
      dir_str <- 'directory'
      directory_name <- paste(nan_,dir_str,sep = "", collapse = "")
      print(directory_name)
      print(accession_n)
          dir_specific_path <- file.path('./OUTPUT', directory_name)
          outdir <- 'output'
          outdir_specific_path <- file.path(dir_specific_path,outdir )
          dir.create(outdir_specific_path)
wd <- dir_specific_path
outdir <- outdir_specific_path
setup(wd = dir_specific_path,
      txid = accession_n,
        ncbi_dr = '/home/christian/ncbi-blast-2.11.0+/bin/') # 2.
          run(wd = wd)
R <- read_phylota(wd)
print(R@txids)
print(" ... finding clusters")
R_clusters <- R
cids <- R_clusters@cids
  n_taxa <- get_ntaxa(phylota = R_clusters, cid = cids)
    keep <- cids[n_taxa > 1] # this drops any cluster with less than 4 taxa
      selected <- drop_clstrs(phylota = R_clusters, cid = keep)
        selected_summary <- summary(selected)
      print(selected_summary)
        # cid <- selected_summary[] needs to be converted to a loop
        cid <- selected_summary[1, 'ID']
        cluster_record <- selected@clstrs[[cid]]
        seq_records <- selected@sqs[cluster_record@sids]
        seq_record <- seq_records[[seq_records@ids[[1]]]] # this gives us a single record ID
        summary(seq_record) 
        print(seq_record)
        seq <- rawToChar(seq_record@sq)
        reduced <- drop_by_rank(phylota = selected, rnk = 'species', n = 1)
        txids <- get_txids(phylota = reduced, cid = cid, rnk = 'species')
        taxonomy <- get_tx_slot(phylota = reduced, txid = txids, slt_nm = 'scnm')
        # cleaning taxonomy so it's cleaner
        taxonomy <- gsub('\\.','', taxonomy)
        taxonomy <- gsub('\\s+', '_', taxonomy) # better for linux (rm whitespace)
        print(taxonomy)
        sids <- reduced@clstrs[[cid]]@sids
        print(sids)
                  
print('cluster complete, accessable in: ')
print(wd)