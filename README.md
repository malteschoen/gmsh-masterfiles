this repo is just meant to hold my 'gold standard' in gmsh geo files for both processing of *.step and *.stl

standard usage for step files - will clean up the step file (don't forget to set a tolerance!), output a gmsh2-formatted mesh file and do a bit of quality checking on the latter
```
gmsh -3 forStepFiles.geo -f msh2 -o output.msh && gmsh -check output.msh
```

alternate usage for step files - as above, but spits out a 'clean' step file and uses unv mesh format for legacy compatibility (i.e. you can open the mesh in FreeCAD!)
```
gmsh -0 forStepFiles.geo -o clean.step && gmsh -3 forStepFiles.geo -f unv -o output.unv && gmsh -check output.unv
```

recommended usage for stl files
```
gmsh -3 forStlFiles.geo -f unv -o output.unv && gmsh -check output.unv
```

If you need to go from STL to STEP, the gameplan in FreeCAD  is:
- Reverse Engineering Workbench: Segmentation -> Refinement via gmsh
- Part Workbench: Shape From Mesh
- Part Workbench: Convert To Solid
- Part Design Workbench: Create Body
- Drag Solid, drop it directly onto (not into!) the body so that a BaseFeature forms
- Happy editing!
