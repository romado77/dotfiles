return {
	"tpope/vim-fugitive",
    keys = {
        {"<leader>gs", ":Git<CR>",  desc = "Git status" },
        {"<leader>gh", ":diffget //2<CR>",  desc = "Git diff get left" },
        {"<leader>gl", ":diffget //3<CR>",  desc = "Git diff get right" }

    }
}
