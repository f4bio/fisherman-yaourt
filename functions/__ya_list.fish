function __ya_list -d "yaourt -Qei"
  yaourt -Qei (yaourt -Qu|cut -d" " -f 1)|awk ' BEGIN {FS=":"}/^Name/{printf("\033[1;36m%s\033[1;37m", $2)}/^Description/{print $2}'
end
