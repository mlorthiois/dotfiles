local wk = require("which-key")

wk.register(
  {
    c = {"<cmd>CommentToggle<cr>", "comment toggle"},
    h = {"<C-W>s<cr>", "split below"},
    v = {"<C-W>v<cr>", "split right"},
    s = {":w<cr>", "save"},
    b = {"<cmd>Telescope buffers<cr>", "list open buffers"},
    n = {":lnext<cr>", "Next in localfix"},
    p = {":lprev<cr>", "Prev in localfix"},
    f = {
      name = "+Telescope",
      p = {"<cmd>Telescope oldfiles<cr>", "previous open files"},
      f = {"<cmd>Telescope find_files<cr>", "files"},
      h = {"<cmd>Telescope command_history<cr>", "history"},
      o = {"<cmd>Telescope vim_options<cr>", "vim_options"},
      g = {"<cmd>Telescope live_grep<cr>", "text"},
      r = {"<cmd>Telescope registers<cr>", "registers"},
      w = {"<cmd>Telescope file_browser<cr>", "buf_fuz_find"}
    },
    g = {
      name = "+Git",
      b = {"<cmd>Telescope git_branches<cr>", "git branches"},
      j = {"<cmd>Gitsigns next_hunk", "next hunk"},
      k = {"<cmd>Gitsigns prev_hunk", "prev hunk"},
      p = {"<cmd>Gitsigns preview_hunk", "preview hunk"},
      r = {"<cmd>Gitsigns reset_hunk", "reset hunk"},
      R = {"<cmd>Gitsigns reset_buffer", "reset buffer"},
      s = {"<cmd>Gitsigns stage_hunk", "stage hunk"},
      u = {"<cmd>Gitsigns undo_stage_hunk", "stage hunk"}
    },
    l = {
      name = "+LSP",
      a = {"<cmd>Lspsaga code_action<cr>", "Code action"},
      g = {"<cmd>lua vim.lsp.buf.definition()<cr>", "Go to definition"},
      t = {"<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type definition"},
      r = {"<cmd>Telescope lsp_references<cr>", "Symbol References"},
      R = {"<cmd>Lspsaga rename<cr>", "Rename symbol"},
      d = {"<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Document diagnostics"},
      D = {"<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace diagnostics"},
      s = {"<cmd>Telescope lsp_document_symbols<cr>", "Document symbols"},
      S = {"<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace symbols"},
      n = {"<cmd>lua vim.lsp.diagnostic.goto_next()<cr>", "Next diagnostic"},
      p = {"<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev diagnostic"}
    }
  },
  {
    prefix = "<leader>"
  }
)
