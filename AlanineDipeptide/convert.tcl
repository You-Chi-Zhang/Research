
package require psfgen
resetpsf

# 1. Load the CHARMM topology file

topology top_all36_prot.rtf

# 3. Crieate a segment for the alanine dipeptide
segment ALAD {
    first ACE
    last CT3
    residue 1 ALA
}

# 4. Read coordinates from your PDB
coordpdb alanine_dipeptide_nowater.pdb ALAD

# 6. Write out the results
writepsf alanine_dipeptide.psf
writepdb alanine_dipeptide.pdb
