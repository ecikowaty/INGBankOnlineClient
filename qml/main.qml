import QtQuick 2.0
import QtQuick.Layouts 1.0

Rectangle {
	id: root
	width: 300
	height: 450

	Drawer {
		id: topDrawer
		anchors.top: parent.top
		width: parent.width
		minimizedHeight: 15
		previewHeight: 45
		opacity: !statusDrawer.maximized
		z: mainBackground.z + 1

		previewContent: Item {
			anchors.fill: parent
			property int offset: 65

			Button {
				text: "Settings"
				anchors { centerIn: parent; horizontalCenterOffset: -offset }

				onClicked: topDrawer.open("SettingsView.qml")
			}

			Button {
				text: "History"
				anchors { centerIn: parent; horizontalCenterOffset: offset }

				onClicked: topDrawer.open("HistoryView.qml")
			}
		}
	}

	Drawer {
		id: statusDrawer

		anchors.bottom: parent.bottom
		width: parent.width
		minimizedHeight: 15
		previewHeight: 40
		z: mainBackground.z + 1

		shadowOnTop: true
		opacity: !topDrawer.maximized

		previewContent: Rectangle {
			anchors { fill: parent; margins: 8 }
			color: Qt.rgba(1, 1, 1, 0.35)
			radius: 1

			DropShadowText {
				id: previewLabel
				anchors {
					verticalCenter: parent.verticalCenter;
					left: parent.left; leftMargin: 12
				}

				text: "No messages"
				wrapText: false

				Connections {
					target: accountInfoProvider
					onStatusInfo: { statusDrawer.previewFor(3000); previewLabel.text = info }
					onUnexpectedError: { statusDrawer.previewFor(3000); previewLabel.text = message }
				}
			}
		}



	}

	Rectangle {
		id: mainBackground
		anchors.fill: parent

		gradient: Gradient {
			GradientStop { position: 0.0; color: "#ffffff" }
			GradientStop { position: 1.0; color: "#dddddd" }
		}

		Image {
			source: "qrc:/logo.png"
			anchors { right: parent.right; bottom: parent.bottom; bottomMargin: 16 }
			opacity: 0.06
		}
	}

	ListView {
		id: overview
		model: accountModel

		clip: true
		width: parent.width

		anchors {
			top: parent.top; topMargin: topDrawer.height / 2 - statusDrawer.height / 2 + 14
			bottom: parent.bottom; bottomMargin: 14
		}

		delegate: AccountEntry {
			accountName: account.name
			accountBalance: account.balance
		}
	}

	Timer {
		running: settings.refreshInterval > 0
		repeat: true
		interval: settings.refreshInterval * 1000 * 60

		onTriggered: accountInfoProvider.login(settings.login, settings.password)

	}

	Connections {
		target: accountInfoProvider
		onLoginSuccessfull: accountInfoProvider.getBalance()
		onBalanceDataUpdated: accountInfoProvider.getHistory()
	}

	Connections {
		target: settings
		onRefreshIntervalChanged: console.debug(settings.refreshInterval)
	}
}



















