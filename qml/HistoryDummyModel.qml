import QtQuick 2.0

ListModel {
	id: historyModel

	ListElement {
		date: "22.10.2013"
		amount: "231,23 zł"
		description: "Lorem ipsum zajebisty przelew"
	}

	ListElement {
		date: "22.10.2013"
		amount: "-1231,23 zł"
		description: "Lorem ipsum zajebisty przelew"
	}

	ListElement {
		date: "22.10.2013"
		amount: "2301,23 zł"
		description: "Lorem ipsum zajebisty przelew"
	}

	ListElement {
		date: "22.10.2013"
		amount: "1,23 zł"
		description: "Lorem ipsum zajebisty przelew"
	}

	ListElement {
		date: "11.01.2014"
		amount: "-231,23 zł"
		description: "Lorem ipsum zajebisty przelew"
	}

	ListElement {
		date: "02.05.2014"
		amount: "115,01 zł"
		description: "Lorem ipsum zajebisty przelew"
	}
}
