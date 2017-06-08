project(vim)

add_subdirectory(src)
add_subdirectory(runtime)

install(FILES local/vimrc DESTINATION libexec/darling/usr/share/vim)
