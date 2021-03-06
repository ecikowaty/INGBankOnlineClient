#ifndef SETTINGS_HPP
#define SETTINGS_HPP

#include <QObject>

class Settings : public QObject
{
	Q_OBJECT

	Q_PROPERTY(QString login READ login WRITE setLogin NOTIFY loginChanged)
	Q_PROPERTY(QString password READ password WRITE setPassword NOTIFY passwordChanged)
	Q_PROPERTY(QString account READ account WRITE setAccount NOTIFY accountChanged)
	Q_PROPERTY(int refreshInterval READ refreshInterval WRITE setRefreshInterval NOTIFY refreshIntervalChanged)

public:
	explicit Settings(QObject *parent = 0);
	~Settings();

signals:
	void loginChanged();
	void passwordChanged();
	void accountChanged();
	void refreshIntervalChanged();

public:
	QString login() const;
	void setLogin(const QString& login);

	QString password() const;
	void setPassword(const QString& password);

	QString account() const;
	void setAccount(const QString& account);

	int refreshInterval() const;
	void setRefreshInterval(int interval);

private:
	class QSettings& settings;
	struct SettingsPrivate& d;
};

#endif // SETTINGS_HPP
