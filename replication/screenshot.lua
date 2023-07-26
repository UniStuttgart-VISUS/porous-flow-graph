mmSetWindowFramebufferSize(1920, 1080)

local wait_time = 10

do
    local start = os.clock()
    while start + wait_time > os.clock() do
        mmRenderNextFrame()
    end
    mmScreenshotEntryPoint('::View2DGL_1', '_fig.4a.png')
end

mmQuit()
