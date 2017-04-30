function ya -d "yaourt - aur and pacman wrapper"
  set -g ya_version 0.0.1
  set -g yaourt_version (rhash --version)[1]

  # set -l current_dir (pwd)
	# set -l cmd

  switch $argv[1]
    case -h --help help
      __ya_usage > /dev/stderr
      return
    case -v --version version
      echo -e "\nv$ya_version (using: $yaourt_version)\n"
      return
    case test
      __ya_test $argv[2..-1]
      return
    case in
      __ya_in $argv[2..-1]
      return
    case upd
      __ya_upd
    case "*"
      echo -e 'unknown command: "$argv[$idx]" - check `\$ ya help`'
  end
end

function ya -d "yaourt helpers"
  if test (count $argv) -lt 2
    echo "wrong amount of parameters: "(count $argv)" (required: >=2)"
    __ya_usage > /dev/stderr
    return 1
  end
  if test (string sub -l 2 $argv[1]) = "ya"
    set -l action (string sub -s 2 $argv[1])
  else

  end

  set -l params $argv[2..-1]

	switch $action
		case -h --help help
			__ya_usage > /dev/stderr
			return
		case -v --version version
			echo "v$ya_version (using: $yaourt_version)"
			return
    case \*
      command "__ya_$action" $params
	end
end
