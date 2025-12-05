-- This module configures Neovide-specific settings for Neovim.
-- [https://neovide.dev/configuration.html]

-- Use true color support in Neovide
vim.opt.termguicolors = true

-- Set up the Gui Font (font family and font size)
-- [https://www.nerdfonts.com/font-downloads]
vim.opt.guifont = 'JetBrainsMonoNL Nerd Font Mono:h14'

-- Line spacing
vim.opt.linespace = 7

-- Set the Neovide window opacity (0.0 to 1.0)
vim.g.neovide_opacity = 0.6

-- Enable window blur effect (only on supported systems and when the opacity is
-- less than 1.0)
vim.g.neovide_window_blurred = true

-- Set up floating blurry
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0

-- Cursor vfx (the cursor moving effect and particle effect)
-- Options: railgun, torpedo, pixiedust, sonicboom, ripple, wireframe
vim.g.neovide_cursor_vfx_mode = ''

-- The duraction of scroll animatoin
vim.g.neovide_scroll_animation_length = 0.3

-- Enable full screen on startup
vim.g.neovide_fullscreen = false

-- Whether to use the previous window size on startup
vim.g.neovide_remember_window_size = true

vim.g.neovide_floating_shadow = false
vim.g.neovide_floating_z_height = 20
vim.g.neovide_light_angle_degrees = 45
vim.g.neovide_light_radius = 5

-- Set up window padding
vim.g.neovide_padding_top = 0
vim.g.neovide_padding_bottom = 0
vim.g.neovide_padding_right = 0
vim.g.neovide_padding_left = 0
