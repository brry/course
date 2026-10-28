# Website to this script: https://brry.github.io/course/#settings

# Set RStudio preferences (Tools - Global Options) from R.
# Settings are applied immediately, no restart needed.
# For each group, the changes are listed and you are asked before they are applied.

# get and check rstudioapi R package:
if(!requireNamespace("rstudioapi", quietly=TRUE)) install.packages("rstudioapi")
if(!rstudioapi::isAvailable()) stop("This script must be run inside RStudio.", call.=FALSE)

# The `why` text is both the explanation of the setting and what is shown in the console.
pref <- function(name, value, why) list(name=name, value=value, why=why)

groups <- list(

list(title = "reproducibility + basics", who = "recommended for everyone",
prefs = list(
pref("load_workspace", FALSE,
     "do not restore old objects at startup (code should run from a clean session)"),
pref("save_workspace", "never",
     "do not save the workspace to .RData on exit"),
pref("always_save_history", FALSE,
     "do not save .Rhistory in the working directory"),
pref("always_shown_extensions", list(),
     "files shown in the Files pane even if 'Show hidden files' is off; empty = hide .git, .Rproj.user, ..."),
pref("always_shown_files", list(),
     "same, for complete file names; empty = hide them too"),
pref("default_encoding", "UTF-8",
     "save scripts as UTF-8 (works across operating systems and with special characters)")
)),

list(title = "comfort + readability", who = "useful for most people, purely visual/convenience",
prefs = list(
pref("highlight_r_function_calls", TRUE,
     "function names in code get their own color"),
pref("rainbow_parentheses", TRUE,
     "matching brackets share a color, easier to spot unbalanced ones"),
pref("auto_append_newline", TRUE,
     "scripts end with an empty line (cleaner git diffs)"),
pref("syntax_color_console", TRUE,
     "syntax highlighting for code typed in the console"),
pref("save_files_before_build", TRUE,
     "save all open files before building/checking a package")
)),

list(title = "personal taste", who = "Berry's preferences, skip if unsure",
prefs = list(
pref("editor_theme", "Cobalt",
     "dark blue editor theme"),
pref("enable_snippets", FALSE,
     "no code snippet expansion when pressing TAB"),
pref("real_time_spellchecking", FALSE,
     "no red squiggles under words in the editor"),
pref("reindent_on_paste", FALSE,
     "keep indentation of pasted code as it is")
)),

list(title = "multiple computers / cloud sync", who = "if you work on several OS or in Dropbox / Google Drive",
prefs = list(
pref("line_ending_conversion", "windows",
     "CR/LF line endings on every OS, so files do not differ between e.g. Windows PC and Mac"),
pref("project_user_data_directory", "~/.R/rstudioprojects",
     "store the .Rproj.user folder outside of the (synced) project folder")
))

)

message("\n== set_rstudio_prefs ==\n",
  "This script changes RStudio preferences (Tools - Global Options) in ", length(groups), " groups.\n",
  "For each group, the changes (old -> new) are listed first.\n",
  "Nothing is changed without your explicit 'yes'; settings apply immediately.\n",
  "Not run in RStudio's console? Then you will be asked nothing and nothing is changed.")

show <- function(x) paste(deparse(x), collapse="")

for(i in seq_along(groups))
{
g <- groups[[i]]
message("\n--- group ", i, ": ", g$title, " (", g$who, ") ---")
current <- lapply(g$prefs, function(p) rstudioapi::readRStudioPreference(p$name, NA))
todo <- !mapply(function(p, cur) identical(p$value, cur), g$prefs, current)
if(!any(todo))
  {
  message("All ", length(todo), " settings already set, nothing to do.")
  next
  }
for(j in which(todo))
  message(g$prefs[[j]]$name, ": ", show(current[[j]]), " -> ", show(g$prefs[[j]]$value),
          "\n    ", g$prefs[[j]]$why)
if(any(!todo)) message("(already set: ",
                       paste(sapply(g$prefs[!todo], `[[`, "name"), collapse=", "), ")")
answer <- askYesNo(paste0("Apply these ", sum(todo), " changes (group ", i, ": ", g$title, ")?"),
                   default=NA)
if(is.na(answer)) # Cancel / no answer possible
  {
  message("Cancelled, no further changes.")
  break
  }
if(!answer)
  {
  message("Group ", i, " skipped.")
  next
  }
for(j in which(todo))
  rstudioapi::writeRStudioPreference(g$prefs[[j]]$name, g$prefs[[j]]$value)
message("Group ", i, " applied.")
}

message("\nDone. Keyboard shortcuts are not covered here, see https://brry.github.io/course/#settings")
