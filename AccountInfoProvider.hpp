#ifndef ACCOUNTINFOPROVIDER_HPP
#define ACCOUNTINFOPROVIDER_HPP

#include <QVariant>
#include <QObject>
#include <QScopedPointer>
#include <QtNetwork/QNetworkAccessManager>
#include <QtNetwork/QNetworkReply>
#include <QScopedPointer>

namespace ingonline
{
	enum LoginState
	{
		ENTERING_LOGIN,
		LOGIN_ENTRED,
		PASSWORD_ENTRED,
		BALANCE_CHECK,
		HISTORY_REQUESTED,
		AWAITING_HISTORY_PAGE,
		READ_ERROR,
		IDLE
	};

	class AccountInfoProvider: public QObject
	{
		Q_OBJECT

	public:
		typedef QScopedPointer<AccountInfoProvider> Ptr;

	public slots:

		void login(const QString& username, const QString& password);
//		void logout();

		void getBalance();
		void getHistory(const QString& accountNumber);
		void onHttpReply(QNetworkReply* reply);
		void onHttpError(QNetworkReply::NetworkError error);

	signals:
		void balanceDataUpdated(const QStringList& data);
		void historyDataUpdated(const QStringList& data);
		void loginSuccessfull();
		void loginUnsuccessfull();
		void dataReceived(const QString& data);
		void passwordReady(const QString& data);

		void unexpectedError(const QString& message);
		void statusInfo(QString info);

	private:
		QScopedPointer<QNetworkAccessManager>	networkManager;

		LoginState	state = ENTERING_LOGIN;
		QString		username;
		QString		password;

		QVariant	cookie;
	};

}

#endif // ACCOUNTINFOPROVIDER_HPP
