#include <QtGui/QGuiApplication>
#include <QApplication>
#include <QThread>
#include <QDebug>
#include <QQmlContext>
#include "qtquick2applicationviewer.h"
#include "AccountModel.hpp"
#include "HistoryModel.hpp"
#include "AccountInfoProvider.hpp"
#include "Settings.hpp"

int main(int argc, char *argv[])
{
	QCoreApplication::setOrganizationDomain("ecikowaty.com");
	QCoreApplication::setOrganizationName("ecikowaty");

	QApplication app(argc, argv);

	Settings settings;
	QtQuick2ApplicationViewer viewer;
	ingonline::AccountInfoProvider accountInfoProvider;

	AccountModel accountModel;
	QObject::connect(&accountInfoProvider, &ingonline::AccountInfoProvider::balanceDataUpdated,
					 &accountModel, &AccountModel::replaceWith);
	try
	{
		HistoryModel historyModel;
		QObject::connect(&accountInfoProvider, &ingonline::AccountInfoProvider::historyDataUpdated,
						 &historyModel, &HistoryModel::replaceWith);

		viewer.rootContext()->setContextProperty("accountInfoProvider", &accountInfoProvider);
		viewer.rootContext()->setContextProperty("accountModel", &accountModel);
		viewer.rootContext()->setContextProperty("historyModel", &historyModel);
		viewer.rootContext()->setContextProperty("settings", &settings);

		viewer.setMainQmlFile(QStringLiteral("qml/main.qml"));
		viewer.showExpanded();

		return app.exec();
	}
	catch (const std::runtime_error& e)
	{
		qCritical() << e.what();
		return 1;
	}

	return 0;
}
