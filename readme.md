# Visual Analysis of Displacement Processes in Porous Media using Spatio-Temporal Flow Graphs.

In the following, we will provide information about the implementation for our paper.


## MegaMol

For this work, we created two new plugins in [MegaMol](https://github.com/UniStuttgart-VISUS/megamol): imageseries and imageseries_gl.
They provide all functionality to read image series from experiments, preprocess them, create the time map, and extract and simplify a flow graph.

### Get the code

You can get MegaMol from its repository at [https://github.com/UniStuttgart-VISUS/megamol](https://github.com/UniStuttgart-VISUS/megamol).
To make sure that you have a functioning version at the state of publication of our paper, you can checkout TODO.

### Build steps

Configure MegaMol with CMake by running:  
`cmake /path/to/source -DMEGAMOL_USE_OPENGL=ON -DMEGAMOL_PLUGIN_IMAGESERIES=ON -DMEGAMOL_PLUGIN_IMAGESERIES_GL=ON`  
This enables the required plugins *imageseries* and *imageseries_gl*.

Now build and install MegaMol.

### Run example project

todo


## LuaVis

[LuaVis](https://github.com/UniStuttgart-VISUS/LuaVis) is a standalone application that has been modified to allow the interactive visualization of flow graphs.
Its core is written in C++, the implementation for graph visualization in Lua.

### Get the code

You can get LuaVis from its repository at [https://github.com/UniStuttgart-VISUS/LuaVis](https://github.com/UniStuttgart-VISUS/LuaVis).

### Build steps

todo

### Run

Execute the run script.
