# -*- mode: python -*-
import os
import platform
import sys
sys.path.append("")


a = Analysis(['mainLauncher.py'],
             hiddenimports=[],
             hookspath=None,
             runtime_hooks=['C:/Python27/Lib/site-packages/PyInstaller/loader/rthooks/pyi_rth_qml.py'])
                            # 'C:/Python27/Lib/site-packages/PyInstaller/loader/rthooks/pyi_rth_pkgres.py'])


pyz = PYZ(a.pure)

utils_folder = Tree('utils', prefix='utils')
js_folder = Tree('js', prefix='js')
content_folder = Tree('content', prefix='content')

a.datas.append(('d3dcompiler_46.dll', 'C:/Qt/Qt5.2.1/5.2.1/msvc2012_64/bin/d3dcompiler_46.dll', "DATA"))
a.datas.append(('installer.qml', 'installer.qml', "DATA"))
a.datas.append(('icon.ico', 'icon.ico', "DATA"))

a.datas.append(('python.exe', 'C:\\Python27\\python.exe', "DATA"))
a.datas.append(('7z.exe', '7z.exe', "DATA"))
a.datas.append(('7z.dll', '7z.dll', "DATA"))
a.datas.append(('PortableGit.7z', 'PortableGit.7z', "DATA"))
a.datas.append(('Lib.7z', 'Lib.7z', "DATA"))
a.datas.append(('qml.7z', 'qml.7z', "DATA"))

#for one-File
exename = 'Installer.exe'
if "64" in platform.architecture()[0]:
    exename = 'Installer_x64.exe'


for d in a.datas:
    if 'pyconfig' in d[0]: 
        a.datas.remove(d)

exe = EXE(pyz,
          a.scripts,
          a.binaries,
          utils_folder,
          js_folder,
          content_folder,
          a.datas,
          a.zipfiles,
          name=os.path.join('dist', exename),
          debug=False,
          strip=False,
          upx=True,
          console=True , icon='icon.ico')
