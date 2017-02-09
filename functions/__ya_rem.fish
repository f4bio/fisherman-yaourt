###
# yarem
#
function __ya_rem -d "yaourt -Rns; Remove the specified package(s), its configuration(s) and unneeded dependencies"
  yaourt -Rns $argv
end
