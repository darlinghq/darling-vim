project(vim-src)

# vim does some intentional buffer overflows between struct members -> disable fortification
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=0 -Wno-error=int-conversion")

add_definitions(-DHAVE_CONFIG_H -DMACOS_X_UNIX -DMACOS_X_DARWIN "-DINLINE=" -nostdinc -w "-include ../gen/vim_dynamic_config.h"
	-DFEAT_RUBY -DDYNAMIC_RUBY -D"DYNAMIC_RUBY_DLL=\"\\\"/System/Library/Frameworks/Ruby.framework/Ruby\\\"\""
)

include_directories(
	${CMAKE_CURRENT_SOURCE_DIR}
	${CMAKE_CURRENT_SOURCE_DIR}/proto
	${CMAKE_CURRENT_SOURCE_DIR}/libvterm/include
	${CMAKE_CURRENT_SOURCE_DIR}/../darling/submodules/ruby/darling/include/ruby
)

set(vim_sources
	arabic.c
	arglist.c
	auto/pathdef.c
	autocmd.c
	blob.c
	blowfish.c
	buffer.c
	bufwrite.c
	change.c
	channel.c
	charset.c
	cindent.c
	clientserver.c
	clipboard.c
	cmdexpand.c
	cmdhist.c
	crypt_zip.c
	crypt.c
	debugger.c
	dict.c
	diff.c
	digraph.c
	drawline.c
	drawscreen.c
	edit.c
	eval.c
	evalbuffer.c
	evalfunc.c
	evalvars.c
	evalwindow.c
	ex_cmds.c
	ex_cmds2.c
	ex_docmd.c
	ex_eval.c
	ex_getln.c
	fileio.c
	filepath.c
	findfile.c
	fold.c
	getchar.c
	gui_xim.c
	hardcopy.c
	hashtab.c
	help.c
	highlight.c
	if_cscope.c
	if_ruby.c
	if_xcmdsrv.c
	indent.c
	insexpand.c
	job.c
	json.c
	list.c
	locale.c
	main.c
	map.c
	mark.c
	match.c
	mbyte.c
	memfile.c
	memline.c
	menu.c
	message.c
	misc1.c
	misc2.c
	mouse.c
	move.c
	netbeans.c
	normal.c
	ops.c
	option.c
	optionstr.c
	os_mac_conv.c
	os_macosx.m
	os_unix.c
	popupmenu.c
	popupwin.c
	profiler.c
	pty.c
	quickfix.c
	regexp.c
	register.c
	screen.c
	scriptfile.c
	search.c
	session.c
	sha256.c
	sign.c
	spell.c
	spellfile.c
	spellsuggest.c
	syntax.c
	tag.c
	term.c
	terminal.c
	testing.c
	textformat.c
	textobject.c
	textprop.c
	time.c
	typval.c
	ui.c
	undo.c
	usercmd.c
	userfunc.c
	version.c
	vim9compile.c
	vim9execute.c
	vim9script.c
	vim9type.c
	viminfo.c
	window.c
)

set(libvterm_sources
	beval.c
	libvterm/src/encoding.c
	libvterm/src/keyboard.c
	libvterm/src/mouse.c
	libvterm/src/parser.c
	libvterm/src/pen.c
	libvterm/src/screen.c
	libvterm/src/state.c
	libvterm/src/unicode.c
	libvterm/src/vterm.c
)

# requires `dev_gui_common` component because of AppKit and CoreServices
if (COMPONENT_dev_gui_common)
	add_darling_static_library(libvterm SOURCES ${libvterm_sources})
	add_darling_executable(vim ${vim_sources})
	target_link_libraries(vim system CoreServices ncurses CoreFoundation Foundation AppKit iconv libvterm)

	install(TARGETS vim DESTINATION libexec/darling/usr/bin)

	InstallSymlink(vim "${CMAKE_INSTALL_PREFIX}/libexec/darling/usr/bin/ex")
	InstallSymlink(vim "${CMAKE_INSTALL_PREFIX}/libexec/darling/usr/bin/rview")
	InstallSymlink(vim "${CMAKE_INSTALL_PREFIX}/libexec/darling/usr/bin/rvim")
	InstallSymlink(vim "${CMAKE_INSTALL_PREFIX}/libexec/darling/usr/bin/vi")
	InstallSymlink(vim "${CMAKE_INSTALL_PREFIX}/libexec/darling/usr/bin/view")
	InstallSymlink(vim "${CMAKE_INSTALL_PREFIX}/libexec/darling/usr/bin/vimdiff")
endif()

if (COMPONENT_cli)
	add_darling_executable(xxd xxd/xxd.c)

	install(TARGETS xxd DESTINATION libexec/darling/usr/bin)
endif()
