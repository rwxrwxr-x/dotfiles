#!/bin/sh

# logo sh script (posix sh compatible)
# this code is public domain
# please, visit vk.com/that_is_linux
# send bug reports to dima@golovin.in

if [ "$TERM" = "xterm-256color" ]; then
  Y='\033[38;05;15;48;05;222m'  # yellow
  G='\033[38;05;222;48;05;237m' # gray
  L='\033[38;05;237;48;05;15m'  # white
else
  Y='\033[37;103m' # yellow RGB(FFCC66)
  G='\033[33;100m' # gray   RGB(333333)
  L='\033[30;107m' # white  RGB(FFFFFF)
fi

N='\033[0m'
C='\x20'
B=

E='echo'
if [ "`$E -e test`" = "-e test" ]; then
  E='env echo'
fi

expr "$S" : '[1-9]$' >/dev/null || S=1
H=$S
W=$(expr 2 \* $S)

for I in $(seq 1 $W); do
  B="$B$C"
done

print() {
  for I in $(seq 1 $H); do
    $E -e "$Y$B$1$B$N"
  done
}

print "$B$B$B$B"
print "$B$B$B$B"
print "$G$B$B$L$B$Y$B"
print "$B$G$B$L$B$B$Y"
print "$B$B$B$B"
print "$B$B$B$B"

