# Visual Analysis of Displacement Processes in Porous Media using Spatio-Temporal Flow Graphs.

In the following, we will provide information about the implementation for our paper.



## MegaMol

For this work, we created two new plugins in [MegaMol](https://github.com/UniStuttgart-VISUS/megamol): imageseries and imageseries_gl.
They provide all functionality to read image series from experiments, preprocess them, create the time map, and extract and simplify a flow graph.

### Get the code

You can get MegaMol from its repository at [https://github.com/UniStuttgart-VISUS/megamol/tree/2023.07.26](https://github.com/UniStuttgart-VISUS/megamol/tree/2023.07.26).

### Build steps

Configure MegaMol with CMake by running:  
```
cmake /path/to/source -DMEGAMOL_USE_OPENGL=ON -DMEGAMOL_PLUGIN_IMAGESERIES=ON -DMEGAMOL_PLUGIN_IMAGESERIES_GL=ON
```
This enables the required plugins *imageseries* and *imageseries_gl*.

Now build and install MegaMol.

### Run example project

You can find an example project in the MegaMol examples called "porous".
To run it, simply start MegaMol and load the project.



## LuaVis

[LuaVis](https://github.com/UniStuttgart-VISUS/LuaVis) is a standalone application that has been modified for the interactive visualization of flow graphs.
Its core is written in C++, the implementation for graph visualization in Lua.

### Get the code

You can get LuaVis from its repository at [https://github.com/UniStuttgart-VISUS/LuaVis](https://github.com/UniStuttgart-VISUS/LuaVis).

### Build steps

LuaVis depends on the following libraries, which have to be built and installed.
Best use the linked repositories for compatibility.

- [LuaJIT](https://github.com/LuaJIT/LuaJIT/tree/v2.1)
- [cppfs](https://github.com/straubar/cppfs)
- [SFML](https://github.com/Marukyu/SFML)
- [zlib](https://github.com/madler/zlib)

After building the dependencies, configure LuaVis by running CMake with:
```
cmake /path/to/source -Dcppfs_DIR=/path/to/cppfs -DLUAJIT_DIR=/path/to/LuaJIT -DSFML_DIR=/path/to/lib/cmake/SFML -DZLIB_ROOT=/path/to/zlib
```

Now build and install LuaVis.

### Run

Execute the run script.
By default, an example dataset is loaded and visualized.
