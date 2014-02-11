import QtQuick 2.0

Item {
	id: root

	property color color: "white"

	property int horizontalMargin: 2
	property int verticalMargin: 2
	property int radius: 0

	Rectangle {
		id: mainArea
		radius: root.radius

		anchors {
			fill: parent;
			leftMargin: horizontalMargin; rightMargin: horizontalMargin
			topMargin: verticalMargin; bottomMargin: verticalMargin
		}

		color: root.color
	}

	Rectangle {
		anchors.fill: parent
		color: root.color
		opacity: 0.5
		radius: root.radius
	}

}
