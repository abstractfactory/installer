## abstract factory ltd.
## Installer (launcher)
# https://github.com/abstractfactory/installer
####################################################################
import sys
import os
import subprocess
import urllib
import time
import webbrowser
# import pip
from threading import Thread
from _winreg import *

from PyQt5.QtCore import pyqtProperty, QObject, QUrl, pyqtSlot, pyqtSignal
from PyQt5.QtGui import QIcon
from PyQt5.QtWidgets import QApplication, QSystemTrayIcon
from PyQt5.QtQml import qmlRegisterType, QQmlListProperty, QQmlApplicationEngine
# from PyQt5.QtQuick import QQuickView

class Logic(QObject):

	# _fixture = 'git+https://madoodia:{pw}@github.com/abstractfactory/{pkg}.git'

	# _packages = [
	# 	('installer', '(~2.39Mb)')
	# ]

	_packages = [
	    'pifou_beta1',
	    'pigui_beta1',
	    'piapp_beta1',
	    'pidep'
	]

	signal1 = pyqtSignal()

	def __init__(self, parent=None):
		super(Logic, self).__init__(parent)
		self._password = ''
		self._python_path = ''
		self._check_password = 0
		self._check_custom_path = 'no'

	@pyqtProperty(int)
	def check_password(self):
		return self._check_password

	@check_password.setter
	def check_password(self, check_password):
		self._check_password = check_password

	@pyqtProperty(str)
	def check_custom_path(self):
		return self._check_custom_path

	@check_custom_path.setter
	def check_custom_path(self, check_custom_path):
		self._check_custom_path = check_custom_path

	@pyqtProperty(str)
	def python_path(self):
		return self._python_path

	@python_path.setter
	def python_path(self, python_path):
		self._python_path = python_path
		
	@pyqtProperty(str)
	def password(self):
		return self._password

	@password.setter
	def password(self, password):
		self._password = password
		
	@pyqtSlot()
	def print_password(self):
		print "pass in python: ", self._password

	@pyqtSlot()
	def get_python_path(self):
		if read_from_reg() != '':
			self._python_path = read_from_reg() + "Lib\\site-packages"
		else:
			self._python_path = ''

	@pyqtSlot()
	def open_docs_page(self):
		webbrowser.open_new('http://docs.abstractfactory.io/')

	@pyqtSlot()
	def install_program(self):
		try:
			self.thread = Thread(target = self.run_process)
			self.thread.start()
		except WindowsError:
			print "does not exists"

	def run_process(self):
		dir_name = self._python_path
		# Method 1:	clone repo then install it
		if getattr(sys, 'frozen', False):
			full_directory = os.path.abspath(os.path.join(os.environ.get("_MEIPASS", sys._MEIPASS)))
			cwd = os.getcwd()			
			
			# for item in ['Lib.7z', 'PortableGit.7z']:
			# 	subprocess.call(['7z', 'x', '-y', ('-o' + full_directory), (full_directory + '\\' + item)], shell=True)
			# 	os.remove(full_directory + '\\' + item)

			# os.environ['PATH'] += (";" + full_directory + '\\PortableGit\\bin')
		else:
			full_directory = os.path.dirname(os.path.abspath(__file__))	

		for pkg in self._packages:
			# self.signal2.emit()
			p = subprocess.call(['git', 'clone'
								, 'https://pipibeta:' + urllib.quote_plus(self.password)
								 + '@github.com/abstractfactory/' + pkg + '.git', (full_directory + '\\' + pkg)], shell=True)

			d = os.path.dirname(dir_name)
			b = os.path.basename(dir_name)
			repo_dir = os.chdir((full_directory + '\\' + pkg))

			p = subprocess.call(['python', 'setup.py', 'install'
									, ('--root=' + d)
									, ('--install-lib='+ b)
								], shell=True)
		self.signal1.emit()

	@pyqtSlot()
	def check_password_slot(self):
		p = subprocess.call(['git', 'ls-remote', 'https://pipibeta:'
						 + urllib.quote_plus(self.password)+ '@github.com/abstractfactory/' + self._packages[0] + '.git'], shell=True)

		if p == 0:
			self._check_password = 1


	@pyqtSlot(str)
	def check_custom_path_slot(self, custom_path):
		if os.path.exists(str(custom_path)) & os.path.isdir(str(custom_path)):
			self._check_custom_path = 'yes'
		else:
			self._check_custom_path = 'no'


if __name__ == "__main__":

	# Working with registry

	def subkeys(key):
		i = 0
		while True:
			try:
				subkey = EnumKey(key, i)
				yield subkey
				i+=1
			except WindowsError:
				break
	# Working with registry
	def read_from_reg():
		try:	
			root_key = OpenKey(HKEY_CURRENT_USER, r'Software\Python\PythonCore', 0, KEY_READ)
			if root_key:
				for item in subkeys(root_key):
					if str(item) == '2.7':
						sub_key = OpenKey(HKEY_CURRENT_USER, (r'Software\Python\PythonCore\2.7'), 0, KEY_READ)
						for item in subkeys(sub_key):
							if item == 'InstallPath':
								install_path = QueryValue(sub_key, item)
								return install_path
					return ''
		except WindowsError:
			return ''



	def unpacking():
		if getattr(sys, 'frozen', False):
			full_directory = os.path.abspath(os.path.join(os.environ.get("_MEIPASS", sys._MEIPASS)))		
			for item in ['Lib.7z', 'PortableGit.7z']:
				subprocess.call(['7z', 'x', '-y', ('-o' + full_directory), (full_directory + '\\' + item)], shell=True)
				os.remove(full_directory + '\\' + item)
			os.environ['PATH'] += (";" + full_directory + '\\PortableGit\\bin')

	# Getting Frozen Directory
	if getattr(sys, 'frozen', False):
		full_directory = os.path.abspath(os.path.join(os.environ.get("_MEIPASS", sys._MEIPASS)))
		os.environ['PATH'] += (";" + full_directory)		
		for item in ['qml.7z']:
			subprocess.call(['7z', 'x', '-y', ('-o' + full_directory), (full_directory + '\\' + item)], shell=True)
			os.remove(full_directory + '\\' + item)
	else:
		full_directory = os.path.dirname(os.path.abspath(__file__))

	app = QApplication(sys.argv)
	qmlRegisterType(Logic, 'LOGIC', 1, 0, 'Logic')
	engine = QQmlApplicationEngine()
	qml_file = os.path.join(full_directory, "installer.qml")
	engine.load(str(qml_file))
	window = engine.rootObjects()[0]
	# window.setIcon(QIcon('icon.ico'))

	try:
		thread = Thread(target = unpacking)
		thread.start()
	except WindowsError:
		print "does not exists"

	window.show()

	sys.exit(app.exec_())