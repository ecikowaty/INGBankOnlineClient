import QtQuick 2.0

Rectangle {
	width: 250
	height: 36
	color: Qt.rgba(1, 1, 1, 0.3)
	radius: 2

	property alias text: label.text
	property alias inputText: input.text
	property alias inputFocus: input.focus
	property alias echoMode: input.echoMode

	DropShadowText {
		id: label

		anchors {
			right: inputBackground.left
			rightMargin: 10
			verticalCenter: inputBackground.verticalCenter
		}

		text: "Text"
		textColor: "white"
	}

	Rectangle {
		id: inputBackground
		width: parent.width * 3/5
		height: parent.height - 10
		color: "white"
		opacity: input.activeFocus ? 1 : 0.85

		TextInput {
			id: input
			anchors { fill: parent; margins: 4 }
			verticalAlignment: TextInput.AlignVCenter
			clip: true

			color: "#ff7514"
			font.bold: true
			font.family: "Lucida Grande"
			selectionColor: "#ffc476"
		}

		anchors {
			verticalCenter: parent.verticalCenter
			right: parent.right
			rightMargin: 6
		}
	}
}
