" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/home/jason/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/jason/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/jason/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/jason/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/jason/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["BetterLua.vim"] = {
    loaded = true,
    path = "/home/jason/.local/share/nvim/site/pack/packer/start/BetterLua.vim"
  },
  ["base16-vim"] = {
    loaded = true,
    path = "/home/jason/.local/share/nvim/site/pack/packer/start/base16-vim"
  },
  ["completion-nvim"] = {
    loaded = true,
    path = "/home/jason/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/home/jason/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/jason/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/jason/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["md-img-paste.vim"] = {
    loaded = true,
    path = "/home/jason/.local/share/nvim/site/pack/packer/start/md-img-paste.vim"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "/home/jason/.local/share/nvim/site/pack/packer/start/nlua.nvim"
  },
  ["nvim-bufferline.lua"] = {
    loaded = true,
    path = "/home/jason/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/jason/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/jason/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/jason/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/jason/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/jason/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/jason/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["pandoc-preview.vim"] = {
    loaded = true,
    path = "/home/jason/.local/share/nvim/site/pack/packer/start/pandoc-preview.vim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/jason/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/jason/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/jason/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-colorscheme-switcher"] = {
    loaded = true,
    path = "/home/jason/.local/share/nvim/site/pack/packer/start/vim-colorscheme-switcher"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/home/jason/.local/share/nvim/site/pack/packer/start/vim-dispatch"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/jason/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-misc"] = {
    loaded = true,
    path = "/home/jason/.local/share/nvim/site/pack/packer/start/vim-misc"
  },
  ["vim-pandoc"] = {
    loaded = true,
    path = "/home/jason/.local/share/nvim/site/pack/packer/start/vim-pandoc"
  },
  ["vim-pandoc-syntax"] = {
    loaded = true,
    path = "/home/jason/.local/share/nvim/site/pack/packer/start/vim-pandoc-syntax"
  }
}

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
