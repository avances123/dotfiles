Assumes a fresh install of Ubuntu 12.04 LTS.

1. Setup the system to handle compiling and installing from source.

        $ sudo apt-get install build-essential

2. If SSL support is needed then we will need to install `libssl-dev`.

        $ sudo apt-get install libssl-dev

3. The install script uses `curl`, so we will need to install `curl`.

        $ sudo apt-get install curl

4. Change into the directory containing the install script and source it.

        $ . node-and-npm-in-30s.sh

    **N.B.** This step takes a while.

5. Finally, check that the latest version of node and npm are indeed installed.

        $ node -v
        $ npm -v

References:

* http://www.howtogeek.com/105413/how-to-compile-and-install-from-source-on-ubuntu/
* https://gist.github.com/579814
* http://joyeur.com/2010/12/10/installing-node-and-npm/