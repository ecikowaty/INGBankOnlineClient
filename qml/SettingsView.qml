import QtQuick 2.0
import QtQuick.Layouts 1.1

Item {
	anchors.fill: parent

	Behavior on opacity { PropertyAnimation { easing.type: Easing.OutQuart } }

	function switchFocusTo(nextFocusField) {
		focus = false
		nextFocusField.inputFocus = true
	}

	DropShadowText {
		text: "Settings"
		textSize: 32

		anchors {
			horizontalCenter: parent.horizontalCenter
			top: parent.top; topMargin: 16
		}
	}

	Rectangle {
		id: background
		width: parent.width - 20
		height: 250
		anchors.centerIn: parent

		radius: 2

		color: Qt.rgba(1, 1, 1, 0.2)

		ColumnLayout {
			id: inputContainer
			width: parent.width
			anchors {
				top: parent.top; topMargin: 10
				bottom: refreshButton.top; bottomMargin: 30
			}

			FormInput {
				id: username
				anchors { horizontalCenter: parent.horizontalCenter; topMargin: 40 }
				text: "Username"
				inputText: settings.login

				Keys.onPressed: if (event.key === Qt.Key_Tab) switchFocusTo(password)
			}

			FormInput {
				id: password
				anchors.horizontalCenter: parent.horizontalCenter
				text: "Password"
				echoMode: TextInput.Password
				inputText: settings.password

				Keys.onPressed: if (event.key === Qt.Key_Tab) switchFocusTo(refreshInterval)
			}

			FormInput {
				id: refreshInterval
				anchors.horizontalCenter: parent.horizontalCenter
				text: "Refresh"
				inputText: settings.refreshInterval

				Keys.onPressed: if (event.key === Qt.Key_Tab) switchFocusTo(username)
			}
		}

		Button {
			id: refreshButton
			text: "Manual Refresh"

			anchors {
				right: applyButton.right; rightMargin: 100
				verticalCenter: applyButton.verticalCenter
			}

			onClicked: accountInfoProvider.login(settings.login, settings.password)
		}

		Button {
			id: applyButton
			text: "Apply"

			anchors {
				right: parent.right; rightMargin: 20
				bottom: parent.bottom; bottomMargin: 20
			}

			onClicked: {
				settings.login = username.inputText
				settings.password = password.inputText
				settings.refreshInterval = refreshInterval.inputText
			}
		}
	}

}
