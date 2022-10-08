return {
  ["goolord/alpha-nvim"] = { disable = true },
  ["max397574/better-escape.nvim"] = { disable = true },
  ["EdenEast/nightfox.nvim"] = {
    config = require "user.plugins.nightfox",
  },
  ["ur4ltz/surround.nvim"] = {
    event = "BufRead",
    config = function() require("surround").setup { mappings_style = "surround", map_insert_mode = false } end,
  },
  ["phaazon/hop.nvim"] = {
    branch = "v1", -- optional but strongly recommended
    event = "BufRead",
    config = function() require("hop").setup() end,
  },
  ["ray-x/lsp_signature.nvim"] = {
    event = "InsertEnter",
    config = function() require("lsp_signature").setup {} end,
  },
  ["KabbAmine/vCoolor.vim"] = {
    cmd = "VCoolor",
  },
  ["sindrets/winshift.nvim"] = {
    cmd = "WinShift",
    config = require "user.plugins.WinShift",
  },
  ["nvim-telescope/telescope-dap.nvim"] = {
    module = "telescope._extensions.dap",
  },
  ["nvim-telescope/telescope-packer.nvim"] = {
    module = "telescope._extensions.packer",
  },
  ["nvim-treesitter/playground"] = {
    cmd = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    after = "nvim-dap",
    config = function() require("nvim-dap-virtual-text").setup() end,
  },
  ["ziontee113/syntax-tree-surfer"] = { module = "syntax-tree-surfer" },
  ["nvim-treesitter/nvim-treesitter-textobjects"] = { after = "nvim-treesitter" },
  ["andymass/vim-matchup"] = {
    event = "BufRead",
    config = function() vim.g.matchup_matchparen_offscreen = {} end,
  },
  ["hrsh7th/cmp-nvim-lua"] = { after = "cmp_luasnip" },

  { "booperlv/nvim-gomove" },

  -- {
  --   "kylechui/nvim-surround",
  --   tag = "*", -- Use for stability; omit to use `main` branch for the latest features
  --   config = function()
  --     require("nvim-surround").setup {
  --       -- Configuration here, or leave empty to use defaults
  --     }
  --   end,
  -- },
  --
  { "normen/vim-pio" },

  ["neoclide/coc.nvim"] = {
    branch = "release",
    config = require "user.plugins.coc",
  },
}
