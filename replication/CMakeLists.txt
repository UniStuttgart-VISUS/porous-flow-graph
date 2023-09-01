##################################################################
#
# Visual Analysis of Displacement Processes in Porous Media
# using Spatio-Temporal Flow Graphs
#
# This scripts downloads, configures, builds, and installs
# MegaMol and LuaVis for replicability.
#
##################################################################
cmake_minimum_required(VERSION 3.2 FATAL_ERROR)

project("replicability_porous_flow_graph")

# use CMake functionality to download and build stuff
include(FetchContent)
include(ExternalProject)
find_package(Git REQUIRED)

mark_as_advanced(FORCE
    FETCHCONTENT_BASE_DIR
    FETCHCONTENT_FULLY_DISCONNECTED
    FETCHCONTENT_QUIET
    FETCHCONTENT_UPDATES_DISCONNECTED)

# get MegaMol
ExternalProject_Add(megamol
    GIT_REPOSITORY https://github.com/UniStuttgart-VISUS/megamol.git
    GIT_TAG 6974ec3
    GIT_SHALLOW TRUE
    CMAKE_ARGS
        -DMEGAMOL_VCPKG_DOWNLOAD_CACHE=ON
        -DMEGAMOL_USE_OPENGL=ON
        -DMEGAMOL_PLUGIN_IMAGESERIES=ON
        -DMEGAMOL_PLUGIN_IMAGESERIES_GL=ON
        -DCMAKE_INSTALL_PREFIX=${CMAKE_BINARY_DIR}/megamol
)

# get dependencies for LuaVis
ExternalProject_Add(cppfs
    GIT_REPOSITORY https://github.com/straubar/cppfs.git
    GIT_TAG 871c7c7
    GIT_SHALLOW TRUE
    CMAKE_ARGS
        -DOPTION_BUILD_TESTS=OFF
        -DCMAKE_INSTALL_PREFIX=${CMAKE_BINARY_DIR}/cppfs
)

ExternalProject_Add(sfml
    GIT_REPOSITORY https://github.com/Marukyu/SFML.git
    GIT_TAG 3e6b953
    GIT_SHALLOW TRUE
    CMAKE_ARGS
        -DCMAKE_INSTALL_PREFIX=${CMAKE_BINARY_DIR}/sfml
)

ExternalProject_Add(zlib
    GIT_REPOSITORY https://github.com/madler/zlib.git
    GIT_TAG 04f42ce
    GIT_SHALLOW TRUE
    CMAKE_ARGS
        -DCMAKE_INSTALL_PREFIX=${CMAKE_BINARY_DIR}/zlib
)

FetchContent_Declare(luajit_download
    GIT_REPOSITORY https://github.com/LuaJIT/LuaJIT.git
    GIT_TAG 8635cba
    GIT_SHALLOW FALSE
    SOURCE_DIR ${CMAKE_BINARY_DIR}/luajit_download)
FetchContent_GetProperties(luajit_download)
if (NOT luajit_POPULATED)
  FetchContent_Populate(luajit_download)
  mark_as_advanced(FORCE
    FETCHCONTENT_SOURCE_DIR_LUAJIT_DOWNLOAD
    FETCHCONTENT_UPDATES_DISCONNECTED_LUAJIT_DOWNLOAD)
endif ()
if (MSVC)
    string(REPLACE "/" "\\" SOURCE_DIR ${CMAKE_SOURCE_DIR})
    string(REPLACE "/" "\\" TARGET_DIR ${CMAKE_BINARY_DIR})
    add_custom_target(luajit COMMAND call ${SOURCE_DIR}\\build_luajit.bat ${TARGET_DIR})
else ()
    add_custom_target(luajit COMMAND sh cd ${CMAKE_BINARY_DIR}/luajit_download && make && make install PREFIX=${CMAKE_BINARY_DIR}/luajit)
endif ()

# get LuaVis
ExternalProject_Add(luavis
    GIT_REPOSITORY https://github.com/UniStuttgart-VISUS/LuaVis.git
    GIT_TAG cda8208
    GIT_SHALLOW TRUE
    CMAKE_ARGS
        -Dcppfs_DIR=${CMAKE_BINARY_DIR}/cppfs
        -DLUAJIT_DIR=${CMAKE_BINARY_DIR}/luajit
        -DSFML_DIR=${CMAKE_BINARY_DIR}/sfml/lib/cmake/SFML
        -DZLIB_ROOT=${CMAKE_BINARY_DIR}/zlib
        -DCMAKE_INSTALL_PREFIX=${CMAKE_BINARY_DIR}/luavis
)

add_dependencies(luavis luajit cppfs sfml zlib)

# create dummy target
add_custom_target(replicability ALL DEPENDS megamol luavis)
