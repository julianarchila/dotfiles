return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")

    local cmake = require("cmake-tools")

    local icons = require("config.icons")

    -- colors = colors.light;
    local config = {
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    }

    -- Inserts a component in lualine_c at left section
    local function ins_c_section(component)
      -- remove separator for components added using this function
      component.separator = ""
      table.insert(config.sections.lualine_c, component)
    end

    ---------------------
    ---- CMake Tools ----
    ---------------------

    -- Build type
    ins_c_section({
      function()
        local type = cmake.get_build_type()
        return "BuildType: [" .. (type and type or "") .. "]"
      end,
      icon = icons.ui.Search,
      cond = function()
        return cmake.is_cmake_project() and not cmake.has_cmake_preset()
      end,
      on_click = function(n, mouse)
        if n == 1 then
          if mouse == "l" then
            vim.cmd("CMakeSelectBuildType")
          end
        end
      end,
    })

    -- Select kit
    --[[ ins_c_section({
      function()
        local kit = cmake.get_kit()
        return "[" .. (kit and kit or "X") .. "]"
      end,
      icon = icons.ui.Pencil,
      cond = function()
        return cmake.is_cmake_project() and not cmake.has_cmake_preset()
      end,
      on_click = function(n, mouse)
        if n == 1 then
          if mouse == "l" then
            vim.cmd("CMakeSelectKit")
          end
        end
      end,
    }) ]]

    -- Build
    ins_c_section({
      function()
        return "Build"
      end,
      icon = icons.ui.Gear,
      cond = cmake.is_cmake_project,
      on_click = function(n, mouse)
        if n == 1 then
          if mouse == "l" then
            vim.cmd("CMakeBuild")
          end
        end
      end,
    })

    -- Build Preset
    --[[ ins_c_section({
      function()
        local b_preset = cmake.get_build_preset()
        return "[" .. (b_preset and b_preset or "X") .. "]"
      end,
      icon = icons.ui.Search,
      cond = function()
        return cmake.is_cmake_project() and cmake.has_cmake_preset()
      end,
      on_click = function(n, mouse)
        if n == 1 then
          if mouse == "l" then
            vim.cmd("CMakeSelectBuildPreset")
          end
        end
      end,
    }) ]]

    -- Select Build Target
    ins_c_section {
      function()
        local b_target = cmake.get_build_target()
        return "[" .. (b_target and b_target or "Build Target") .. "]"
      end,
      cond = cmake.is_cmake_project,
      on_click = function(n, mouse)
        if (n == 1) then
          if (mouse == "l") then
            vim.cmd("CMakeSelectBuildTarget")
          end
        end
      end
    }

    -- Debug
    ins_c_section {
      function()
        return icons.ui.Debug
      end,
      cond = cmake.is_cmake_project,
      on_click = function(n, mouse)
        if (n == 1) then
          if (mouse == "l") then
            vim.cmd("CMakeDebug")
          end
        end
      end
    }

    -- Run
    ins_c_section {
      function()
        return icons.ui.Run
      end,
      cond = cmake.is_cmake_project,
      on_click = function(n, mouse)
        if (n == 1) then
          if (mouse == "l") then
            vim.cmd("CMakeRun")
          end
        end
      end
    }
    -- Select Launch Target
    ins_c_section {
      function()
        local l_target = cmake.get_launch_target()
        return "[" .. (l_target and l_target or "Launch Target") .. "]"
      end,
      cond = cmake.is_cmake_project,
      on_click = function(n, mouse)
        if (n == 1) then
          if (mouse == "l") then
            vim.cmd("CMakeSelectLaunchTarget")
          end
        end
      end
    }
    -- Now don't forget to initialize lualine
    lualine.setup(config)
  end,
}
