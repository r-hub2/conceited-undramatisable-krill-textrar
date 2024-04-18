# Test environments

* local
    * Windows 11, R 4.3.3
    * Mac OS 11 Big Sur, R 4.3.3
* devtools::check_win_devel()
* rhub::rc_submit()
    * ubuntu-latest on GitHub
    * macos-latest on GitHub
    * windows-latest on GitHub
    <https://github.com/r-hub2/conceited-undramatisable-krill-textrar/actions>

# R CMD check results

## On local check 

There were 0 errors  | 0 warnings  | 0 notes

## devtools::check_win_devel() and devtools::check_rhub()

There were 0 errors  | 0 warnings  | 4 notes

* checking CRAN incoming feasibility ... NOTE
  Maintainer: 'Toshikazu Matsumura <matutosi@gmail.com>'
  New submission
  Possibly misspelled words in DESCRIPTION:
    TexTra (10:5)

* checking for non-standard things in the check directory ... NOTE
  Found the following files/directories:
  ''NULL''

* checking for detritus in the temp directory ... NOTE
  Found the following files/directories:
  'lastMiKTeXException'

* checking HTML version of manual ... NOTE
  Skipping checking HTML validation: no command 'tidy' found

# Downstream dependencies

There are currently no downstream dependencies for this package.
