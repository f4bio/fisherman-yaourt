###
# yain
#
function yain -d "`yaourt -S`; Install specific package(s) from the repositories"
  yaourt -S $argv
end
