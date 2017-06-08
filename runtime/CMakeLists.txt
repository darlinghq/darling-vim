project(vim-runtime)

install(FILES doc/vim.1 DESTINATION libexec/darling/usr/share/man/man1)
install(FILES bugreport.vim  delmenu.vim  evim.vim  filetype.vim  ftoff.vim  ftplugin.vim  ftplugof.vim  gvimrc_example.vim  indent.vim  indoff.vim  macmap.vim  makemenu.vim  menu.vim  mswin.vim  optwin.vim  scripts.vim  synmenu.vim  vimrc_example.vim DESTINATION libexec/darling/usr/share/vim/vim74)

install(DIRECTORY autoload colors compiler doc ftplugin indent keymap lang macros plugin print spell syntax tutor DESTINATION libexec/darling/usr/share/vim/vim74)

