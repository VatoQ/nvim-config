return {
  'rmagatti/auto-session',
  lazy = false,

  ---enables autocompletes for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '~/Documents/', '/' },
    -- log_level = "debug",
  },
}
