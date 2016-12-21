###
# yareps
#
function yareps -d "yaourt -Ss; Search for package(s) in the repositories"
  yaourt -Ss $argv
end
