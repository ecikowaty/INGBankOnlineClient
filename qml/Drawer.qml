import QtQuick 2.0


Rectangle {
	id: root
	state: "minimized"

	property int previewHeight

	property int minimizedHeight

	property bool shadowOnTop: false

	property alias mainContent: mainLoader.sourceComponent

	property alias previewContent: previewLoader.sourceComponent

	property bool selfClickable: false

	property bool maximized: state === "maximized"

	Behavior on opacity { NumberAnimation {} }

	function open(componentName) {
		root.mainContent = Qt.createComponent(componentName)
		root.state = "maximized"
	}

	function close() {
		root.state = "minimized"
	}

	function previewFor(timeToClose) {
		root.state = "preview"

		if (previewTimer.running) {
			previewTimer.stop()
		}

		previewTimer.interval = timeToClose
		previewTimer.start()
	}

	gradient: Gradient {
		GradientStop { position: 0.0; color: "#ff600d" }
		GradientStop { position: 1.0; color: "#ff7514" }
	}

	Timer {
		id: defaultCloseTimer
		interval: 300

		onTriggered: root.close()
	}

	Timer {
		id: previewTimer
		onTriggered: root.close()
	}

	MouseArea {
		anchors.fill: parent
		hoverEnabled: true

		onEntered: defaultCloseTimer.running ? defaultCloseTimer.stop() : root.state = "preview"
		onExited: defaultCloseTimer.start()

		Loader {
			id: mainLoader
			anchors.fill: parent
			enabled: root.state === "maximized"
		}

		Loader {
			id: previewLoader
			anchors.fill: parent
			enabled: root.state === "preview"
		}
	}


	Rectangle {
		id: shadow
		width: parent.width
		height: 3
		color: "black"
		opacity: 0.1

		anchors.bottom: shadowOnTop ? parent.top : undefined
		anchors.top: shadowOnTop ? undefined : parent.bottom
	}

	states: [
		State {
			name: "minimized"
			PropertyChanges { target: mainLoader; opacity: 0 }
			PropertyChanges { target: previewLoader; opacity: 0 }
			PropertyChanges { target: root; height: minimizedHeight }
		},
		State {
			name: "preview"
			PropertyChanges { target: mainLoader; opacity: 0 }
			PropertyChanges { target: previewLoader; opacity: 1 }
			PropertyChanges { target: root; height: previewHeight }
		},
		State {
			name: "maximized"
			PropertyChanges { target: mainLoader; opacity: 1 }
			PropertyChanges { target: previewLoader; opacity: 0 }
			PropertyChanges { target: root; height: parent.height }
		}
	]

	transitions: [
		Transition {
			PropertyAnimation { properties: "height,opacity"; easing.type: Easing.OutQuart }
		},
		Transition {
			to: "preview"
			SequentialAnimation {
				PropertyAnimation { properties: "height"; easing.type: Easing.OutQuart }
				PropertyAnimation { properties: "opacity"; easing.type: Easing.OutQuart }
			}
		},
		Transition {
			to: "minimized"
			SequentialAnimation {
				PropertyAnimation { properties: "opacity"; easing.type: Easing.OutQuart }
				PropertyAnimation { properties: "height"; duration: 500; easing.type: Easing.OutQuart }
			}
		},
		Transition {
			to: "maximized"
			SequentialAnimation {
				PropertyAnimation { target: previewLoader; properties: "opacity"; easing.type: Easing.OutQuart }
				PropertyAnimation { properties: "height"; duration: 500; easing.type: Easing.OutQuart }
				PropertyAnimation { target: mainLoader; properties: "opacity"; easing.type: Easing.OutQuart }
			}
		}
	]
}








