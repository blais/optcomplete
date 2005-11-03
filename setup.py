#!/usr/bin/env python
#
# Install script for tengis.
#

__version__ = "$Revision$"
__author__ = "Martin Blais <blais@furius.ca>"

from distutils.core import setup

def read_version():
    try:
        return open('VERSION', 'r').readline().strip()
    except IOError, e:
        raise SystemExit(
            "Error: you must run setup from the root directory (%s)" % str(e))

setup(name="optcomplete",
      version=read_version(),
      description=\
      "Automatic shell completion support for scripts that use optparse.",
      long_description="""
This module provide automatic bash completion support for programs that use the
optparse module.  The premise is that the optparse options parser specifies
enough information (and more) for us to be able to generate completion strings
esily.  Another advantage of this over traditional completion schemes where the
completion strings are hard-coded in a separate bash source file, is that the
same code that parses the options is used to generate the completions, so the
completions is always up-to-date with the program itself.

In addition, we allow you specify a list of regular expressions or code that
define what kinds of files should be proposed as completions to this file if
needed.  If you want to implement more complex behaviour, you can instead
specify a function, which will be called with the current directory as an
argument.

You need to activate bash completion using the shell script function that comes
with optcomplete (see http://furius.ca/optcomplete for more details).
""",
      license="BSD",
      author="Martin Blais",
      author_email="blais@furius.ca",
      url="http://furius.ca/optcomplete",
      package_dir = {'': 'lib/python'},
      py_modules = ['optcomplete'],
     )
