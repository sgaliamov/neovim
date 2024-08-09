return {
  'williamboman/mason-lspconfig.nvim', -- bridges mason.nvim with the nvim-lspconfig
  dependencies = { 'williamboman/mason.nvim' },
  opts = {
    ensure_installed = {
      'bashls',
      'bicep',
      'biome', -- js and json
      'lemminx', -- xml
      'lua_ls',
      'marksman', -- md
      'powershell_es',
      'rust_analyzer',
      'openscad_lsp',
      'taplo', -- toml
      'yamlls', -- yaml
      -- 'csharp_ls',
    },
  },
}
