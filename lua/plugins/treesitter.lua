-- ~/Projects/vimrc/lua/plugins/treesitter-plugins.lua

return {
  -- Treesitter Textobjects
  {
    'nvim-treesitter/nvim-treesitter-textobjects',

    event = { "BufReadPost", "BufNewFile" },

    config = function()
      -- 直接使用 textobjects 模組，不透過 configs
      require('nvim-treesitter-textobjects').setup({
        select = {
          enable = true,
          lookahead = true, -- 自動向前尋找 textobject

          keymaps = {
            -- Functions
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",

            -- Classes/Modules
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",

            -- Blocks
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",

            -- Parameters/Arguments
            ["ap"] = "@parameter.outer",
            ["ip"] = "@parameter.inner",

            -- Comments
            ["a/"] = "@comment.outer",
            ["i/"] = "@comment.inner",

            -- Conditionals (if/else)
            ["ai"] = "@conditional.outer",
            ["ii"] = "@conditional.inner",

            -- Loops
            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",
          },

          -- 選取模式
          selection_modes = {
            ['@parameter.outer'] = 'v', -- charwise
            ['@function.outer'] = 'V',  -- linewise
            ['@class.outer'] = '<c-v>', -- blockwise
          },

          -- 是否包含周圍空白
          include_surrounding_whitespace = false,
        },

        -- 在 textobjects 間移動
        move = {
          enable = true,
          set_jumps = true, -- 加入 jumplist (可用 Ctrl-o/Ctrl-i 跳回)

          -- 跳到下一個開始
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]c"] = "@class.outer",
            ["]a"] = "@parameter.inner",
            ["]b"] = "@block.outer",
          },

          -- 跳到下一個結束
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]C"] = "@class.outer",
            ["]A"] = "@parameter.inner",
            ["]B"] = "@block.outer",
          },

          -- 跳到上一個開始
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[c"] = "@class.outer",
            ["[a"] = "@parameter.inner",
            ["[b"] = "@block.outer",
          },

          -- 跳到上一個結束
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[C"] = "@class.outer",
            ["[A"] = "@parameter.inner",
            ["[B"] = "@block.outer",
          },
        },

        -- 交換 textobjects（進階功能）
        swap = {
          enable = true,
          swap_next = {
            ["<leader>sp"] = "@parameter.inner", -- swap parameter
            ["<leader>sf"] = "@function.outer",  -- swap function
          },
          swap_previous = {
            ["<leader>sP"] = "@parameter.inner",
            ["<leader>sF"] = "@function.outer",
          },
        },

        -- LSP 互操作（可選）
        lsp_interop = {
          enable = true,
          border = 'rounded',
          peek_definition_code = {
            ["<leader>pf"] = "@function.outer",
            ["<leader>pc"] = "@class.outer",
          },
        },
      })
    end,
  },

-- === 選取 (Visual mode) ===
-- vif   " 選取函數內容 (inner function)
-- vaf   " 選取整個函數 (around function)
-- vip   " 選取參數 (inner parameter)
-- vap   " 選取參數及逗號 (around parameter)
-- vib   " 選取 block 內容
-- vab   " 選取整個 block
-- vic   " 選取 class 內容
-- vac   " 選取整個 class

-- " === 刪除 ===
-- dif   " 刪除函數內容
-- dap   " 刪除參數
-- dab   " 刪除 block

-- === 修改 ===
-- cif   " 修改函數內容
-- cap   " 修改參數
-- cib   " 修改 block 內容

-- " === 移動 ===
-- ]m    " 跳到下一個函數開始
-- [m    " 跳到上一個函數開始
-- ]M    " 跳到下一個函數結束
-- [M    " 跳到上一個函數結束
-- ]b    " 跳到下一個 block
-- [b    " 跳到上一個 block

-- " === 交換（需要先設定 leader key，例如 space）===
-- <leader>sp   " 與下一個參數交換位置
-- <leader>sP   " 與上一個參數交換位置
-- <leader>sf   " 與下一個函數交換位置

-- " === Peek 定義（需要 LSP）===
-- <leader>pf   " Peek 函數定義
-- <leader>pc   " Peek class 定義

  -- Treesitter Context
  {
    'nvim-treesitter/nvim-treesitter-context',

    event = { "BufReadPost", "BufNewFile" },

    opts = {
      enable = true,
      max_lines = 3,           -- 最多顯示幾行上下文
      min_window_height = 0,   -- 最小視窗高度才啟用
      line_numbers = true,     -- 顯示行號
      multiline_threshold = 1, -- 多行函數才顯示
      trim_scope = 'outer',    -- 修剪範圍
      mode = 'cursor',         -- 模式: 'cursor' 或 'topline'
      separator = nil,         -- 分隔符號 (nil = 無)
      zindex = 20,             -- z-index
    },

    -- 按鍵映射
    keys = {
      {
        "<leader>tc",
        function()
          require("treesitter-context").toggle()
        end,
        desc = "Toggle Treesitter Context",
      },
      {
        "[x",
        function()
          require("treesitter-context").go_to_context()
        end,
        desc = "Go to context",
      },
    },
  },
}

-- <leader>tc   " 切換 context 顯示/隱藏
-- [x           " 跳到當前 context 所在位置（例如跳到函數開頭）
