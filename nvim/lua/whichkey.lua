local wk = require("which-key")

wk.register(
  {
    c = {"<cmd>CommentToggle<cr>", "comment toggle"},
    h = {"<C-W>s<cr>", "split below"},
    v = {"<C-W>v<cr>", "split right"},
    s = {":w<cr>", "save"},
    p = {"<cmd>Telescope buffers<cr>", "list open buffers"},
    f = {
      name = "+Telescope",
      B = {"<cmd>Telescope git_branches<cr>", "git branches"},
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
      a = {"<cmd>Lspsaga code_action<cr>", "code action"},
      A = {"<cmd>Lspsaga range_code_action<cr>", "selected action"},
      D = {"<cmd>Telescope lsp_document_diagnostics<cr>", "document diagnostics"},
      i = {"<cmd>lua vim.lsp.buf.implementation()<cr>", "implementations"},
      d = {"<cmd>lua vim.lsp.buf.definition()<cr>", "go to definition"},
      q = {"<cmd>Telescope quickfix<cr>", "quickfix"},
      r = {"<cmd>lua vim.lsp.buf.references()<cr>", "references"},
      R = {"<cmd>Lspsaga rename<cr>", "rename"},
      t = {"<cmd>lua vim.lsp.type_definition()<cr>", "type defintion"},
      x = {"<cmd>cclose<cr>", "close quickfix"},
      s = {"<cmd>lua vim.lsp.buf.signature_help()<cr>", "signature help"},
      S = {"<cmd>Telescope lsp_document_symbols<cr>", "document symbols"}
    }
  },
  {
    prefix = "<leader>"
  }
)
