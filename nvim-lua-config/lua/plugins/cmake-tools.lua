local function configCmakeTools()
    local cmake = require('cmake-tools')
    cmake.setup({
        cmake_build_directory = 'build/${variant:buildType}',
    })
end

return {
    'civitasv/cmake-tools.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = configCmakeTools,
}
