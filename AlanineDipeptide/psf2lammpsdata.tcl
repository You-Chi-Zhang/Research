mol new solvated.psf
mol addfile solvated.pdb

package require topotools

topo readparams par_all36_prot.prm
topo writelammpsdata alanine_dipeptide.data full
