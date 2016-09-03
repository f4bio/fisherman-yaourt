function ya -d "yaourt - aur and pacman wrapper"
  if test (count $argv) -ge 1
    set -l cmd $argv[1]
    echo "found command: $cmd"
  end

  if test (count $argv) -gt 1
    set -l cmdv $argv[2..-1]
    echo "found args: $cmdv"
  end

  switch "$cmd"
    case "test"
      echo $cmdv
    case "in"
      yaourt -S $cmdv
    case "upd"
      yaourt -Sy
    case "*"
      echo -e 'unknown command: "$cmd" - check `\$ ya help`'
  end
end

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
function yains -d "yaourt -U	Install specific package not from the repositories but from a file"
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
