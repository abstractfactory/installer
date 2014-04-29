## abstract factory ltd.
## Installer (launcher)
# https://github.com/abstractfactory/installer
####################################################################
import sys
import os
import subprocess
import urllib
from PyQt5.QtCore import pyqtProperty, QObject, QUrl, pyqtSlot, pyqtSignal
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import qmlRegisterType, QQmlListProperty, QQmlApplicationEngine


class Logic(QObject):

	signal1 = pyqtSignal()

	def __init__(self, parent=None):
		super(Logic, self).__init__(parent)
		self._password = ''
		self._installList = ['pip', 'install', 'git+git://github.com/abstractfactory/openmetadata.git']


	@pyqtProperty(str)
	def password(self):
		return self._password

	@password.setter
	def password(self, password):
		self._password = password

	@pyqtProperty(QQmlListProperty)
	def installList(self):
		return QQmlListProperty(str(), self, self._installList)
		
	@pyqtSlot()
	def printPassword(self):
		print "pass in python: ", self._password

	@pyqtSlot()
	def installProgram(self):
		subprocess.Popen(['pip', 'install', ('git+https://madoodia:'+ urllib.quote_plus(self._password) + '@github.com/abstractfactory/installer.git')])
		# print ('git+https://"madoodia":"' + self._password + '"@github.com/abstractfactory/installer.git')


# ---------------------------------------------------- #    	
app = QGuiApplication(sys.argv)
qmlRegisterType(Logic, 'LOGIC', 1, 0, 'Logic')

engine = QQmlApplicationEngine(QUrl("test.qml"))
window = engine.rootObjects()[0]
window.show()

sys.exit(app.exec_())