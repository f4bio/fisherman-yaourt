function __ya_disowned -d "yaourt -Qlq; Display list of disowned files"
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
