FILE(REMOVE_RECURSE
  "CMakeFiles/modules.dir/functions.f90.o"
  "libmodules.pdb"
  "libmodules.a"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang Fortran)
  INCLUDE(CMakeFiles/modules.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
