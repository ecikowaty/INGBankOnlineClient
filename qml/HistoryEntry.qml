import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1

Item {
	id: root
	width: parent.width
	height: descriptionLabel.height + 64

	Rectangle {
		id: background
		anchors {
			fill: parent; margins: 15; bottomMargin: 6
			horizontalCenter: parent.horizontalCenter
		}

		color: Qt.rgba(1, 1, 1, 0.45)
		radius: 1

		Item {
			id: header
			width: parent.width
			height: 30

			RowLayout {
				anchors.centerIn: parent
				spacing: 10

				Rectangle {
					width: 120
					height: 20
					radius: 1
					color: Qt.rgba(1, 1, 1, 0.9)

					DropShadowText {
						anchors.centerIn: parent
						text: entry.date
						textColor: "orange"
					}
				}

				Rectangle {
					width: 120
					height: 20
					radius: 1
					color: Qt.rgba(1, 1, 1, 0.9)

					DropShadowText {
						anchors.centerIn: parent
						text: entry.amount
						textColor: text.indexOf("-") >= 0 ? "#ff2600" : "#79aa43"
					}
				}
			}
		}

		Item {
			id: descriptionContainer
			width: parent.width
			height: descriptionLabel.height
			anchors {
				top: header.bottom; topMargin: 4
				bottom: parent.bottom
			}

			DropShadowText {
				id: descriptionLabel
				width: parent.width - 22
				anchors.horizontalCenter: parent.horizontalCenter
				text: entry.description
			}
		}
	}
}
