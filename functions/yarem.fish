###
# yarem
#
function yarem -d "yaourt -Rns; Remove the specified package(s), its configuration(s) and unneeded dependencies"
  yaourt -Rns $argv
end
