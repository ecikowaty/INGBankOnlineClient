import QtQuick 2.0

Item {
	id: root

	implicitWidth: paintedWidth
	implicitHeight: paintedHeight

	property alias text: buttonText.text
	property alias textColor: buttonText.color
	property alias textSize: buttonText.font.pixelSize

    property alias shadowColor: shadow.color
    property alias shadowOpacity: shadow.opacity

    property alias paintedWidth: buttonText.paintedWidth
    property alias paintedHeight: buttonText.paintedHeight

	property bool wrapText: true

    Text {
        id: buttonText
		width: root.width

		color: "#fff"
		font { bold: true; pixelSize: 13; family: "Lucida Grande" }
        z: 1

		wrapMode: wrapText ? Text.WordWrap : Text.NoWrap
		horizontalAlignment: Text.AlignJustify

		Text {
			id: shadow
			width: root.width

			x: parent.x + 1
			y: parent.y + 1

			wrapMode: wrapText ? Text.WordWrap : Text.NoWrap
			horizontalAlignment: Text.AlignJustify

			text: parent.text
			color: "#000"
			opacity: 0.2

			font { bold: parent.font.bold; pixelSize: parent.font.pixelSize; family: "Lucida Grande" }
			z: parent.z - 2
		}
	}
}
