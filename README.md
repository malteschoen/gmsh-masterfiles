this repo is just meant to hold the 'gold standard' in gmsh geo files for both processing of *.step and *.stl

recommended usage for step files
```
gmsh -3 forStepFiles.geo -f msh2 -o output.msh && gmsh -check output.msh
```

recommended usage for stl files
```
gmsh -3 forStlFiles.geo -f msh2 -o output.msh && gmsh -check output.msh
```

