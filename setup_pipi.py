"""

Pipi installer script, simply run this and you
will be prompted for your password. The installer will take
care of the rest. :)

"""

import os
import sys
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
_command = ['pip', 'install']

_packages = [
    ('pifou_beta1', '(~69.9kb)'),
    ('pigui_beta1', '(~201kb)'),
    ('piapp_beta1', '(~39.5kb)'),
    ('pidep', '(~47.4mb) (Grab a coffee..)')
]
# END TODO

clear_cmd = 'cls' if os.name == 'nt' else 'clear'
clear = lambda: subprocess.call(clear_cmd, shell=True)


def update(msg):
    clear()
    sys.stdout.write(_template)
    sys.stdout.write(msg)


def main():
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

        update("Installing | %i/%i | %s.. %s " % (
            curr_pkg, num_pkgs, package, info))

        with open(os.devnull, 'w') as nul:
            retcode = subprocess.call(command,
                                      stdout=nul,
                                      stderr=subprocess.STDOUT)

            if retcode:
                _packages.insert(0, (package, info))
                break

        curr_pkg += 1

    if not _packages:
        update("Complete!")
    else:
        update(":(\n\nThese packages did not install successfully:\n")
        for package, info in _packages:
            sys.stdout.write("\t%s\n" % package)

        sys.stdout.write("\nDid you enter the correct password?")
        sys.stdout.write("\n\nIf the problem persists, get in contact")
        sys.stdout.write("\n\t<marcus@abstractfactory.io>")
        sys.stdout.write("\n\nor post a message in the usergroup")
        sys.stdout.write("\n\thttps://groups.google.com/forum/#!forum/pipi-beta1")


if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        print "\n\n# Cancelled.."
        sys.exit()

    # Keep console open after completed
    sys.stdout.write("\n\nPress enter to continue..")
    raw_input()
