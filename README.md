<pre>
#
# _________        ____  ____________         _______ ___________________
# ______  /__________  |/ /___  ____/________ ___    |__  ____/___  ____/
# _  __  / __  ___/__    / ______ \  ___  __ \__  /| |_  /     __  __/   
# / /_/ /  _  /    _    |   ____/ /  __  /_/ /_  ___ |/ /___   _  /___   
# \__,_/   /_/     /_/|_|  /_____/   _  .___/ /_/  |_|\____/   /_____/   
#                                    /_/           drxspace@gmail.com
#
</pre>

# VBox shares remounter

VirtualBox's shares remounter is a bash script that tries to mount a VBox shared folder<br />
for use by a simple (not root the default) user account<br />
<br />
### Necessary dependencies:
Perhaps you'll need to install zenity with this command:<br />
<code>sudo apt-get install -y zenity</code><br />
gksu is not recommended any more and it may be removed entirely from future issues of Ubuntu. Nevertheless it can be installed with:<br />
<code>sudo apt-get install -y gksu</code><br />
If you decided to install gksu and you're using the 64-bit version you'll need to run:<br />
<code>gksu-properties</code> once to set the authentication to sudo.<br />
