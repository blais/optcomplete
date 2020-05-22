=======================================================
optcomplete: Shell Completion Self-Generator for Python
=======================================================

.. contents:: Table of Contents

Description
===========

This Python module aims at providing almost automatically shell completion for
any Python program that already uses the ``optparse`` module.

Motivation
----------

This module aims at placing the shell completion routine and the option parsing
code in a single location: in the program itself.

The logic is that since a program already knows about its options, and in Python
we have a standard module to specify them programmatically since Python-2.3
(``optparse``), the program itself is in the best position to suggest
completions for an incomplete command-line to a shell that invokes it.

Traditionally, this has been done by writing shell-specific descriptions
*separate* from the programs themselves, such as the `Bash Programmable
Completion <http://freshmeat.net/projects/bashcompletion/>`_ project.  This
approach requires maintaining the shell completion functions up-to-date with the
programs.

During development of this proof-of-concept, we were interested in finding if
the programs could not describe their completion routines themselves, using the
well-specified completion protocol in bash.  Similar completion routines could
be easily written for other shells and we could extend this module to
them.

This code comes with support for automatic completions for Bash and Zsh.


Documentation
=============

``optcomplete`` consists of a simple module `optcomplete.py
<lib/python/optcomplete.py>`_ which you should install somewhere in your
PYTHONPATH.

To add simple support to a program which already uses ``optparse``, simply add
the following code after the optparse declarations, *before* calling the
``parse_args()`` function on your options parser::

    import optcomplete
    optcomplete.autocomplete(parser)

Optionally, you can pass a completer as a second argument (see module code).

You also need to `source a Bash function <etc/optcomplete.bash>`_ and then to
tell Bash to trigger optcomplete completion for the specific programs that use
it::

   complete -F _optcomplete <program>


More examples:

- `Examples --- sample example output <doc/sample-output.html>`_;
- `A note about conditionals <doc/conditional.html>`_;

- `Simple test program speaks for itself <bin/optcomplete-simple>`_;
- `Test program with subcommands <bin/optcomplete-commands>`_;

- `CHANGES <CHANGES>`_
- `TODO <TODO>`_


Download
========

A Mercurial repository can be found at:

  http://bitbucket.org/blais/optcomplete


Copyright and License
=====================

Copyright (C) 2001-2004  Martin Blais.  All Rights Reserved.

This code is distributed under the `BSD License <COPYING>`_.


Author
======

Martin Blais <blais@furius.ca>
