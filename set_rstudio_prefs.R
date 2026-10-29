# Set RStudio preferences (Tools - Global Options) from R.

# get and check rstudioapi R package:
if(!requireNamespace("rstudioapi", quietly=TRUE)) install.packages("rstudioapi")
if(!rstudioapi::isAvailable()) stop("This script must be run inside RStudio.", call.=FALSE)

# See what will be set, depending on selection when asked below:
settings <- list(
# level 1:
"load_workspace"=FALSE,   # do not carry objects over to new sessions
"save_workspace"="never", # keep code reproducible

"always_save_history"=FALSE, # don't save record of running code, work with git

"default_encoding"="UTF-8", # avoid file encoding hassle

"always_shown_extensions"=list(), # actually hide hidden files in RStudio
"always_shown_files"=list(),      # when 'Show hidden files' is off

"highlight_r_function_calls"=TRUE, # make
"rainbow_parentheses"=TRUE,        # syntax highlighting
"syntax_color_console"=TRUE,       # nicer

"auto_append_newline"=TRUE, # end scripts with empty line for cleaner git diffs
"save_files_before_build"=TRUE, # for package developers

"rmd_viewer_type"="pane", # rendered quarto documents in RStudio instead of browser

# level 2:
"editor_theme"="Cobalt", # dark mode

# level 3:
"project_user_data_directory"="~/.R/rstudioprojects_SetbyBerry", # outside of (synced) project folder
"reindent_on_paste"=FALSE, # keep indentation of pasted code as it is
"enable_snippets"=FALSE, # avoid annoying snippet expansion when pressing TAB
"line_ending_conversion"="windows", # CR/LF line endings on every OS
"default_sweave_engine"="knitr", # for Rnw documents (use quarto instead now)
"jobs_tab_visibility"="shown", # keep "Background jobs" open to check results later
"windows_terminal_shell"="win-ps", # to enable CTRL + V in the terminal
"real_time_spellchecking"=FALSE # no red squiggles under words in the editor
)

message("Select which RStudio settings are to be changed:\n",
        "1: basics\n",
        "2: also dark mode\n",
        "3: also Berry's personal preferences\n",
        "Anything else: don't change settings")
lvl <- readline("Type wanted number here in console, then press ENTER: ")
sel <- c()
if(lvl=="1") sel <- 1:12
if(lvl=="2") sel <- 1:13
if(lvl=="3") sel <- 1:21

message("Changing ", length(sel), " settings...")
for(i in seq_along(sel)) rstudioapi::writeRStudioPreference(names(settings)[i], settings[[i]])

# outro:
fn <- "~/.config"
if(Sys.info()[["sysname"]]=="Windows") fn <- gsub("\\","/",Sys.getenv("APPDATA"), fixed=TRUE)
if(length(sel)>1)
message("RStudio settings adapted.\nTo edit individually, run:\n",
        "file.edit('", fn, "/rstudio/rstudio-prefs.json')\n",
        "For Keyboard shortcuts, see:\nhttps://brry.github.io/course/#settings")

