-- ~/.config/yazi/init.lua
require("bookmarks"):setup({
	save_last_directory = true,
	persist = "vim",
	notify = {
		enable = true,
		timeout = 1,
		message = {
			new = "New bookmark '<key>' -> '<folder>'",
			delete = "Deleted bookmark in '<key>'",
			delete_all = "Deleted all bookmarks",
		},
	},
})

