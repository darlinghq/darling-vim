project(vim-src)

# vim does some intentional buffer overflows between struct members -> disable fortification
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=0")

add_definitions(-DHAVE_CONFIG_H -DMACOS_X_UNIX -nostdinc -w)

include_directories(
	${CMAKE_CURRENT_SOURCE_DIR}
	${CMAKE_CURRENT_SOURCE_DIR}/proto
	${CMAKE_SOURCE_DIR}/src/libc/gen
)

set(vim_sources
	buffer.c
	blowfish.c
	charset.c
	crypt.c
	crypt_zip.c
	diff.c
	digraph.c
	edit.c
	eval.c
	ex_cmds.c
	ex_cmds2.c
	ex_docmd.c
	ex_eval.c
	ex_getln.c
	fileio.c
	fold.c
	getchar.c
	hardcopy.c
	hashtab.c
	if_cscope.c
	if_xcmdsrv.c
	mark.c
	memline.c
	menu.c
	message.c
	misc1.c
	misc2.c
	move.c
	mbyte.c
	normal.c
	ops.c
	option.c
	os_unix.c
	auto/pathdef.c
	popupmnu.c
	quickfix.c
	regexp.c
	screen.c
	search.c
	sha256.c
	spell.c
	syntax.c
	tag.c
	term.c
	ui.c
	undo.c
	window.c
	#os_macosx.m # Disabled until we have AppKit with NSPasteboard
	os_mac_conv.c
	netbeans.c
	main.c
	memfile.c
	version.c
)

add_darling_executable(vim ${vim_sources})
target_link_libraries(vim system CoreServices ncurses CoreFoundation iconv)

add_darling_executable(xxd xxd/xxd.c)

install(TARGETS vim xxd DESTINATION libexec/darling/usr/bin)

InstallSymlink(vim "${CMAKE_INSTALL_PREFIX}/libexec/darling/usr/bin/ex")
InstallSymlink(vim "${CMAKE_INSTALL_PREFIX}/libexec/darling/usr/bin/rview")
InstallSymlink(vim "${CMAKE_INSTALL_PREFIX}/libexec/darling/usr/bin/rvim")
InstallSymlink(vim "${CMAKE_INSTALL_PREFIX}/libexec/darling/usr/bin/vi")
InstallSymlink(vim "${CMAKE_INSTALL_PREFIX}/libexec/darling/usr/bin/view")
InstallSymlink(vim "${CMAKE_INSTALL_PREFIX}/libexec/darling/usr/bin/vimdiff")
