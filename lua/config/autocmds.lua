-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--

vim.cmd([[
  function! ElixirUmbrellaTransform(cmd) abort
    if match(a:cmd, 'apps/') != -1
      return substitute(a:cmd, 'mix test apps/\([^/]*\)/', 'doppler run -- mix cmd --app \1 mix test --color ', '')
    else
      return a:cmd
    end
  endfunction

  let g:test#custom_transformations = {'elixir_umbrella': function('ElixirUmbrellaTransform')}
  let g:test#transformation = 'elixir_umbrella'
]])
