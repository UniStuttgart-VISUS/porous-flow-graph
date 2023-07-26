mmCheckVersion("4d0c88c0260b6452-dirty")
mmCreateView("GraphEntry_1","View2DGL","::View2DGL_1")

mmCreateModule("ImageSeriesLoader","::ImageSeriesLoader_1")
mmCreateModule("ImageSeriesRenderer","::ImageSeriesRenderer_1")
mmCreateModule("ImageSeriesFlowPreprocessor","::ImageSeriesFlowPreprocessor_1")
mmCreateModule("ImageSeriesTimestampFilter","::ImageSeriesTimestampFilter_1")
mmCreateModule("TransferFunctionGL","::TransferFunctionGL_1")

mmCreateCall("CallRender2DGL","::View2DGL_1::rendering","::ImageSeriesRenderer_1::rendering")
mmCreateCall("ImageSeries2DCall","::ImageSeriesRenderer_1::requestImageSeries","::ImageSeriesTimestampFilter_1::getData")
mmCreateCall("CallGetTransferFunctionGL","::ImageSeriesRenderer_1::requestTransferFunction","::TransferFunctionGL_1::gettransferfunction")
mmCreateCall("ImageSeries2DCall","::ImageSeriesFlowPreprocessor_1::requestInputImageSeries","::ImageSeriesLoader_1::getData")
mmCreateCall("ImageSeries2DCall","::ImageSeriesTimestampFilter_1::requestInputImageSeries","::ImageSeriesFlowPreprocessor_1::getData")

mmSetParamValue("::View2DGL_1::resetViewOnBBoxChange",[=[false]=])
mmSetParamValue("::View2DGL_1::showLookAt",[=[false]=])
mmSetParamValue("::View2DGL_1::view::showViewCube",[=[false]=])
mmSetParamValue("::View2DGL_1::anim::play",[=[false]=])
mmSetParamValue("::View2DGL_1::anim::speed",[=[0.010000]=])
mmSetParamValue("::View2DGL_1::anim::time",[=[0.313460]=])
mmSetParamValue("::View2DGL_1::backCol",[=[#000020]=])
mmSetParamValue("::ImageSeriesLoader_1::Filename pattern",[=[\.png]=])
mmSetParamValue("::ImageSeriesRenderer_1::Display Mode",[=[TF category lookup (word)]=])
mmSetParamValue("::ImageSeriesFlowPreprocessor_1::Mask frame",[=[0.000000]=])
mmSetParamValue("::ImageSeriesFlowPreprocessor_1::Deinterlace",[=[0]=])
mmSetParamValue("::ImageSeriesFlowPreprocessor_1::Enable segmentation",[=[true]=])
mmSetParamValue("::ImageSeriesFlowPreprocessor_1::Segmentation threshold",[=[0.500000]=])
mmSetParamValue("::ImageSeriesFlowPreprocessor_1::Segmentation negation",[=[false]=])
mmSetParamValue("::ImageSeriesTimestampFilter_1::Denoise iterations",[=[0]=])
mmSetParamValue("::ImageSeriesTimestampFilter_1::Denoise threshold",[=[100]=])
mmSetParamValue("::TransferFunctionGL_1::textureInterpolation",[=[Nearest neighbor]=])
mmSetParamValue("::TransferFunctionGL_1::TransferFunction",[=[{
  "IgnoreProjectRange": true,
  "Interpolation": "LINEAR",
  "Nodes": [
    [
      0.26700401306152344,
      0.004873999860137701,
      0.3294149935245514,
      1.0,
      0.0,
      0.05000000074505806
    ],
    [
      0.12814849615097046,
      0.565106987953186,
      0.5508924722671509,
      1.0,
      0.5,
      0.05000000074505806
    ],
    [
      0.9932479858398438,
      0.9061570167541504,
      0.14393599331378937,
      1.0,
      1.0,
      0.05000000074505806
    ]
  ],
  "TextureSize": 8,
  "ValueRange": [
    4.0,
    1024.0
  ]
}]=])

mmSetParamValue("::View2DGL_1::camstore::settings",[=[{"aspect":1.8879055976867676,"direction":[0.0,0.0,-1.0],"far_plane":100.0,"frustrum_height":2050.0,"image_plane_tile_end":[1.0,1.0],"image_plane_tile_start":[0.0,0.0],"near_plane":0.10000000149011612,"position":[1224.0,1025.0,1.0],"projection_type":1,"right":[0.0,-1.9231999728955828e-22,4.590513639281668e-41],"up":[0.0,1.0,0.0]}]=])
mmSetParamValue("::ImageSeriesLoader_1::Path",[=[luavis/assets/scripts/luavis/vis/example/data]=])
mmSetParamValue("::ImageSeriesRenderer_1::highlight::Enabled",[=[true]=])
mmSetParamValue("::ImageSeriesRenderer_1::highlight::Selected value",[=[81]=])
