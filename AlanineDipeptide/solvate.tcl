package require solvate

# 1. Load the files into VMD first
mol new alanine_dipeptide.psf
mol addfile alanine_dipeptide.pdb

# 2. Run the solvate command
# The solvate plugin uses the 'top' (currently selected) molecule by default.
solvate  alanine_dipeptide.psf alanine_dipeptide.pdb -o solvated -minmax {{-12.5 -12.5 -12.5} {12.5 12.5 12.5}}

# 3. Clean up the steric clashes (deleting overlapping waters)
set clashing_waters [atomselect top "water and same residue as (water within 2.3 of protein)"]
$clashing_waters delete

# 4. Write out the final files
set all [atomselect top all]
$all writepsf solvated.psf
$all writepdb solvated.pdb
