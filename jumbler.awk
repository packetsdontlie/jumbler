# jumbler.awk
# Tuesday, March 25, 2008 8:26:47 PM
# mods by bek
# usage: awk -f jumbler.awk
#
# (c) 2004 Stephen E. Sachs
# Released under GNU General Public License, www.gnu.org/copyleft/gpl.html
# http://www.stevesachs.com/jumbler.awk


BEGIN {
  srand()
  print ""
  print "================================================"
  print ">> welcmoe to jbmleur.awk - a ptreatn mldoeer <<"
  print ">> welcome to jumbler.awk - a pattern modeler <<"
  print ">> enter your text below,  use the return key <<"
  print ">> when done, use ctrl+c to exit this program <<"
  print "================================================"
  print ""
  print ">> ready"
  print ""
  while ((getline)>0) {
    for(i=1;i<=NF;i++) {
      $i = pjumble($i)
    }
  print ""
  print ">> jumbling"
  print ""
  print $0
  print ""
  print "<< done"
  print ">> ready"
  print ""
  }
}

function pjumble(x) {
  # separating out punctuation...
  if (!match(x,"[^a-zA-Z1-9 ]+")) return jumble(x)
  else return jumble(substr(x,1,RSTART-1)) substr(x,RSTART,RLENGTH) pjumble(substr(x,RSTART+RLENGTH))
}

function jumble(x,  a,n,y,z) {
  # preserving first and last letters, making sure it differs from original...
  n = length(x)
  if (n<=3) return x
  else {
    y = substr(x,2,n-2)
    a = "^" substr(y,1,1) "+$"
    while (1) { z = mix(y); if (y != z || y ~ a ) return substr(x,1,1) z substr(x,n,1) }
  }
}

function mix(x,  n,c) {
  # mixing what comes in between...
  n = length(x)
  c = int(rand()*(n)+1)
  if (x) return substr(x,c,1) mix(substr(x,1,c-1) substr(x,c+1,n-c))
}
