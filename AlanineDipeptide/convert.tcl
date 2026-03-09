
package require psfgen
resetpsf

# 1. Load the CHARMM topology file

topology top_all36_prot.rtf

# 2. Alias residues/atoms to match your PDB naming
# This is critical! If your PDB has 'OXT', you must alias it to the name in the topology.
pdbalias atom ALA OT1 O
pdbalias atom ALA OT2 OXT

# 3. Create a segment for the alanine dipeptide
segment ALAD {
    pdb alanine_dipeptide_nowater.pdb
}

# 4. Read coordinates from your PDB
coordpdb alanine_dipeptide_nowater.pdb ALAD

# patching with terminal groups
# patch ACE ALAD:1
# patch CT3 ALAD:1

# 5. Build missing coordinates (hydrogens, etc.)
guesscoord

# 6. Write out the results
writepsf alanine_dipeptide_2.psf
writepdb alanine_dipeptide_converted_2.pdb
