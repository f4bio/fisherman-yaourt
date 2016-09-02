###
# yadisowned
#
function yadisowned -d "Display list of disowned files"
  if test -d "$TMPDIR"
    set tmp $TMPDIR
  else
    set tmp "/tmp"
  end
  set dir (mktemp -d -p $tmp)

  set -l fs "$dir/fs"
  set -l db "$dir/db"

  yaourt -Qlq | sort -u > "$db"

  find /bin /etc /lib /sbin /usr ! -name lost+found \
         \( -type d -printf '%p/\n' -o -print \) | sort > "$fs"

  comm -23 "$fs" "$db"

  # clean-up after ourself
  rm -rf "$dir"
end
###
# yain
#
function yain -d "`yaourt -S`; Install specific package(s) from the repositories"
  yaourt -S $argv
end
###
# yains
#
function yains -d "Install specific package not from the repositories but from a file"
  yaourt -U $argv
end
###
# yalist
#
function yalist
  yaourt -Qei (yaourt -Qu|cut -d" " -f 1)|awk ' BEGIN {FS=":"}/^Name/{printf("\033[1;36m%s\033[1;37m", $2)}/^Description/{print $2}'
end
###
# yaloc
#
function yaloc -d "Display information about a given package in the local database"
  yaourt -Qi $argv
end
###
# yalocs
#
function yalocs -d "Search for package(s) in the local database"
  yaourt -Qs $argv
end
###
# yaupd
#
which abs ^ /dev/null > /dev/null
if test $status -ne 1
  function yaupd -d "Update and refresh the local package and ABS databases against repositories"
    yaourt -Sy; and sudo abs
  end
else
  function yaupd -d "Update and refresh the local package against repositories"
    yaourt -Sy
  end
end

###
# yaupg
#
function yaupg -d "Synchronize with repositories before upgrading packages that are out of date on the local system."
  yaourt -Syua
end
