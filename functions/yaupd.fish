###
# yaupd
#
which abs ^ /dev/null > /dev/null
if test $status -ne 1
  function yaupd -d "yaourt -Sy; Update and refresh the local package and ABS databases against repositories"
    yaourt -Sy; and sudo abs
  end
else
  function yaupd -d "yaourt -Sy; Update and refresh the local package against repositories"
    yaourt -Sy
  end
end
