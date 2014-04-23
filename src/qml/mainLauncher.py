## abstract factory ltd.
## Installer (launcher)
####################################################################
import sys
from PyQt5.QtCore import QUrl
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine

app = QGuiApplication(sys.argv)

engine = QQmlApplicationEngine(QUrl("main.qml"))
window = engine.rootObjects()[0]
window.show()

sys.exit(app.exec_())