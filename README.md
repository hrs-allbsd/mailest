mailest - search mail messages with Hyper Estrairer
===================================================

"mailest" is a "search" backend for [Mew](http://mew.org) using
[Hyper Estraier](fallabs.com/hyperestraier/index.html).  It can replace
the existing backend `mewest`.


Install
-------

OpenBSD:

    % ftp https://github.com/yasuoka/mailest/archive/mailest-0.9.4.tar.gz
    % tar xzf mailest-0.9.4.tar.gz
    % cd mailest-mailest-0.9.4
    % make
    % sudo make install

Other:

    % wget https://github.com/yasuoka/mailest/archive/mailest-0.9.4.tar.gz
    % tar xzf mailest-0.9.4.tar.gz
    % cd mailest-mailest-0.9.4
    % ./configure
    % make
    % sudo make install

On BSD other than OpenBSD, you may need to use "gmake" instead of "make"
to use GNUmakefile since Makefiles are for OpenBSD.


Quick Usage
-----------

+ Add the below line to .mew.el to let Mew use "Hyper Estrairer" for
  search.

      ((setq mew-search-method 'est)

+ Add the below lines to ~/.emacs use use the "mailest" instead of
  existing "mewest".

      (defvar mew-prog-est        "mew-mailest")
      (defvar mew-prog-est-update "mew-mailest")

+ Use `km`, `kM`, `k/` or `k?` in Mew.  See
  http://mew.org/en/info/release/mew_6.html#dbsearch for search commands
  in Mew.


Manpages
--------

- [mailestctl(1)](http://yasuoka.github.io/mailest/mailestctl.1.html)
- [mailestd(8)](http://yasuoka.github.io/mailest/mailestd.8.html)
- [mailestd.conf(5)](http://yasuoka.github.io/mailest/mailestd.conf.5.html)
- [mew-mailest(8)](http://yasuoka.github.io/mailest/mew-mailest.1.html)


Differences from `mewest`
-------------------------

Backup of the database

  "mailest" doesn't create a backup of the database before updating the
  database which `mewest` does.  Hyper estrairer databases break easyly
  if the program or the system crashes during updating the database.


Copyright
---------

Licenses other than "libestdraft" are BSD or OpenBSD license.  Only
"libestdraft" is derived from Hyper Estrairer's estcmd.c, it's LGPL.
See the source code to check the entire copyright.
