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
