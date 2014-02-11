import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Button {
	id: root

	style: ButtonStyle {
		id: buttonStyle

		background: Item {

			Rectangle {
				id: top

				x: control.pressed ? background.x : background.x - 2
				y: control.pressed ? background.y : background.y - 2

				Behavior on x { NumberAnimation { duration: 100 } }
				Behavior on y { NumberAnimation { duration: 100 } }

				width: buttonLabel.paintedWidth + 30
				height: buttonLabel.paintedHeight + 10

				gradient: Gradient {
					GradientStop { position: 0.0; color: "#fff" }
					GradientStop { position: 1.0; color: "#f0f0f0" }
				}

				DropShadowText {
					id: buttonLabel

					anchors.centerIn: top

					text: root.text
					textColor: "#ff600d"
					shadowColor: "#000"
					shadowOpacity: 0.2

					Binding { target: root; property: "width"; value: buttonLabel.paintedWidth + 30 }
					Binding { target: root; property: "height"; value: buttonLabel.paintedHeight + 10 }
				}
			}

			Rectangle {
				id: background
				width: top.width
				height: top.height

				z: parent.z - 1

				color: "white"
				opacity: 0.4
			}
		}

		label: Text {}
	}
}
