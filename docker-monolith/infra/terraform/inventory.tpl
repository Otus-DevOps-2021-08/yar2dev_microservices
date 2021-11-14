[docker]
%{ for index, docker in docker ~}${docker} ansible_host=${external-ip[index]}
%{ endfor ~}
