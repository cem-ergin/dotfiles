if vim.g.vscode then
    -- VSCode extension


    require("cem.initvscode")
else
    -- ordinary Neovim
    require("cem.initnvim")
end
