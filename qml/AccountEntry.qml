import QtQuick 2.0
import QtQuick.Layouts 1.1

Item {
	id: root
	width: parent.width
	height: 100

	property alias accountName: name.text
	property alias accountBalance: balance.text

	ColumnLayout {
		anchors { fill: parent; margins: 12; bottomMargin: 6 }

		Rectangle {
			id: nameBackground
			color: "#ff7514"
			width: parent.width
			height: parent.height / 2

			DropShadowText {
				id: name
				textSize: 16
				anchors.centerIn: parent
			}
		}

		Rectangle {
			id: balanceBackground
			color: "#ff7514"
			anchors.top: nameBackground.bottom
			width: parent.width
			height: parent.height / 2

			DropShadowText {
				id: balance
				textSize: 24
				anchors.centerIn: parent
			}
		}
	}
}
