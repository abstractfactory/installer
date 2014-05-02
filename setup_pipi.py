"""

Pipi installer script, simply run this and you
will be prompted for your password. The installer will take
care of the rest. :)

"""

from __future__ import print_function

import os
import sys
import time
import getpass
import subprocess


# TODO: fetch this from remote service
_template = """
 ______________________________________________
|                                              |
|                    Pipi                      |
|                v0.7.1 (beta)                 |
|                                              |
|               Abstract Factory               |
|       email: marcus@abstractfactory.io       |
|______________________________________________|

- Installing Abstract Factory - Pipi, BETA1
"""

_fixture = 'git+https://pipibeta:{pw}@github.com/abstractfactory/{pkg}.git'
_pip = 'pip'
_git = 'git'

_command = [_pip, 'install']

_packages = [
    ('pifou_beta1', '(~69.9kb)'),
    ('pigui_beta1', '(~201kb)'),
    ('piapp_beta1', '(~39.5kb)'),
    ('pidep', '(~53.2mb) (Grab a coffee..)')
]

# END TODO


def check():
    """
    This file can't be run from any process, main culprit being Chrome; e.g.
    running the file right when it has been downloaded.

    This function looks for trouble and provides comfort.

    """

    # Look for pip
    try:
        subprocess.call(_pip,
                        stdout=subprocess.PIPE,
                        stderr=subprocess.STDOUT)
    except WindowsError:
        _python_root = os.path.dirname(sys.executable)

        if os.name == 'nt':
            _default_pip = os.path.join(_python_root, 'scripts', 'pip.exe')
        else:
            raise OSError("pip wasn't found on your PATH")

        if not os.path.exists(_default_pip):
            raise RuntimeError("\n:(\n\n`pip` wasn't found on your PATH")

        # Update command
        _command[0] = _default_pip

    # Look for git
    try:
        subprocess.call(_git,
                        stdout=subprocess.PIPE,
                        stderr=subprocess.STDOUT)
    except WindowsError:
        raise OSError("`git` wasn't found on your PATH")


def main():
    clear_cmd = 'cls' if os.name == 'nt' else 'clear'
    clear = lambda: subprocess.call(clear_cmd, shell=True)

    def update(msg):
        clear()
        print(_template, msg)

    # Print introductory message
    update('')
    password = getpass.getpass()

    num_pkgs = len(_packages)
    curr_pkg = 1
    while _packages:
        # Install each package, one by one
        package, info = _packages.pop(0)
        command = list(_command)
        command.append(_fixture.format(pw=password, pkg=package))

        update("\nInstalling | %i/%i | %s.. %s " % (
            curr_pkg, num_pkgs, package, info))

        retcode = subprocess.call(command,
                                  stdout=subprocess.PIPE,    # Discard output
                                  stderr=subprocess.STDOUT)  # of this process

        if retcode:
            _packages.insert(0, (package, info))
            break

        curr_pkg += 1

    if not _packages:
        update("\nComplete!")
    else:
        update("\n\t:(")
        time.sleep(1)

        print("\n\nThese packages did not install successfully:")
        for package, info in _packages:
            print("\t%s" % package)

        print("\nDid you enter the correct password?")
        print("\nIf the problem persists, get in contact")
        print("\t<marcus@abstractfactory.io>")
        print("\nor post a message in the usergroup")
        print("\thttps://groups.google.com/forum/#!forum/pipi-beta1")


if __name__ == '__main__':

    try:
        check()
        main()

    except TypeError as e:
        print("\n:(\n\nCouldn't run script from here, try running it "
              "from your file-browser, or via a terminal.")

    except RuntimeError as e:
        print(e)

    except KeyboardInterrupt:
        print("\n\n# Cancelled..")
        sys.exit()

    except OSError as e:
        print("\n:(\n\n%s and the installer doesn't understand your OS "
              "well enough to go look for itself." % e)

    # Keep console open after completed
    print("\n\nPress enter to continue..")
    raw_input()
