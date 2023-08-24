# Clinky
Clickjacking is an online attack that tricks a victim into clicking something other than what they intended without realizing it.
In most cases, an attacker will craft a legitimate-looking website and embed a malicious or legitimate website in an invisible iframe.
The iframe is invisible, so the malicious site isn’t visible and the victim only sees the legitimate-looking site.
Iframes enable you to embed content from other sources (websites) onto your webpages.  

This script scans the target website for missing headers on the Server-side. 
Basicaly, the tool will create a PoC screenshot on your desktop in case of a successful exploit. 
All you need is to run script as follows: ```$ bash Clinky.sh <URL>```.

