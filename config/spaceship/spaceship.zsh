# Spaceship Prompt Configuration
SPACESHIP_PROMPT_ADD_NEWLINE=true
SPACESHIP_PROMPT_SEPARATE_LINE=false
# Enable async rendering
SPACESHIP_PROMPT_ASYNC=false

# Enable components
# SPACESHIP_TIME_SHOW=true
SPACESHIP_USER_SHOW=always
SPACESHIP_HOST_SHOW=always
SPACESHIP_DIR_TRUNC=0
# Do not truncate path in repos
SPACESHIP_DIR_TRUNC_REPO=false

# Prompt order
SPACESHIP_PROMPT_ORDER=(
  # time
  user          # username
  dir           # full path
  host          # hostname
  git           # git info
  vi_mode       # vim mode
  char          # prompt char
)

# Add custom Ember section
# See: https://github.com/spaceship-prompt/spaceship-ember
spaceship add ember
# Add a custom vi-mode section to the prompt
# See: https://github.com/spaceship-prompt/spaceship-vi-mode
spaceship add --before char vi_mode
