import QtQuick 2.0

Item {
	id: root
	anchors.fill: parent

	DropShadowText {
		id: title
		text: "History"
		textSize: 32

		anchors {
			horizontalCenter: parent.horizontalCenter
			top: parent.top; topMargin: 16
		}
	}

	ListView {
		width: parent.width
		anchors {
			top: title.bottom; topMargin: 16
			bottom: parent.bottom; bottomMargin: 16
		}

		clip: true
		model: historyModel

		delegate: HistoryEntry {}
	}
}
