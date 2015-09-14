A basis for a build environment
===================================

This is me gathering all the build and development tools I usually use when I develop PHP, JavaScript, HTML, CSS, LESS, Python and equal stuff.

My prime build tool is make and the tasks are gathered in the Makefile.



Preconditions
-----------------------------------

Install make.

Install composer in the path.

Install node and npm.

Install Atom and apm.

Add to your path.

```
export export PATH=".composer/vendor/bin:$HOME/.composer/vendor/bin:$HOME/.npm-packages/bin:$PATH"
```



Install & update devtools
-----------------------------------

```
make config
make install

# To keep updated
make update
```
