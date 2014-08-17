// abstract factory ltd.
// Installer (GUI)
////////////////////////////////////////////////////////////////////
import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Layouts 1.1
import QtQuick.Window 2.1
import LOGIC 1.0
import "content"
import "utils"
import "js/style.js" as Style


ApplicationWindow {
	id: root
	width: 330
	height: 330
	title: "Installer"
	flags: Qt.FramelessWindowHint | Qt.Window
	maximumHeight: 330
	maximumWidth: 330
	minimumHeight: 330
	minimumWidth: 330
	color: "transparent"
	// visible: false

	SplashLogo {
		id: splash1
		onTimeout: main.visible = true
	}

	Logic {
		id: logic    
		Component.onCompleted: {
			get_python_path()
		}
		onSignal1: {				
			page1.visible = false
			page2.visible = false
			page3.visible = false
			page4.visible = false
			page5.visible = false
			page6.visible = true
		}
		// onSignal2: {				
		// 	splash.visible = false
		// 	main.visible = true	
		// }
	}
	Item {
		id: main
		visible: false
		anchors.centerIn: parent
		width: parent.width
		height: parent.height

		BorderImage {
			anchors.fill: bg
			anchors { leftMargin: -6; topMargin: -6; rightMargin: -6; bottomMargin: -6 }
			border { left: 15; top: 15; right: 15; bottom: 15 }
			source: "content/shadow.png"; smooth: true
		}

		Rectangle {
			id: bg
			anchors.centerIn: parent
			width: parent.width-10
			height: parent.height-10
			color: "#383838"
			radius: 2
			// z: -1

			Alert {
				id: alert
				anchors.centerIn: parent
				visible: false
				z: 2
			}
			
			MouseArea {
				anchors.fill: parent
				property real lastMouseX: 0
				property real lastMouseY: 0
				acceptedButtons: Qt.LeftButton
				onPressed: {
					if(mouse.button == Qt.LeftButton){
						parent.forceActiveFocus()
						lastMouseX = mouseX
						lastMouseY = mouseY
					}
				}
				onMouseXChanged: root.x += (mouseX - lastMouseX)
				onMouseYChanged: root.y += (mouseY - lastMouseY)
			}

			ColumnLayout {
				id: ui
				width: parent.width
				height: parent.height-10
				spacing: 10
				Layout.alignment: Qt.AlignHCenter | Qt.AlignHCenter
				RowLayout {
					id: header
					spacing: 95
					Layout.alignment: Qt.AlignHCenter
					ColumnLayout {
						Text {
							id: brand
							text: "abstract factory ltd."
							color : Style.staticTextColor
							font.family: Style.font1
							font.pointSize: Style.fontSize
						}
					}
					ColumnLayout {
						RowLayout {
							Image {
								id: minimizeBg
								source: "content/button_minimise.png"

								MouseArea {
									id: minimizeBrn
									anchors.fill: parent
									onClicked: root.visibility = Window.Minimized
								}
							}
							Image {
								id: closeBg
								source: "content/button_close.png"
								MouseArea {
									id: closeBtn
									anchors.fill: parent
									onClicked: Qt.quit()
								}
							}
						}
					}
				}

				RowLayout {
					id: pages
					Layout.alignment: Qt.AlignHCenter
					Layout.maximumHeight: 250

					ColumnLayout {
						id: page1
						spacing : 25
						// visible: false
						RowLayout {
							Layout.alignment: Qt.AlignHCenter
							Rectangle {
								width: 240
								height: 120
								color: Style.checkBoxsRectBgColor
								border.color: Style.checkBoxIndBgColor
								ColumnLayout {
									width: parent.width
									height: parent.height
									Layout.alignment: Qt.AlignHCenter
									spacing: 0
									RowLayout {
										Layout.alignment: Qt.AlignHCenter
										spacing: 120
										StatusCheck {
											checked: true
											checkBoxLabel: "pifou"
										}
										Text {
											text: "0.7.1"
											font.family: Style.font1
											font.pointSize: Style.fontSize
											color: Style.staticTextColor
										}
									}
									RowLayout {
										Layout.alignment: Qt.AlignHCenter
										spacing: 120
										StatusCheck {
											checked: true
											checkBoxLabel: "pigui"
										}
										Text {
											text: "0.7.1"
											font.family: Style.font1
											font.pointSize: Style.fontSize
											color: Style.staticTextColor
										}
									}
									RowLayout {
										Layout.alignment: Qt.AlignHCenter
										spacing: 120
										StatusCheck {
											checked: true
											checkBoxLabel: "piapp"
										}
										Text {
											text: "0.7.1"
											font.family: Style.font1
											font.pointSize: Style.fontSize
											color: Style.staticTextColor
										}
									}
									RowLayout {
										Layout.alignment: Qt.AlignHCenter
										spacing: 120
										StatusCheck {
											checked: true
											checkBoxLabel: "pidep"
										}
										Text {
											text: "1.0.0"
											font.family: Style.font1
											font.pointSize: Style.fontSize
											color: Style.staticTextColor
										}
									}
								}
							}                        
						}

						RowLayout {
							Layout.alignment: Qt.AlignHCenter
							InputField {
								id: pass
								placeholderText : "Password..."
								echoMode: TextInput.Password
								flag: true
								onTextChanged: {
									if(text != ""){
										page1NextBtn.mainEnabled = true
									}
									else
									{
										page1NextBtn.mainEnabled = false			
									}
								}
							}
						}

						RowLayout {
							Layout.alignment: Qt.AlignHCenter
							Button {
								id: page1NextBtn
								labelText: "Next"
								onClicked: {
									logic.password = pass.text
									logic.check_password_slot()
									if(logic.check_password == 1){
										page1.visible = false
										page6.visible = false
										page3.visible = false
										page4.visible = false
										page5.visible = false
										page2.visible = true
									}
									else {
										pass.text = ""
										mainEnabled = false
										pass.placeholderText = "Enter Correct Password..."									
									}
								}
								Component.onCompleted: {
									if(pass.text == ''){
										mainEnabled = false
									}
								}
							}
						}
					}

					ColumnLayout {
						id: page2
						spacing: 10
						visible: false
						RowLayout {
							spacing: 10
							BigBtnCheck {
								id: sitePackages
								label: "default"
								check: true
								Component.onCompleted: {
									parent.forceActiveFocus()
									logic.get_python_path()
									check = true
									custom.check = false
									custom.fgColor = "#373737"
									fgColor = "#474747"
									pathText.enabled = false
									if(logic.python_path == ''){
										pathText.text = ("Python 2.7 does not exist.")
										// page2NextInstallBtn.mainEnabled = false
										page2NextInstallBtn.labelText = "Use Custom"
										page2NextInstallBtn.width = 85
										page2NextInstallBtn.mainEnabled = false
									}
									else{
										pathText.text = (logic.python_path)
										page2NextInstallBtn.labelText = "Install"
										page2NextInstallBtn.width = 75
										page2NextInstallBtn.mainEnabled = true
									}
								}
								onClicked: {
									parent.forceActiveFocus()
									logic.get_python_path()
									check = true
									custom.check = false
									custom.fgColor = "#373737"
									// page2NextInstallBtn.labelText = "Install"
									fgColor = "#474747"
									pathText.enabled = false
									if(logic.python_path == ''){
										pathText.text = ("Python 2.7 does not exist.")
										pathText.placeholderText = "Enter Your Path..."
										page2NextInstallBtn.mainEnabled = false
									}
									else{
										pathText.text = (logic.python_path)
										pathText.placeholderText = "Enter Your Path..."
										page2NextInstallBtn.labelText = "Install"
										page2NextInstallBtn.width = 75
										page2NextInstallBtn.mainEnabled = true
										
									}
								}
							}                   
							BigBtnCheck {
								id: custom
								label: "custom" 
								Component.onCompleted: {
									parent.forceActiveFocus()
									sitePackages.check = false
									sitePackages.fgColor = "#373737"
									page2NextInstallBtn.labelText = "Next"
									fgColor = "#474747"
									pathText.text == ""
								} 
								onClicked: {
									sitePackages.check = false
									parent.forceActiveFocus()
									page2NextInstallBtn.labelText = "Next"
									page2NextInstallBtn.width = 75
									check = true
									sitePackages.fgColor = "#373737"
									fgColor = "#474747"
									pathText.enabled = true
									pathText.text = ""
								}                          
							}                   
						}

						RowLayout {
							Layout.alignment: Qt.AlignHCenter
							InputField {
								id: pathText
								placeholderText : "Enter Your Path..."
								width: 260
								// enabled: false
								// echoMode: TextInput.Password
								flag: false
								onTextChanged: {
									if(text != ""){
										logic.check_custom_path_slot(text)
										if(logic.check_custom_path == "yes"){
											page2NextInstallBtn.mainEnabled = true	
											page2NextInstallBtn.labelText = 'Next'
											page2NextInstallBtn.width = 75
											textColor1 = Style.textFieldTextColor						
										}
										else{
											page2NextInstallBtn.mainEnabled = false
											textColor1 = 'red'
										}
									}
									else
									{
										page2NextInstallBtn.mainEnabled = false			
									}
								}
							}
						}

						RowLayout {
							Layout.alignment: Qt.AlignHCenter
							Button {
								id: page2NextInstallBtn
								anchors.centerIn: parent
								labelText: "Next"
								width: 120
								Component.onCompleted: {
									if(pathText.text == ''){
										mainEnabled = false
									}
									else{
										mainEnabled = true
									}
								}
								onClicked: {
									if(custom.check){
										page4.visible = true
										page5.visible = false
										page1.visible = false
										page6.visible = false
										page3.visible = false
										page2.visible = false
									}
									else{
										page1.visible = false
										page6.visible = false
										page3.visible = false
										page2.visible = false
										page5.visible = true
										page4.visible = false
										logic.python_path = pathText.text
										logic.install_program()										
									}
								}
							}
						}
					}

					ColumnLayout {
						id: page3
						spacing: 10
						visible: false
						RowLayout {
							spacing: 10
							BigBtnCheck {
								id: user
								label: "user"
								check: true
								Component.onCompleted: {
									parent.forceActiveFocus()
									check = true
									developer.check = false
									developer.fgColor = "#373737"
									fgColor = "#474747"
									messageText.text = "user: install source code"
								}
								onClicked: {
									parent.forceActiveFocus()
									check = true
									developer.check = false
									developer.fgColor = "#373737"
									fgColor = "#474747"
									messageText.text = "user: install source code"
									
								}
							}                   
							BigBtnCheck {
								id: developer
								label: "developer" 
								Component.onCompleted: {
									parent.forceActiveFocus()
									user.check = false
									user.fgColor = "#373737"
									fgColor = "#474747"
									messageText.text = "developer: install source code"
								} 
								onClicked: {
									parent.forceActiveFocus()
									check = true
									user.check = false
									user.fgColor = "#373737"
									fgColor = "#474747"
									messageText.text = "developer: install source code"
									
								}                          
							}                   
						}

						RowLayout {
							Layout.alignment: Qt.AlignHCenter
							Text {
								id: messageText
								anchors.horizontalCenter: parent.horizontalCenter
								width: 265
								color: "#858585"
								font.family: Style.font1
								font.pointSize: 10
							}
						}

						RowLayout {
							Layout.alignment: Qt.AlignHCenter
							Button {
								id: page3InstallBtn
								anchors.horizontalCenter: parent.horizontalCenter
								// anchors.top: parent.bottom
								// anchors.topMargin: 5
								labelText: "Install"
								width: 120
								onClicked: {
									page1.visible = false
									page2.visible = false
									page3.visible = false
									page5.visible = false
									page6.visible = false
									page4.visible = true
									
								}
							}
						}
					}

					ColumnLayout {
						id: page4
						Layout.alignment: Qt.AlignHCenter
						spacing: 25
						visible: false
						RowLayout {
							Layout.alignment: Qt.AlignHCenter							
							Rectangle {								
								width: 280
								height: 130
								color: "#373737"
								border.color: "#2b2b2b" 
								border.width: 3
								Rectangle {
									anchors.centerIn: parent
									width: parent.width-4
									height: parent.height-4
									color: "#191919"
									border.color: "#4b4b4b" 
									border.width: 3
									Text {
										id: message
								        anchors.centerIn: parent
								        width: parent.width - 50
								        text: ("<b>Path: </b>[" + pathText.text + "]<p><b>Remember</b>, for Python to find your custom path, 
								        		it must be available on your PYTHONPATH environment variable")
								        textFormat: TextEdit.RichText
								        wrapMode: Text.WordWrap
								        horizontalAlignment: Text.AlignLeft
								        color: "#eeeeee"
								        font.family: Style.font1
								        font.pointSize: Style.fontSize
									} 
								}
							}
						}

						RowLayout {
							Layout.alignment: Qt.AlignHCenter
							Button {
								id: page4InstallBtn
								// anchors.top: parent.bottom
								// anchors.topMargin: 5
								labelText: "Install"
								enabled: true
								width: 110
								onClicked: {
									page1.visible = false
									page2.visible = false
									page3.visible = false
									page4.visible = false
									page6.visible = false
									page5.visible = true
									logic.python_path = pathText.text
									logic.install_program()
								}
							}
						}
					}

					ColumnLayout {
						id: page5
						spacing: 50
						visible: false
						Layout.maximumHeight: 190
						RowLayout {}
						RowLayout {
							Layout.alignment: Qt.AlignHCenter
							ColumnLayout {
								spacing: 15
								ProgressBar{
									label:"downloading..."
									indeterminate: true
									// value: Math.floor(Math.random()*11)/10
								}
								ProgressBar{
									label:"progress..."
									indeterminate: true
									// value: Math.floor(Math.random()*11)/10
								}          
							}
						}
					}

					ColumnLayout {
						id: page6
						spacing: 40
						visible: false
						Layout.maximumHeight: 210
						RowLayout {
							Layout.alignment: Qt.AlignBottom
							ColumnLayout {
								spacing: 20
								RowLayout {
									Layout.alignment: Qt.AlignHCenter
									Text {
										id: successText
										text: "Installation Successful!"
										color : Style.lightColor
										font.family: Style.font1
										font.pointSize: Style.fontSize
									}
								}
								RowLayout {
									Layout.alignment: Qt.AlignHCenter
									spacing: 7
									ColumnLayout {
										Button {
											labelText: "Documentation"
											width: 120
											onClicked: {
												logic.open_docs_page()
											}
										}
										Button {
											labelText: "Close"
											width: 120
											onClicked: Qt.quit()
										}
									}
								}
							}
						}
					}
				}

				RowLayout {
					id: footer
					Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
					Text {
						id: pipi
						text: "pipi 0.7.1"
						color : Style.staticTextColor
						font.family: Style.font1
						font.pointSize: Style.fontSize
					}
				}
			}
		}
	}
}
