###
# yains
#
function yains -d "yaourt -U; Install specific package not from the repositories but from a file"
  yaourt -U $argv
end
